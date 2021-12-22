<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - mypage</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/member.css">
<link rel="stylesheet" href="/resources/css/mypage.css">
<script src="/resources/js/mypage.js"></script>
</head>
<body>
	<div id="section">
 		<%@include file="sidemenu.jsp" %>
 		
		<div id="content">
			<div style="margin-left: 20px; margin-top: 20px; display: block;">전체주문내역</div>
			
 			<form name="frmPopup">
			<input type="hidden" name="pcode">
			</form>
			
			<div>
				<c:set var="prev_code" value="0" scope="page"></c:set>
				<table class="orderITEM">
					<c:forEach items="${olist}" var="mvo">
					<c:if test="${prev_code != mvo.order_code}">
					<tr>
						<td class="td1"><div class="orderNO"><strong>주문번호 : ${mvo.order_code}</strong></div></td>
						<td class="td3" colspan="2"><div class="orderDATE">주문일시 : ${mvo.regdate}</div></td>
					</tr>
					<c:set var="prev_code">${mvo.order_code}</c:set>
					</c:if>
					<tr>
						<td class="td2" colspan="2"><div class="item_desc"><img src="${mvo.img}" width="35"> <span>${mvo.title}</span></div></td>
						<td class="td3"><div class="review_btn"><input type="button" value="리뷰" onclick="open_pop('${mvo.pcode}')"></div></td>
					</tr>
					</c:forEach>
				</table>
			</div>

 		</div>	<!-- id="content" -->

	</div>	<!-- id="section" -->
</body>
</html>