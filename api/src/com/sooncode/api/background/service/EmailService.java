package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

 
import com.sooncode.api.background.dao.interfac.EmailDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class EmailService {
	public EmailDaoI emailDao = (EmailDaoI) ClassCache.getImplement(EmailDaoI.class) ; 
}
