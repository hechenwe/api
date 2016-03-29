package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

import com.sooncode.api.background.dao.interfac.UserDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class UserService {
	
	public UserDaoI userDao = (UserDaoI) ClassCache.getImplement(UserDaoI.class) ;

}
