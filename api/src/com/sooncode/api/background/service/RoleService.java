package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

import com.sooncode.api.background.dao.interfac.RoleDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class RoleService {
	public RoleDaoI roleDao = (RoleDaoI) ClassCache.getImplement(RoleDaoI.class) ; 
}
