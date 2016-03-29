package com.sooncode.api.background.entity;


/**
 *   参数约束 
 * 
 *  @author HeChen 
 *
 */
 
public class ParameterConstraint implements java.io.Serializable{

    /** 序列化  */
    private static final long serialVersionUID = 1L; 
    
   
    /**约束编号*/
    private String parameterConstraintId; 
    
    
    /**参数编号*/
    private String parameterId; 
    
    
    /**约束名称*/
    private String parameterConstraintName; 
    
    
    /**约束代码*/
    private String parameterConstraintCode; 
    
    
    /**约束说明*/
    private String parameterConstraintExplain; 
    
    
    /**创建时间*/
    private java.util.Date creatDate; 
    
    
    /**权重*/
    private Integer weight; 
    
    
    /**参数*/
	private Parameter parameter ;
	
	
  
 
 
 
 
 
  
                                                               
   
    //------------------------get,set 方法----------------------------
 
 
    /**约束编号*/ 
    public String getParameterConstraintId(){  
      return parameterConstraintId;  
    }  
     /**约束编号*/
    public void setParameterConstraintId(String parameterConstraintId){  
      this.parameterConstraintId = parameterConstraintId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**参数编号*/ 
    public String getParameterId(){  
      return parameterId;  
    }  
     /**参数编号*/
    public void setParameterId(String parameterId){  
      this.parameterId = parameterId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**约束名称*/ 
    public String getParameterConstraintName(){  
      return parameterConstraintName;  
    }  
     /**约束名称*/
    public void setParameterConstraintName(String parameterConstraintName){  
      this.parameterConstraintName = parameterConstraintName;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**约束代码*/ 
    public String getParameterConstraintCode(){  
      return parameterConstraintCode;  
    }  
     /**约束代码*/
    public void setParameterConstraintCode(String parameterConstraintCode){  
      this.parameterConstraintCode = parameterConstraintCode;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**约束说明*/ 
    public String getParameterConstraintExplain(){  
      return parameterConstraintExplain;  
    }  
     /**约束说明*/
    public void setParameterConstraintExplain(String parameterConstraintExplain){  
      this.parameterConstraintExplain = parameterConstraintExplain;  
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
   
   
  
    /**参数*/ 
    public Parameter getParameter(){  
      return this.parameter;  
    }  
    /**参数*/
    public void setParameter(Parameter parameter){  
      this.parameter = parameter;  
    } 
    
    
    //----------------------------------------------------------------
  
  
 
 
   
 
 
 


     //----------------------------------------------------------------
     @Override
	 public String toString() {
		return  "ParameterConstraint : 参数_参数约束["+
		        " ;约束编号:parameterConstraintId = " + parameterConstraintId +  
		        " ;参数编号:parameterId = " + parameterId +  
		        " ;约束名称:parameterConstraintName = " + parameterConstraintName +  
		        " ;约束代码:parameterConstraintCode = " + parameterConstraintCode +  
		        " ;约束说明:parameterConstraintExplain = " + parameterConstraintExplain +  
		        " ;创建时间:creatDate = " + creatDate +  
		        " ;权重:weight = " + weight + "]" ;
	}
 

}
