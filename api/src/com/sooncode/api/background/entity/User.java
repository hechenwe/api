package com.sooncode.api.background.entity;
 
import java.util.List;


/**
 *  用户 
 * 
 *  @author HeChen 
 *
 */
 
public class User implements java.io.Serializable{

    /** 序列化  */
    private static final long serialVersionUID = 1L; 
    
   
    /**用户编号*/
    private String userId; 
    
    
    /**公司编号*/
    private String companyId; 
    
    
    /***/
    private String roleId; 
    
    
    /**用户名*/
    private String userName; 
    
    
    /**密码*/
    private String password; 
    
    
    /**邮箱*/
    private String email; 
    
    
    /**手机号码*/
    private String mobileNumber; 
    
    
    /**注册时间*/
    private java.util.Date registerDate; 
    
    
    /***/
	private Role role ;
	
	
    /**公司编号*/
	private Company company ;
	
	
  
 
 
 
 
 
    /** 项目编号 */
	private  List<Project> projects ;
	 
	 	 
  
                                                               
   
    //------------------------get,set 方法----------------------------
 
 
    /**用户编号*/ 
    public String getUserId(){  
      return userId;  
    }  
     /**用户编号*/
    public void setUserId(String userId){  
      this.userId = userId;  
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
   
   
    /***/ 
    public String getRoleId(){  
      return roleId;  
    }  
     /***/
    public void setRoleId(String roleId){  
      this.roleId = roleId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**用户名*/ 
    public String getUserName(){  
      return userName;  
    }  
     /**用户名*/
    public void setUserName(String userName){  
      this.userName = userName;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**密码*/ 
    public String getPassword(){  
      return password;  
    }  
     /**密码*/
    public void setPassword(String password){  
      this.password = password;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**邮箱*/ 
    public String getEmail(){  
      return email;  
    }  
     /**邮箱*/
    public void setEmail(String email){  
      this.email = email;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**手机号码*/ 
    public String getMobileNumber(){  
      return mobileNumber;  
    }  
     /**手机号码*/
    public void setMobileNumber(String mobileNumber){  
      this.mobileNumber = mobileNumber;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**注册时间*/ 
    public java.util.Date getRegisterDate(){  
      return registerDate;  
    }  
     /**注册时间*/
    public void setRegisterDate(java.util.Date registerDate){  
      this.registerDate = registerDate;  
    } 
    
    
   //----------------------------------------------------------------
   
   
  
    /***/ 
    public Role getRole(){  
      return this.role;  
    }  
    /***/
    public void setRole(Role role){  
      this.role = role;  
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
  
  
 
 
   
 
 
 

	/**项目编号*/ 
    public List<Project> getProjects(){  
      return this.projects;  
    }  
    /**项目编号*/
    public void setProjects(List<Project> projects){  
      this.projects = projects;  
    } 
    
    
    //----------------------------------------------------------------
    
     	 

     //----------------------------------------------------------------
     @Override
	 public String toString() {
		return  "User : 用户_用户["+
		        " ;用户编号:userId = " + userId +  
		        " ;公司编号:companyId = " + companyId +  
		        " ;:roleId = " + roleId +  
		        " ;用户名:userName = " + userName +  
		        " ;密码:password = " + password +  
		        " ;邮箱:email = " + email +  
		        " ;手机号码:mobileNumber = " + mobileNumber +  
		        " ;注册时间:registerDate = " + registerDate + "]" ;
	}
 

}
