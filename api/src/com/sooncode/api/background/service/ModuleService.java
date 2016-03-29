package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

import com.sooncode.api.background.dao.interfac.ModuleDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class ModuleService {
	public ModuleDaoI moduleDao = (ModuleDaoI) ClassCache.getImplement(ModuleDaoI.class) ; 
}
