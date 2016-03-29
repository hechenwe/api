package com.sooncode.api.background.dao.interfac;

 
 
import com.sooncode.api.background.entity.Parameter;
import com.sooncode.jdbc.DaoI;

public interface ParameterDaoI extends DaoI<Parameter> {
	/**
	 * 获取最大的权重值
	 * @param interfacId 接口编号
	 * @return
	 */
	public Integer getMaxWeight(String interfacId);

	/**
	 * 
	 * @param module
	 * @return
	 */
	public Parameter getLast(Parameter parameter);

	/**
	 * 
	 * @param module
	 * @return
	 */
	public Parameter getNext(Parameter parameter);
}
