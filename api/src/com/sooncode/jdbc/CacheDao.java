package com.sooncode.jdbc;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;

 
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
 
import com.sooncode.jdbc.reflect.Genericity;
import com.sooncode.jdbc.reflect.RClass;
import com.sooncode.jdbc.reflect.RObject;
import com.sooncode.jdbc.sql.ComSQL;
import com.sooncode.jdbc.util.Pager;
import com.sooncode.jdbc.util.T2E;

/**
 * 带缓存的Dao
 * 
 * @author pc
 * 
 */
public abstract class CacheDao {

	public final static Logger logger = Logger.getLogger("Dao.class");

	/**
	 * 数据处理对象JDBC
	 */
	public static Jdbc jdbc;
	
	static {
		jdbc = new Jdbc();
	}

	 

	 

	/**
	 * 获取一个实体(逻辑上只有一个匹配的实体存在)
	 * 
	 * @param obj
	 *            封装的查询条件
	 * @return 实体
	 */
	public static Object get(Object obj) {
 
		String sql = ComSQL.select(obj);
		List<Map<String, Object>> list = jdbc.executeQueryL(sql);
		@SuppressWarnings("unchecked")
		List<Object> rList = (List<Object>)  getObject(list, obj.getClass());
		if(rList.size()==1){
			return rList.get(0);
		}
		return null;
	}
	/**
	 * 获取多个实体 
	 * 
	 * @param obj
	 *            封装的查询条件
	 * @return 实体集
	 */
	public static List<?> gets(Object obj) {
		
		String sql = ComSQL.select(obj);
		List<Map<String, Object>> list = jdbc.executeQueryL(sql);
		return  getObject(list, obj.getClass());
	}
 

	 
	/**
	 * 分页查询
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @param left
	 * @param others
	 * @return
	 */
	public static Pager<?> getPager(Long pageNum, Long pageSize, Object left, Object... others) {
		RObject leftRO = new RObject(left);
		// 1.单表
		if (others.length == 0) {
			String sql = ComSQL.select(left, pageNum, pageSize);
			List<Map<String, Object>> list = jdbc.executeQueryL(sql);
			Long size = getSize(left, others);
			 
			List<?> lists =  getObject(list, left.getClass());
			Pager<?> pager = new Pager<>(pageNum, pageSize, size, lists);
			return pager;

		} else if (others.length == 1) {// 3.一对多
			
			RObject rightRO = new RObject(others[0]);
			String leftPk = leftRO.getPk();
			String rightPk = rightRO.getPk();

			if (rightRO.hasField(leftPk) && !leftRO.hasField(rightPk)) {
				String sql = ComSQL.getO2M(left, others[0], pageNum, pageSize);
				List<Map<String, Object>> list = jdbc.executeQueryL(sql);
				Object l = getObject(list, left.getClass());
				@SuppressWarnings("unchecked")
				List<Object> res = (List<Object>) getObject(list, others[0].getClass());
				leftRO.invokeSetMethod(leftRO.getListFieldName(others[0].getClass()), res);
				long size = getSize(left, others);
				Pager<?> pager = new Pager<>(pageNum, pageSize, size, l);

				return pager;
			}else {
				return o2o(pageNum,pageSize,left, others) ;
			}
		} else if (others.length == 2) {// 4.多对多
			String leftPk = new RObject(left).getPk();
			String rightPk = new RObject(others[1]).getPk();
			RObject middle = new RObject(others[0]);
			if (middle.hasField(leftPk) && middle.hasField(rightPk)) {
				String sql = ComSQL.getM2M(left, others[0], others[1], pageNum, pageSize);
				List<Map<String,Object>> list = jdbc.executeQueryL(sql);
				Object l = getObject(list, left.getClass());
				@SuppressWarnings("unchecked")
				List<Object> res = (List<Object>) getObject(list, others[0].getClass());
				leftRO.invokeSetMethod(leftRO.getListFieldName(others[0].getClass()), res);
				long size = getSize(left, others);
				Pager<?> pager = new Pager<Object>(pageNum, pageSize, size, l);
				return pager;
			} else { // 一对一
				return o2o(pageNum,pageSize,left, others) ;
			}

		} else {// 一对一
			return o2o(pageNum,pageSize,left, others) ;
		}
	}
    
	

