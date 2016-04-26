package com.sooncode.api.background.entity;
 
import java.util.List;


/**
 *  项目 
 * 
 *  @author HeChen 
 *
 */
 
public class Project implements java.io.Serializable{

    /** 序列化  */
    private static final long serialVersionUID = 1L; 
    
   
    /**项目编号*/
    private String projectId; 
    
    
    /**项目名称*/
    private String projectName; 
    
    
    /**项目代码*/
    private String projectCode;
    
    
    /**资源前缀*/
    private String urlPrefix; 
    
    
    /**项目简介*/
    private String projectIntro; 
    
    
    /**创建时间*/
    private java.util.Date creatDate; 
    
    
    /**权重*/
    private Integer weight; 
    
    
    /**公司编号*/
    private String companyId; 
    
    
    /**作者姓名*/
    private String authorName; 
    
    
    /**版本号*/
    private String versions; 
    
    
    /**公司编号*/
	private Company company ;
	
	
  
 
 
 
    /** 模块_模块 */
	private  List<Module> modules ;
	
		 
 
 
    /** 用户编号 */
	private  List<User> users ;
	 
	 	 
  
                                                               
   
    //------------------------get,set 方法----------------------------
 
 
    /**项目编号*/ 
    public String getProjectId(){  
      return projectId;  
    }  
     /**项目编号*/
    public void setProjectId(String projectId){  
      this.projectId = projectId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**项目名称*/ 
    public String getProjectName(){  
      return projectName;  
    }  
     /**项目名称*/
    public void setProjectName(String projectName){  
      this.projectName = projectName;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**项目代码*/ 
    public String getProjectCode(){  
      return projectCode;  
    }  
     /**项目代码*/
    public void setProjectCode(String projectCode){  
      this.projectCode = projectCode;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**项目简介*/ 
    public String getProjectIntro(){  
      return projectIntro;  
    }  
     /**项目简介*/
    public void setProjectIntro(String projectIntro){  
      this.projectIntro = projectIntro;  
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
   
   
    /**公司编号*/ 
    public String getCompanyId(){  
      return companyId;  
    }  
     /**公司编号*/
    public void setCompanyId(String companyId){  
      this.companyId = companyId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**作者姓名*/ 
    public String getAuthorName(){  
      return authorName;  
    }  
     /**作者姓名*/
    public void setAuthorName(String authorName){  
      this.authorName = authorName;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**版本号*/ 
    public String getVersions(){  
      return versions;  
    }  
     /**版本号*/
    public void setVersions(String versions){  
      this.versions = versions;  
    } 
    
    
   //----------------------------------------------------------------
   
   
  
    /**公司编号*/ 
    public Company getCompany(){  
      return this.company;  
    }  
    /**公司编号*/
    public void setCompany(Company company){  
      this.company = company;  
    } 
    
    
    //----------------------------------------------------------------
  
   
	
	/**模块_模块*/ 
    public List<Module> getModules(){  
      return this.modules;  
    }  
    /**模块_模块*/
    public void setModules(List<Module> modules){  
      this.modules = modules;  
    } 
    
    
    //----------------------------------------------------------------
    
    	 	 
 

	/**用户编号*/ 
    public List<User> getUsers(){  
      return this.users;  
    }  
    /**用户编号*/
    public void setUsers(List<User> users){  
      this.users = users;  
    } 
    
    
    
    //----------------------------------------------------------------
    
     	 

     public String getUrlPrefix() {
		return urlPrefix;
	}
	public void setUrlPrefix(String urlPrefix) {
		this.urlPrefix = urlPrefix;
	}
	//----------------------------------------------------------------
	@Override
	public String toString() {
		return "{\"projectId\":\"" + projectId + "\",\"projectName\":\"" + projectName + "\",\"projectCode\":\"" + projectCode + "\",\"urlPrefix\":\"" + urlPrefix + "\",\"projectIntro\":\"" + projectIntro + "\",\"creatDate\":\"" + creatDate + "\",\"weight\":\"" + weight + "\",\"companyId\":\"" + companyId + "\",\"authorName\":\"" + authorName + "\",\"versions\":\"" + versions + "\",\"company\":\"" + company + "\",\"modules\":\"" + modules + "\",\"users\":\"" + users + "\"}  ";
	}
    
 

}
