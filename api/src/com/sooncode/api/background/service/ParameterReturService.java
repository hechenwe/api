package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

import com.sooncode.api.background.dao.interfac.ParameterReturDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class ParameterReturService {
	public ParameterReturDaoI parameterReturDao = (ParameterReturDaoI) ClassCache.getImplement(ParameterReturDaoI.class) ; 
}
