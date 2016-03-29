package com.sooncode.api.background.controller;

import java.util.Date;
 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sooncode.api.background.entity.ParameterRetur;
import com.sooncode.api.background.service.ParameterReturService;


/**
 * 返回值示例
 * 
 * @author hechen
 *
 */
@Controller()
@RequestMapping("/parameterRetur")
public class ParameterReturController {

	@Autowired
	private ParameterReturService parameterReturService;

	@RequestMapping("/saveParameterRetur")
	@ResponseBody
	public String saveParameterRetur(HttpServletRequest request, HttpSession session) {
	 
		String exampleId = request.getParameter("exampleId").trim().replace("-", "");
		String parameterId = request.getParameter("parameterId").trim().replace("-", "");
		String parameterName = request.getParameter("parameterName");
		String parameterCode = request.getParameter("parameterCode");
		String parameterDataType = request.getParameter("parameterDataType");
		String minLength = request.getParameter("minLength");
		String maxLength = request.getParameter("maxLength");
		String parameterExample = request.getParameter("parameterExample");
		String parameterExplain = request.getParameter("parameterExplain");
		String isMust = request.getParameter("isMust");

		ParameterRetur pr = new ParameterRetur();
		pr.setParameterId(parameterId);
		pr.setExampleId(exampleId);
		pr.setParameterName(parameterName);
		pr.setParameterCode(parameterCode);
		pr.setParameterDataType(parameterDataType);
		if(parameterDataType.equals("String")){
			pr.setMinLength(Integer.parseInt(minLength));
			pr.setMaxLength(Integer.parseInt(maxLength));
		}
		pr.setParameterExample(parameterExample);
		pr.setParameterExplain(parameterExplain);
		pr.setIsMust(isMust);
		pr.setWeight(1);
		pr.setCreatDate(new Date());
		 

		long n = parameterReturService.parameterReturDao.save(pr);
		if (n == 1) return "1";
		return "0";
	}
}
