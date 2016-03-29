package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

import com.sooncode.api.background.dao.interfac.OperationDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class OperationService {
	public OperationDaoI operationDao = (OperationDaoI) ClassCache.getImplement(OperationDaoI.class) ; 
}
