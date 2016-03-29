//修改返回示例
function toUpdateExample(exampleId,interfacId){

	var url = "../example/toUpdateExample.html?exampleId="+exampleId;
	$.get(url,function (data){
		$("#div-exam-"+interfacId).append(data);
		 
		
		
	})
	
	
	
}
//-------------------------------------------------------------------------------------------------
function updateExample(exampleId,interfacId){
	 
	var exampleType = $("#exampleType-"+exampleId).val();  
	var exampleContent = $("#exampleContent-"+exampleId).val(); 
	var url = "../example/updateExample.html?exampleId="+exampleId + "&exampleType="+exampleType+"&exampleContent="+exampleContent;
	 
	$.get(url,function (data){
		
		if(data == "1"){
	     
		$("#div-exam-"+interfacId).empty();
		$("#small-example-"+exampleId).text(exampleContent);//	exampleContent-${example.exampleId}
		 
		}
		
	})
	
	
	
}