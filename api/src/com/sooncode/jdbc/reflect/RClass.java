package com.sooncode.jdbc.reflect;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

/**
 * 反射Class
 * 
 * @author pc
 *
 */
public class RClass {

	private Class<?> clas;
	 
	public static Logger logger = Logger.getLogger("RClass.class");

	public RClass(String allClassName) {
		try {
			Class<?> c = Class.forName(allClassName);
			clas = c;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
    
	public RClass(Class<?> clas) {
			this.clas = clas;
	}
	
	
	public RClass(Object object) {

		Class<?> c = object.getClass();
		clas = c;

	}

	public Class<?> getClas() {
		return clas;
	}

	public void setClas(Class<?> clas) {
		this.clas = clas;
	}
    
	public String getClassName(){
		String [] str = this.clas.getName().split("\\.");
		return str[str.length-1].trim();
	}
	/**
	 * 创建对象
	 * 
	 * @param clas
	 *            Class 对象 (必须有无参构造器)
	 * @return
	 */
	public RObject getRObject() {
		try {
			Object object = this.clas.newInstance();
			RObject rObject = new RObject(object);
			return rObject; //
		} catch (InstantiationException e) {
			e.printStackTrace();
			return null;
		} catch (IllegalAccessException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 执行类的构造函数 (被反射的类的属性的数据类型为非基本数据类型,如 Integer String 等)
	 * 
	 * @param clas
	 *            Class 对象
	 * @param paraTypes
	 *            公有构造器需要的参数
	 * @return
	 */
	public RObject getRObject(Object... args) {
		 
		Constructor<?>[] cones = this.clas.getDeclaredConstructors();
		String str = "(";

		for (int i = 0; i < args.length; i++) {
			if (i == 0) {
				str = str + args[i].getClass().getName();

			} else {
				str = str + "," + args[i].getClass().getName();
			}
		}

		str = str + ")";
		// logger.info(str);

		for (Constructor<?> c : cones) {
			if (c.toGenericString().contains(str)) {

				Object object;
				try {
					object = c.newInstance(args);
					RObject rObject = new RObject(object);
					return rObject;
				} catch (InstantiationException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}

			}
		}

		return null;
	}

	/**
	 * 获取对象的所有属性(序列化除外)
	 * 
	 * @param clas
	 * @return
	 */
	public List<Field> getFields() {
		List<Field> list = new ArrayList<>();
		Field[] fields = clas.getDeclaredFields();
		for (Field f : fields) {
			if( !f.getName().equals("serialVersionUID")){
				list.add(f);
			}
		}
		return list;
	}

	/**
	 * 获取类的公有静态方法
	 * 
	 * @return
	 */
	public List<Method> getStaticMethods() {
		Method[] methods = this.clas.getMethods();
		List<Method> list = new ArrayList<>();
		for (int i = 0; i < methods.length; i++) {
			if (methods[i].toGenericString().contains("public static")) {
				list.add(methods[i]);
			}

		}

		return list;
	}

	public Object invokeStaticMethod(Method staticMethod, Object... args) {

		try {
			return staticMethod.invoke(null, args);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return null;
	}

	 
}
