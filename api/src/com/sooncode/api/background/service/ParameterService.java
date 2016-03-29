package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

import com.sooncode.api.background.dao.interfac.ParameterDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class ParameterService {
	public ParameterDaoI parameterDao = (ParameterDaoI) ClassCache.getImplement(ParameterDaoI.class) ; 
}
