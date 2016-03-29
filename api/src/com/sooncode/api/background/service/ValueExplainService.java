package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

 
import com.sooncode.api.background.dao.interfac.ValueExplainDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class ValueExplainService {
	public ValueExplainDaoI valueExplainDao = (ValueExplainDaoI) ClassCache.getImplement(ValueExplainDaoI.class) ; 
}
