package com.sooncode.api.background.controller.project;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import org.apache.log4j.Logger;

 

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

public class FreemarkerOut {
	
	private static Configuration configuration;
	private static Logger logger = Logger.getLogger("DaoCodeGenerator.class");

	static {
		char l = File.separatorChar;
		configuration = new Configuration();
		String templatePath =Thread.currentThread().getContextClassLoader().getResource("/").getPath()+ ""; 
        String path = l  + "com" + l  + "sooncode" +l  + "api" + l  + "background"+ l  + "controller"+ l  + "project";
		 
        File tempfile = new File(templatePath+path);
		try {
			configuration.setDirectoryForTemplateLoading(tempfile);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	public static void fileOutput(Map<String,Object>map,String projectCode) throws Exception {
		//char l = File.separatorChar;
		String path =  System.getProperty("api.root")+"project";
		configuration.setObjectWrapper(new DefaultObjectWrapper());
		configuration.setDefaultEncoding("UTF-8");
		Template template = configuration.getTemplate("index.html");// 模板名称
		File folder = new File(path); // 创建文件夹
		 
		boolean isExist = folder.exists();
		if (isExist == false) { // 该文件夹不存在
			folder.mkdirs(); // 创建文件夹
			isExist = true;
		}
		if (isExist) {
			logger.info(path+File.separatorChar+projectCode+".html");
			File file = new File(path+File.separatorChar+projectCode+".shtml");// 创建文件
			 
			Writer riter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
			template.process(map, riter);
			riter.flush();
			riter.close();
			
			//----------------------压缩html代码
			/*FileUtil fileUtil = new FileUtil();
			String html = fileUtil.readFile(path+File.separatorChar+projectCode+".html");
			html = HtmlCompressor.compress(html);
			fileUtil.writeFile(path+File.separatorChar+projectCode+".html", html, "utf-8");*/
			
			
		}
	}
}
