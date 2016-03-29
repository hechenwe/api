package com.sooncode.jdbc.sql;

import java.io.File;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;


/**
 * 读取Xml文件
 * 
 * @author pc
 *
 */
public class Xml {
	private static Logger logger = Logger.getLogger("Xml.class");
	/**
	 * xml 文件名
	 */
	private String xmlName;
	
	
    /**
     * 
     * @param xmlName xml文件的全路径名称
     */
	public Xml(String xmlName) {
		this.xmlName = xmlName;
	}

	/**
	 * 去掉字符串中的 回车、换行符、制表符
	 * 
	 * @param str
	 * @return 压缩后的字符串
	 */
	private String compressString(String str) {
		String temp = "";
		if (str != null) {
			Pattern p = Pattern.compile("\t|\r|\n");
			Matcher m = p.matcher(str);
			temp = m.replaceAll("");
		}
		return temp;
	}

	/**
	 * 获取预编译SQL语句
	 * 
	 * @param id
	 *            xml文件中 节点的id属性值
	 * @return 预编译SQL语句
	 */
	public String getSql(String id) {
		SAXReader saxReader = new SAXReader();

		Document document = null;
		try {
			document = saxReader.read(new File(this.xmlName));
			// 获取根元素
			Element root = document.getRootElement();
			// 获取所有子元素
			@SuppressWarnings("unchecked")
			List<Element> child = root.elements();
			for (Element e : child) {
				Attribute attr = e.attribute("id");
				if (attr.getValue().equals(id)) {
					String sql = e.getStringValue();
					sql = this.compressString(sql);
					logger.info("【SQL】: "+sql);
					return sql;
				}
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}
	/**
	 * 获取可执行SQL语句
	 * @param id xml文件中 节点的id属性值
	 * @param obs 参数载体(注入sql中的对象集 (可选) 或者一个Map对象)
	 * @return 可执行SQL语句
	 */
	public String getSql(String id,Object...obs) {
		 String sql = getSql(id);
		 sql = Para.replaceParameter(sql, obs);
		 return sql;
		
	}

}
