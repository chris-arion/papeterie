/**
 * 
 */

function open_pop(pcode){
    var frmPop= document.frmPopup;
    var url = '../review/write';
    window.open('','write','width=450, height=550, toolbar=no, menubar=no, resizable=no');  
     
    frmPop.action = url;
    frmPop.target = 'write'; //window,open()의 두번째 인수와 같아야 하며 필수다.  
    frmPop.pcode.value = pcode;
    frmPop.submit();   
}

function review_ok() {
	var formData = new FormData($('#frm')[0]);

	$.ajax({
		url : "write_ok",
		method : "POST",
		enctype: "multipart/form-data",  
		data : formData,
		cache : false,
		processData: false, // 필수 
		contentType: false, // 필수
		datatype : "text",
		success : function(data) {
			//console.log("return OK");
			console.log(data);
			self.close();
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	});
	
}

function review_cancel() {
	self.close();   //자기자신창을 닫습니다.
}
