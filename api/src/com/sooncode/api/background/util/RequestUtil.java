package com.sooncode.api.background.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

/**
 * Request获取参数的工具类
 * 
 * @author pc
 *
 */
public class RequestUtil {

	/**
	 * 获取String类型的参数
	 * 
	 * @param request
	 * @param parameterName
	 * @return
	 */
	public static String getString(HttpServletRequest request, String parameterName) {

		String str = request.getParameter(parameterName);
		if(str != null){
			return str.trim();
		}else{
			return null;
		}
		 
	}

	/**
	 * 获取int类型的参数
	 * 
	 * @param request
	 * @param parameterName
	 * @return
	 */
	public static Integer getInt(HttpServletRequest request, String parameterName) {
		String str = request.getParameter(parameterName);
		Integer parameter = null;
		if (str != null && !str.equals("")) {
			try {
				parameter = Integer.parseInt(str.trim());
			} catch (Exception e) {
				
			}
		}  
		return parameter;
	}

	/**
	 * 获取long类型的参数
	 * 
	 * @param request
	 * @param parameterName
	 * @return
	 */
	public static Long getLong(HttpServletRequest request, String parameterName) {
		String str = request.getParameter(parameterName);
		Long parameter = null;
		if (str != null && !str.equals("")) {
			try {
				parameter = Long.parseLong(str.trim());
			} catch (Exception e) {
				
			}
		}  
		return parameter;
	}
	
	/**
	 * 获取boolean类型的参数
	 * 
	 * @param request
	 * @param parameterName
	 * @return
	 */
	public static Boolean getBoolean(HttpServletRequest request, String parameterName) {
		String str = request.getParameter(parameterName);
		Boolean parameter = null;
		if (str != null && !str.equals("")) {
			try {
				parameter = Boolean.parseBoolean(str.trim());
			} catch (Exception e) {
				
			}
		}  
		return parameter;
	}
	
	/**
	 * 获取byte类型的参数
	 * 
	 * @param request
	 * @param parameterName
	 * @return
	 */
	public static Byte getByte(HttpServletRequest request, String parameterName) {
		String str = request.getParameter(parameterName);
		Byte parameter = null;
		if (str != null && !str.equals("")) {
			try {
				parameter = Byte.parseByte(str.trim());
			} catch (Exception e) {
				
			}
		}  
		return parameter;
	}
	
	
	/**
	 * 获取short类型的参数
	 * 
	 * @param request
	 * @param parameterName
	 * @return
	 */
	public static Short getShort(HttpServletRequest request, String parameterName) {
		String str = request.getParameter(parameterName);
		Short parameter = null;
		if (str != null && !str.equals("")) {
			try {
				parameter = Short.parseShort(str.trim());
			} catch (Exception e) {
				
			}
		}  
		return parameter;
	}
	
	/**
	 * 获取float类型的参数
	 * 
	 * @param request
	 * @param parameterName
	 * @return
	 */
	public static Float getFloat(HttpServletRequest request, String parameterName) {
		String str = request.getParameter(parameterName);
		Float parameter = null;
		if (str != null && !str.equals("")) {
			try {
				parameter = Float.parseFloat(str.trim());
			} catch (Exception e) {
				
			}
		}  
		return parameter;
	}
	/**
	 * 获取double类型的参数
	 * 
	 * @param request
	 * @param parameterName
	 * @return
	 */
	public static Double getDouble(HttpServletRequest request, String parameterName) {
		String str = request.getParameter(parameterName);
		Double parameter = null;
		if (str != null && !str.equals("")) {
			try {
				parameter = Double.parseDouble(str.trim());
			} catch (Exception e) {
				
			}
		}  
		return parameter;
	}
	
	/**
	 * 获取Date类型的参数
	 * 
	 * @param request 
	 * @param parameterName 参数名称
	 * @param formatDate 时间格式 如："yyyy-MM-dd"
	 * @return
	 */
	public static Date getDate(HttpServletRequest request, String parameterName ,String formatDate) {
		String str = request.getParameter(parameterName);
		Date parameter = null;
		if (str != null && !str.equals("")) {
			try {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat(formatDate);//小写的mm表示的是分钟  
				parameter = simpleDateFormat.parse(str.trim());  
			} catch (Exception e) {
				
			}
		}  
		return parameter;
	}
 
 
}
