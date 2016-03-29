package com.sooncode.api.background.dao.implemets;

import java.util.List;

 
import com.sooncode.api.background.dao.interfac.ProjectDaoI;
 
import com.sooncode.api.background.entity.Example;
import com.sooncode.api.background.entity.Interfac;
import com.sooncode.api.background.entity.Module;
import com.sooncode.api.background.entity.Parameter;
import com.sooncode.api.background.entity.ParameterConstraint;
import com.sooncode.api.background.entity.ParameterRetur;
import com.sooncode.api.background.entity.Project;
import com.sooncode.api.background.entity.ValueExplain;

import com.sooncode.jdbc.Dao;
import com.sooncode.jdbc.CacheDao;

public class ProjectDao extends Dao<Project>implements ProjectDaoI {
 
	@SuppressWarnings("unchecked")
	@Override
	public Project getProjectAllInfo(String projectId) {
		Project p = new Project();
		Module m = new Module();
		m.setProjectId(projectId);
		p.setProjectId(projectId);
		p = this.get(p);
		List<Module> modules = (List<Module>) CacheDao.getPager(1L, Long.MAX_VALUE, m).getLists(); 
		for (Module module : modules) {
			Interfac interfac = new Interfac();
			interfac.setModuleId(module.getModuleId());
			List<Interfac> interfaces = (List<Interfac>) CacheDao.getPager(1L, Long.MAX_VALUE, interfac).getLists();// 接口
			module.setInterfacs(interfaces);
			for (Interfac i : interfaces) {

				Parameter para = new Parameter();
				para.setInterfacId(i.getInterfacId());
				List<Parameter> parameters = (List<Parameter>) CacheDao.getPager(1L, Long.MAX_VALUE, para).getLists();// 参数
				i.setParameters(parameters);
				Example example = new Example();
				example.setInterfacId(i.getInterfacId());
				List<Example> examples = (List<Example>) CacheDao.getPager(1L, Long.MAX_VALUE, example).getLists();// 返回值事例
				i.setExamples(examples);

				for (Parameter parameter : parameters) { // 遍历参数
					ParameterConstraint pc = new ParameterConstraint();
					pc.setParameterId(parameter.getParameterId());
					List<ParameterConstraint> pces = (List<ParameterConstraint>) CacheDao.getPager(1L, Long.MAX_VALUE, pc).getLists();// 返回值参数约束
					parameter.setParameterConstraints(pces);

				}

				for (Example e : examples) {
					ParameterRetur pr = new ParameterRetur();
					pr.setExampleId(e.getExampleId());
					List<ParameterRetur> pres = (List<ParameterRetur>) CacheDao.getPager(1L, Long.MAX_VALUE, pr).getLists();
					e.setParameterReturs(pres);

					for (ParameterRetur parameterR : pres) {
						ValueExplain ve = new ValueExplain();
						ve.setParameterId(parameterR.getParameterId());
						List<ValueExplain> ves = (List<ValueExplain>) CacheDao.getPager(1L, Long.MAX_VALUE, ve).getLists();
						parameterR.setValueExplains(ves);
					}

				}

			}

		}

		p.setModules(modules);
		return p;

	}

	/**
	 * 获取接口
	 * @param interfacId
	 * @return
	 */
	@Override
	@SuppressWarnings("unchecked")
	public Interfac getInterfacAllInfo(String interfacId) {
		
		 
		       Interfac i = new Interfac();
	           i.setInterfacId(interfacId);
		       i = (Interfac) CacheDao.get(i);
				
				
				Parameter para = new Parameter();
				para.setInterfacId(i.getInterfacId());
				List<Parameter> parameters = (List<Parameter>) CacheDao.getPager(  1L, Long.MAX_VALUE,para).getLists();//参数
				i.setParameters(parameters);
				Example example = new Example();
				example.setInterfacId(i.getInterfacId());
				List<Example>  examples = (List<Example>) CacheDao.getPager(  1L, Long.MAX_VALUE,example).getLists();//返回值事例
				i.setExamples(examples);
				
				for (Parameter parameter : parameters) { // 遍历参数
					ParameterConstraint pc = new ParameterConstraint();
					pc.setParameterId(parameter.getParameterId());
					List<ParameterConstraint> pces = (List<ParameterConstraint>) CacheDao.getPager(1L, Long.MAX_VALUE, pc).getLists();// 返回值参数约束
					parameter.setParameterConstraints(pces);

				}

				for (Example e : examples) {
					ParameterRetur pr = new ParameterRetur();
					pr.setExampleId(e.getExampleId());
					List<ParameterRetur> pres = (List<ParameterRetur>) CacheDao.getPager(1L, Long.MAX_VALUE, pr).getLists();
					e.setParameterReturs(pres);

					for (ParameterRetur parameterR : pres) {
						ValueExplain ve = new ValueExplain();
						ve.setParameterId(parameterR.getParameterId());
						List<ValueExplain> ves = (List<ValueExplain>) CacheDao.getPager(1L, Long.MAX_VALUE, ve).getLists();
						parameterR.setValueExplains(ves);
					}

				}
		 
		return i;
		
	}
	 

}