	/**
	 * 保存一个实体对象
	 * 
	 * @param object
	 * @return 保存数量
	 */
	public static Long save(Object object) {
		// 验证obj
		if (isNull(object) == false) {
			return null;
		}
		String sql = ComSQL.insert(object).toString();
		Long n = jdbc.executeUpdate(sql);
		return n;

	}

	/**
	 * 保存多个实体对象
	 * 
	 * @param object
	 * @return 保存数量
	 */
	public static void save(List<Object> objs) {
		// 验证obj
		if (isNull(objs) == false) {
			return;
		}
		List<String> sqls = new ArrayList<>();
		for (Object obj : objs) {
			String sql = ComSQL.insert(obj).toString();
			sqls.add(sql);
		}
		jdbc.executeInserts(sqls);

	}

	/**
	 * 保存和更新智能匹配 多个实体
	 * 
	 * @param objs
	 */
	public static void saveOrUpdate(List<Object> objs) {
		List<String> sqls = new ArrayList<>();
		for (Object object : objs) {
			RObject rObj = new RObject(object);
			Object id = rObj.getPkValue();
			if (id != null) {// obj 有id update();
				sqls.add(ComSQL.update(object));

			} else {// obj 没有id
				Object oldObj = get(object);
				if (oldObj == null) {
					sqls.add(ComSQL.insert(object));
				}
			}
		}

		jdbc.executeInserts(sqls);
	}

	/**
	 * 保存和更新智能匹配
	 * 
	 * @param obj
	 *            要保存或者更新的对象
	 * @return -1 ：没有更新 也没有保存
	 */
	public static Long saveOrUpdate(Object obj) {

		RObject rObj = new RObject(obj);
		Object id = rObj.getPkValue();
		if (id != null) {// obj 有id update();
			return update(obj);
		} else {// obj 没有id
			Object oldObj = get(obj);
			if (oldObj == null) {
				return save(obj);// 用obj 去数据库查询 如果不存在 则保存
			} else {
				return -1L;// 用obj 去数据库查询 如何存在 不更新 不保存
			}
		}

	}

	/**
	 * 修改一个实体对象
	 * 
	 * @param object
	 * @return 更新数量
	 */
	public static Long update(Object object) {
		if (isNull(object) == false) {
			return 0L;
		}
		String sql = ComSQL.update(object).toString();
		Long n = jdbc.executeUpdate(sql);
		return n;

	}

	/**
	 * 移除一个实体对象
	 * 
	 * @param object
	 * @return 删除数量
	 */
	public static int delete(Object object) {
		if (isNull(object) == false) {
			return 0;
		}
		String sql = ComSQL.delete(object).toString();
		int n = new Long(jdbc.executeUpdate(sql)).intValue();
		return n;

	}

	/**
	 * 验证 object是否为空 或 其属性是否全为空
	 * 
	 * @param object
	 *            被验证的实体
	 * @return
	 */
	private static boolean isNull(Object object) {
		if (object == null) {
			return false;
		}
		// obj的属性值不全为null
		RObject rObj = new RObject(object);
		Map<String, Object> files = rObj.getFiledAndValue();
		boolean b = false;
		for (Map.Entry<String, Object> en : files.entrySet()) {
			if (en.getValue() == null) {
				b = b || false;
			} else {
				b = b || true;
			}
		}

		if (b == false) {
			return false;
		} else {
			return true;
		}
	}

