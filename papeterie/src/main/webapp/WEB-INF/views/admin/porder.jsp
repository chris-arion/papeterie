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
<div id="content-head">
	<span id="content-head-text">Porder Management</span>
</div>
<div id="table_margin">
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>번호</th>
				<th>주문번호</th>
				<th>주문자</th>
				<th>가격</th>
				<th>배송비</th>
				<th>배송지</th>
				<th>결제방법</th>
				<th>전화번호</th>
				<th>상태</th>
				<th>주문일</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="ovo">
            <tr>
                <td>${ovo.idx}</td>
				<td>${ovo.order_code}</td>
				<td>${ovo.userid}</td>
				<td>${ovo.price} 원</td>
				<td>${ovo.ship_price} 원</td>
				<td>${ovo.addr1}</td>
				<td>
					<c:if test="${ovo.pay_type == 0}">
						계좌이체
					</c:if>
					<c:if test="${ovo.pay_type == 1}">
						신용카드
					</c:if>
					<c:if test="${ovo.pay_type == 2}">
						간편결제
					</c:if>
				
				</td>
				<td>${ovo.phone}</td>
				<td>
					<c:if test="${ovo.state == 0}">
						<a href="state_ok?id=${ovo.idx}" style="color:#ff0000;">주문 완료</a>
					</c:if>
					<c:if test="${ovo.state == 1}">
						<a href="state_ok?id=${ovo.idx}" style="color:#ff8c00;">결제 완료</a>
					</c:if>
					<c:if test="${ovo.state == 2}">
						<a href="state_ok?id=${ovo.idx}" style="color:#ffd700;">입금 대기</a>
					</c:if>
					<c:if test="${ovo.state == 3}">
						<a href="state_ok?id=${ovo.idx}" style="color:#008000;">입금 확인</a>
					</c:if>
					<c:if test="${ovo.state == 4}">
						<a href="state_ok?id=${ovo.idx}" style="color:#0000ff;">상품 준비중</a>
					</c:if>
					<c:if test="${ovo.state == 5}">
						<a href="state_ok?id=${ovo.idx}" style="color:#4b0082;">배송중</a>
					</c:if>
					<c:if test="${ovo.state == 6}">
						<span style="color:#800080;">배송 완료</span>
					</c:if>
				</td>
				<td>${ovo.regdate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</div>
</body>
</html>