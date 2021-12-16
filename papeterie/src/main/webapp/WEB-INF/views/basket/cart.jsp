<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - 장바구니</title>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/purchase.css">
<link rel="stylesheet" href="/resources/css/cart.css">
</head>
<body>

	<div id="section">

		<span id="page_title">장바구니</span> <span id="page_sub"><strong>01장바구니 ></strong> 02주문서작성/결제 > 03주문완료</span>
		<hr>
		<div id="goods_table">
			<span><strong>장바구니 목록</strong></span>
			<table>
				<tr>
					<th><input type="checkbox" id="allCheck" checked="checked"></th>
					<th id="goods_id">상품/옵션 정보</th>
					<th id="goods_default">수량</th>
					<th id="goods_default">상품금액</th>
					<th id="goods_discount">할인/적립</th>
					<th id="goods_default">합계 금액</th>
					<th id="goods_default">배송비</th>
				</tr>
				<tr>
					<td><input type="checkbox" name="hobby" id="h2" checked="checked"></td>
					<td class="goods_id_td"><img id="goods_img" src=""> 상품 명</td>
					<td>1개</td>
					<td>4,000원</td>
					<td class="goods_td">10%포인트 적립</td>
					<td class="goods_td">4,000원</td>
					<td class="goods_td">3,000원</td>
				</tr>
<!-- 				
				<tr>
					<td colspan="6" id="go_basket">
						<a href=""><span>장바구니 가기></span></a>
					</td>
				</tr>
 -->
			</table>
		</div>
		<div id="goods_total_price">
			<div id="price_main">
				총 몇개의 상품금액<br> <strong>4,000원</strong>
			</div>
			<div class="price_img">
				<img src="/resources/img/purchase_plus.png">
			</div>
			<div id="price_ship">
				배송비<br> <strong>3,000원</strong>
			</div>
			<div class="price_img">
				<img src="/resources/img/purchase_right_arrow.png">
			</div>
			<div id="price_total">
				합계<br> <strong>ex)10,000원</strong>
			</div>
		</div>

		<div class="btn_order_box">
			<span class="btn_left_box">
				<button type="button" class="btn_order_choice_del" onclick="gd_cart_process('cartDelete');">선택 상품 삭제</button>
				<button type="button" class="btn_order_choice_wish" onclick="gd_cart_process('cartToWish');">선택 상품 찜</button>
			</span> <span class="btn_right_box">
				<button type="button" class="btn_order_choice_buy" onclick="gd_cart_process('orderSelect');">선택 상품 주문</button>
				<button type="button" class="btn_order_whole_buy" onclick="gd_order_all();">전체 상품 주문</button>
			</span>
		</div>
	</div>
</body>
</html>