package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

 
import com.sooncode.api.background.dao.interfac.ExampleDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class ExampleService {
	public ExampleDaoI exampleDao = (ExampleDaoI) ClassCache.getImplement(ExampleDaoI.class) ; 
}
