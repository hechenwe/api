        





        //-----------------------------添加项目----------------------------------------
		function toAddProject() {
			$("#page-wrapper").empty();
			$("#page-wrapper").append($("#project").html());
		}
		//-----------------------------添加模块----------------------------------------
		function toAddModule(projectId) {
			$("#page-wrapper").empty();
			$("#page-wrapper").append($("#module").html());
			$("#projectId").val(projectId);
			//openOrClose('module',projectId);
		}
		//-----------------------------添加接口----------------------------------------
		function toAddInterface(moduleId) {

			$("#page-wrapper").empty();
			$("#page-wrapper").append($("#interface").html());
			$("#moduleId").val(moduleId);
		}
		//-----------------------------添加参数----------------------------------------
		function toAddParameter(interfacId) {
			var url = '../interface/getInterfaceParameterFormatParameterSize.html?interfacId='+interfacId;
			 
			
			$.get(url, function(data) {
				var parameterFormat = data.parameterFormat ;
				var parameterSize = data.parameterSize ;
				alert(parameterFormat+":"+parameterSize);
				
				$("#page-wrapper").empty();
				
				if(parameterFormat == "JSON" ){
					if(parameterSize == 0){
					$("#page-wrapper").append($("#parameter_json").html());
					}else{
						alert("JSON格式的参数已添加!");
					}
				}else{
				     $("#page-wrapper").append($("#parameter").html());
				}
				$("#interfacId").val(interfacId);
			})
			 
			
			
		}
		//-----------------------------添加参数的约束----------------------------------------
		function toAddParameterConstraint(parameterId) {
			$("#page-wrapper").empty();
			$("#page-wrapper").append($("#parameter_constraint").html());
			$("#parameterId").val(parameterId);
		}