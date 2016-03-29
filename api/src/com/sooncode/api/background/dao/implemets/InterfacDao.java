package com.sooncode.api.background.dao.implemets;


import java.util.Map;

import com.sooncode.api.background.dao.interfac.InterfacDaoI;
import com.sooncode.api.background.entity.Interfac;
import com.sooncode.api.background.entity.Module;
import com.sooncode.jdbc.Dao;
import com.sooncode.jdbc.sql.SQL;

public class InterfacDao extends Dao<Interfac> implements InterfacDaoI {

	@Override
	public Integer getMaxWeight(String moduleId) {
		String sql = "SELECT MAX(WEIGHT) AS WEIGHT  FROM INTERFAC  WHERE MODULE_ID = '"+moduleId+"'";
		Map<String,Object> map = jdbc.executeQueryM(sql);
		Integer max = (Integer) map.get("weight");
		return max;
	}

	@Override
	public Interfac getLast(Interfac interfac) {
		String sql = " SELECT "+ new SQL().COLUMNS(Module.class).toString() +" FROM INTERFAC  WHERE MODULE_ID = '"+interfac.getModuleId()+"' AND WEIGHT > "+interfac.getWeight()+" ORDER BY WEIGHT   LIMIT 0,1";
		Interfac i = (Interfac) jdbc.executeQuery(sql, Interfac.class);
		return i;
	}

	@Override
	public  Interfac getNext(Interfac interfac) {
		String sql = " SELECT "+ new SQL().COLUMNS(Module.class).toString() +" FROM INTERFAC  WHERE MODULE_ID = '"+interfac.getModuleId()+"' AND WEIGHT < "+interfac.getWeight()+" ORDER BY WEIGHT   LIMIT 0,1";
		Interfac i = (Interfac) jdbc.executeQuery(sql, Interfac.class);
		return i;
	}

	 

}
