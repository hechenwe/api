package com.sooncode.api.background.entity;


/**
 *   参数值说明 
 * 
 *  @author HeChen 
 *
 */
 
public class ValueExplain implements java.io.Serializable{

    /** 序列化  */
    private static final long serialVersionUID = 1L; 
    
   
    /**参数值说明编号*/
    private String valueExplainId; 
    
    
    /**参数编号*/
    private String parameterId; 
    
    
    /**常数值*/
    private String value; 
    
    
    /**值含义*/
    private String valueMeaning; 
    
    
    /**权重*/
    private Integer weight; 
    
    
    /**参数*/
	private ParameterRetur parameter ;
	
	
  
 
 
 
 
 
  
                                                               
   
    //------------------------get,set 方法----------------------------
 
 
    /**参数值说明编号*/ 
    public String getValueExplainId(){  
      return valueExplainId;  
    }  
     /**参数值说明编号*/
    public void setValueExplainId(String valueExplainId){  
      this.valueExplainId = valueExplainId;  
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
   
   
    /**常数值*/ 
    public String getValue(){  
      return value;  
    }  
     /**常数值*/
    public void setValue(String value){  
      this.value = value;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**值含义*/ 
    public String getValueMeaning(){  
      return valueMeaning;  
    }  
     /**值含义*/
    public void setValueMeaning(String valueMeaning){  
      this.valueMeaning = valueMeaning;  
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
    public ParameterRetur getParameter(){  
      return this.parameter;  
    }  
    /**参数*/
    public void setParameter(ParameterRetur parameter){  
      this.parameter = parameter;  
    } 
    
    
    //----------------------------------------------------------------
  
  
 
 
   
 
 
 


     //----------------------------------------------------------------
     @Override
	 public String toString() {
		return  "ValueExplain : 返回值_参数值说明["+
		        " ;参数值说明编号:valueExplainId = " + valueExplainId +  
		        " ;参数编号:parameterId = " + parameterId +  
		        " ;常数值:value = " + value +  
		        " ;值含义:valueMeaning = " + valueMeaning +  
		        " ;权重:weight = " + weight + "]" ;
	}
 

}
