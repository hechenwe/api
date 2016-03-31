package com.sooncode.api.background.util;

 

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

/**
 * 类 缓存
 * 
 * @author pc
 *
 */
public class ClassCache {
	public final static Logger logger = Logger.getLogger("ClassCache.class");
	public static String root;
	public static List<String> classCache;
    
	public static Map<String, List<String>> interfacCache;

	static {
		classCache = new ArrayList<>();
		interfacCache = new HashMap<>();
		root = getSrc();
		findClass(classCache, root);
	}

	public static String getSrc() {
		 
		String webRoot = System.getProperty("api.root");
		
		String classesPath = webRoot +File.separatorChar +"WEB-INF"+ File.separatorChar +"classes";
		return classesPath;
//		try {
//			//src = Thread.currentThread().getContextClassLoader().getResource("/").getPath() + "";
//			//src = src.substring(1,src.length()-1);
//			src = File.separatorChar+"root"+File.separatorChar+"tomcat"+File.separatorChar+"webapps"+File.separatorChar+"api"+File.separatorChar+"WEB-INF"+File.separatorChar+"classes";
//            logger.info("【src】:>"+src+"<");
//		} catch (Exception e) {
//			src = System.getProperty("user.dir") + File.separatorChar + "build"+ File.separatorChar+"classes";
//			logger.info("【src】:"+src);
//		}
//		return src;
	}

	/**
	 * 递归查找类
	 * 
	 * @return
	 */
	public static void findClass(List<String> classCache, String path) {

		String fileList[] = new File(path).list();

		for (int i = 0; i < fileList.length; i++) {
			String fileName = fileList[i];
			if (fileName.contains(".class")) {
				String packageName = path + "";
				packageName = packageName.replace(root + File.separatorChar, "").replace(File.separatorChar + "", ".");
                fileName = fileName.replace(".class", "");
				String className = packageName + "." + fileName;
				classCache.add(className);
				try {
					Class<?> cla = Class.forName(className);

					Class<?> interfaces[] = null;// 声明一个对象数组
					interfaces = cla.getInterfaces();// 获取类实现的所有接口
				    String interfaceName = "";
				    List<String> classList = new ArrayList<>() ;
					if (interfaces.length == 1) {
						interfaceName = interfaces[0].getName();
						 classList = interfacCache.get(interfaceName);
					}

					if (classList == null) {
						classList = new ArrayList<>() ;
						classList.add(className);
						interfacCache.put(interfaceName, classList);
					}

				} catch (ClassNotFoundException e) {
				}

			} else if (!fileName.contains(".")) {
				String newPath = path + "";
				newPath = newPath + File.separatorChar + fileName;
				findClass(classCache, newPath);
			} else {
			}
		}
	}

	/**
	 * 获取接口的唯一实现类实例
	 * @param interfac 接口
	 * @return 接口的唯一实现类实例
	 */
	public static Object getImplement(Class<?> interfac) {

		try {
			Class<?> clas = Class.forName(interfacCache.get(interfac.getName()).get(0));
			Object obj = clas.newInstance();
			return obj;
		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}

	}

	public static void main(String[] args) {
		System.out.println(ClassCache.classCache);
		System.out.println(ClassCache.interfacCache);
	}
}
