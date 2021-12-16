<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
<link rel="stylesheet" href="/resources/css/admin.css">
<script src="/resources/js/admin.js"></script>
</head>
<body>
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
    		<li><a href="#">▶ 전체페이지</a></li>
    		<li><a href="#">▶ 주문관리</a></li>
    		<li><a href="#">▶ 배송관리</a></li>
    		<li><a href="#">▶ 상품관리</a></li>
    		<li><a href="#">▶ 회원관리</a></li>
    		<li><a href="#">▶ 공지관리</a></li>
    		<li><a href="#">▶ Qna관리</a></li>
    	</ul>
    	<div id="logout"><a>▶ Log Out</a> </div>
	</div>
	
<!-- 본문 내용 -->
<div id="content">
	<div id="content-head">
		<span>Admin Dashboard</span>
	</div>
	<div id="content-user">
		<div id="content-userbox">
			<div id="content-userhead">회원 <span id="content-userhead2">(명)</span></div>
			<img src="/resources/img/user.png" width="50">
			<div><span id="content-userchk">0</span></div>
		</div>
		<div id="content-userbox">
			<div id="content-userhead">오늘 가입한 회원 <span id="content-userhead2">(명)</span></div>
			<img src="/resources/img/user.png" width="50">
			<div><span id="content-userchk">0</span></div>
		</div>
		<div id="content-userbox">
			<div id="content-userhead"> 회원 전체 포인트 <span id="content-userhead2">(P)</span></div>
			<img src="/resources/img/user.png" width="50">
			<div><span id="content-userchk">0.00</span></div>
		</div>
	</div>
	<div id="content-note">
	<div class="box">
		<table class="table gongji">
			<tr>
				<th colspan="2" height="30">공지 현황</th>
			</tr>
			<tr>
				<th height="40" width="100" class="gongji-th">구분</th>
				<th class="gongji-th">갯수</th>
			</tr>
			<tr>
				<td class="gongji-td">게시글</td>
				<td class="gongji-td-right">0개</td>
			</tr>
		</table>
	</div>
	<div class="box">
		<table class="table gongji">
			<tr>
				<th colspan="2" height="30">공지 현황</th>
			</tr>
			<tr>
				<th height="40" width="100" class="gongji-th">구분</th>
				<th class="gongji-th">갯수</th>
			</tr>
			<tr>
				<td class="gongji-td">게시글</td>
				<td class="gongji-td-right">0개</td>
			</tr>
		</table>
	</div>
	</div>
</div>
</body>
</html>