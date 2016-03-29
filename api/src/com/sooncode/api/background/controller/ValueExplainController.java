package com.sooncode.api.background.controller;

 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sooncode.api.background.entity.ValueExplain;
import com.sooncode.api.background.service.ValueExplainService;

 
/**
 * 返回值示例
 * 
 * @author hechen
 *
 */
@Controller()
@RequestMapping("/valueExplain")
public class ValueExplainController {

	@Autowired
	private ValueExplainService valueExplainService;

	@RequestMapping("/savaValueExplain")
	@ResponseBody
	public String savaValueExplain(HttpServletRequest request, HttpSession session) {

		 
		String valueExplainId = request.getParameter("valueExplainId").trim().replace("-", "");
		String parameterId = request.getParameter("parameterId").trim().replace("-", "");
		String value = request.getParameter("value");
		String valueMeaning = request.getParameter("valueMeaning");
	/*	String weight = request.getParameter("weight");*/

		ValueExplain ve = new ValueExplain();
		ve.setParameterId(parameterId);
		ve.setValue(value);
		ve.setValueExplainId(valueExplainId);
		ve.setWeight(Integer.parseInt("1"));
		ve.setValueMeaning(valueMeaning);

		long n = valueExplainService.valueExplainDao.save(ve);
		if (n == 1) return "1";
		return "0";
	}
}
