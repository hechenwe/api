package com.sooncode.api.background.controller;

import java.util.ArrayList;
import java.util.Date;
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

import com.sooncode.api.background.controller.project.FreemarkerOut;
import com.sooncode.api.background.entity.Project;
import com.sooncode.api.background.entity.User;
import com.sooncode.api.background.service.ProjectService;
import com.sooncode.api.background.util.MyUUID;
 

@Controller
@RequestMapping("/project")
public class ProjectController {
	

	@Autowired
	private ProjectService projectService;
    /**
     * 跳转至 add_project页面
     * @param request
     * @param session
     * @return
     */
	@RequestMapping("/addProject")
	// @ResponseBody
	public ModelAndView addProject(HttpServletRequest request, HttpSession session) {
		String userId = request.getParameter("userId");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		return new ModelAndView("add_project", map);
	}

	@RequestMapping("/edIndex")
	public ModelAndView edIndex(HttpServletRequest request, HttpSession session) {
		String projectId = request.getParameter("projectId");
		Map<String, Object> map = new HashMap<String, Object>();
		Project p = new Project();
		p.setProjectId(projectId);
		Project project = projectService.projectDao.getProjectsModules(projectId);
		if (project == null) { // 新创建的项目 没有模块信息
			project = projectService.projectDao.get(p);

		}
		map.put("project", project);
		map.put("page","project");
		return new ModelAndView("ed/ed_index", map);
	}

	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, HttpSession session) {
		String projectCode = request.getParameter("projectCode");
		return new ModelAndView("project/" + projectCode, null);
	}

	@RequestMapping("/releaseProjectApi")
	@ResponseBody
	public String releaseProjectApi(HttpServletRequest request) {
		String projectId = request.getParameter("projectId");

		Map<String, Object> map = new HashMap<String, Object>();

		Project p = new Project();
		p.setProjectId(projectId);

		Project project = projectService.projectDao.getProjectAllInfo(projectId);
		User user = (User) request.getSession().getAttribute("user");
		map.put("project", project);
		map.put("user", user);

		try {
			FreemarkerOut.fileOutput(map, project.getProjectCode());
		} catch (Exception e) {

			e.printStackTrace();
		}

		return "1";
	}

	/**
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveProject")
	@ResponseBody
	public String saveProject(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
		String companyId = request.getParameter("companyId");
		String projectName = request.getParameter("projectName");
		String projectCode = request.getParameter("projectCode");
		 
		Project p = new Project();
		p.setProjectId(MyUUID.getUUID());
		p.setCompanyId(companyId);
		p.setProjectName(projectName);
		p.setProjectCode(projectCode);
		p.setAuthorName(user.getUserName());
		p.setVersions("1.0");
		p.setCreatDate(new Date());
		p.setWeight(1);
	    projectService.projectDao.save(p); 
		return "1";
	}

	/**
	 * 是否存在项目名称
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/haveProjectName")
	@ResponseBody
	public String haveProjectName(HttpServletRequest request) {

		String companyId = request.getParameter("companyId");
		String projectName = request.getParameter("projectName");
		String projectCode = request.getParameter("projectCode");
		
		  
		
		
		if (projectName != null && projectName.trim().equals("")) {
			projectName = null;
		}
		if (projectCode != null && projectCode.trim().equals("")) {
			projectCode = null;
		}
		Project p1 = new Project();
		p1.setCompanyId(companyId);
		p1.setProjectName(projectName);
		List<Project> projects1;
		if (projectName == null) {
			projects1 = new ArrayList<>();
		} else {
			projects1 = projectService.projectDao.getPager(1L,1L,p1).getLists();
		}

		Project p2 = new Project();
		p2.setCompanyId(companyId);
		p2.setProjectCode(projectCode);
		List<Project> projects2;
		if (projectCode == null) {
			projects2 = new ArrayList<Project>();
		} else {
			projects2 = projectService.projectDao.getPager(1L,1L,p2).getLists();

		}

		if (projects1.size() == 1 || projects2.size() == 1) {
			return "1"; // 项目名称 或者 项目代码 存在
		} else {
			return "0";// 项目名称 或者 项目代码 不存在

		}

	}
	
	
	/**
	 * 删除项目文档
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteProject")
	@ResponseBody
	public String deleteProject(HttpServletRequest request){
		String projectId = request.getParameter("projectId");
		
		Integer n = projectService.deleteProject(projectId);
		
		return n + "";
	}

}
