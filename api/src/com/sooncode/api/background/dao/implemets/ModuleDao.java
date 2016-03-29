package com.sooncode.api.background.dao.implemets;

import java.util.Map;

import com.sooncode.api.background.dao.interfac.ModuleDaoI;
import com.sooncode.api.background.entity.Module;
import com.sooncode.jdbc.Dao;
import com.sooncode.jdbc.sql.SQL;

public class ModuleDao extends Dao<Module> implements ModuleDaoI {

	@Override
	public Integer getMaxWeight(String projectId) {
		String sql = "SELECT MAX(WEIGHT) AS WEIGHT  FROM MODULE  WHERE PROJECT_ID = '"+projectId+"'";
		Map<String,Object> map = jdbc.executeQueryM(sql);
		Integer max = (Integer) map.get("weight");
		return max;
	}

	@Override
	public Module getLast(Module module) {
		String sql = " SELECT "+ new SQL().COLUMNS(Module.class).toString() +" FROM MODULE  WHERE PROJECT_ID = '"+module.getProjectId()+"' AND WEIGHT > "+module.getWeight()+" ORDER BY WEIGHT   LIMIT 0,1";
		Module m = (Module) jdbc.executeQuery(sql, Module.class);
		return m;
	}

	@Override
	public Module getNext(Module module) {
		String sql = " SELECT "+ new SQL().COLUMNS(Module.class).toString() +" FROM MODULE  WHERE PROJECT_ID = '"+module.getProjectId()+"' AND WEIGHT < "+module.getWeight()+" ORDER BY WEIGHT   LIMIT 0,1";
		Module m = (Module) jdbc.executeQuery(sql, Module.class);
		return m;
	}

}
