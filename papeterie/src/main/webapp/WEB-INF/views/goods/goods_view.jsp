<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>

<link rel="stylesheet" href="/resources/css/goods_view.css">
<script src="/resources/js/goods_view.js"></script>

</head>
<body>
	<div id="section">
		<div id="goods_img">
			<img src="${gvo.img}">
		</div>
		<div id="goods_side">
		<h3>${gvo.title}</h3>
		<form method="post" action="login_check" name="goods_form">
		<input type="hidden" name="pcode" value="${gvo.pcode}">
		<input type="hidden" name="su" value="1">
			<table id="goods_detail_table">
				<tr>
					<td class="td_head">판매 가격</td>
					<td class="td_content"> <strong id="goods_price"><fmt:formatNumber value="${gvo.price}"/>원</strong> </td>
				</tr>
				<tr>
					<td class="td_head">배송 정보</td>
					<td class="td_content">
					2,500원 (3만원 이상 구매시 무료)<br>
					오후 2시 당일배송마감
					</td>
				</tr>
				<tr>
					<td colspan="2" id="goods_option_list">
						<div class="goods_option">
							<div class="option_name">${gvo.title}</div>
							<input type="button" class="left_button" onclick="count_goods(this)" value="-">
							<div class="center_count">1</div>
							<input type="button" class="right_button" onclick="count_goods(this)" value="+">
							<div class="option_price"><fmt:formatNumber value="${gvo.price}"/>원</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" id="blank"></td>
				</tr>
				<tr>
					<td colspan="2" id="total_price_td">
					<span id="total_price_word" class="td_head">총 합계 금액</span> <strong id="total_price"><fmt:formatNumber value="${gvo.price}"/>원</strong>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" class="goods_buy_button" value="바 로 구 매"><br>
						<a href="" class="goods_sub_button">찜 하 기</a>
						<a href="javascript:;" class="goods_sub_button" onclick="add_cart_fn('${gvo.pcode}')">장 바 구 니</a>
					</td>
				</tr>
			</table>
			</form>
		</div>
		<div id="goods_data">
			<div id="goods_detail">
				<div class="goods_data_menu">
					<div class="goods_data_menu_sub sub_here" onclick="Goods_Menu_Move(0)">상세정보</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(1)">배송안내</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(2)">교환/반품</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(3)">리뷰(후기)</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(4)">문의사항</div>
				</div>
				${gvo.content}
			</div>
			<div id="goods_shipping">
				<div class="goods_data_menu">
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(0)">상세정보</div>
					<div class="goods_data_menu_sub sub_here" onclick="Goods_Menu_Move(1)">배송안내</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(2)">교환/반품</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(3)">리뷰(후기)</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(4)">문의사항</div>
				</div>
				<img src="/resources/img/goods_shipping_notice.png">
			</div>
			<div id="goods_refund">
				<div class="goods_data_menu">
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(0)">상세정보</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(1)">배송안내</div>
					<div class="goods_data_menu_sub sub_here" onclick="Goods_Menu_Move(2)">교환/반품</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(3)">리뷰(후기)</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(4)">문의사항</div>
				</div>
				<img src="/resources/img/goods_refund_notice.png">
			</div>
			<div id="goods_review">
				<div class="goods_data_menu">
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(0)">상세정보</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(1)">배송안내</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(2)">교환/반품</div>
					<div class="goods_data_menu_sub sub_here" onclick="Goods_Menu_Move(3)">리뷰(후기)</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(4)">문의사항</div>
				</div>
				<div id="review_content">
				<span><strong>상 품 후 기</strong></span> <a href=""><span class="write_button">상품후기 글쓰기</span></a>
				<table>
					<tr>
						<td>평점</td>
						<td><a href="javascript:show_review()">리뷰내용</a></td>
						<td>작성자</td>
						<td>작성일</td>
					</tr>
					<tr class="review_detail_tr">
						<td colspan="4" class="review_detail">
						이곳은 리뷰 내용이 등록될 곳입니다
						</td>
					</tr>
					<tr>
						<td>평점</td>
						<td><a href="javascript:show_review()">리뷰내용</a></td>
						<td>작성자</td>
						<td>작성일</td>
					</tr>
				</table>
				</div>
			</div>
			<div id="goods_inquiry">
				<div class="goods_data_menu">
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(0)">상세정보</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(1)">배송안내</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(2)">교환/반품</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(3)">리뷰(후기)</div>
					<div class="goods_data_menu_sub sub_here" onclick="Goods_Menu_Move(4)">문의사항</div>
				</div>
				<div id="inquiry_content">
				<span><strong>상 품 문 의</strong></span> <a href="../qna/write"><span class="write_button">상품문의 글쓰기</span></a>
				<table>
					<tr>
						
					</tr>
				</table>
				</div>
			</div>
		</div>
</body>
</html>