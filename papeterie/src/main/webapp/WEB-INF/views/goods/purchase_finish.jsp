<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 완료</title>
<link rel="stylesheet" href="/resources/css/purchase_finish.css">
<script src="/resources/js/purchase_finish.js"></script>

</head>
<body>
	<div id="section">
		<div>
			상품 구매 완료
		</div>
		<div id="order_table">
			<table>
				<tr>
					<th>상 품 명</td>
					<td>상품 수량</td>
					<td>상품 가격</td>
					<td>상품 총 가격</td>
					</td>
				</tr>
				<c:forEach items="${list}" var="ovo">
				<tr>
					<td>${ovo.title}</td>
					<td>${ovo.price}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>