package com.sooncode.jdbc.reflect;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;

 

/**
 * 反射创建的对象
 * 
 * @author pc
 *
 */
public class RObject {
	public static Logger logger = Logger.getLogger("RObject.class");
	/** 被反射代理的对象 */
	private Object object;
	// private Class<?> clas;

	
	public RObject(Object object) {
		this.object = object;
		Map<String, Object> fields = this.getFiledAndValue();
		for (Map.Entry<String, Object> entry : fields.entrySet()) {
			this.invokeSetMethod(entry.getKey(), entry.getValue());
		}
	}
	public RObject(Class<?> clas) {
		 
		
		try {
			this.object = clas.newInstance();
			Map<String, Object> fields = this.getFiledAndValue();
			for (Map.Entry<String, Object> entry : fields.entrySet()) {
				this.invokeSetMethod(entry.getKey(), entry.getValue());
			}
			
		} catch ( Exception e) {
			 
			e.printStackTrace();
		}  
	}
	/** 获取对象的类名 */
	public String getClassName() {
		// String[] str = this.object.getClass().getName().split("\\.");
		return this.object.getClass().getSimpleName();// str[str.length -
														// 1].trim();
	}

	/** 获取对象的全类名 */
	public String getAllClassName() {
		return this.object.getClass().getName();
	}

	/** 获取被反射代理的对象 */
	public Object getObject() {
		return object;
	}

	/**
	 * 获取被反射代理对象的属性集(除serialVersionUID属性外)
	 * 
	 * @return
	 */
	public List<Field> getFields() {
		List<Field> list = new ArrayList<>();
		Field[] fields = this.object.getClass().getDeclaredFields();
		for (Field f : fields) {
			if (!f.getName().equals("serialVersionUID")) {
				list.add(f);
			}
		}
		return list;
	}

	/**
	 * 判断属性是否存在
	 * 
	 * @param field
	 * @return
	 */
	public Boolean hasField(String field) {
		if (field == null || field.equals("")) {
			return false;
		}
		Field[] fields = this.object.getClass().getDeclaredFields();
		for (Field f : fields) {
			if (f.getName().equals(field.trim())) {
				return true;
			}
		}
		return false;

	}
	
	
	/**
	 * 判断属性是否存在
	 * @param type 属性的类型（简单类名）
	 * @param field 属性名称
	 * @return
	 */
	public Boolean hasField(String type,String field) {
		if (field == null || field.equals("")) {
			return false;
		}
		Field[] fields = this.object.getClass().getDeclaredFields();
		for (Field f : fields) {
			if (f.getName().equals(field.trim()) && f.getType().getSimpleName().equals(type)) {
				return true;
			}
		}
		return false;
		
	}

	/**
	 * 获取 list 类型的属性名称
	 * @param listClass list的数据类型
	 * @return
	 */
	public String getListFieldName(Class<?> listClass) {
		List<Field> fields = getFields();
		for (Field f : fields) {
			if (f.getType().toString().contains("interface java.util.List")) {
				ParameterizedType pt = (ParameterizedType) f.getGenericType();
				String str = pt.getActualTypeArguments()[0].toString(); // 获取List泛型参数类型名称
				str = str.replace("class ", "").trim();// 全类名
				if(str.equals(listClass.getName())){
					return f.getName() ;
				}
			}
		}
		return null;
	}
	
	

