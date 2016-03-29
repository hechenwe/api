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

import com.sooncode.api.background.entity.Parameter;
import com.sooncode.api.background.service.ParameterService;

 
 
 
 

@Controller
@RequestMapping("/parameter")
public class ParameterController {
	@Autowired
	private ParameterService parameterService;

	// @Autowired
	// private ProjectServiceBG projectServiceBG;
	@RequestMapping("/saveParameter")
	@ResponseBody
	public String saveParameter(HttpServletRequest request, HttpSession session) {

		String interfacId = request.getParameter("interfacId");
		String parameterId = request.getParameter("parameterId");
		String parameterName = request.getParameter("parameterName");
		String parameterCode = request.getParameter("parameterCode");
		String parameterDataType = request.getParameter("parameterDataType");
		String minLength = request.getParameter("minLength");
		String maxLength = request.getParameter("maxLength");
		String parameterExample = request.getParameter("parameterExample");
		String parameterExplain = request.getParameter("parameterExplain");
		String isMust = request.getParameter("isMust");
		String type = request.getParameter("type");

		Parameter p = new Parameter();
		p.setParameterName(parameterName);
		p.setParameterDataType(parameterDataType);
		p.setCreatDate(new Date());
		p.setParameterExample(parameterExample);
		p.setParameterExplain(parameterExplain);
		p.setParameterCode(parameterCode);
		p.setMaxLength(Integer.parseInt(maxLength));
		p.setMinLength(Integer.parseInt(minLength));
		p.setIsMust(isMust);
		Integer weight = parameterService.parameterDao.getMaxWeight(interfacId);
		if (weight == null) {
			weight = 1;
		} else {
			weight = weight + 1;
		}
		p.setWeight(weight);
		long n = 0;
		if(type != null && type.equals("UPDATE")){
			p.setParameterId(parameterId);
			n = parameterService.parameterDao.update(p);
		}else{
			
			p.setParameterId(parameterId.replace("-", ""));
			p.setInterfacId(interfacId.replace("-", ""));
			n = parameterService.parameterDao.save(p);
		}
		  
		if (n == 1) {
			return "1";
		} else {
			return "0";
		}

	}

	@RequestMapping("/deleteParameter")
	@ResponseBody
	public String deleteParameter(HttpServletRequest request, HttpSession session) {
		String parameterId = request.getParameter("parameterId");
		Parameter p = new Parameter();
		p.setParameterId(parameterId.replace("-", ""));
		int n = parameterService.parameterDao.delete(p);
		if (n == 1) {
			return "1";
		} else {
			return "0";
		}
	}

	@RequestMapping("/updateParameter")

	public ModelAndView updateParameter(HttpServletRequest request) {
		String parameterId = request.getParameter("parameterId");
		Parameter p = new Parameter();
		p.setParameterId(parameterId.replace("-", ""));
		p = parameterService.parameterDao.get(p);
		Map<String, Object> map = new HashMap<>();
		map.put("parameter", p);
		return new ModelAndView("update/up_parameter", map);

	}
}
