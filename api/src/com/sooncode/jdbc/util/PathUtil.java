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

}
