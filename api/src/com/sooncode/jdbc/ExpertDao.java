package com.sooncode.jdbc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.sooncode.jdbc.sql.ComSQL;
import com.sooncode.jdbc.util.T2E;

/**
 * 高级查询Dao
 * @author pc
 *
 */
public class ExpertDao {
	private static Logger logger = Logger.getLogger("ExpertDao.class");
	/**
	 * 数据处理对象JDBC
	 */
	private static Jdbc jdbc;
    static{
    	jdbc = new Jdbc();
    }
    public static void setJdbc(Jdbc j){
    	jdbc=j;
    }
	/**
	 * 去重查询
	 * @param obj 查询条件
	 * @param fields 去重查询字段集
	 * @return map
	 */
	public static List<Map<String,Object>> getFields(Object obj,String ... fields){
		if(fields.length == 0){
			return null;
		}
		String sql = "SELECT DISTINCT ";
		for (int i = 0;i<fields.length;i++) {
			if(i!=0){
				sql = sql + " , "+T2E.toColumn(fields[i]);
			}else{
				sql = sql + T2E.toColumn(fields[i]);
			}
		}
		String tableName = T2E.toColumn(obj.getClass().getSimpleName());
		sql = sql + " FROM " + tableName + " WHERE " + ComSQL.where(obj);
		logger.info("【高级查询 SQL】:"+sql);
		return jdbc.executeQueryL(sql);
	}
	
	public static void main(String[] args) {
	 
	}
	
}
