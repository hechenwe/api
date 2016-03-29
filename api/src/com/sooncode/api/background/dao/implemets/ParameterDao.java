package com.sooncode.api.background.dao.implemets;
import java.util.Map;

import com.sooncode.api.background.dao.interfac.ParameterDaoI;
import com.sooncode.api.background.entity.Parameter;
import com.sooncode.jdbc.Dao;
import com.sooncode.jdbc.sql.SQL;
public class ParameterDao extends Dao<Parameter> implements ParameterDaoI {

	@Override
	public Integer getMaxWeight(String interfacId) {
		String sql = "SELECT MAX(WEIGHT) AS WEIGHT  FROM PARAMETER  WHERE INTERFAC_ID = '"+interfacId+"'";
		Map<String,Object> map = jdbc.executeQueryM(sql);
		Integer max = (Integer) map.get("weight");
		return max;
	}

	@Override
	public Parameter getLast(Parameter parameter) {
		String sql = " SELECT "+ new SQL().COLUMNS(Parameter.class).toString() +" FROM PARAMETER  WHERE INTERFAC_ID = '"+parameter.getInterfacId()+"' AND WEIGHT > "+parameter.getWeight()+" ORDER BY WEIGHT   LIMIT 0,1";
		Parameter p = (Parameter) jdbc.executeQuery(sql, Parameter.class);
		return p;
	}

	@Override
	public Parameter getNext(Parameter parameter) {
		String sql = " SELECT "+ new SQL().COLUMNS(Parameter.class).toString() +" FROM PARAMETER  WHERE INTERFAC_ID = '"+parameter.getInterfacId()+"' AND WEIGHT < "+parameter.getWeight()+" ORDER BY WEIGHT   LIMIT 0,1";
		Parameter p = (Parameter) jdbc.executeQuery(sql, Parameter.class);
		return p;
	}

}
