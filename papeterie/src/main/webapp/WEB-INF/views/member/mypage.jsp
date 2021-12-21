<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - mypage</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/member.css">
</head>
<body>
	<div id="section">
 		<%@include file="sidemenu.jsp" %>
 		
		<div id="content">
			<div style="margin-left: 20px; margin-top: 20px;">전체주문내역</div>
			<div style="margin: 10px; text-align: right;"><input type="button" value="리뷰" onclick="open_pop('p0163')"></div>
			<script>
			function open_pop(pcode){
			    var frmPop= document.frmPopup;
			    var url = '../review/write';
			    window.open('','write','width=450, height=550, toolbar=no, menubar=no, resizable=no');  
			     
			    frmPop.action = url;
			    frmPop.target = 'write'; //window,open()의 두번째 인수와 같아야 하며 필수다.  
			    frmPop.pcode.value = pcode;
			    frmPop.submit();   
			}
			</script>

			<form name="frmPopup">
			<input type="hidden" name="pcode">
			</form>
			
			<table id="mypage_table">
				<tr>
					<th width="150">1</th>
					<th width="150">2</th>
					<th width="150">3</th>
					<th width="150">4</th>
				</tr>
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
				</tr>
				<tr>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
				</tr>
			</table>
		</div>	<!-- id="content" -->

	</div>	<!-- id="section" -->
</body>
</html>