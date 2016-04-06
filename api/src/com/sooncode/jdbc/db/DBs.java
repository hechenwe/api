package com.sooncode.jdbc.db;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

 
import com.sooncode.jdbc.util.PropertiesUtil;

/**
 * 数据库缓存
 * @author pc
 *
 */
public class DBs {

	
	
	private static Map<String,DB> dBcache = new HashMap<>();
	private static String classesPath;
	
	public static void init() {
		  dBcache.clear();
		  classesPath = new DBs().getClassesPath(); 
		  List<String> dbConfig = getDbConfig();
		  for (String str : dbConfig) {
			 
			  PropertiesUtil pu = new PropertiesUtil(classesPath+str);
			  DB db = new DB();
			   
			  db.setKey(pu.getString("KEY"));
			  db.setDriver(pu.getString("DRIVER"));
			  db.setIp(pu.getString("IP"));
			  db.setPort(pu.getString("PORT"));
			  db.setDataName(pu.getString("DATA_NAME"));
			  db.setEncodeing(pu.getString("ENCODEING"));
			  db.setUserName(pu.getString("USERNAME"));
			  db.setPassword(pu.getString("PASSWORD"));
			  putDB(db);  
		}
		  
	}
	
	public static void putDB(DB db){
		dBcache.put(db.getKey(),db);
	}
	
	
	public static DB getDB(String key){
		init();
		return dBcache.get(key);
	}
	
	
	private static List<String> getDbConfig(){
		  File file=new File(classesPath);
		  String test[];
		  test=file.list();
		  List<String> dbCongig = new ArrayList<>() ;
		  for(int i=0;i<test.length;i++)
		  {
			  
			  String fileName = test[i];
			  if(fileName.contains("_db.properties")){
				  dbCongig.add(fileName);
			  }
		  }
		  
		  return dbCongig;
		
	}
	private String getClassesPath() {
		   String path = this.getClass().getResource("/").getPath();
		   File file = new File(path);
		   String classesPath = file.toString()+File.separatorChar;
		   return classesPath;
		  
		}
}
