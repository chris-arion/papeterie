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
<script>
function qna_delete(my)
{
	if(!confirm("정말로 삭제하시겠습니까?"))
	{
		
	}
	else
	{
		location="../qna/delete?id="+my;
	}
}
</script>
</head>
<body>
<!-- 본문 내용 -->
<div id="content">
<div id="content-head">
	<span id="content-head-text">Q&A Management</span>
</div>
<div id="table_margin">
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>제목</th>
				<th>내용</th>
				<th>조회수</th>
				<th>분류</th>
				<th>작성일</th>
				<th>답변하기</th>
				<th>수정/삭제</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="qvo" varStatus="status">
        <c:if test="${qvo.bimil == 1}">
            <tr>
                <td>${fn:length(list) - status.index}</td>
				<td>${qvo.userid}</td>
				<td>${qvo.name}</td>
				<td>${qvo.title}</td>
				<td><a href="../qna/content?id=${qvo.id}">Click</a></td>
				<td>${qvo.readnum}</td>
				<td>
					<c:if test="${qvo.category == 1}">
						제품문의
					</c:if>
					<c:if test="${qvo.category == 2}">
						배송문의
					</c:if>
					<c:if test="${qvo.category == 3}">
						이벤트문의
					</c:if>
					<c:if test="${qvo.category == 4}">
						교환/반품/환불
					</c:if>
					<c:if test="${qvo.category == 5}">
						기타문의
					</c:if>
				</td>
				<td>${qvo.writeday}</td>
				<td>
					<c:if test="${qvo.dapbun == 0}">
						<a href="../qna/rewrite?id=${qvo.id}&grp=${qvo.grp}&seq=${qvo.seq}&dep=${qvo.dep}&pwd=${qvo.pwd}">답변작성</a>
					</c:if>
					<c:if test="${qvo.dapbun == 1}">
						답변완료
					</c:if>
				</td>
				<td><a href="../qna/update?id=${qvo.id}" style="color:DodgerBlue;">수정</a> / <a href="#" onclick="qna_delete(${qvo.id})" style="color:tomato;">삭제</a></td>
            </tr>
        </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
</body>
</html>