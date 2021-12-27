<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 찜목록</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/member.css">
<link rel="stylesheet" href="/resources/css/wishlist.css?var=1">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/member.js"></script>
<script>
</script>
</head>
<body>
	<div id="section">
 		<%@include file="sidemenu.jsp" %>
		
		<div id="content">
			<div  id="wisi-head">찜목록</div>
			<BR>
			<table id="">
				<tr>
					<th width="60">번호</th>
					<th width="400">상품정보</th>
					<th width="100">상품금액</th>
					<th width="60">삭제</th>
				</tr>
				<c:forEach items="${wlist}" var="wvo">
				<c:set var="i" value="${i + 1}"></c:set>
				<tr>
					<td align="center">${i}</td>
					<td><img id="goods_img" src="${wvo.img}"> ${wvo.title}</td>
					<td align="center"><fmt:formatNumber value="${wvo.price}"/> 원</td>
					<td align="center">
						<a href="del_wishlist?idx=${wvo.idx}"><img src="/resources/img/ic_delete.svg" alt="삭제" title="삭제"></a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>	<!-- id="content" -->
		


	</div>	<!-- id="section" -->
</body>
</html>