<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/js/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/css/gongji.css">
<script src="/resources/js/gongji.js"></script>
</head>
<body>

<!-- 헤더 이미지 -->
<div class="content" align="center">
	<img src="/resources/img/gongji.jpg" width="1903" height="400">
	<div class="content_text"> Notice Write </div>
</div>

<!-- 본문 시작 -->
<div id="section">

	<!-- 페이지 제목 -->
	<h2> 공지사항 작성 </h2>
	
	<!-- 작성 폼 -->
	<form method="post" action="write_ok">
	<table class="table table-center">
		<tr>
			<th width="150">작성자</th>
			<td><input type="text" name="name" id="name" size="40"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title" size="40"></td>
		</tr>
		<tr>
			<th style="padding-top:200px;">내용</th>
			<td><textarea name="content" id="summernote"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center"> 
				<input type="button" value="이전" onclick="location='list'" id="write-btn">
				<input type="submit" value="저장" id="write-sub">
			</td>
		</tr>
	</table>
	</form>
</div>
</body>
</html>