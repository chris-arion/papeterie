<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/resources/css/admin.css">
<script src="/resources/js/admin.js"></script>
</head>
<body>
<!-- 메뉴 인클루드 파일 -->

<!-- 좌측 메뉴 -->
<div id="leftmenu">
		<div id="menu-head">
			<span>KOREA</span><br>
			<span>PAPETERIE</span><br>
			<span>MARKET</span>
		</div>
		<div id="menu-date"> 
	        <div id="date"></div> 
	        <div id="yoil"></div> 
	        <div id="time"></div> 
    	</div> 
    	<ul id="menu-list">
    		<li><a href="manager">▶ 전체페이지</a></li>
    		<li><a href="#">▶ 주문관리</a></li>
    		<li><a href="#">▶ 배송관리</a></li>
    		<li><a href="product">▶ 상품관리</a></li>
    		<li><a href="user">▶ 회원관리</a></li>
    		<li><a href="gongji">▶ 공지관리</a></li>
    		<li><a href="qna">▶ Q&A관리</a></li>
    	</ul>
    	<div id="logout"><a>▶ Log Out</a> </div>
	</div>