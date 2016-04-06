package com.sooncode.jdbc.util;

import java.io.File;

/**
 * 工程路径 工具类
 * @author pc
 *
 */
public class PathUtil {
 
    /**
     * 获取src路径
     * @return
     */
	public static String getSrc() {
		String src = "";
		try{
			 src = Thread.currentThread().getContextClassLoader().getResource("/").getPath() + "";
			
		}catch (Exception e){
			src = System.getProperty("user.dir")+File.separatorChar+"target"+File.separatorChar+"classes"+File.separatorChar;
		}
		return src;
	}
    /**
     * 获取webroot路径
     * @return
     */
	public static String getWebRoot() {
		String webRoot = System.getProperty("tool.root");
		return webRoot;
	}
	/**
	 * 获取classes路径
	 * @return
	 */
	public static String getClasses() {
		String webRoot = getWebRoot();
		return webRoot +"WEB-INF"+File.separatorChar+"classes";
	}
	
//	private String getClasses() {
//		   String path = getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
//		   path = path.substring(1, path.length()-1);
//		   return path;
//		  
//		}
}
