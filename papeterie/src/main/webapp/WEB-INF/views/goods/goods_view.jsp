<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<img src="">
		</div>
		
		<div id="goods_side">
		<h3>상품명 입력</h3>
		<form>
			<table id="goods_detail_table">
				<tr>
					<td class="td_head">판매 가격</td>
					<td class="td_content"> <strong>ex)3,000원</strong> </td>
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
					<td colspan="2" id="goods_option_list">
						<div class="goods_option">
							<div class="option_name">선택한 옵션1</div>
							<div id="left_button">+</div>
							<div id="center_count">수량</div>
							<div id="right_button">-</div>
							<div class="option_price">옵션1 가격</div>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					총 금액 <strong id="total_price">5,000 원</strong>
					</td>
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
		
		<div id="goods_data">
			<div id="goods_detail">
				<div class="goods_data_menu">
					<div class="goods_data_menu_sub sub_here" onclick="Goods_Menu_Move(0)">상세정보</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(1)">배송안내</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(2)">교환/반품</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(3)">리뷰(후기)</div>
					<div class="goods_data_menu_sub" onclick="Goods_Menu_Move(4)">문의사항</div>
				</div>
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
						<td>리뷰내용</td>
						<td>작성자</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td>평점</td>
						<td>리뷰내용</td>
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
				<span><strong>상 품 문 의</strong></span> <a href=""><span class="write_button">상품문의 글쓰기</span></a>
				<table>
					<tr>
						<td>문의번호</td>
						<td>문의내용</td>
						<td>작성자</td>
						<td>작성일</td>
					</tr>
					<tr>
						<td>문의번호</td>
						<td>문의내용</td>
						<td>작성자</td>
						<td>작성일</td>
					</tr>
				</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>