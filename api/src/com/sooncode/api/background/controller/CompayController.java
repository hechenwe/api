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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sooncode.api.background.entity.Company;
import com.sooncode.api.background.entity.Role;
import com.sooncode.api.background.entity.User;
import com.sooncode.api.background.service.CompanyService;
import com.sooncode.api.background.service.UserService;
import com.sooncode.api.background.util.Md5;
import com.sooncode.api.background.util.MyUUID;
import com.sooncode.api.background.util.RequestUtil;
 
import com.sooncode.api.subassembly.UploadFileServic;
 

/**
 * 
 * @author hechen
 *
 */
@Controller
@RequestMapping("companyController")
public class CompayController {

	@Autowired
	private CompanyService companyService;
	@Autowired
	private UserService userService;
 
	@RequestMapping(value="/saveCompany",method=RequestMethod.POST)
	public ModelAndView  saveCompany (@RequestParam(value = "logoFile", required = false) MultipartFile logoFile,HttpServletRequest request){
		
		Company compay = new Company();
		 String companyName = request.getParameter("companyName");
		 if(logoFile != null){
			 String  filePath  =  UploadFileServic.saveFile(logoFile); 
			 compay.setLogo(filePath);
		 }
		 
		 compay.setCompanyId(MyUUID.getUUID());
		 compay.setCompanyName(companyName);
	     Long n =  companyService.companyDao.save(compay);
	     Map<String,Object> map = new HashMap<>();
	     map.put("company",compay);
		 if(n == 1){
			 
			User user = (User) request.getSession().getAttribute("user");
			user.setCompanyId(compay.getCompanyId()); 
			Long m = userService.userDao.update(user);
			if(m == 1){
				request.getSession().removeAttribute("user");
				request.getSession().setAttribute("user", user);
			}
			
			return new ModelAndView ("project",map);
		 } 
		 
		 
		 return new ModelAndView ("introduction",map);
		 
		 
	}
	
	
	/**
	 * 挑转至公司所有用户
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/user")
	public ModelAndView user(HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
 
		User u = new User();
		u.setCompanyId(user.getCompanyId());
		List<User> users = userService.userDao.getPager(1L, 10L, u, new Role()).getLists();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("users",users);
		map.put("page","user");
		 
		return new ModelAndView("user", map);
	}
	/**
	 * 保存用户
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/saveUser")
	@ResponseBody
	public String saveUser(HttpServletRequest request, HttpSession session) {
		
		String companyId = RequestUtil.getString(request, "companyId");
		String userName = RequestUtil.getString(request, "userName");
		String email = RequestUtil.getString(request, "email");
		String password = RequestUtil.getString(request, "password");
		
		User user = new User();
		user.setUserId(MyUUID.getUUID());
		user.setCompanyId(companyId);
		user.setUserName(userName);
		user.setEmail(email);
		user.setPassword(Md5.GetMD5Code(password));
		user.setRegisterDate(new Date());
		user.setRoleId("E8517FDA0CE94F01BDB80B5C81217ABC");//普通用户
		
		Long n = userService.userDao.save(user);
		
		if(n==1){
			return "1";
		}else{
			return "0";
		}
		 
	}
	/**
	 * 删除用户
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(HttpServletRequest request, HttpSession session) {
		
		String userId = RequestUtil.getString(request, "userId");
		
		User user = new User();
		user.setUserId(userId);
		 
		long n = userService.userDao.delete(user);
		
		if(n==1){
			return "1";
		}else{
			return "0";
		}
		
	}
}
