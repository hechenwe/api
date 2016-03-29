package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

import com.sooncode.api.background.dao.interfac.CompanyDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class CompanyService {
	public CompanyDaoI companyDao = (CompanyDaoI) ClassCache.getImplement(CompanyDaoI.class) ; 
}
