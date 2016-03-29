package com.sooncode.api.background.dao.interfac;

import com.sooncode.api.background.entity.Module;
import com.sooncode.jdbc.DaoI;

public interface ModuleDaoI extends DaoI<Module> {

	/**
	 * 获取最大的权重值
	 * @param pojectId 项目编号
	 * @return
	 */
	public Integer getMaxWeight(String projectId);

	/**
	 * 
	 * @param module
	 * @return
	 */
	public Module getLast(Module module);

	/**
	 * 
	 * @param module
	 * @return
	 */
	public Module getNext(Module module);
}
