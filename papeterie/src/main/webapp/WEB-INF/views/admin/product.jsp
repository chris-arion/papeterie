<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="menu.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap.min.css">
<style>
#content{
height:1300px;
}

#product-btn-add{
	position:absolute;
	width: 100px;
	height: 35px;
	border: 1px solid silver;
	cursor: pointer;
	font-size: 12px;
	background: white;
	color: black;
	margin-bottom: 10px;
	font-weight:bold;
	left:1180px;
	top:195px;
}
</style>
</head>
<body>
<!-- 본문 내용 -->
<div id="content">
<div id="content-head">
	<span id="content-head-text">Product Management</span>
</div>
<div id="table_margin">
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th width="30">번호</th>
				<th width="70" >상품이미지</th>
				<th>상품제목</th>
				<th width="60">상품가격</th>
				<th width="60">상품분류</th>
				<th width="60">상품번호</th>
				<th width="60">상세정보</th>
				<th>상품등록일</th>
				<th width="60">상품삭제</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="gsvo" varStatus="status">
            <tr>
                <td>${fn:length(list) - status.index}</td>
				<td align="center"><img src="${gsvo.img}" width="50"></td>
				<td>${gsvo.title}</td>
				<td>${gsvo.price} 원</td>
				<td>${gsvo.category}</td>
				<td>${gsvo.pcode}</td>
				<td><a href="../goods/goods_view?pcode=${gsvo.pcode}">Click</a></td>
				<td>${gsvo.regdate}</td>
				<td><a href="product_delete?id=${gsvo.idx}" style="color:tomato;">삭제</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div><input type="button" value="상품 추가" id="product-btn-add" onclick="location='../admin/product_add'"></div>
</div>
</body>
</html>