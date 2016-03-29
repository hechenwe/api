package com.sooncode.api.background.entity;
 
import java.util.List;


/**
 *  返回值示例 
 * 
 *  @author HeChen 
 *
 */
 
public class Example implements java.io.Serializable{

    /** 序列化  */
    private static final long serialVersionUID = 1L; 
    
   
    /**事例编号*/
    private String exampleId; 
    
    
    /**接口编号*/
    private String interfacId; 
    
    
    /**事例名称*/
    private String exampleType; 
    
    
    /**事例内容*/
    private String exampleContent; 
    
    
    /**创建时间*/
    private java.util.Date creatDate; 
    
    
    /**权重*/
    private Integer weight; 
    
    
    /**接口*/
	private Interfac interfac ;
	
	
  
 
 
 
    /** 返回值_参数 */
	private  List<ParameterRetur> parameterReturs ;
	
		 
 
 
  
                                                               
   
    //------------------------get,set 方法----------------------------
 
 
    /**事例编号*/ 
    public String getExampleId(){  
      return exampleId;  
    }  
     /**事例编号*/
    public void setExampleId(String exampleId){  
      this.exampleId = exampleId;  
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
   
   
    /**事例名称*/ 
    public String getExampleType(){  
      return exampleType;  
    }  
     /**事例名称*/
    public void setExampleType(String exampleType){  
      this.exampleType = exampleType;  
    } 
    
    
   //----------------------------------------------------------------
   
   
    /**事例内容*/ 
    public String getExampleContent(){  
      return exampleContent;  
    }  
     /**事例内容*/
    public void setExampleContent(String exampleContent){  
      this.exampleContent = exampleContent;  
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
   
   
  
    /**接口*/ 
    public Interfac getInterfac(){  
      return this.interfac;  
    }  
    /**接口*/
    public void setInterfac(Interfac interfac){  
      this.interfac = interfac;  
    } 
    
    
    //----------------------------------------------------------------
  
  
 
 
   
 
 
	 
	
	/**返回值_参数*/ 
    public List<ParameterRetur> getParameterReturs(){  
      return this.parameterReturs;  
    }  
    /**返回值_参数*/
    public void setParameterReturs(List<ParameterRetur> parameterReturs){  
      this.parameterReturs = parameterReturs;  
    } 
    
    
    //----------------------------------------------------------------
    
    	 	 
 


     //----------------------------------------------------------------
     @Override
	 public String toString() {
		return  "Example : 返回值_事例["+
		        " ;事例编号:exampleId = " + exampleId +  
		        " ;接口编号:interfacId = " + interfacId +  
		        " ;事例名称:exampleType = " + exampleType +  
		        " ;事例内容:exampleContent = " + exampleContent +  
		        " ;创建时间:creatDate = " + creatDate +  
		        " ;权重:weight = " + weight + "]" ;
	}
 

}
