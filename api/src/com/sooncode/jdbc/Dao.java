package com.sooncode.jdbc;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;

import java.util.HashMap;
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
 * Dao 基类 注意:子类必须在空构造器中对jdbc赋值
 * 
 * @author pc
 * 
 */
public abstract class Dao<T> {

	public final static Logger logger = Logger.getLogger("Dao.class");

	/**
	 * 数据处理对象JDBC
	 */
	public Jdbc jdbc;

	public Dao() {
		jdbc = new Jdbc();
	}

	/**
	 * 临时SQL
	 */
	private String sql;
	/**
	 * 临时对象
	 */
	private Object obj;

	/**
	 * 获取一个实体(逻辑上只有一个匹配的实体存在)
	 * 
	 * @param obj
	 *            封装的查询条件
	 * @return 实体
	 */
	public T get(Object obj) {

		// 去数据库查询
		String sql = ComSQL.select(obj);
		List<Map<String, Object>> list = jdbc.executeQueryL(sql);
		if (list.size() == 1) {
			return getEntitys(list).get(0);
		} else {
			return null;
		}
	}

	/**
	 * 获取一个实体对象集
	 * 
	 * @param obj
	 * @return
	 */

	public List<T> gets(Object obj) {
		// 去数据库查询
		String sql = ComSQL.select(obj);
		List<Map<String, Object>> list = jdbc.executeQueryL(sql);
		return getEntitys(list);
	}
	
	
	/**
	 * 批量查询
	 * 
	 * @param objs
	 * @return
	 */
	
	public List<T> gets(List<Object> objs) {
		// 去数据库查询
		String sql = ComSQL.select(obj);
		List<Map<String, Object>> list = jdbc.executeQueryL(sql);
		return getEntitys(list);
	}

	/**
	 * 模糊查询
	 * 
	 * @param obj
	 * @return
	 */

	public Dao<T> startGets(Object obj) {
		// 去数据库查询
		this.sql = ComSQL.select(obj);
		logger.info("[模糊查询]" + sql);
		this.obj = obj;
		return this;// getEntitys(list);
	}

	public Dao<T> like(String field) {

		String com = T2E.toColumn(field);
		RObject rObj = new RObject(this.obj);
		Object value = rObj.getFiledAndValue().get(field);
		String subSql = com + " = " + "'" + value + "'";
		String like = com + " LIKE " + "'%" + value + "%'";

		this.sql = sql.replace(subSql, like);
		return this;// getEntitys(list);
	}

	public Dao<T> like(String field, String newValue) {

		String com = T2E.toColumn(field);
		RObject rObj = new RObject(this.obj);
		Object value = rObj.getFiledAndValue().get(field);
		String subSql = com + " = " + "'" + value + "'";
		String like = com + " LIKE " + "'%" + newValue + "%'";

		this.sql = sql.replace(subSql, like);
		return this;// getEntitys(list);
	}

