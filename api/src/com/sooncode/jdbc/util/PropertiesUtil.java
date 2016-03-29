package com.sooncode.jdbc.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * 配置文件 读取工具类
 * 
 * @author pc
 *
 */
public class PropertiesUtil {
	/**
	 * 配置文件所在路径
	 */
	private String filePath;

	public PropertiesUtil(String filePath) {
		this.filePath = filePath;
	}

	/**
	 * 根据Key读取Value
	 * 
	 * @param filePath
	 *            配置文件 (默认在src下)
	 * 
	 * @param key
	 *            关键字
	 * @return 值
	 */
	public String getString(String key) {
		Properties p = new Properties();
		try {
			InputStreamReader in = new InputStreamReader(new FileInputStream(this.filePath), "utf-8");
			p.load(in);
			String value = p.getProperty(key);
			return value.trim();

		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 根据Key读取Value
	 * 
	 * @param filePath
	 *            配置文件 (默认在src下)
	 * 
	 * @param key
	 *            关键字
	 * 
	 * @return int
	 */
	public Integer getInt(String key) {
		Properties properties = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(this.filePath));
			properties.load(in);
			String value = properties.getProperty(key);
			Integer val = Integer.parseInt(value.trim());
			return val;

		} catch (Exception e) {

			return null;
		}
	}

	// 读取Properties的全部信息
	public  Map<String, String> getKeyAndValue(){
		Properties pps = new Properties();
		InputStream in;
		try {
			in = new BufferedInputStream(new FileInputStream(this.filePath));
			pps.load(in);
			Enumeration<?> en = pps.propertyNames(); // 得到配置文件的名字
			Map<String, String> map = new HashMap<String, String>();
			while (en.hasMoreElements()) {
				String strKey = (String) en.nextElement();
				String strValue = pps.getProperty(strKey);
				map.put(strKey, strValue);
			}
			return map;
		} catch ( Exception e) { 
			e.printStackTrace();
			return null;
		}
	}

	// 写入Properties信息
	public static void WriteProperties(String filePath, String pKey, String pValue) throws IOException {
		Properties pps = new Properties();

		InputStream in = new FileInputStream(filePath);
		// 从输入流中读取属性列表（键和元素对）
		pps.load(in);
		// 调用 Hashtable 的方法 put。使用 getProperty 方法提供并行性。
		// 强制要求为属性的键和值使用字符串。返回值是 Hashtable 调用 put 的结果。
		OutputStream out = new FileOutputStream(filePath);
		pps.setProperty(pKey, pValue);
		// 以适合使用 load 方法加载到 Properties 表中的格式，
		// 将此 Properties 表中的属性列表（键和元素对）写入输出流
		pps.store(out, "Update " + pKey + " name");
	}

	public static void main(String[] args) throws IOException {
		PropertiesUtil pu = new PropertiesUtil("config/test.properties");
		String value = pu.getString("username");
		System.out.println(value);
		// GetAllProperties("Test.properties");
		// WriteProperties("test.properties","long", "212");
	}
}
