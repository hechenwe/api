package com.sooncode.api.background.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * http 请求  其他资源系统服务器 
 * @author hechen
 *
 */
public class  HttpRequestOtherSystem {
 

	 
	/**
	 * 发送Http post请求
	 * 
	 * @param url 资源路径
	 *            
	 * @param jsonData  json 类型的数据
	 *            
	 * @return 成功:返回结果数据      错误则返回 ： ERROR
	 */
	public static String postRequest(String strURL, String jsonData) {
		
		 return request(strURL ,"POST" ,jsonData);
	}
	
	
	
	/**
	 * 发送Http get 请求
	 * @param url 资源路径
	 * @return 成功:返回结果数据      错误则返回 ： ERROR
	 */
	public static String getRequest(String url ) {
		
		 return request(url ,"GET" ,null);
	}
 
	
	/**
	 * 
	 * @param url 资源路径
	 * @param requestTpye 请求方式 
	 * @param JsonData json类型的数据 
	 * @return
	 */
	public static String request (String url , String requestTpye , String JsonData){
		
		try {
			 
			URL uRL = new URL(url);// 创建连接
			HttpURLConnection connection = (HttpURLConnection) uRL.openConnection();
			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);
			connection.setRequestMethod(requestTpye); // 设置请求方式
			connection.setRequestProperty("Accept", "application/json"); // 设置接收数据的格式
			connection.setRequestProperty("Content-Type", "application/json"); // 设置发送数据的格式
			connection.connect();
		   
			
			OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), "UTF-8"); // utf-8编码
			if(JsonData != null){
				out.append(JsonData);
			}
			out.flush();
			out.close();
			// 读取响应
			  
			InputStream is = connection.getInputStream();
			 
				byte[] data = new byte[1000*1000];
				byte[] temp = new byte[512];
				int readLen = 0;
				int destPos = 0;
				while ((readLen = is.read(temp)) > 0) {
					System.arraycopy(temp, 0, data, destPos, readLen);
					destPos += readLen;
				}
				String result = new String(data, "UTF-8").trim(); // utf-8编码
				return result;
			 
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "{\"message\":\"服务器错误\"}"; // 自定义错误信息
		
	}
	  
	public static void main(String[] args) {
		 
		
	}
	 

}