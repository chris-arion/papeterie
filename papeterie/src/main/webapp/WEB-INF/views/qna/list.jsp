<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/qna.css">
<script>
function qnalist(){
	if(confirm("글을 작성하시려면 로그인을 해 주십시오."))
	{
		location="../member/login";
	}
	else
	{
		
	}
}
</script>
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
		<c:forEach items="${list}" var="qvo" varStatus="status">
		<tbody>
		<tr>
			<td class="list-center">${fn:length(list) - status.index}</td>
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
			<td class="list-center">${qvo.name}</td>
			<td class="list-center">${qvo.writeday}</td>
			<td class="list-center">${qvo.readnum}</td>
		</tr>
		</tbody>
		</c:forEach>
	</table>
	<c:if test="${userid == null}">
	<div id="btn_text">
		  <button type="button" class="btn btn-light" onclick="qnalist()">문의하기</button>
		</div>
	</c:if>
	<c:if test="${userid != null}">
	<div id="btn_text">
		  <button type="button" class="btn btn-light" onclick="location='write'">문의하기</button>
		</div>
	</c:if>
</div>
</body>
</html>