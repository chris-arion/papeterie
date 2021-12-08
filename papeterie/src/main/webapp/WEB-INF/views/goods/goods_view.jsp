<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/goods_view.css">
</head>
<body>
	<div id="section">
		<div id="goods_img">
			<img src="">
		</div>
		
		<div id="goods_side">
		<h3>상품명 입력</h3>
		<form>
			<table id="goods_detail_table">
				<tr>
					<td class="td_head">판매 가격</td>
					<td class="td_content"> <strog>ex)3,000원</strog> </td>
				</tr>
				<tr>
					<td class="td_head">배송 정보</td>
					<td class="td_content">
					2,500원 (3만원 이상 구매시 무료)<br>
					오후 2시 당일배송마감
					</td>
				</tr>
				<tr>
					<td class="td_head">옵션 선택</td>
					<td class="td_content">
						<select id="select_box" onchange="select_option()">
							<option>==선택==</option>
							<option> 옵션1 </option>
							<option> 옵션2 </option>							
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="" class="goods_buy_button">바 로 구 매</a>
						<a href="" class="goods_sub_button">찜 하 기</a>
						<a href="" class="goods_sub_button">장 바 구 니</a>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="goods_detail">
		</div>
	</div>
</body>
</html>