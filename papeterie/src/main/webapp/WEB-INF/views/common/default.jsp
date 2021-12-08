<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>     
<!DOCTYPE html>
<html>
<head>
<title><decorator:title default="2021. 12. 1 오전 11:18:48" /></title>
<decorator:head />
<link rel="stylesheet" href="/resources/css/menu.css">
<script src="/resources/js/menu.js"></script>
</head>
<body>
	<!-- 
	일전의 top.jsp / bottom.jsp의 역할을 한다
	해당하는 decorator 태그에 지정된 문서가 자동으로 대치된다  
	-->
	<div id="first"></div>
	<div id="second">
		<ul id="shop">
			<li><a href="../main/index">PAPETERIE</a></li>
			<li id="">
				<ul id="menu">
					<li onmouseover="showsub(0)" onmouseout="hidesub(0)">
						Item1
						<ul class="sub">
							<li>sub 1</li>
							<li>sub 2</li>
							<li>sub 3</li>
						</ul>
					</li>
					<li onmouseover="showsub(1)" onmouseout="hidesub(1)">
						Item2
						<ul class="sub">
							<li>sub 1</li>
							<li>sub 2</li>
							<li>sub 3</li>
						</ul>
					</li>
					<li onmouseover="showsub(2)" onmouseout="hidesub(2)">
						Item3
						<ul class="sub">
							<li>sub 1</li>
							<li>sub 2</li>
							<li>sub 3</li>
						</ul>
					</li>
					<li onmouseover="showsub(3)" onmouseout="hidesub(3)">
						Item4
						<ul class="sub">
							<li>sub 1</li>
							<li>sub 2</li>
							<li>sub 3</li>
						</ul>
					</li>
					<li onmouseover="showsub(4)" onmouseout="hidesub(4)">
						커뮤니티
						<ul class="sub">
							<li><a href="../board/list">공지사항</a></li>
							<li>고객센터</li>
							<li>추천상품</li>
						</ul>
					</li>
				</ul>
			</li>
			<li>
				<c:if test="${userid == null }">
					<a href="../member/login">로그인</a>
					/
					<a href="../member/signin">회원가입</a>
				</c:if>
				<c:if test="${userid != null }">
					${name}님 <a href="../member/logout">로그아웃</a>
					/
					<a href="../member/mypage">Mypage</a>
				</c:if>
			</li>
		</ul>
	</div>

	<decorator:body />

	<!-- 문서의 내용이 출력 -->

	<div id="bottom">My Shop 정보</div>
</body>
</html>