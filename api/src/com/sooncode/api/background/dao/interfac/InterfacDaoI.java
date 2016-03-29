package com.sooncode.api.background.dao.interfac;

import com.sooncode.api.background.entity.Interfac;
 
import com.sooncode.jdbc.DaoI;

public interface InterfacDaoI extends DaoI<Interfac> {
	/**
	 * 获取最大的权重值
	 * @param moduleId 模块编号
	 * @return
	 */
	public Integer getMaxWeight(String moduleId);

	/**
	 * 
	 * @param module
	 * @return
	 */
	public Interfac getLast(Interfac interfac);

	/**
	 * 
	 * @param module
	 * @return
	 */
	public Interfac getNext(Interfac interfac);
}
