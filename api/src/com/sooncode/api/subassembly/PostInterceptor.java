package com.sooncode.api.subassembly;

 

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sooncode.api.background.entity.User;

 
 

 

/**
 * 拦截器
 * 
 * @author hechen
 *
 */

public class PostInterceptor extends HandlerInterceptorAdapter {

	public static Logger logger = Logger.getLogger("PostInterceptor.class");
	 
	 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
	 
		 
		String method = request.getMethod();
		String url = request.getRequestURL().toString();
		boolean bool1 = method.equals("POST") && url.contains("indexController/login");
		boolean bool2 = url.contains("indexController/register"); //注册
		boolean bool8 = url.contains("userController/haveUser"); //验证用户名是否存在
		boolean bool9= url.contains("userController/havaCompany"); //验证公司名称是否存在
		boolean bool3 = method.equals("POST") && url.contains("indexController/test");
		boolean bool4 = method.equals("POST") && url.contains("indexController/introduction");
		boolean bool5 = method.equals("POST") && url.contains("indexController/exit");
		boolean bool6 =   url.contains("mailController/getCode");
		boolean bool7 =   url.contains("userController/addUser");
	 

		if ( bool1 || bool2 || bool3 || bool4 ||  bool5 ||bool6 ||bool7||bool8||bool9  ) {  
			return true;
		} else {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			if (user!=null) {
				return true;
			} else { // session 中没有当前用户
				    response.sendRedirect("../login.shtml");
					return false;
				}
			}
		 
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		 
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		 
	}

	 
 

}
