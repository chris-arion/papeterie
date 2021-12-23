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
		<span id="page_title">주문/결제 완료</span> <span id="page_sub">01장바구니 > 02주문서작성/결제 > <strong style="color:black;">03주문완료</strong></span>
		<hr>
	<div id="receipt">
		<div id="receipt_head">
			<img src="/resources/img/papeterie.png" id="receipt_logo"/><span>주문/결제 확인서</span>
		</div>
		<div id="receipt_middle">
		<div id="product_table">
			<ul>
				<li>주문번호 : </li>
				<li>결제수단 : </li>
				<li>주문날짜 : </li>
			</ul>
			<table>
				<tr>
					<th class="product_title">상 품 명</th>
					<th>상품 수량</th>
					<th>상품 가격</th>
					<th>상품 총 가격</th>
				</tr>
				<tr>
					<td class="product_title">~~상품이름입니다</td>
					<td class="product_price">5</td>
					<td>5,000원</td>
					<td>25,000원</td>
				</tr>
				<%-- <c:forEach items="" var="">
				<tr>
					<td class="product_title">${pvo.title}</td>
					<td class="product_price">${pvo.count}</td>
					<td><fmt:formatNumber value="${pvo.price}"/>원</td>
					<td><fmt:formatNumber value="${pvo.price*pvo.count}"/>원</td>
				</tr>
				</c:forEach> --%>
			</table>
			<div class="total_price"> 총 주문/결제 금액  <strong>```원</strong> </div>
		</div>
		</div>
		<div id="receipt_bottom">
			
		</div>
	</div>
	</div>
</body>
</html>