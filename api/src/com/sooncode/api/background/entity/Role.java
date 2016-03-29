package com.sooncode.api.background.entity;
 
import java.util.List;


/**
 *  角色 
 * 
 *  @author HeChen 
 *
 */
 
public class Role implements java.io.Serializable{

    /** 序列化  */
    private static final long serialVersionUID = 1L; 
    
   
    /***/
    private String roleId; 
    
    
    /**角色名称*/
    private String roleName; 
    
    
    /***/
    private String roleCode; 
    
    
  
 
 
 
    /** 用户_用户 */
	private  List<User> users ;
	
		 
 
 
  
                                                               
   
    //------------------------get,set 方法----------------------------
 
 
    /***/ 
    public String getRoleId(){  
      return roleId;  
    }  
     /***/
    public void setRoleId(String roleId){  
      this.roleId = roleId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**角色名称*/ 
    public String getRoleName(){  
      return roleName;  
    }  
     /**角色名称*/
    public void setRoleName(String roleName){  
      this.roleName = roleName;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /***/ 
    public String getRoleCode(){  
      return roleCode;  
    }  
     /***/
    public void setRoleCode(String roleCode){  
      this.roleCode = roleCode;  
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
		return  "Role : 权限模块_角色["+
		        " ;:roleId = " + roleId +  
		        " ;角色名称:roleName = " + roleName +  
		        " ;:roleCode = " + roleCode + "]" ;
	}
 

}
