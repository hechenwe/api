package com.sooncode.api.background.dao.interfac;

 

import com.sooncode.api.background.entity.Interfac;
import com.sooncode.api.background.entity.Project;
import com.sooncode.jdbc.DaoI;

public interface ProjectDaoI extends DaoI<Project> {

	public  Project  getProjectAllInfo(String projectId); 
	public  Interfac  getInterfacAllInfo(String interfacId); 
		
	 
}
