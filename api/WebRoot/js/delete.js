//-----------------------------------------------------删除返回示例----------------------------------------------
function deleteExample(exampleId) {

	if (confirm("确认要删除？")) {
		var url = '../example/deleteExample.html?exampleId=' + exampleId;

		$.get(url, function(data) {

			if (data == "1") {
				$("#example"+exampleId).remove();
			}
		})
	}
}
