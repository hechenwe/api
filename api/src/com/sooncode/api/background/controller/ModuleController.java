package com.sooncode.api.background.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sooncode.api.background.entity.Module;
 
import com.sooncode.api.background.service.ModuleService;
 
 
 
 

@Controller()
@RequestMapping("/module")
public class ModuleController {
	@Autowired
	private ModuleService moduleService;

	 

	/**
	 * 保存模块信息
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/saveModule")
	@ResponseBody
	public String saveModule(HttpServletRequest request, HttpSession session) {
		String projectId = request.getParameter("projectId");
		String moduleId = request.getParameter("moduleId");
		String moduleName = request.getParameter("moduleName");
		String moduleCode = request.getParameter("moduleCode");
		String moduleIntro = request.getParameter("moduleIntro");
		Module m = new Module();
		m.setProjectId(projectId.replace("-", ""));
		m.setModuleId(moduleId.replace("-", ""));
		m.setModuleName(moduleName);
		m.setModuleCode(moduleCode);
		m.setModuleIntro(moduleIntro);
		Integer weightInt = moduleService.moduleDao.getMaxWeight(projectId);
		weightInt = weightInt==null ? 0 : weightInt;
		m.setWeight(weightInt + 1);
		Long n = moduleService.moduleDao.saveOrUpdate(m);
		if (n !=null && n == 1) {
			return "1";
		}
		return "0";
	}
 

	/**
	 * 删除模块信息
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/deleteModule")
	@ResponseBody
	public String deleteModule(HttpServletRequest request, HttpSession session) {

		String moduleId = request.getParameter("moduleId");

		Module m = new Module();
		m.setModuleId(moduleId);
		int n = moduleService.moduleDao.delete(m);
		if (n == 1) {
			return "1";
		} else {
			return "0";
		}

	}

	/**
	 * 调整模块的位置
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/upOrdownModule")
	@ResponseBody
	public String upOrdownModule(HttpServletRequest request, HttpSession session) {
		String projectId = request.getParameter("projectId");
		String moduleId = request.getParameter("moduleId");
		String type = request.getParameter("type");
		String weight = request.getParameter("weight");

		Module thisModule = new Module();
		thisModule.setProjectId(projectId);
		thisModule.setWeight(Integer.parseInt(weight));
		Module tempModule = new Module();
		if ("up".equals(type)) {
			tempModule = moduleService.moduleDao.getNext(thisModule);
		} else {
			tempModule = moduleService.moduleDao.getLast(thisModule);
		}
		if (tempModule == null) {

			return "1";
		}
		thisModule = new Module();
		thisModule.setModuleId(moduleId);
		thisModule.setWeight(tempModule.getWeight());
		moduleService.moduleDao.update(thisModule);// 更新时需要 id 和 weight
		tempModule.setWeight(Integer.parseInt(weight));
		moduleService.moduleDao.update(tempModule);
		return "1";
	}

	/**
	 * 获取模块
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/getModules")
	@ResponseBody
	public Map<String, Object> getModules(HttpServletRequest request, HttpSession session) {
		String projectId = request.getParameter("projectId");

		Module m = new Module();
		m.setProjectId(projectId);

		List<Module> modules = moduleService.moduleDao.getPager(1L,Long.MAX_VALUE ,m).getLists();

		Map<String, Object> map = new HashMap<>();
		map.put("modules", modules);
		return map;
	}

	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/editModule")
	public ModelAndView editModule(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		String moduleId = request.getParameter("moduleId");
		Module module = new Module();
		module.setModuleId(moduleId);
		module = moduleService.moduleDao.get(module);
		map.put("module", module);
		return new ModelAndView("ed/ed_module", map);
	}

}
