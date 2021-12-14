<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/qna.css">
</head>
<body>

<!-- 본문 시작 -->
<div id="section">

	<!-- 페이지 제목 -->
	<h2> Q&A </h2>
	
	<!-- 리스트 목록 -->
	<table class="table list-table">
	<thead>
		<tr>
			<th width="80">번호</th>
			<th width="150">분류</th>
			<th>제목</th>
			<th width="80">이름</th>
			<th width="200">날짜</th>
			<th width="80">조회수</th>
		</tr>
	</thead>
		<c:forEach items="${list}" var="qvo">
		<tbody>
		<tr>
			<td class="list-center">${qvo.id}</td>
			<td class="list-center">
				<c:if test="${qvo.category == 1}">
					제품문의
				</c:if>
				<c:if test="${qvo.category == 2}">
					배송문의
				</c:if>
				<c:if test="${qvo.category == 3}">
					이벤트문의
				</c:if>
				<c:if test="${qvo.category == 4}">
					교환/반품/환불
				</c:if>
				<c:if test="${qvo.category == 5}">
					기타문의
				</c:if>
			</td>
			<td><a href="bimil?id=${qvo.id}" id="bimil-title">${qvo.title}</a>&nbsp;&nbsp;<img src="/resources/img/ico_lock.gif"></td>
			<td class="list-center">${uname}</td>
			<td class="list-center">${qvo.writeday}</td>
			<td class="list-center">${qvo.readnum}</td>
		</tr>
		</tbody>
		</c:forEach>
	</table>
	
	<!-- 유저아이디가 관리자가 아닐시 글쓰기 버튼이 안나옴. -->
	<c:if test="${userid == 'admin'}">
		<div id="btn_text">
		  <button type="button" class="btn btn-light" onclick="location='write'">글쓰기</button>
		</div>
	</c:if>
</div>
</body>
</html>