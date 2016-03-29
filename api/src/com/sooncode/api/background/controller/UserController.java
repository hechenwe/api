package com.sooncode.api.background.controller;

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

import com.sooncode.api.background.entity.Company;
import com.sooncode.api.background.entity.Control;
import com.sooncode.api.background.entity.Email;
import com.sooncode.api.background.entity.Operation;
import com.sooncode.api.background.entity.Project;
import com.sooncode.api.background.entity.Role;
import com.sooncode.api.background.entity.User;
import com.sooncode.api.background.service.CompanyService;
import com.sooncode.api.background.service.ControlService;
import com.sooncode.api.background.service.EmailService;
import com.sooncode.api.background.service.OperationService;
import com.sooncode.api.background.service.RoleService;
import com.sooncode.api.background.service.UserService;
import com.sooncode.api.background.util.Md5;
import com.sooncode.api.background.util.MyUUID;
import com.sooncode.api.background.util.RequestUtil;
 

/**
 * 
 * @author pc
 *
 */
@Controller
@RequestMapping("/userController")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private EmailService emailService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private OperationService operationService;
	@Autowired
	private ControlService  controlService;

	@RequestMapping("/addUser")
	@ResponseBody
	public String addUser(HttpServletRequest request) {

		String companyName = request.getParameter("companyName");
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String code = request.getParameter("code");
		String password = request.getParameter("password");

		Email e = new Email();
		e.setEmail(email);
		List<Email> emails = emailService.emailDao.getPager(1L,1L,e).getLists();
		if (emails.size() == 1) {
			e = emails.get(0);
			if (code.equals(e.getCode() + "")) {// 验证码有效
				User user = new User();
				user.setUserId(MyUUID.getUUID());
				user.setEmail(email);
				user.setUserName(userName);
				user.setPassword(Md5.GetMD5Code(password));
                //分配权限
				Role role = new Role();
				role.setRoleCode("ADMIN");
				List<Role> roles = roleService.roleDao.getPager(1L,1L,role).getLists();
				if (roles.size() == 1) {
					role = roles.get(0);
				}
				user.setRoleId(role.getRoleId());// 管理员的ID
				//创建用户的公司
				
				Company c = new Company();
				String uuid = MyUUID.getUUID();
				c.setCompanyId(uuid);
				c.setCompanyName(companyName);
				
				companyService.companyDao.save(c);
				
				user.setCompanyId(uuid);
				user.setCompany(c);
				user.setRegisterDate(new Date());
				long n = userService.userDao.save(user);

				
				
				
				if (n == 1) {
					user.setRole(role);
					HttpSession session = request.getSession();
					session.setAttribute("user", user);
					return user.getUserId();
				} else {
					return "0";// 失败
				}
			} else {
				return "500";// 验证码错误
			}
		} else {
			return "0";
		}

	}

	@RequestMapping("/toRole")
	public ModelAndView toRole(HttpServletRequest request,HttpSession session) {
        String userId = RequestUtil.getString(request, "userId");
        String userName = RequestUtil.getString(request, "userName");
		
       Map<String, Object> map = new HashMap<String, Object>();
		
		User user = (User) session.getAttribute("user");
		
		
	//	List<Project> allProjects =  companyService.companyDao.selectCompanyAndProjects(user.getCompany(), null, 1, Integer.MAX_VALUE).getProjects();
		Company c = new Company();
		c.setCompanyId(user.getCompanyId());
		c =  companyService.companyDao.getPager(1L,Long.MAX_VALUE,c,new Project()).getEntity();
		map.put("projects",c.getProjects());
		map.put("userId",userId);
		map.put("userName",userName);
		
		Control con = new Control();
		con.setUserId(userId);
		List<Control> controles = controlService.controlDao.getPager(1L,Long.MAX_VALUE,con).getLists();
		
		map.put("controles",controles );
		map.put("page","user");
		return new ModelAndView("role", map);

	}
	
	
	@RequestMapping("/settingRole")
	@ResponseBody
	public String settingRole(HttpServletRequest request,HttpSession session) {
		String userId = RequestUtil.getString(request, "userId");
		String projectId = RequestUtil.getString(request, "projectId");
		String operationCode = RequestUtil.getString(request, "operationCode");
		
		Control oldC= new Control();
		oldC.setUserId(userId);
		oldC.setProjectId(projectId);
		List<Control> controles = controlService.controlDao.getPager(1L,1L,oldC).getLists();
		
		
		Operation o = new Operation();
		
		if(!operationCode.equals("NULL")){
			o.setOperationCode(operationCode);
			o= operationService.operationDao.getPager(1L,1L,o).getLists().get(0);
			
		}else{
			if(controles.size()==1){
				controlService.controlDao.delete(controles.get(0));
			}
			return "1";
		}
		
		
		
		if(controles.size()==1){
			oldC = controles.get(0);
			
			 
			oldC.setOperationId(o.getOperationId());
			controlService.controlDao.update(oldC);
			
		}else{
			Control c= new Control();
			c.setControlId(MyUUID.getUUID());
			c.setUserId(userId);
			c.setProjectId(projectId);
			c.setOperationId(o.getOperationId());
			controlService.controlDao.save(c);
		}
		
		
		return "1";
		
	}
	/**
	 * 验证用户名是否存在
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/haveUser")
	@ResponseBody
	public String haveUser(HttpServletRequest request,HttpSession session) {
		String userName = RequestUtil.getString(request, "userName");
		User user = new User();
		user.setUserName(userName);
		
		List<User>  users= userService.userDao.getPager(1L,1L,user).getLists();
		if(users.size()==1){
			return "1";
		}else{
			return "0";
		}
		
	}
	/**
	 * 验证公司名称是否存在
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/havaCompany")
	@ResponseBody
	public String havaCompany(HttpServletRequest request,HttpSession session) {
		String companyName = RequestUtil.getString(request, "companyName");
		Company c = new Company();
		c.setCompanyName(companyName);
		List<Company>  companies= companyService.companyDao.getPager(1L,1L,c).getLists();
		if(companies.size()==1){
			return "1";
		}else{
			return "0";
		}
		
	}

}
