package com.sooncode.api.background.controller;

import java.io.IOException;
import java.io.PrintWriter;
 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 跨越请求Controller
 * @author pc
 *
 */
@Controller
@RequestMapping("/spanRequestController")
public class SpanRequestController {

	/**
	 * 请求
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/request" ,method = RequestMethod.POST)
	@ResponseBody
	public void request(HttpServletRequest request ,HttpServletResponse response){
		
		String url = request.getParameter("url");
		String requestType = request.getParameter("requestType");
		String jsonString = request.getParameter("jsonString");
		
		String resultJsonString = ""; 
		if(requestType.equals("POST")){
			  resultJsonString =  HttpRequestOtherSystem.postRequest(url,jsonString);
			
		}else if(requestType.equals("GET")){
			  resultJsonString =  HttpRequestOtherSystem.getRequest(url);
		}
		 
		printWriterJson(resultJsonString,response) ;
		
		
	}
	
	/**
	 * 将json字符串写入response输入流中
	 * @param jsonString
	 * @param response
	 */
	private static void printWriterJson(String jsonString  ,  HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");  
		response.setContentType("application/json; charset=utf-8");
		PrintWriter printWriter = null; 
		 try {
			 printWriter = response.getWriter();
			 printWriter.append(jsonString);  
		} catch (IOException e) {
		 
			e.printStackTrace();
		}finally {
			printWriter.close();
		}
	}
}
