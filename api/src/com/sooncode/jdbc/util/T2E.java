package com.sooncode.jdbc.util;
/**
 * 数据库表 和 对应的实体类 
 * @author pc
 *
 */
public class T2E {
	
	
	/** 属性名称转换成字段名称 */
	public static String toColumn(String field) {
		String string = "";
		char[] c = field.toCharArray();
		int i = 0;
		StringBuilder sb = new StringBuilder();
		while (i < field.length()) {
			while (i < field.length() && c[i] > 'Z') {
				sb.append(c[i]);
				i++;
			}
			if (i != 0) {
				string = string + sb.toString().toUpperCase() + "_";
			}
			if (i < field.length()) {
				sb = new StringBuilder();
				sb.append(c[i++]);
			}

		}
		return string.substring(0, string.length() - 1);
	}

	public static String toField(String columnName) {
		String[] arrays = columnName.toLowerCase().split("_");
		String propertyName = "";
		if (arrays.length > 0) {
			propertyName = arrays[0];
		}
		for (int i = 1; i < arrays.length; i++) {
			propertyName += (arrays[i].substring(0, 1).toUpperCase() + arrays[i].substring(1, arrays[i].length()));
		}
		return propertyName;
	}

}
