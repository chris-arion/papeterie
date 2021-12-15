/**
 * 
 */
 
 function addOpen(){
 	window.open("jusoPopup", "주소검색", "width=550, height=517, toolbar=no, menubar=no, scrollbars=no, resizable=no" );
 }

 function jusoCallBack(roadFulladdr){
	var add = document.getElementById("target_address");
	add.value = roadFulladdr;
}

 function checkAll(){
	 if(document.getElementById("agree_all").checked==true){ 
	 	for(var i=0;i<2;i++) document.getElementsByName("agreecheck")[i].checked=true;   
	 }
	 if(document.getElementById("agree_all").checked==false){
	 	for(var i=0;i<2;i++) document.getElementsByName("agreecheck")[i].checked=false;  
	 }
}

 function check_back(my){
	 if(my.checked==false){
	 	document.getElementById("agree_all").checked=false;  
	 }
 }
 
 function change_mail(my){
 	var mail = "";
 	switch(my.value){
 		case "0": mail=""; break;
 		case "1": mail="naver.com"; break;
 		case "2": mail="daum.net"; break;
 		case "3": mail="nate.com"; break;
 		case "4": mail="gmail.com"; break;
 		case "5": mail="hotmail.com"; break;
 		default : mail=""; break;
 	}
 	document.getElementById("email_juso").value=mail;
 }
 
 function shipping_my(my){
 	if(my.value == "0"){
 		document.getElementById("target").value="";
 		document.getElementById("target_tel").value="";
 		document.getElementById("target_phone").value="";
 		document.getElementById("target_notice").value="";
 	}
 	else{
 		document.getElementById("target").value=document.getElementById("buyer").value;
 		document.getElementById("target_tel").value=document.getElementById("buyer_tel").value;
 		document.getElementById("target_phone").value=document.getElementById("buyer_phone").value;
 		document.getElementById("target_notice").value=document.getElementById("buyer_notice").value;
 	}
 }
