<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 리뷰</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/member.css">
<link rel="stylesheet" href="/resources/css/review.css">
<script src="/resources/js/member.js"></script>
<script>
</script>
</head>
<body>
	<div id="section">
 		<%@include file="sidemenu.jsp" %>
		
		<form name="frmPopup">
		<input type="hidden" name="idx">
		</form>
		
		<div id="content">
			<div style="margin-left: 20px; margin-top: 20px;">리뷰목록</div>
			<BR>
			<table id="">
				<tr>
					<th width="60">No</th>
					<th width="100">별점</th>
					<th width="400">내용</th>
					<th width="100">관리</th>
				</tr>
				<c:forEach items="${rlist}" var="rvo">
				<c:set var="i" value="${i + 1}"></c:set>
				<tr>
					<td>${i}</td>
					<td>${rvo.score}</td>
					<td>
						<c:if test="${rvo.filename != null }">
						<img src="${rvo.filename}" width="35">
						</c:if>
						<a href="javascript:;" onclick="updateopen('${rvo.idx}')">${rvo.content}</a>
					</td>
					<td>
						<a href="javascript:;"><img src="/resources/img/ic_delete.svg" alt="삭제" title="삭제" onclick="del_review('${rvo.idx}')"></a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>	<!-- id="content" -->
		


	</div>	<!-- id="section" -->
</body>
</html>