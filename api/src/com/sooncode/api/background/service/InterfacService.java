package com.sooncode.api.background.service;

 

import org.springframework.stereotype.Service;

import com.sooncode.api.background.dao.interfac.InterfacDaoI;
 
import com.sooncode.api.background.util.ClassCache;
 

@Service
public class InterfacService {
	public InterfacDaoI interfacDao = (InterfacDaoI) ClassCache.getImplement(InterfacDaoI.class) ; 
	 
}
