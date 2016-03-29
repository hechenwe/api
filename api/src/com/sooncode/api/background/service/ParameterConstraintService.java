package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

import com.sooncode.api.background.dao.interfac.ParameterConstraintDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class ParameterConstraintService {
	public ParameterConstraintDaoI parameterConstraintDao = (ParameterConstraintDaoI) ClassCache.getImplement(ParameterConstraintDaoI.class) ; 
}
