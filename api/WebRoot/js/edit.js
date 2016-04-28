var projectId = $("#input_projectId").val();

 

//------------------------关闭修改模块的div------------------------------------------------------------------
function colseModuleDiv(moduleId) {
	
		$("#div-"+moduleId).toggleClass('div-display');
}
 
 
 

//--------------------移动模块--------------------------------------------------------
function upModule() {
	    var dataKeys = $("#context-menu").attr("data-key").split(":");
	    var type = "up";
	    var moduleId = dataKeys[0];
	    var weight = dataKeys[1];
	    var urlString= '../module/upOrdownModule.html?projectId='+projectId+'&moduleId=' + moduleId+'&type='+type +'&weight='+weight;
		$.get(urlString, function(data) {
			 window.location.reload();//刷新当前页面.
		})
		
}
function downModule() {
	var dataKeys = $("#context-menu").attr("data-key").split(":");
	var type = "down";
	var moduleId = dataKeys[0];
	var weight = dataKeys[1];
	var urlString= '../module/upOrdownModule.html?projectId='+projectId+'&moduleId=' + moduleId+'&type='+type +'&weight='+weight;
	$.get(urlString, function(data) {
		window.location.reload();//刷新当前页面.
	})
	
}



//----------------------------更新接口信息-----------------------------------------------------
function editInterface() {
	var interfacId = $("#context-menu").attr("data-key").split(":")[0];
	var urlString = '../interface/toEditInterface.html?projectId='+projectId+'&interfacId=' + interfacId;
	
	$.get(urlString, function(data) {
		$("#div-"+interfacId).empty(); 
	    $("#div-"+interfacId).append(data).toggleClass('div-display'); 
	})

}

//------------------删除接口------------------------
function deleteInterface() {
	var interfacId = $("#context-menu").attr("data-key").split(":")[0];
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

