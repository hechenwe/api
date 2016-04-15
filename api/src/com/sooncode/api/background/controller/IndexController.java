package com.sooncode.api.background.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.fabric.xmlrpc.base.Array;
import com.sooncode.api.background.entity.Company;
import com.sooncode.api.background.entity.Control;
import com.sooncode.api.background.entity.Project;
import com.sooncode.api.background.entity.Role;
import com.sooncode.api.background.entity.User;
import com.sooncode.api.background.service.CompanyService;

import com.sooncode.api.background.service.UserService;
import com.sooncode.api.background.util.Md5;

@Controller
@RequestMapping("/indexController")
public class IndexController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private UserService userService;

	private static Logger logger = Logger.getLogger("IndexController.class");

	/**
	 * 登录系统
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request, HttpSession session) {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		User user = new User();
		user.setUserName(userName);
		// List<User> users = userService.selectUserPage(user, 1, 1).getLists();
		user = userService.userDao.get(user);// (user, 1, 1).getLists();
		Map<String, Object> map = new HashMap<String, Object>();

		if (user != null && user.getPassword().equals(Md5.GetMD5Code(password))) {
			// if ( users.size()==1 &&
			// users.get(0).getPassword().equals(password)) {//

			session.setAttribute("user", user);
			map.put("userId", user.getUserId());

			Company company = new Company();

			company.setCompanyId(user.getCompanyId());

			company = companyService.companyDao.get(company);

			List<User> users = userService.userDao.getPager(1L, 1L, user, new Role(), new Company()).getLists();// (user,
																												// null,
																												// null,
																												// 1,
																												// 1).getLists();
			if (users != null && users.size() == 1) {
				session.removeAttribute("user");
				session.setAttribute("user", users.get(0));
			}

			map.put("page", "introduction");
			return new ModelAndView("introduction", map);

		}
		return new ModelAndView("login/login", map);

	}

	@RequestMapping("/edIndex")
	public ModelAndView edIndex(HttpServletRequest request, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Project p = new Project();
		p.setProjectId("9B8AACB65185483DAADF914C26703FD9");

		// Project project = projectServiceBG.getProjectByProjectId(p);

		// map.put("project", project);

		return new ModelAndView("ed_index", map);
	}

	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		Project p = new Project();
		p.setProjectId("9B8AACB65185483DAADF914C26703FD9");

		// Project project = projectServiceBG.getProjectByProjectId(p);

		// map.put("project", project);

		logger.info(p);
		return new ModelAndView("index", map);
	}

	/**
	 * 挑转至注册页面
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/register")
	public ModelAndView register(HttpServletRequest request, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		return new ModelAndView("register/register", map);
	}

	/**
	 * 挑转至自定义调试页面
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/test")
	public ModelAndView test(HttpServletRequest request, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", "test");
		return new ModelAndView("test/test", map);
	}

	/**
	 * 挑转至自定义入门页面
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/introduction")
	public ModelAndView introduction(HttpServletRequest request, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("page", "introduction");
		return new ModelAndView("introduction", map);
	}

	/**
	 * 挑转至项目管理页面
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/project")
	public ModelAndView project(HttpServletRequest request, HttpSession session) {

		Map<String, Object> map = new HashMap<String, Object>();

		User user = (User) session.getAttribute("user");
		// 管理员

		if (user.getRole().getRoleCode().equals("ADMIN")) { // 管理员
			Company company = new Company();
			company.setCompanyId(user.getCompanyId());
			company = companyService.companyDao.getPager(1L, 10L, company, new Project()).getEntity();
			List<Project> projects;
			if (company == null) {
				projects = null;
			} else {
				projects = company.getProjects();

			}
			map.put("projects", projects);
		} else if (user.getRole().getRoleCode().equals("GENERAL")) {// 普通用户
			Control control = new Control();
			control.setUserId(user.getUserId());
			user = userService.userDao.getPager(1L, 10L, user, new Control(), new Project()).getEntity();
			// Pager<Project> projectsPager = userService.userDao.getPager( 1L,
			// Long.MAX_VALUE, user, new
			// Project());//.selectUserAndProjects(user, null, 1,
			// Integer.MAX_VALUE).get("projectPager");

			List<Project> projects = new ArrayList<>();
			if (user != null) {
				projects = user.getProjects();
			}
			map.put("projects", projects);

		}
		map.put("page", "project");
		return new ModelAndView("project", map);
	}

	/**
	 * 退出系统
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/exit")
	public ModelAndView exit(HttpServletRequest request, HttpSession session) {

		session.removeAttribute("user");

		Map<String, Object> map = new HashMap<String, Object>();

		return new ModelAndView("login/login", map);
	}

}
