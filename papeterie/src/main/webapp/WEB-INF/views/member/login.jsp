<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/member.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<div id="section">
		<form method="post" action="login_ok">
			<table width="400" align="center">
				<tr>
					<td><input type="text" name="userid" placeholder="아이디"></td>
				</tr>
				<tr>
					<td><input type="password" name="pwd" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td><input type="submit" value="로그인"></td>
				</tr>
			</table>
		</form>
		<div align="center">
			<span onclick="view_uidsearch()">아이디 찾기</span>
			<span onclick="view_pwdsearch()">비밀번호 찾기</span>
		</div>
		<form name="userid_search" id="userid_search">
			<table width="400" align="center">
				<caption><h4 id="uid"></h4></caption>
				<tr>
					<td><input type="text" name="name" placeholder="이름"></td>
				</tr>
				<tr>
					<td><input type="text" name="email" placeholder="이메일"></td>
				</tr>
				<tr>
					<td><input type="button" value="아이디찾기"	onclick="userid_search_fn()"></td>
				</tr>
			</table>
		</form>
		<form name="pwd_search" id="pwd_search">
			<table width="400" align="center">
				<caption><h4 id="pid"></h4></caption>
				<tr>
					<td><input type="text" name="userid" placeholder="아이디"></td>
				</tr>
				<tr>
					<td><input type="text" name="name" placeholder="이름"></td>
				</tr>
				<tr>
					<td><input type="text" name="email" placeholder="이메일"></td>
				</tr>
				<tr>
					<td><input type="button" value="비밀번호찾기" onclick="pwd_search_fn()"></td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>