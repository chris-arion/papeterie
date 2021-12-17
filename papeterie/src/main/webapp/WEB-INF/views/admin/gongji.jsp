<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<body>
<!-- 본문 내용 -->
<div id="content">
<div id="table_margin">
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>번호</th>
				<th>이름</th>
				<th>제목</th>
				<th>내용</th>
				<th>조회수</th>
				<th>작성일</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="gvo">
            <tr>
                <td>${gvo.id}</td>
                <td>${gvo.name}</td>
				<td>${gvo.title}</td>
				<td><a href="../gongji/content?id=${gvo.id}">Click</a></td>
				<td>${gvo.readnum}</td>
				<td>${gvo.writeday}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
</body>
</html>