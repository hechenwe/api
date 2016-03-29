package com.sooncode.api.background.entity;
 


/**
 *  权限_控制_中间表 
 * 
 *  @author HeChen 
 *
 */
 
public class Control implements java.io.Serializable{

    /** 序列化  */
    private static final long serialVersionUID = 1L; 
    
   
    /**控制编号*/
    private String controlId; 
    
    
    /**项目编号*/
    private String projectId; 
    
    
    /**用户编号*/
    private String userId; 
    
    
    /**操作编号*/
    private String operationId; 
    
    
    /**项目编号*/
	private Project project ;
	
	
    /**用户编号*/
	private User user ;
	
	
  
 
 
 
 
 
  
                                                               
   
    //------------------------get,set 方法----------------------------
 
 
    /**控制编号*/ 
    public String getControlId(){  
      return controlId;  
    }  
     /**控制编号*/
    public void setControlId(String controlId){  
      this.controlId = controlId;  
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
   
   
    /**用户编号*/ 
    public String getUserId(){  
      return userId;  
    }  
     /**用户编号*/
    public void setUserId(String userId){  
      this.userId = userId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**操作编号*/ 
    public String getOperationId(){  
      return operationId;  
    }  
     /**操作编号*/
    public void setOperationId(String operationId){  
      this.operationId = operationId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
  
    /**项目编号*/ 
    public Project getProject(){  
      return this.project;  
    }  
    /**项目编号*/
    public void setProject(Project project){  
      this.project = project;  
    } 
    
    
    //----------------------------------------------------------------
  
  
    /**用户编号*/ 
    public User getUser(){  
      return this.user;  
    }  
    /**用户编号*/
    public void setUser(User user){  
      this.user = user;  
    } 
    
    
    //----------------------------------------------------------------
  
  
 
 
   
 
 
 


     //----------------------------------------------------------------
     @Override
	 public String toString() {
		return  "Control : 权限_控制_中间表["+
		        " ;控制编号:controlId = " + controlId +  
		        " ;项目编号:projectId = " + projectId +  
		        " ;用户编号:userId = " + userId +  
		        " ;操作编号:operationId = " + operationId + "]" ;
	}
 

}
