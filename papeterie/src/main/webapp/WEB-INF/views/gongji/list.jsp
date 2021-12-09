<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/gongji.css">
</head>
<body>

<!-- 헤더 이미지 -->
<div class="content1" align="center">
	<img src="/resources/img/gongji.jpg" width="1903" height="400">
	<div class="content_text1"> Notice </div>
</div>

<!-- 본문 시작 -->
<div id="section">

	<!-- 페이지 제목 -->
	<h2> 공지사항 </h2>
	
	<!-- 리스트 목록 -->
	<table class="table list-table">
	<thead>
		<tr>
			<th width="100">번호</th>
			<th>제목</th>
			<th width="300">날짜</th>
			<th width="150">작성자</th>
		</tr>
	</thead>
		<c:forEach items="${list}" var="gvo">
		<tbody>
		<tr>
			<td class="list-center">
				${gvo.id}
			</td>
			<td>${gvo.title}</td>
			<td class="list-center">${gvo.writeday}</td>
			<td class="list-center">${gvo.name}</td>
		</tr>
		</tbody>
		</c:forEach>
	</table>
	<div id="btn_text">
	  <button type="button" class="btn btn-light" onclick="location='write'">글쓰기</button>
	</div>
</div>
</body>
</html>