<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - login</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/member.css">
<script src="/resources/js/member.js"></script>
</head>
<body>
	<div id="section">
		<div align="center">
			<form name="frm" method="post" action="login_ok">
				<table id="login_table">
					<tr>
						<td>
							<input type="text" name="userid" placeholder="아이디">
						</td>
					</tr>
					<tr>
						<td>
							<input type="password" name="pwd" placeholder="비밀번호">
						</td>
					</tr>
					<tr>
						<td>
							<input type="submit" value="로그인">
						</td>
					</tr>
					<tr>
						<td>
							<div align="center">
								<span onclick="view_uidsearch()" style="cursor: pointer;">아이디 찾기</span>
								<a>&nbsp;&nbsp;|&nbsp;&nbsp;</a>
								<span onclick="view_pwdsearch()" style="cursor: pointer;">비밀번호 찾기</span>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div id="userid_search" align="center">
			<form name="userid_search">
				<table id="userid_search_tbl">
					<tr>
						<td>
							<input type="text" name="uname" placeholder="이름">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="email" placeholder="이메일">
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="아이디찾기" onclick="userid_search_fn()">
						</td>
					</tr>
					<tr>
						<td>
							<div align="center"><span id="uid"></span></div>
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div id="pwd_search" align="center">
			<form name="pwd_search">
				<table id="pwd_search_tbl">
					<tr>
						<td>
							<input type="text" name="userid" placeholder="아이디">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="uname" placeholder="이름">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="email" placeholder="이메일">
						</td>
					</tr>
					<tr>
						<td>
							<input type="button" value="비밀번호찾기" onclick="pwd_search_fn()">
						</td>
					</tr>
					<tr>
						<td>
							<div align="center"><span id="pid"></span></div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
	</div>

</body>
</html>