	/**
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @param left
	 * @param others
	 * @return
	 */
	private static Pager<?> o2o(Long pageNum,Long pageSize,Object left,Object ... others){
		String sql = ComSQL.getO2O(left, others);
		//logger.info(sql);
		List<Map<String, Object>> list = jdbc.executeQueryL(sql);
		
		String str = "Integer Long Short Byte Float Double Character Boolean Date String List";

		String TClassName =left.getClass().getName();// Genericity.getGenericity(this.getClass(), 0);// 泛型T实际运行时的全类名

		RClass rClass = new RClass(TClassName);
		List<Object> resultList = new ArrayList<>();

		for (Map<String, Object> m : list) { // 遍历数据库返回的数据集合
			RObject rObject = rClass.getRObject();
			List<Field> fields = rObject.getFields();// T 对应的属性

			for (Field f : fields) {
				Object obj = m.get(T2E.toField(Genericity.getSimpleName(TClassName).toUpperCase() + "_" + T2E.toColumn(f.getName())));
				if (obj != null) {
					rObject.invokeSetMethod(f.getName(), obj);
				}

				String typeSimpleName = f.getType().getSimpleName();
				String typeName = f.getType().getName();
				if (!str.contains(typeSimpleName)) {
					RClass rC = new RClass(typeName);
					RObject rO = rC.getRObject();

					List<Field> fs = rC.getFields();

					for (Field ff : fs) {

						Object o = m.get(T2E.toField(typeSimpleName.toUpperCase() + "_" + T2E.toColumn(ff.getName())));
						if (o != null) {
							rO.invokeSetMethod(ff.getName(), o);
						}

					}

					rObject.invokeSetMethod(f.getName(), rO.getObject());
				}
			}

			resultList.add(rObject.getObject());

		}
		 
		long size = getSize(left, others);
		Pager<?> pager = new Pager<>(pageNum, pageSize, size, resultList);
		return pager;
	}
	
	/**
	 * 获取查询长度
	 * 
	 * @param left
	 * @param others
	 * @return
	 */
	private static Long getSize(Object left, Object... others) {
		String sql = "";
		if (others.length == 0) { // 单表
			sql = ComSQL.selectSize(left);
		} else

		if (others.length == 1) { // 一对多
			RObject leftRO = new RObject(left);
			RObject rightRO = new RObject(others[0]);
			String leftPk = leftRO.getPk();
			String rightPk = rightRO.getPk();

			if (rightRO.hasField(leftPk) && !leftRO.hasField(rightPk)) {
				sql = ComSQL.getO2Msize(left, others[0]);
			}else{
				sql = ComSQL.O2OSize(left, others);
			}

		} else if (others.length == 2) {// 多对多
			String leftPk = new RObject(left).getPk();
			String rightPk = new RObject(others[1]).getPk();
			RObject middle = new RObject(others[0]);
			if (middle.hasField(leftPk) && middle.hasField(rightPk)) {
				sql = ComSQL.selectSize(others[1]);
			}else {
				sql = ComSQL.O2OSize(left, others);
			}
		} else {// 一对一
			sql = ComSQL.O2OSize(left, others);
		}

		logger.info(sql);
		Map<String, Object> map = jdbc.executeQueryM(sql);
		Object obj = map.get("size");
		return (Long) obj;

	}
	
	/**
	 * 抓取对象
	 * 
	 * @param list
	 * @param clas
	 * @return List对象 ,或简单对象
	 */
	private static List<?> getObject(List<Map<String, Object>> list, Class<?> clas) {
		List<Object> objects = new ArrayList<>();
		for (Map<String, Object> map : list) {
			try {
				Object object = clas.newInstance();
				Field[] fields = clas.getDeclaredFields();
				for (Field field : fields) {
					Object value = map.get(T2E.toField(T2E.toColumn(clas.getSimpleName()) + "_" + T2E.toColumn(field.getName())));
					if (value == null) {
						value = map.get(field.getName());
						if(value == null){
							continue;
						}
					}
					PropertyDescriptor pd = new PropertyDescriptor(field.getName(), clas);
					Method method = pd.getWriteMethod();
					method.invoke(object, value);
				}
				if (objects.size() >= 1 && object.toString().equals(objects.get(objects.size() - 1).toString())) {
					continue;
				}
				objects.add(object);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			return objects;
	}
}
