package com.sooncode.api.background.entity;
 
import java.util.List;


/**
 *   模块 
 * 
 *  @author HeChen 
 *
 */
 
public class Module implements java.io.Serializable{

    /** 序列化  */
    private static final long serialVersionUID = 1L; 
    
   
    /**模块编号*/
    private String moduleId; 
    
    
    /**项目编号*/
    private String projectId; 
    
    
    /**模块名称*/
    private String moduleName; 
    
    
    /**模块代码*/
    private String moduleCode; 
    
    
    /**模块简介*/
    private String moduleIntro; 
    
    
    /**创建时间*/
    private java.util.Date creatDate; 
    
    
    /**权重*/
    private Integer weight; 
    
    
    /**项目*/
	private Project project ;
	
	
  
 
 
 
    /** 接口_接口 */
	private  List<Interfac> interfacs ;
	
		 
 
 
  
                                                               
   
    //------------------------get,set 方法----------------------------
 
 
    /**模块编号*/ 
    public String getModuleId(){  
      return moduleId;  
    }  
     /**模块编号*/
    public void setModuleId(String moduleId){  
      this.moduleId = moduleId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**项目编号*/ 
    public String getProjectId(){  
      return projectId;  
    }  
     /**项目编号*/
    public void setProjectId(String projectId){  
      this.projectId = projectId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**模块名称*/ 
    public String getModuleName(){  
      return moduleName;  
    }  
     /**模块名称*/
    public void setModuleName(String moduleName){  
      this.moduleName = moduleName;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**模块代码*/ 
    public String getModuleCode(){  
      return moduleCode;  
    }  
     /**模块代码*/
    public void setModuleCode(String moduleCode){  
      this.moduleCode = moduleCode;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**模块简介*/ 
    public String getModuleIntro(){  
      return moduleIntro;  
    }  
     /**模块简介*/
    public void setModuleIntro(String moduleIntro){  
      this.moduleIntro = moduleIntro;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**创建时间*/ 
    public java.util.Date getCreatDate(){  
      return creatDate;  
    }  
     /**创建时间*/
    public void setCreatDate(java.util.Date creatDate){  
      this.creatDate = creatDate;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**权重*/ 
    public Integer getWeight(){  
      return weight;  
    }  
     /**权重*/
    public void setWeight(Integer weight){  
      this.weight = weight;  
    } 
    
    
   //----------------------------------------------------------------
   
   
  
    /**项目*/ 
    public Project getProject(){  
      return this.project;  
    }  
    /**项目*/
    public void setProject(Project project){  
      this.project = project;  
    } 
    
    
    //----------------------------------------------------------------
  
  
 
 
   
 
 
	 
	
	/**接口_接口*/ 
    public List<Interfac> getInterfacs(){  
      return this.interfacs;  
    }  
    /**接口_接口*/
    public void setInterfacs(List<Interfac> interfacs){  
      this.interfacs = interfacs;  
    } 
    
    
    //----------------------------------------------------------------
    
    	 	 
 


     //----------------------------------------------------------------
     @Override
	 public String toString() {
		return  "Module : 模块_模块["+
		        " ;模块编号:moduleId = " + moduleId +  
		        " ;项目编号:projectId = " + projectId +  
		        " ;模块名称:moduleName = " + moduleName +  
		        " ;模块代码:moduleCode = " + moduleCode +  
		        " ;模块简介:moduleIntro = " + moduleIntro +  
		        " ;创建时间:creatDate = " + creatDate +  
		        " ;权重:weight = " + weight + "]" ;
	}
 

}