	public List<T> endGets() {
		logger.info("【模糊查询】" + sql);
		List<Map<String, Object>> list = jdbc.executeQueryL(sql);
		sql = "";
		this.obj = null;
		return getEntitys(list);

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
	public Pager<T> getPager(Long pageNum, Long pageSize, Object left, Object... others) {

		// 1.单表
		if (others.length == 0) {
			String sql = ComSQL.select(left, pageNum, pageSize);
			List<Map<String, Object>> list = jdbc.executeQueryL(sql);
			Long size = getSize(left, others);
			Pager<T> pager = new Pager<>(pageNum, pageSize, size, getEntitys(list));
			return pager;

		} else if (others.length == 1) {// 3.一对多
			RObject leftRO = new RObject(left);
			RObject rightRO = new RObject(others[0]);
			String leftPk = leftRO.getPk();
			String rightPk = rightRO.getPk();

			if (rightRO.hasField(leftPk) && !leftRO.hasField(rightPk)) {
				String sql = ComSQL.getO2M(left, others[0], pageNum, pageSize);
				List<Map<String, Object>> list = jdbc.executeQueryL(sql);
				T t = this.get2M(list);
				long size = getSize(left, others);
				Pager<T> pager = new Pager<>(pageNum, pageSize, size, t);

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
				//logger.info("SQL:" + sql);
				T t = this.get2M(jdbc.executeQueryL(sql));
				//RObject m = new RObject(middle);
				//m.setPk(new RObject(left).getPkValue());
				long size = getSize(left, others);
				Pager<T> pager = new Pager<T>(pageNum, pageSize, size, t);
				return pager;
			} else { // 一对一
				return o2o(pageNum,pageSize,left, others) ;
			}

		} else {// 一对一
			return o2o(pageNum,pageSize,left, others) ;
		}

		 
	}
    
	
	
	
	/**
	 * 获取实体集
	 * 
	 * @param list
	 *            执行SQL语句得到的结果集
	 * @return 封装好的实体集
	 */
	@SuppressWarnings("unchecked")
	public T getEntity(Map<String, Object> map) {

		String tClassName = Genericity.getGenericity(this.getClass(), 0);// 泛型T实际运行时的全类名
		RClass rClass = new RClass(tClassName);
		List<Field> fields = rClass.getFields();
		RObject rObject = rClass.getRObject();
		for (int i = 0; i < fields.size(); i++) {
			String fieldName = fields.get(i).getName();
			Object o = map.get(fieldName);
			rObject.invokeSetMethod(fields.get(i).getName(), o);
		}

		return (T) rObject.getObject();

	}

	/**
	 * 获取实体集
	 * 
	 * @param list
	 *            执行SQL语句得到的结果集
	 * @return 封装好的实体集
	 */
	@SuppressWarnings("unchecked")
	public List<T> getEntitys(List<Map<String, Object>> list) {
		String tClassName = Genericity.getGenericity(this.getClass(), 0);// 泛型T实际运行时的全类名
		RClass rClass = new RClass(tClassName);
		List<Field> fields = rClass.getFields();
		List<T> objects = new ArrayList<>();
		for (Map<String, Object> map : list) {

			RObject rObject = rClass.getRObject();
			for (int i = 0; i < fields.size(); i++) {
				String fieldName = fields.get(i).getName();
				Object o = map.get(fieldName);
				rObject.invokeSetMethod(fields.get(i).getName(), o);
			}
			objects.add((T) rObject.getObject());
		}
		return objects;

	}

	/**
	 * 1对多 ，多对多 查询
	 * 
	 * @param list
	 *            执行SQL语句得到的结果集
	 * @return 封装好的实体集
	 */
	@SuppressWarnings("unchecked")
	public T get2M(List<Map<String, Object>> list) {
		// 验证 list 参数
		if (list == null || list.size() == 0) {
			return null;
		}
		String TClassName = Genericity.getGenericity(this.getClass(), 0);// 泛型T实际运行时的全类名
		RClass rClass = new RClass(TClassName);
		List<Field> fields = rClass.getFields();

		Map<String, Object> map = list.get(0);
		String rightClassName = "";

		for (Map.Entry<String, Object> en : map.entrySet()) {
			String str = T2E.toColumn(en.getKey());
			String[] strs = str.split("_");
			String className = strs[0];
			if (!rClass.getClassName().toUpperCase().contains(className)) {
				rightClassName = className; // 获取 右实体对应的 类名 (大写)
				break;
			}
		}

		RObject leftObjet = rClass.getRObject();
		for (Field f : fields) {
			Object obj = map.get(T2E.toField(Genericity.getSimpleName(TClassName).toUpperCase() + "_" + T2E.toColumn(f.getName())));
			if (obj != null) {
				leftObjet.invokeSetMethod(f.getName(), obj); // 给左实体对应的类对象的属性赋值
			}
		}

		//logger.info(leftObjet.getObject());

		Map<String, String> rightFields = new HashMap<String, String>();
		Map<String, String> listFields = new HashMap<String, String>();

		for (Field f : fields) {
			if (f.getType().toString().contains("interface java.util.List")) {
				ParameterizedType pt = (ParameterizedType) f.getGenericType();
				String str = pt.getActualTypeArguments()[0].toString(); // 获取List泛型参数类型名称
																		// (第一个参数)
				str = str.replace("class ", "").trim();// 全类名
				String[] strs = str.split("\\.");
				String simpleName = strs[strs.length - 1].toUpperCase();
				rightFields.put(simpleName, str);
				listFields.put(simpleName, f.getName()); // 属性名称
			}
		}

		String rightClass = rightFields.get(rightClassName);// 全类名
		//logger.info(rightClass);
		List<Object> rightObjects = new ArrayList<>();
		// 获取 右端 实体集
		for (Map<String, Object> map2 : list) {

			RClass rightCl = new RClass(rightClass);
			RObject rightO = rightCl.getRObject();

			List<Field> fs = rightCl.getFields();
			for (Field f : fs) {

				Object o = map2.get(T2E.toField(rightClassName.toUpperCase() + "_" + T2E.toColumn(f.getName())));

				if (o != null) {
					rightO.invokeSetMethod(f.getName(), o);
				}

			}
			rightObjects.add(rightO.getObject());
		}

		String listField = listFields.get(rightClassName);
		leftObjet.invokeSetMethod(listField, rightObjects); //
		return (T) leftObjet.getObject();

	}

	public List<Map<String,Object>> get(Object...objs){
		String sql = ComSQL.supSelect(objs);
		return jdbc.executeQueryL(sql);
	}
	
	/**
	 * 一对一查询
	 * 
	 * @param list
	 *            执行SQL语句得到的结果集
	 * @return 封装好的实体集
	 */

	@SuppressWarnings("unchecked")
	public List<T> getO2O(List<Map<String, Object>> list) {
		// 基本的数据类型
		String str = "Integer Long Short Byte Float Double Character Boolean Date String List";

		String TClassName = Genericity.getGenericity(this.getClass(), 0);// 泛型T实际运行时的全类名

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

		return (List<T>) resultList;

	}

	/**
	 * 获取查询长度
	 * 
	 * @param left
	 * @param others
	 * @return
	 */
	public Long getSize(Object left, Object... others) {
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
	 * 保存一个实体对象
	 * 
	 * @param object
	 * @return 保存数量
	 */
	public Long save(Object object) {
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
	public void save(List<Object> objs) {
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
	public void saveOrUpdate(List<Object> objs) {
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
	public Long saveOrUpdate(Object obj) {

		RObject rObj = new RObject(obj);
		Object id = rObj.getPkValue();
		if (id == null) {// obj 没有id 保存();
			return save(obj);
		} else {// obj 有id 
			
			String pk = rObj.getPk();
			RObject newRobj= new RObject(obj.getClass());
			newRobj.invokeSetMethod(pk, id);
			Object newObj =newRobj.getObject() ;
			Object oldObj = get(newObj); //去数数据库查询
			if (oldObj == null) { //数据库没有记录
				return save(obj);//保存
			}else {//数据库有记录
				return update(obj);//更新 
			}
		}

	}

	/**
	 * 修改一个实体对象
	 * 
	 * @param object
	 * @return 更新数量
	 */
	public Long update(Object object) {
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
	public int delete(Object object) {
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
	private boolean isNull(Object object) {
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
	private Pager<T> o2o(Long pageNum,Long pageSize,Object left,Object ... others){
		String sql = ComSQL.getO2O(left, others);
		//logger.info(sql);
		List<Map<String, Object>> list = jdbc.executeQueryL(sql);
		List<T> ts = this.getO2O(list);
		long size = getSize(left, others);
		Pager<T> pager = new Pager<>(pageNum, pageSize, size, ts);
		return pager;
	}
}
