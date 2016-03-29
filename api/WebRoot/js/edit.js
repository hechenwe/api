var projectId = $("#input_projectId").val();

//-----------------更新模块信息---------------------
function editModule(moduleId) {

	var urlString = '../module/editModule.html?projectId='+projectId+'&moduleId=' + moduleId;
    
	$.get(urlString, function(data) {
		$("#div-"+moduleId).empty(); 
       $("#div-"+moduleId).append(data).toggleClass('div-display');
	})

}

//------------------------关闭修改模块的div------------------------------------------------------------------
function colseModuleDiv(moduleId) {
	
		$("#div-"+moduleId).toggleClass('div-display');
}
 
 
//------------------删除模块------------------------
function deleteModule(moduleId) {
	
	if (confirm("确认要删除？")) {
		var url = '../module/deleteModule.html?projectId='+projectId+'&moduleId=' + moduleId;
		$.get(url,function (data){
			if(data == "1"){
				$("#h4-"+moduleId).remove();
			}else{
				alert("删除失败!");
			}
		})
		 
	} 
	
	 
}

//--------------------移动模块--------------------------------------------------------
function upOrdownModule(type, moduleId , weight ) {
	    var urlString= '../module/upOrdownModule.html?projectId='+projectId+'&moduleId=' + moduleId+'&type='+type +'&weight='+weight;
		//window.location.href='../module/upOrdownModule.html?projectId='+projectId+'&moduleId=' + moduleId+'&type='+type +'&weight='+weight;
		$.get(urlString, function(data) {
			 window.location.reload();//刷新当前页面.
		})
		
}



//----------------------------更新接口信息-----------------------------------------------------
function editInterface(interfacId) {

	var urlString = '../interface/toEditInterface.html?projectId='+projectId+'&interfacId=' + interfacId;
	
	$.get(urlString, function(data) {
		$("#div-"+interfacId).empty(); 
	    $("#div-"+interfacId).append(data).toggleClass('div-display'); 
	})

}

//------------------删除接口------------------------
function deleteInterface(interfacId) {
	
	if (confirm("确认要删除？")) {
		var url = '../interface/deleteInterface.html?interfacId=' + interfacId+"&projectId="+projectId;
		$.get(url,function (data){
			if(data == "1"){
				$("#h5-"+interfacId).remove();
				$("#hr-"+interfacId).remove();
			}
		})
		//window.location.href='../interface/deleteInterface.html?interfacId=' + interfacId+"&projectId="+projectId;
	} 
}

//--------------------移动接口----------------------
function upOrdownInterface(type, interfacId , weight ) {
	var url = '../interface/upOrdownInterface.html?projectId='+projectId+'&interfacId=' + interfacId+'&type='+type +'&weight='+weight;
	
	$.get(url,function (data){
		window.location.reload();
	})
}

