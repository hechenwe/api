package com.sooncode.api.background.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sooncode.api.background.entity.ParameterConstraint;
import com.sooncode.api.background.service.ParameterConstraintService;

 

@Controller
@RequestMapping("/parameterConstraint")
public class ParameterConstraintController {

	@Autowired
	private ParameterConstraintService parameterConstraintService;
	
	@RequestMapping("/saveParameterConstraint")
	@ResponseBody
	public String saveParameterConstraint(HttpServletRequest request,HttpSession session){
		String parameterId = request.getParameter("parameterId").replace("-", "");
		String parameterConstraintId = request.getParameter("parameterConstraintId").replace("-", "");
		String parameterConstraintCode = request.getParameter("parameterConstraintCode");
		String parameterConstraintExplain = request.getParameter("parameterConstraintExplain");
		/*String weight = request.getParameter("weight");*/
	 
		ParameterConstraint p = new ParameterConstraint();
		p.setParameterConstraintId(parameterConstraintId);
		p.setParameterConstraintCode(parameterConstraintCode);
		p.setParameterConstraintExplain(parameterConstraintExplain);
		p.setParameterId(parameterId);
		/*p.setWeight(Integer.parseInt(weight));*/
		long n = parameterConstraintService.parameterConstraintDao.save(p);
		if(n==1){
			return "1";
		}
		return "0";
	}
}
