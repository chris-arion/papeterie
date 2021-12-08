/**
 * 
 */

function view_uidsearch() // 아이디 찾기 창 보이기
{
	document.getElementById("userid_search").style.display = "block";
	document.getElementById("pwd_search").style.display = "none";
	document.pwd_search.userid.value = "";
	document.pwd_search.name.value = "";
	document.pwd_search.email.value = "";
 }
 function view_pwdsearch() // 비밀번호 찾기 창 보이기
 {
	  document.getElementById("userid_search").style.display = "none"; // 아이디 찾기 숨기기 
	  document.getElementById("pwd_search").style.display = "block";
	  document.userid_search.name.value = "";
	  document.userid_search.email.value = "";
 }
 
 function userid_search_fn() // 이름,이메일을 가지고 서버에가서 아이디를 찾아 오기
 {
	  var name=document.userid_search.name.value;
	  var email=document.userid_search.email.value;
	  var us=new XMLHttpRequest();
	  us.open("get", "userid_search_ok?name=" + name + "&email=" + email);
	  us.send();
	  us.onreadystatechange = function()
	  {
		  if(us.readyState == 4)
		  {
		     if(us.responseText == 0)
		     {
		    	 alert("이름 혹은 이메일이 틀립니다.");
		     }	 
		     else
		     {   
		    	 //alert();
		    	 var imsi=us.responseText.trim();
		    	 document.getElementById("uid").innerText="당신의 아이디는 " + imsi + " 입니다";
		     }
		  }
	  }
 }
 
 function pwd_search_fn() // 이름,이메일을 가지고 서버에가서 아이디를 찾아 오기
 {
	  var userid = document.pwd_search.userid.value;
	  var name = document.pwd_search.name.value;
	  var email = document.pwd_search.email.value;
	  var ps=new XMLHttpRequest();
	  ps.open("get", "pwd_search_ok?userid=" + userid + "&name=" + name + "&email=" + email);
	  ps.send();
	  ps.onreadystatechange = function()
	  {
		 if(ps.readyState == 4)
		 {
		    if(ps.responseText == 0)
		    {
		    	alert("아이디,이름 혹은 이메일이 틀립니다.");
		    }	 
		    else  // 성공했을때
		    {   
		    	 document.getElementById("pwd_search").style.display="none";
		    	 alert("이메일로 비밀번호를 전송하였습니다");
			}
		}
	}
}
