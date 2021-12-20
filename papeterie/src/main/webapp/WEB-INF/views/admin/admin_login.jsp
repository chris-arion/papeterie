<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/admin.css">
<style>
body{
	margin:0px;
	background:#f2f2f2;
}

#section2{
	width:600px;
	height:800px;
	margin:auto;
	margin-top:100px;
}

#login-form{
	width:400px;
	height:400px;
	margin:auto;
	border:1px solid silver;
	background:white;
	padding:60px 20px;
}

.login-head{
	display:inline-block;
	width:100px;
	height:35px;
	font-weight:bold;
	font-size:14px;
	padding-top:15px;
	text-align:center;
	border-left:1px solid silver;
	border-top:2px solid silver;
	border-right:1px solid silver;
	background:#f2f2f2;
	cursor:pointer;
}

.login-input{
	width:330px;
	height:50px;
	border:2px solid silver;
	padding-left:20px;
}

#login-ok{
	width:358px;
	height:50px;
	background:gray;
	color:white;
	font-size:18px;
	border:none;
	border-radius:8px;
	cursor:pointer;
}

.click{
	background:white;
	border-top:2px solid gray;
	border-right:none;
}

#chk{
-webkit-transform: scale(1.5);
margin-bottom:10px;
}
</style>
<script>
window.onload = function()
{
	var element = document.getElementById("div1");
	element.classList.add("click");
}


</script>
</head>
<body>
	<div id="section2">
		<div align="center"><img src="/resources/img/papeterie.png" width="300"></div>
		<div id="login-form">
			<table width="350" align="center">
				<tr>
					<td style="border-bottom:1px solid silver;"><span class="login-head" id="div1" onclick="color-chg()">대표운영자</span><span class="login-head" id="div2" onclick="">부운영자</span></td>
				</tr>
				<tr>
					<td style="padding-top:30px;padding-bottom:10px;"><input type="text" name="userid" class="login-input" placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<td><input type="password" name="pwd" class="login-input" placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="chk">&nbsp;로그인상태 유지 <span style="float:right;">비밀번호 재설정 ></span></td>
				</tr>
				<tr>
					<td><input type="submit" value="관리자 로그인" id="login-ok"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>