<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/admin.css">
<script src="/resources/js/admin.js"></script>
<script>
$(document).ready(function() {
    $('#example').DataTable( {
    	"lengthMenu": [[10, 25, 50, 100, 500, -1], [10, 25, 50, 100, 500, "전부"]],
        "language": {
            "decimal" : "",
            "emptyTable" : "데이터가 없습니다.",
            "info" : "_START_ - _END_ (총 _TOTAL_ 명)",
            "infoEmpty" : "0명",
            "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
            "infoPostFix" : "",
            "thousands" : ",",
            "lengthMenu" : "_MENU_ 개씩 보기",
            "loadingRecords" : "로딩중...",
            "processing" : "처리중...",
            "search" : "검색 : ",
            "zeroRecords" : "검색된 데이터가 없습니다.",
            "paginate" : 
            {
                "first" : "첫 페이지",
                "last" : "마지막 페이지",
                "next" : "다음",
                "previous" : "이전"
            },
            "aria" : 
            {
                "sortAscending" : " :  오름차순 정렬",
                "sortDescending" : " :  내림차순 정렬"
            }
        }
    } );
} );
</script>
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
    		<li><a href="manager">▶ 전체페이지</a></li>
    		<li><a href="#">▶ 주문관리</a></li>
    		<li><a href="#">▶ 배송관리</a></li>
    		<li><a href="#">▶ 상품관리</a></li>
    		<li><a href="user">▶ 회원관리</a></li>
    		<li><a href="#">▶ 공지관리</a></li>
    		<li><a href="#">▶ Qna관리</a></li>
    	</ul>
    	<div id="logout"><a>▶ Log Out</a> </div>
	</div>
<div id="content">
	<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
                <th>이름</th>
				<th>닉네임</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>가입일</th>
				<th>상태</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="fdto">
            <tr>
                <td>${fdto.name}</td>
				<td>${fdto.nickname}</td>
				<td>${fdto.userid}</td>
				<td>${fdto.email}</td>
				<td>${fdto.tel}</td>
				<td>${fdto.regdate}</td>
				<td></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
</body>
</html>