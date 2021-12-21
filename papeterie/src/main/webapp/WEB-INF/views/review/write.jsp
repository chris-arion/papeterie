<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 리뷰</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/review.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

<form name="frm" id="frm" action="write_ok" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pcode" value="${gvo.pcode}">
	<table id="review_write">
		<tr>
			<td><img id="goods_img" src="${gvo.img}"> ${gvo.title}</td>
		</tr>
		<tr>
			<td>상품은 만족하셨나요?</td>
		</tr>
		<tr>
			<td>
			    <fieldset>
			        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">★</label>
			        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">★</label>
			        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">★</label>
			        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">★</label>
			        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">★</label>
			    </fieldset>
				<div class="_3Q4AGAjnPM">선택하세요.</div>
			</td>
		</tr>
		<tr>
			<td>어떤 점이 좋았나요?</td>
		</tr>
		<tr>
			<td><textarea name="content" id="content" rows="10" cols="40"></textarea></td>
		</tr>
		<tr>
			<td>사진 첨부하기</td>
		</tr>
		<tr>
			<td><input type="file" name="filename"></td>
		</tr>
		<tr>
			<td>
			<input type="button" value="등록" onclick="">
			<input type="button" value="취소" onclick="">
			</td>
		</tr>
	</table>
</form>
</body>
</html>