<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>     
<!DOCTYPE html>
<html>
<head>
<title><decorator:title default="PAPETERIE" /></title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/resources/css/default.css?var=1">
<script src="/resources/js/default.js?var=1"></script>

<decorator:head />
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
			<img src="/resources/img/papeterie.png"  class="top-logo-text3" width="100" style="cursor:pointer;" onclick="location='../main/index'">
			
			<!-- 로그인이 안되었을때 -->
			<div class="top-head-menu">
				<c:if test="${userid == null}">
					<a class="top_head_first_menu" href="../member/login">로그인</a> <a class="top_head_first_menu2">|</a>
					<a class="top_head_first_menu" href="#">회원가입</a> <a class="top_head_first_menu2">|</a>
					<a class="top_head_first_menu" href="../member/login">마이페이지</a> <a class="top_head_first_menu2">|</a>
					<a class="top_head_first_menu" href="../basket/cart">장바구니</a>
				</c:if>
				
				<!-- 로그인이 되었을때 -->
				<c:if test="${userid != null}">
					<span class="top_head_first_menu">${uname}님</span> <a class="top_head_first_menu" href="../member/logout">로그아웃</a> <a class="top_head_first_menu2">|</a>
					<a class="top_head_first_menu" href="../member/mypage">마이페이지</a> <a class="top_head_first_menu2">|</a>
					<a class="top_head_first_menu" href="../basket/cart">장바구니</a>
				</c:if>
			</div>
		</div>
		
		<!-- 두번째 층 -->
		<div class="top_head_second">
		
			<!-- 처음시작시 로고 뜨는부분 -->
			<div class="top-logo-head">
				<img src="/resources/img/papeterie.png"  width="200" style="cursor:pointer;" onclick="location='../main/index'">
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
						<li><a href="../gongji/list">공지사항</a></li>
						<li><a href="../qna/list">고객센터</a></li>
						<li><a href="#">추천상품</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	
<decorator:body/>
	
<!-- 문서의 내용이 출력 -->
	
<!-- 바텀 부분 -->
<div id="bottom-head">
	<div id="bottom-logo"><img src="/resources/img/papeterie.png"  width="250" style="cursor:pointer;" onclick="location='../main/index'"></div>
	<div id="bottom-content">
		<div id="bottom-first">
			<a href="../gongji/list">공지사항</a>
			<a href="../qna/list">질문/답변</a>
			<a href="#">이용약관</a>
			<a href="#">개인정보처리방침</a>
			<a href="#">판매처 안내</a>
		</div>
		<div class="bottom-second">상호 : (주)Papeterie  사업자등록번호 : 120-10-01010 통신판매업신고번호 : 2022-서울구로-0106 [사업자정보확인] </div>
		<div class="bottom-second">팩스번호 : 010-101-0011 메일 : papeterie@market.com / Papeterie 인스타그램 : @Papeterie </div>
		<div class="bottom-second">주소 : 서울 구로구 구로중앙로34길 33-4 영림빌딩  호스팅제공 : 경영기술개발원 (주)</div>
		<div class="bottom-second">© Papeterie Guro Corp. All right Reserved</div>
	</div>
		<div>
			<!-- 테스트용 -->
			<form action="">
				<select id="test" class="test" name="test">
					<c:forEach items="${glist}" var="gvo">
						<option value="${gvo.pcode}">${gvo.pcode}</option>
					</c:forEach>
				</select> <input type="button" value="이동" onclick="gotourl()">
			</form>
			<script>
				function gotourl() {
					var selectOption = document.getElementById("test");
					selectOption = selectOption.options[selectOption.selectedIndex].value;
					//alert(selectOption);
					location = "../goods/goods_view?pcode=" + selectOption;
				}
			</script>
		</div>
	</div>
</body>
</html>