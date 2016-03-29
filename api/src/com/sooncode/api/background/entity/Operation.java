package com.sooncode.api.background.entity;


/**
 *  权限_操作 
 * 
 *  @author HeChen 
 *
 */
 
public class Operation implements java.io.Serializable{

    /** 序列化  */
    private static final long serialVersionUID = 1L; 
    
   
    /**操作编号*/
    private String operationId; 
    
    
    /**操作名称*/
    private String operationName; 
    
    
    /**操作代码*/
    private String operationCode; 
    
    
  
 
 
 
 
 
  
                                                               
   
    //------------------------get,set 方法----------------------------
 
 
    /**操作编号*/ 
    public String getOperationId(){  
      return operationId;  
    }  
     /**操作编号*/
    public void setOperationId(String operationId){  
      this.operationId = operationId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**操作名称*/ 
    public String getOperationName(){  
      return operationName;  
    }  
     /**操作名称*/
    public void setOperationName(String operationName){  
      this.operationName = operationName;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**操作代码*/ 
    public String getOperationCode(){  
      return operationCode;  
    }  
     /**操作代码*/
    public void setOperationCode(String operationCode){  
      this.operationCode = operationCode;  
    } 
    
    
   //----------------------------------------------------------------
   
   
  
 
 
   
 
 
 


     //----------------------------------------------------------------
     @Override
	 public String toString() {
		return  "Operation : 权限_操作["+
		        " ;操作编号:operationId = " + operationId +  
		        " ;操作名称:operationName = " + operationName +  
		        " ;操作代码:operationCode = " + operationCode + "]" ;
	}
 

}
