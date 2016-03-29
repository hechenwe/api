package com.sooncode.api.background.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sooncode.api.background.entity.Example;
import com.sooncode.api.background.service.ExampleService;
import com.sooncode.api.background.util.RequestUtil;
 

/**
 * 返回值示例
 * 
 * @author hechen
 *
 */
@Controller()
@RequestMapping("/example")
public class ExampleController {

	@Autowired
	private ExampleService exampleServic;

	@RequestMapping("/savaExample")
	
	public ModelAndView saveExample(HttpServletRequest request, HttpSession session) {

		Map<String, Integer> exampleTypeMap = new HashMap<String, Integer>();
		exampleTypeMap.put("SUCCESS", 1);
		exampleTypeMap.put("FAILURE", 2);
		exampleTypeMap.put("EXCEPTION", 3);
		exampleTypeMap.put("OTHER", 4);
		String interfacId = request.getParameter("interfacId").trim().replace("-", "");
		String exampleId = request.getParameter("exampleId").trim().replace("-", "");
		String exampleType = request.getParameter("exampleType");
		String exampleContent = request.getParameter("exampleContent");

		Example e = new Example();
		e.setExampleId(exampleId);
		e.setInterfacId(interfacId);
		e.setExampleContent(exampleContent);
		e.setExampleType(exampleType);
		e.setCreatDate(new Date());
		e.setWeight(exampleTypeMap.get(exampleType));

		  exampleServic.exampleDao.save(e);
		Map<String,Object> map = new HashMap<>();
		map.put("example",e);
		
		return new ModelAndView("ed/div_example",map);
	}
	
	
	/**
	 * 删除返回示例
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/deleteExample")
	@ResponseBody
	public String deleteExample(HttpServletRequest request, HttpSession session) {
	 
		String exampleId = request.getParameter("exampleId").trim();
		
		Example e = new Example();
		e.setExampleId(exampleId);
		
		int n = exampleServic.exampleDao.delete(e);
		if (n == 1){
			return "1";
		}else{
			return "0";
		}
	}
	/**
	 * 修改返回示例
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/updateExample")
	@ResponseBody
	public String updateExample(HttpServletRequest request) {
		
		String exampleId = RequestUtil.getString(request, "exampleId");
		String exampleType = RequestUtil.getString(request, "exampleType");
		String exampleContent = RequestUtil.getString(request, "exampleContent");
		 
		Example e = new Example();
		e.setExampleId(exampleId);
		e.setExampleType(exampleType);
		e.setExampleContent(exampleContent);
		
		long n = exampleServic.exampleDao.update (e);
		if (n == 1){
			return "1";
		}else{
			return "0";
		}
	}
	/**
	 * 跳转修改返回示例
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/toUpdateExample")
	 
	public ModelAndView toUpdateExample(HttpServletRequest request) {
		
		String exampleId = RequestUtil.getString(request, "exampleId");
		Map <String,Object> map = new HashMap<>();
		Example e = new Example();
		e.setExampleId(exampleId);
		e =   exampleServic.exampleDao.get(e);
		map.put("example",e);
		return new ModelAndView("update/up_example",map);
	}
}
