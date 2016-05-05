
var projectId = $("#input_projectId").val();
//添加模块
function toAddModule(projectId) {
	
	$("#div_module").toggleClass('div-display');
	$("#projectId").val(projectId);

}

//保存模块
function saveModule() {
	 
	var projectId = $("#projectId").val();
	var moduleId = Math.uuid();
	var moduleName = $("#moduleName").val();
	var moduleCode = $("#moduleCode").val();
	var moduleIntro = $("#moduleIntro").val();
	var weight = $("#weight").val();
	var urlString = "../module/saveModule.html?projectId=" + projectId + "&moduleId=" + moduleId + "&moduleName=" + moduleName + "&moduleCode=" + moduleCode + "&moduleIntro=" + moduleIntro + "&weight=" + weight;
	$.get(urlString,function (data){
		 window.location.reload();//刷新当前页面.
	})
	
} 

//-----------------更新模块信息---------------------
function editModule() {
   
	var projectId = $("#input_projectId").val();
	var moduleId = $("#context-menu").attr("data-key").split(":")[0];
	
	var urlString = '../module/editModule.html?projectId='+projectId+'&moduleId=' + moduleId;
    
	$.get(urlString, function(data) {
		$("#div-"+moduleId).empty(); 
       $("#div-"+moduleId).append(data).toggleClass('div-display');
	})

}

//------------------删除模块------------------------
function deleteModule() {
	var projectId = $("#input_projectId").val();
	var moduleId = $("#context-menu").attr("data-key").split(":")[0];
	if (confirm("确认要删除？")) {
		var url = '../module/deleteModule.html?projectId='+projectId+'&moduleId=' + moduleId;
		$.get(url,function (data){
			if(data == "1"){
				//$("#h4-"+moduleId).remove();
				window.location.reload();//刷新当前页面.
			}else{
				alert("删除失败!");
			}
		})
		 
	} 
	
	 
}
