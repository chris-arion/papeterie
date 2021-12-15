<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - addressbook</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/member.css">
<script src="/resources/js/member.js"></script>
</head>
<body>
	<div id="section">
 		<%@include file="sidemenu.jsp" %>
		
		<div id="content">
			<div>배송지 목록</div>
			<div id="ship_add"><input type="button" onclick="show_add()" value="배송지 추가"></div>
			<table id="mypage_table">
				<tr>
					<td>배송지</td>
					<td>12345</td>
					<td>서울특별시 구로구 구로동 123-456</td>
					<td>010-1111-2222</td>
					<td>홍길동</td>
					<td>수정 / 삭제</td>
				</tr>
				<tr>
					<td>홍길동</td>
					<td>12345</td>
					<td>서울특별시 구로구 구로동 123-456</td>
					<td>010-1111-2222</td>
					<td>홍길동</td>
					<td>수정 / 삭제</td>
				</tr>
			</table>
		</div>	<!-- id="content" -->

	</div>	<!-- id="section" -->
</body>
</html>