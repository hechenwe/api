//-----------------------------------------------------保存项目----------------------------------------------
		function saveProject() {

			var projectId = Math.uuid();
			 
			var projectName = $("#projectName").val();
			var projectCode = $("#projectCode").val();
			var projectIntro = $("#projectIntro").val();
			var weight = $("#weight").val();
			$.get("../project/saveProject.html?projectId=" + projectId + "&projectName=" + projectName + "&projectCode=" + projectCode + "&projectIntro=" + projectIntro + "&weight=" + weight, function(data) {
				$("#page-wrapper").empty();

				if (data == "1") {
					var html = '<ul  class="ul-root" id="'+ projectId +'">' + '<li><span onclick="openOrClose("module",' + projectId + ');"></span><a ondblclick="openOrClose("module",' + projectId + ');" >项目名称：' + projectName + '</a> <img src="../images/add-M2.png" onclick="toAddModule(\''+projectId+'\');"></img>' + '</ul>';
					$("#div_tree").append(html);
				}
			})

		}
		//-----------------------------------------------------保存模块----------------------------------------------
		function saveModule() {
			 
			var projectId = $("#projectId").val();
			var moduleId = Math.uuid();
			var moduleName = $("#moduleName").val();
			var moduleCode = $("#moduleCode").val();
			var moduleIntro = $("#moduleIntro").val();
			var weight = $("#weight").val();
			var urlString = "../module/saveModule.html?projectId=" + projectId + "&moduleId=" + moduleId + "&moduleName=" + moduleName + "&moduleCode=" + moduleCode + "&moduleIntro=" + moduleIntro + "&weight=" + weight;
			//alert(urlString);
			//window.location.href=urlString;
			$.get(urlString,function (data){
				 
				 window.location.reload();//刷新当前页面.
			})
			
			//httpGet(urlString,moduleId,projectId,moduleName,'module','add-I2.png','toAddInterface');
		} 
		//-----------------------------------------------------保存接口----------------------------------------------
		function saveInterface() {
			var projectId = $("#input_projectId").val();
			var moduleId = $("#moduleId").val();
			var interfacId = Math.uuid();
			var interfacName = $("#interfacName").val();
			var interfacCode = $("#interfacCode").val();
			var interfacIntro = $("#interfacIntro").val();
			var url = $("#url").val();
			var returnDataType = $('input[name="returnDataType"]:checked').val();
			var requestType = $('input[name="requestType"]:checked').val();
			var parameterFormat = $('input[name="parameterFormat"]:checked').val();
			var style = $('input[name="style"]:checked').val();

			var weight = $("#weight").val();
			var urlString = "../interface/saveInterface.html?";
			urlString = urlString + "moduleId=" + moduleId + "&interfacId=" + interfacId + "&interfacName=" + interfacName + "&interfacCode=" + interfacCode + "&interfacIntro=" + interfacIntro;
			urlString = urlString + "&url=" + url + "&returnDataType=" + returnDataType + "&requestType=" + requestType + "&parameterFormat=" + parameterFormat + "&weight=" + weight + "&projectId="+projectId+"&style="+style;
		 
			//window.location.href=urlString;
		   
			$.get(urlString,function (data){
				$("#div-intface-"+moduleId).removeClass('div-display');//显示 模块下的所用接口
				$("#div-intface-"+moduleId).append(data);
				$("#div_interfac"+moduleId).addClass('div-display');
				interfaceMousedown();
				 
				//window.location.reload();
			})
			 
		}
		
		
		//-----------------------------------------------------保存-返回示例----------------------------------------------
		  function saveExample(interfacId) {
			 
			  
			var exampleId = Math.uuid();
			var exampleType = $("#"+ interfacId +"exampleType").val();
			var exampleContent = $("#"+ interfacId +"exampleContent").val();
		    
			var urlString ="../example/savaExample.html"+
			               "?interfacId="+interfacId+
			               "&exampleId="+exampleId+
			               "&exampleType="+exampleType+
			               "&exampleContent="+exampleContent;
			//alert(urlString);
			$.get(urlString, function(data) {
				 
				$("#div-example"+interfacId).append(data);
				$("#"+ interfacId +"exampleContent").val("");
				 
				$("#returnExample"+interfacId).addClass("div-display");
			})	
		}  
		//-----------------------------------------------------保存-返回参数----------------------------------------------
		  function saveEaxmpleRetur(exampleId) {
		    
			var parameterId = Math.uuid();
			var parameterName = $("#"+ exampleId +"parameterName").val();
			var parameterCode = $("#"+ exampleId +"parameterCode").val();
			var parameterDataType = $("#"+ exampleId +"parameterDataType").val();
			var minLength = $("#"+ exampleId +"minLength").val();
			var maxLength = $("#"+ exampleId +"maxLength").val();
			var parameterExample = $("#"+ exampleId +"parameterExample").val();
			var parameterExplain = $("#"+ exampleId +"parameterExplain").val();
			var isMust = $('input[name="'+ exampleId +'isMust"]:checked').val();
			//var isMust = $('input[name="isMust"]:checked').val();
			var weight = $("#"+ exampleId +"weight").val();
			 
			var urlString ="../parameterRetur/saveParameterRetur.html"+
			               "?exampleId="+exampleId+
			               "&parameterId="+parameterId+
			               "&parameterName="+parameterName+
			               "&parameterCode="+parameterCode+
			               "&parameterDataType="+parameterDataType+
			               "&minLength="+minLength+
			               "&maxLength="+maxLength+
			               "&parameterExample="+parameterExample+
			               "&parameterExplain="+parameterExplain+
			               "&isMust="+isMust+
			               "&weight="+weight;
			
			$.get(urlString, function(data) {
				 
				if (data == "1") {
					alert("添加成功");
				}else{
					alert("添加失败");
				}
			})	
		}  
		//-----------------------------------------------------保存-返回参数说明----------------------------------------------
		  function saveValueExplain(exampleId) {
		      
			var parameterId = $("#"+ exampleId +"valueExplainParameterId").val();
			var valueExplainId = Math.uuid();
			var value = $("#"+ exampleId +"value").val();
			var valueMeaning = $("#"+ exampleId +"valueMeaning").val();
			var weight = $("#"+ exampleId +"valueExplainWeight").val();
		    
			var urlString ="../valueExplain/savaValueExplain.html"+
			               "?parameterId="+parameterId+
			               "&valueExplainId="+valueExplainId+
			               "&value="+value+
			               "&valueMeaning="+valueMeaning+
			               "&weight="+weight;
			//alert(urlString);
			$.get(urlString, function(data) {
				 
				if (data == "1") {
					alert("添加成功")
				}else{
					alert("添加失败")
				}
			})	
		} 
		  
		  //------------------------------------get请求------------------------------------------------
			function httpGet(urlString,id,parentId,nodeName,openString ,addString ,clickName){
				$.get(urlString, function(data) {
					$("#page-wrapper").empty();
					if (data == "1") {
						var html = '<ul  class="ul-root" id="'+ id +'">' + '<li><span onclick="openOrClose(\''+ openString +'\',\'' + id + '\');"></span><a ondblclick="openOrClose(\''+ openString +'\',\'' + id + '\');" >' + nodeName + '</a><img src="../images/'+addString+'" onclick="'+clickName+'(\'' + id + '\');"></img>' + '</ul>';
						if (data == "1") {
							$("#" + parentId).append(html);
							openOrClose( openString, parentId);
						}
					}
				})	
			}