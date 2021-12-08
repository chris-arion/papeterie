<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>     
<!DOCTYPE html>
<html>
<head>
<title><decorator:title default="2021. 12. 1 오전 11:18:48" /></title>
<decorator:head />
<link rel="stylesheet" href="/resources/css/default.css">
<script src="/resources/js/default.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<body>

	<!-- 
	일전의 top.jsp / bottom.jsp의 역할을 한다
	해당하는 decorator 태그에 지정된 문서가 자동으로 대치된다  
	-->
	
	<!-- 탑 부분 -->
	<div class="top_head"> 
	
		<!-- 첫번째 층 -->
		<div class="top_head_first">
		
			<!-- 스크롤 내리면 상단의 로고 -->
			<a class="top-logo-text3" href="/">로고들어갈부분</a>
			
			<!-- 로그인이 안되었을때 -->
			<c:if test="${userid == null}">
				<a class="top_head_first_menu" href="#">로그인</a> <a>|</a>
				<a class="top_head_first_menu" href="#">회원가입</a> <a>|</a>
				<a class="top_head_first_menu" href="#">마이페이지</a> <a>|</a>
				<a class="top_head_first_menu" href="#">장바구니</a>
			</c:if>
			
			<!-- 로그인이 되었을때 -->
			<c:if test="${userid != null}">
				<a class="top_head_first_menu" href="#">로그아웃</a> <a>|</a>
				<a class="top_head_first_menu" href="#">마이페이지</a> <a>|</a>
				<a class="top_head_first_menu" href="#">장바구니</a>
			</c:if>
		</div>
		
		<!-- 두번째 층 -->
		<div class="top_head_second">
		
			<!-- 처음시작시 로고 뜨는부분 -->
			<div class="top-logo-head">
				<a class="top-logo-text1" href="/">로고</a> <a class="top-logo-text2" href="/">들어갈부분</a>
			</div>
			
			<!-- 검색어 나타나는곳 -->
			<div>
				<input type="text" name="search" id="search" placeholder="검색어를 입력해주세요.">
				<img src="/resources/img/search.png" id="search_img">
			</div>
		</div>
		
		<!-- 세번째 층  -->
		<div class="second-head">
			
			<!-- 메뉴 카테고리 -->
			<ul class="second-menu">
				<li onmouseover="view_sub(0)" onmouseout="hide_sub(0)">
					Item1
					<ul class="sub">
						<li>menu 1</li>
						<li>menu 2</li>
						<li>menu 3</li>
					</ul>
				</li>
				<li onmouseover="view_sub(1)" onmouseout="hide_sub(1)">
					Item2
					<ul class="sub">
						<li>menu 1</li>
						<li>menu 2</li>
						<li>menu 3</li>
					</ul>
				</li>
				<li onmouseover="view_sub(2)" onmouseout="hide_sub(2)">
					Item3
					<ul class="sub">
						<li>menu 1</li>
						<li>menu 2</li>
						<li>menu 3</li>
					</ul>
				</li>
				<li onmouseover="view_sub(3)" onmouseout="hide_sub(3)">
					Item4
					<ul class="sub">
						<li>menu 1</li>
						<li>menu 2</li>
						<li>menu 3</li>
					</ul>
				</li>
				<li onmouseover="view_sub(4)" onmouseout="hide_sub(4)">
					커뮤니티
					<ul class="sub">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">고객센터</a></li>
						<li><a href="#">추천상품</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<decorator:body/>
	
	<!-- 문서의 내용이 출력 -->
	
	<!-- 바텀 부분 -->
	<div id="bottom">
	My shop 정보
	</div>
</body>
</html>