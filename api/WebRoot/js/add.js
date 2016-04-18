

//-----------------------------添加项目----------------------------------------
function toAddProject() {
	$("#page-wrapper").empty();
	$("#page-wrapper").append($("#project").html());
}
// -----------------------------添加模块----------------------------------------
function toAddModule(projectId) {
	$("#div_module").toggleClass('div-display');
	//$("#page-wrapper").empty();
	//$("#page-wrapper").append($("#module").html());
	$("#projectId").val(projectId);

}
// -----------------------------添加接口----------------------------------------
function toAddInterface() {
	 var dataKeys = $("#context-menu").attr("data-key").split(":");
	 var moduleId = dataKeys[0];  
	 
	 
	$("#div-intface-"+moduleId).addClass('div-display');//隐藏 模块下的所用接口
	 
	$("#div_interfac"+moduleId).removeClass('div-display');//显示添加接口模块
	 
	$("#moduleId").val(moduleId);
}
// -----------------------------添加参数----------------------------------------
function toAddParameter(interfacId) {
	var url = '../interface/getInterfaceParameterFormatParameterSize.html?interfacId=' + interfacId;

	$.get(url, function(data) {
		var parameterFormat = data.parameterFormat;
		var parameterSize = data.parameterSize;

		if (parameterFormat == "JSON") {
			if (parameterSize == 0) {
				 
				$("#div_parameter"+interfacId).toggleClass('div-display');
			} else {
				alert("JSON格式的参数已添加!");
			}
		} else {
			 
			$("#div_parameter"+interfacId).toggleClass('div-display');
		}
		$("#interfacId").val(interfacId);
	})

}
// -----------------------------添加参数的约束----------------------------------------
/*function toAddParameterConstraint(parameterId) {
	$("#page-wrapper").empty();
	$("#page-wrapper").append($("#parameter_constraint").html());
	$("#parameterId").val(parameterId);
}*/
// -----------------------------添加参数的约束----------------------------------------
function toAddExample(parameterId) {
/*	$("#page-wrapper").empty();
	$("#page-wrapper").append($("#parameter_constraint").html());
	$("#parameterId").val(parameterId);
}*/

}
//-------------------------------------显示添加参数约束-------------------------------------------
function divDisplay(interfacId,parameterId){
	$("#div_parameter_constraint_"+interfacId).toggleClass('div-display');
	 
	$("#"+interfacId+"_parameterId").val(parameterId);
	 
}

//-------------------------------------显示添加返回示例-------------------------------------------
function openOrColseEaxmple(interfacId){
	$("#returnExample"+interfacId).toggleClass('div-display');
	 
}
//-------------------------------------显示添加返回参数-------------------------------------------
function openOrColseEaxmpleReturn(exampleId){
	$("#example-parameter"+exampleId).toggleClass('div-display');
	 
}
//-------------------------------------显示添加返回参数说明-------------------------------------------
function openOrCloseValueExplain(parameterId,exampleId){
	$("#valueExplain"+exampleId).toggleClass('div-display');
	$("#"+exampleId+"valueExplainParameterId").val(parameterId);
	 
}