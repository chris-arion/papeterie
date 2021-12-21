<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	
<!-- 본문 내용 -->
<div id="content">
<div id="content-head">
	<span id="content-head-text">Admin Dashboard</span>
</div>
	<div id="content-user">
		<div id="content-userbox">
			<div id="content-userhead">회원 <span id="content-userhead2">(명)</span></div>
			<img src="/resources/img/user.png" width="50">
			<div><span id="content-userchk">${userlist}</span></div>
		</div>
		<div id="content-userbox">
			<div id="content-userhead">오늘 가입한 회원 <span id="content-userhead2">(명)</span></div>
			<img src="/resources/img/user.png" width="50">
			<div><span id="content-userchk">0</span></div>
		</div>
		<div id="content-userbox">
			<div id="content-userhead"> 회원 전체 포인트 <span id="content-userhead2">(P)</span></div>
			<img src="/resources/img/user.png" width="50">
			<div><span id="content-userchk">${userpoint}</span></div>
		</div>
		<div id="content-i">
			<img src="/resources/img/i.png" width="80">
		<div id="content-i-text">
			<div>관리자 페이지</div>
			<div><a href="#">기능 도움말</a></div>
		</div>
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
				<td class="gongji-td-right">${gongjilist}개</td>
			</tr>
		</table>
	</div>
	<div class="box">
		<table class="table" id="gongji-table">
			<tr>
				<th>최근 공지사항</th>
			</tr>
			<c:forEach items="${gongji_list}" var="gvo">
				<tr>
					<td>${gvo.title}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="box">
		<table class="table gongji">
			<tr>
				<th colspan="2" height="30">Q&A</th>
			</tr>
			<tr>
				<th height="40" width="100" class="gongji-th">구분</th>
				<th class="gongji-th">갯수</th>
			</tr>
			<tr>
				<td class="gongji-td">게시글</td>
				<td class="gongji-td-right">${qnalist}개</td>
			</tr>
			<tr>
				<td class="gongji-td">답글</td>
				<td class="gongji-td-right">${qnalist2}개</td>
			</tr>
		</table>
	</div>
	<div class="box">
		<table class="table" id="gongji-table">
			<tr>
				<th>최근 Q&A</th>
			</tr>
			<c:forEach items="${qna_list}" var="qvo">
				<tr>
					<td width="100">${qvo.name}</td>
					<td>${qvo.title}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</div>
</div>
</body>
</html>