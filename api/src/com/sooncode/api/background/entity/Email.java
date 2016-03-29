package com.sooncode.api.background.entity;


/**
 *  邮箱验证 
 * 
 *  @author HeChen 
 *
 */
 
public class Email implements java.io.Serializable{

    /** 序列化  */
    private static final long serialVersionUID = 1L; 
    
   
    /**验证编号*/
    private String verificationId; 
    
    
    /**邮箱*/
    private String email; 
    
    
    /**验证码*/
    private Integer code; 
    
    
  
 
 
 
 
 
  
                                                               
   
    //------------------------get,set 方法----------------------------
 
 
    /**验证编号*/ 
    public String getVerificationId(){  
      return verificationId;  
    }  
     /**验证编号*/
    public void setVerificationId(String verificationId){  
      this.verificationId = verificationId;  
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
   
   
    /**验证码*/ 
    public Integer getCode(){  
      return code;  
    }  
     /**验证码*/
    public void setCode(Integer code){  
      this.code = code;  
    } 
    
    
   //----------------------------------------------------------------
   
   
  
 
 
   
 
 
 


     //----------------------------------------------------------------
     @Override
	 public String toString() {
		return  "Email : 验证_邮箱验证["+
		        " ;验证编号:verificationId = " + verificationId +  
		        " ;邮箱:email = " + email +  
		        " ;验证码:code = " + code + "]" ;
	}
 

}
