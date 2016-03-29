package com.sooncode.jdbc;

import java.util.List;
import java.util.Map;

import com.sooncode.jdbc.util.Pager;

/**
 * Dao 接口     注意:子类必须在空构造器中对jdbc赋值
 * 
 * @author pc
 * 
 */
public interface DaoI<T> {


	/**
	 * 获取一个实体(逻辑上只有一个匹配的实体存在)
	 * 
	 * @param obj
	 *            封装的查询条件
	 * @return 实体
	 */
	public T get(Object obj);  
	/**
	 * 获取一个实体对象集
	 * 
	 * @param obj
	 * @return
	 */
   
	
	
	public List<T> gets(Object obj) ; 
	
	/**
	 * 分页查询
	 * @param pageNum
	 * @param pageSize
	 * @param left
	 * @param others
	 * @return
	 */
	public Pager<T> getPager(Long pageNum, Long pageSize, Object left, Object... others); 
	/**
	 * 获取实体集
	 * 
	 * @param list
	 *            执行SQL语句得到的结果集
	 * @return 封装好的实体集
	 */
	 
	public T getEntity(Map<String, Object> map);  
	
	/**
	 * 获取实体集
	 * 
	 * @param list
	 *            执行SQL语句得到的结果集
	 * @return 封装好的实体集
	 */
	 
	public List<T> getEntitys(List<Map<String, Object>> list);   
	/**
	 * 超级查询
	 * @param objs
	 * @return
	 */
	public List<Map<String,Object>> get(Object...objs);
	/**
	 * 1对多 ，多对多 查询
	 * 
	 * @param list
	 *            执行SQL语句得到的结果集
	 * @return 封装好的实体集
	 */
 
	public T get2M(List<Map<String, Object>> list);  

	/**
	 * 一对一查询
	 * 
	 * @param list
	 *            执行SQL语句得到的结果集
	 * @return 封装好的实体集
	 */

	 
	public List<T> getO2O(List<Map<String, Object>> list);   

	 

	/**
	 * 获取查询长度
	 * @param left
	 * @param others
	 * @return
	 */
	public Long getSize(Object left, Object... others) ;  
	 

	/**
	 * 保存一个实体对象
	 * 
	 * @param object
	 * @return 保存数量
	 */
	public Long save(Object object) ;
	/**
	 * 保存和更新智能匹配
	 * @param obj 要保存或者更新的对象
	 * @return -1 ：没有更新 也没有保存 
	 */
	public Long saveOrUpdate(Object obj);
	/**
	 * 保存和更新智能匹配
	 
	 */
	public void saveOrUpdate(List<Object> objs);
	/**
	 * 保存多个实体对象
	 * 
	 * @param object
	 * @return 保存数量
	 */
	public void save(List<Object> objs) ;
	
	
	/**
	 * 修改一个实体对象
	 * 
	 * @param object
	 * @return 更新数量
	 */
	public Long update(Object object);   
	/**
	 * 移除一个实体对象
	 * 
	 * @param object
	 * @return 删除数量
	 */
	public int delete(Object object);  
	/**
	 * 验证 object是否为空 或 其属性是否全为空
	 * 
	 * @param object
	 *            被验证的实体
	 * @return
	 */
	 
	/**
	 * 模糊查询
	 * 
	 * @param obj
	 * @return
	 */
	
	public Dao<T> startGets(Object obj); 
		 
	
	public Dao<T> like(String filed) ; 
		 
	public Dao<T> like(String field,String newValue);
	public List<T> endGets() ;
	 
}
