/**
 * 
 */
 
 function jundal(n)
 {
	opener.document.getElementById("target").value = document.getElementsByClassName("rname")[n].innerText;
	opener.document.getElementById("target_phone").value = document.getElementsByClassName("phone")[n].innerText;
	opener.document.getElementById("zipNo").value = document.getElementsByClassName("zip")[n].innerText;
	opener.document.getElementById("roadAddrPart1").value = document.getElementsByClassName("addr1")[n].innerText;
	opener.document.getElementById("addrDetail").value = document.getElementsByClassName("addr2")[n].innerText;
	opener.document.getElementById("target_option").value = document.getElementsByClassName("soption")[n].value;
	close();
 }
 function move_address(){
 	opener.location = "../member/mypage";
 	close();
 }
 