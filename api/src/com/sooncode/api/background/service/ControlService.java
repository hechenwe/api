package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

 
import com.sooncode.api.background.dao.interfac.ControlDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class ControlService {
	public ControlDaoI controlDao = (ControlDaoI) ClassCache.getImplement(ControlDaoI.class) ; 
}
