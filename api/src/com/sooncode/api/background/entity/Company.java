package com.sooncode.api.background.entity;
 
import java.util.List;


/**
 *  用户_公司 
 * 
 *  @author HeChen 
 *
 */
 
public class Company implements java.io.Serializable{

    /** 序列化  */
    private static final long serialVersionUID = 1L; 
    
   
    /**公司编号*/
    private String companyId; 
    
    
    /**公司名称*/
    private String companyName; 
    
    
    /**商标*/
    private String logo; 
    
    
  
 
 
 
    /** 项目_项目 */
	private  List<Project> projects ;
	
		 
    /** 用户_用户 */
	private  List<User> users ;
	
		 
 
 
  
                                                               
   
    //------------------------get,set 方法----------------------------
 
 
    /**公司编号*/ 
    public String getCompanyId(){  
      return companyId;  
    }  
     /**公司编号*/
    public void setCompanyId(String companyId){  
      this.companyId = companyId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**公司名称*/ 
    public String getCompanyName(){  
      return companyName;  
    }  
     /**公司名称*/
    public void setCompanyName(String companyName){  
      this.companyName = companyName;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**商标*/ 
    public String getLogo(){  
      return logo;  
    }  
     /**商标*/
    public void setLogo(String logo){  
      this.logo = logo;  
    } 
    
    
   //----------------------------------------------------------------
   
   
  
 
 
   
 
 
	 
	
	/**项目_项目*/ 
    public List<Project> getProjects(){  
      return this.projects;  
    }  
    /**项目_项目*/
    public void setProjects(List<Project> projects){  
      this.projects = projects;  
    } 
    
    
    //----------------------------------------------------------------
    
    	 	 
	 
	
	/**用户_用户*/ 
    public List<User> getUsers(){  
      return this.users;  
    }  
    /**用户_用户*/
    public void setUsers(List<User> users){  
      this.users = users;  
    } 
    
    
    //----------------------------------------------------------------
    
    	 	 
 


     //----------------------------------------------------------------
     @Override
	 public String toString() {
		return  "Company : 用户_公司["+
		        " ;公司编号:companyId = " + companyId +  
		        " ;公司名称:companyName = " + companyName +  
		        " ;商标:logo = " + logo + "]" ;
	}
 

}
