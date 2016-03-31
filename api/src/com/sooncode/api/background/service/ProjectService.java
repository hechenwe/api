package com.sooncode.api.background.service;

import org.springframework.stereotype.Service;

import com.sooncode.api.background.dao.interfac.ProjectDaoI;
import com.sooncode.api.background.entity.Project;
import com.sooncode.api.background.util.ClassCache;

@Service
public class ProjectService {
	public ProjectDaoI projectDao = (ProjectDaoI) ClassCache.getImplement(ProjectDaoI.class) ; 

    public Integer deleteProject(String projectId){
    	
    	Project p = new Project();
    	p.setProjectId(projectId);
    	
    	return projectDao.delete(p);
    	
    }

}
