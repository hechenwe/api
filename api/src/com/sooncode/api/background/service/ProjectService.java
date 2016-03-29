package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

import com.sooncode.api.background.dao.interfac.ProjectDaoI;
import com.sooncode.api.background.util.ClassCache;

@Service
public class ProjectService {
	public ProjectDaoI projectDao = (ProjectDaoI) ClassCache.getImplement(ProjectDaoI.class) ; 
}
