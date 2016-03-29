package com.sooncode.api.background.entity;
import java.util.List;


/**
 *  参数 
 * 
 *  @author HeChen 
 *
 */
 
public class Parameter implements java.io.Serializable{

    /** 序列化  */
    private static final long serialVersionUID = 1L; 
    
   
    /**参数编号*/
    private String parameterId; 
    
    
    /**接口编号*/
    private String interfacId; 
    
    
    /**参数名称*/
    private String parameterName; 
    
    
    /**参数代码*/
    private String parameterCode; 
    
    
    /**参数数据类型*/
    private String parameterDataType; 
    
    
    /**最小长度*/
    private Integer minLength; 
    
    
    /**最大长度*/
    private Integer maxLength; 
    
    
    /**参数实例*/
    private String parameterExample; 
    
    
    /**参数说明*/
    private String parameterExplain; 
    
    
    /**是否必须*/
    private String isMust; 
    
    
    /**权重*/
    private Integer weight; 
    
    
    /**创建时间*/
    private java.util.Date creatDate; 
    
    
    /**接口*/
	private Interfac interfac ;
	
	
  
 
 
 
    /** 参数_参数约束 */
	private  List<ParameterConstraint> parameterConstraints ;
	
		 
 
 
  
                                                               
   
    //------------------------get,set 方法----------------------------
 
 
    /**参数编号*/ 
    public String getParameterId(){  
      return parameterId;  
    }  
     /**参数编号*/
    public void setParameterId(String parameterId){  
      this.parameterId = parameterId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**接口编号*/ 
    public String getInterfacId(){  
      return interfacId;  
    }  
     /**接口编号*/
    public void setInterfacId(String interfacId){  
      this.interfacId = interfacId;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**参数名称*/ 
    public String getParameterName(){  
      return parameterName;  
    }  
     /**参数名称*/
    public void setParameterName(String parameterName){  
      this.parameterName = parameterName;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**参数代码*/ 
    public String getParameterCode(){  
      return parameterCode;  
    }  
     /**参数代码*/
    public void setParameterCode(String parameterCode){  
      this.parameterCode = parameterCode;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**参数数据类型*/ 
    public String getParameterDataType(){  
      return parameterDataType;  
    }  
     /**参数数据类型*/
    public void setParameterDataType(String parameterDataType){  
      this.parameterDataType = parameterDataType;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**最小长度*/ 
    public Integer getMinLength(){  
      return minLength;  
    }  
     /**最小长度*/
    public void setMinLength(Integer minLength){  
      this.minLength = minLength;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**最大长度*/ 
    public Integer getMaxLength(){  
      return maxLength;  
    }  
     /**最大长度*/
    public void setMaxLength(Integer maxLength){  
      this.maxLength = maxLength;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**参数实例*/ 
    public String getParameterExample(){  
      return parameterExample;  
    }  
     /**参数实例*/
    public void setParameterExample(String parameterExample){  
      this.parameterExample = parameterExample;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**参数说明*/ 
    public String getParameterExplain(){  
      return parameterExplain;  
    }  
     /**参数说明*/
    public void setParameterExplain(String parameterExplain){  
      this.parameterExplain = parameterExplain;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**是否必须*/ 
    public String getIsMust(){  
      return isMust;  
    }  
     /**是否必须*/
    public void setIsMust(String isMust){  
      this.isMust = isMust;  
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
   
   
    /**创建时间*/ 
    public java.util.Date getCreatDate(){  
      return creatDate;  
    }  
     /**创建时间*/
    public void setCreatDate(java.util.Date creatDate){  
      this.creatDate = creatDate;  
    } 
    
    
   //----------------------------------------------------------------
   
   
  
    /**接口*/ 
    public Interfac getInterfac(){  
      return this.interfac;  
    }  
    /**接口*/
    public void setInterfac(Interfac interfac){  
      this.interfac = interfac;  
    } 
    
    
    //----------------------------------------------------------------
  
  
 
 
   
 
 
	 
	
	/**参数_参数约束*/ 
    public List<ParameterConstraint> getParameterConstraints(){  
      return this.parameterConstraints;  
    }  
    /**参数_参数约束*/
    public void setParameterConstraints(List<ParameterConstraint> parameterConstraints){  
      this.parameterConstraints = parameterConstraints;  
    } 
    
    
    //----------------------------------------------------------------
    
    	 	 
 


     //----------------------------------------------------------------
     @Override
	 public String toString() {
		return  "Parameter : 参数_参数["+
		        " ;参数编号:parameterId = " + parameterId +  
		        " ;接口编号:interfacId = " + interfacId +  
		        " ;参数名称:parameterName = " + parameterName +  
		        " ;参数代码:parameterCode = " + parameterCode +  
		        " ;参数数据类型:parameterDataType = " + parameterDataType +  
		        " ;最小长度:minLength = " + minLength +  
		        " ;最大长度:maxLength = " + maxLength +  
		        " ;参数实例:parameterExample = " + parameterExample +  
		        " ;参数说明:parameterExplain = " + parameterExplain +  
		        " ;是否必须:isMust = " + isMust +  
		        " ;权重:weight = " + weight +  
		        " ;创建时间:creatDate = " + creatDate + "]" ;
	}
 

}
