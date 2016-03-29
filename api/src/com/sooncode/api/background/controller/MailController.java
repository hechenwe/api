package com.sooncode.api.background.controller;

import java.io.UnsupportedEncodingException;
 
import java.util.List;
 
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sooncode.api.background.entity.Email;
import com.sooncode.api.background.service.EmailService;
import com.sooncode.api.background.util.MailUtil;
import com.sooncode.api.background.util.MyUUID;

/**
 * 邮箱验证码
 * 
 * @author pc
 *
 */
@Controller
@RequestMapping("/mailController")
public class MailController {

	public static Logger logger = Logger.getLogger("IndexController.class");

	@Autowired
	private EmailService emailService;

	/**
	 * 挑转至注册页面
	 * 
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping("/getCode")
	@ResponseBody
	public String getCode(HttpServletRequest request, HttpSession session) {

		String email = request.getParameter("email").trim();

		Random random = new Random();
		int code = random.nextInt(899999);
		String tital = "SOON CODE 注册验证码";
		String message = "欢迎您注册!您的验证码为:" + code;
		try {
			MailUtil.sendEmail(email, tital, message);
			Email e = new Email();
			e.setEmail(email);
            List<Email> emails = emailService.emailDao.getPager(1L,1L,e).getLists();
            if(emails.size()==1){
            	e = emails.get(0);
            	e.setEmail(email);
            	e.setCode(code);
				long n = emailService.emailDao.update(e);
				if (n == 1) {
					return "1";
				} else {
					return "0";
				}
            }else{
            	Email newEmail = new Email();
				newEmail.setVerificationId(MyUUID.getUUID());
				newEmail.setEmail(email);
				newEmail.setCode(code);
				long n = emailService.emailDao.save(newEmail);
				if (n == 1) {
					return "1";
				} else {
					return "0";
				}
            	
            }
			
		 

		} catch (UnsupportedEncodingException e) {
			
			e.printStackTrace();
			return "0";
		}

		 
	}

}