	/**
	 * 执行对象的SET方法
	 * 
	 * @param fieldName
	 * @param args
	 */
	public void invokeSetMethod(String fieldName, Object... args) {
		PropertyDescriptor pd;
		try {
			pd = new PropertyDescriptor(fieldName, this.object.getClass());
			// 获得set方法
			Method method = pd.getWriteMethod();
			method.invoke(object, args);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (IntrospectionException e) {
			e.printStackTrace();

		}

	}

	/**
	 * 获取Set方法的参数类型
	 * 
	 * @param fieldName
	 * @return
	 */
	public Class<?> getSetMethodParamertType(String fieldName) {
		PropertyDescriptor pd;
		try {
			pd = new PropertyDescriptor(fieldName, this.object.getClass());
			Method method = pd.getWriteMethod();
			Class<?>[] c = method.getParameterTypes();
			return c[0];
		} catch (IntrospectionException e) {
			e.printStackTrace();
			return null;
		}

	}

	/**
	 * 执行对象的GET方法
	 * 
	 * @param fieldName
	 * @return
	 */
	public Object invokeGetMethod(String fieldName) {
		PropertyDescriptor pd;
		try {
			pd = new PropertyDescriptor(fieldName, this.object.getClass());
			// 获得set方法
			Method method = pd.getReadMethod();
			return method.invoke(this.object);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			return null;
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
			return null;
		} catch (InvocationTargetException e) {
			e.printStackTrace();
			return null;
		} catch (IntrospectionException e) {
			e.printStackTrace();
			return null;
		}

	}

	/** 获取对象的属性和其对应的值 */
	public Map<String, Object> getFiledAndValue() {

		String str = "Integer Long Short Byte Float Double Character Boolean Date String";
		Map<String, Object> map = new HashMap<>();
		Class<?> c = object.getClass();
		Field[] fields = c.getDeclaredFields();
		for (Field field : fields) {
			// logger.info(field.getName());
			if (!field.getName().equals("serialVersionUID") && str.contains(field.getType().getSimpleName())) {
				map.put(field.getName(), this.invokeGetMethod(field.getName()));
			}
		}
		return map;
	}

	/** 获取对象的第一个属性名称 （主键） */
	public String getPk() {

		// String str = "Integer Long String"; //主键可能的数据类型
		Class<?> c = object.getClass();
		Field[] fields = c.getDeclaredFields();
		for (Field field : fields) {
			if (!field.getName().equals("serialVersionUID")) { // &&
																// str.contains(field.getType().getSimpleName()))
																// {
				return field.getName();
			}
		}
		return null;
	}

	/** 设置对象的第一个属性名称 （主键） */
	public void setPk(Object value) {
		String pk = getPk();
		invokeSetMethod(pk, value);

	}

	/** 获取对象的第一个属性的值 */
	public Object getPkValue() {

		String str = "Integer Long Short Byte Float Double Character Boolean Date String";
		Class<?> c = object.getClass();
		Field[] fields = c.getDeclaredFields();
		for (Field field : fields) {
			// logger.info(field.getName());
			if (!field.getName().equals("serialVersionUID") && str.contains(field.getType().getSimpleName())) {

				return this.invokeGetMethod(field.getName());
			}
		}
		return null;
	}

	/**
	 * 反射执行方法
	 * 
	 * @param methodName
	 *            方法名称
	 * @param args
	 *            方法需要的参数集
	 * @return 方法执行的返回值
	 */
	public Object invoke(String methodName, Object... args) {
		try {
			Method method = null;
			for (Class<?> clazz = object.getClass(); clazz != Object.class; clazz = clazz.getSuperclass()) {
				try {
					method = clazz.getDeclaredMethod(methodName, new Object().getClass());
				} catch (Exception e) {
				}
			}
			return method.invoke(object, args);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static Method getDeclaredMethod(Object object, String methodName) {
		Method method = null;
		for (Class<?> clazz = object.getClass(); clazz != Object.class; clazz = clazz.getSuperclass()) {
			try {
				method = clazz.getDeclaredMethod(methodName);
				return method;
			} catch (Exception e) {
			}
		}
		return null;
	}

	/**
	 * 用json数据格式重写 实体的toString()方法
	 * 
	 * @param obj
	 * @return
	 */
	public static String toJson(Object obj) {

		RObject rO = new RObject(obj);
		Map<String, Object> map = rO.getFiledAndValue();

		String json = "{";
		int n = 0;
		for (Map.Entry<String, Object> en : map.entrySet()) {
			if (n != 0) {
				json = json + ",";
			}
			json = json + "\"" + en.getKey() + "\":";
			if (en.getValue() != null) {
				String simpleName = en.getValue().getClass().getSimpleName();
				if (simpleName.equals("String")) {
					json = json + "\"" + en.getValue() + "\"";
				} else if (simpleName.equals("Date")) {
					Date date = (Date) en.getValue();
					json = json + "\"" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date) + "\"";

				} else {
					json = json + en.getValue();
				}
			} else {

				json = json + null;
			}
			n++;
		}
		json = json + "}";
		return json;

	}

	public static void main(String[] args) {
		 

	}
}
