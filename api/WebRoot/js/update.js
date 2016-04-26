//修改返回示例
function toUpdateExample(){
	 var dataKeys = $("#context-menu").attr("data-key").split(":");
	 var interfacId = dataKeys[0];
	 var exampleId = dataKeys[1];
	var url = "../example/toUpdateExample.html?exampleId="+exampleId;
	$.get(url,function (data){
		$("#div-exam-"+interfacId).append(data);
		$("#example"+exampleId).addClass('div-display')
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
		$("#example"+exampleId).removeClass('div-display')
		}
		
	})
	
	
	
}