<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 결제</title>
<link rel="stylesheet" href="/resources/css/purchase.css">
<script src="/resources/js/purchase.js"></script>

</head>
<body>
	<div id="section">
	<form method="post" action="purchase_ok" name="orderform" onsubmit="return final_check()">
		<input type="hidden" name="idxlist" value="${idxlist}">
		<span id="page_title">주문서 작성/결제</span> <span id="page_sub">01장바구니 > <strong>02주문서작성/결제 ></strong> 03주문완료</span>
		<hr>
		<div id="goods_table">
		<span><strong>주문 상세 내역</strong></span>
			<table>
				<tr>
					<th id="goods_id">상품/옵션 정보</th>
					<th id="goods_default">수량</th>
					<th id="goods_default">상품금액</th>
					<th id="goods_discount">할인/적립</th>
					<th id="goods_default">합계 금액</th>
				</tr>
				<c:set var="total_count" value="0"/>
				<c:if test="${pvo == null}"> <!-- 장바구니 경우 -->
				<c:set var="total_price" value="0"/>
				<c:forEach items="${list}" var="pvo">
					<tr>
					<input type="hidden" name="pcode" value="${pvo.pcode}">
					<input type="hidden" name="count" value="${pvo.count}">
						<td class="goods_id_td">
							<img id="goods_img" src="${pvo.img}">
							${pvo.title}
						</td>
						<td>${pvo.count}개</td>
						<td><fmt:formatNumber value="${pvo.price}"/>원</td>
						<td class="goods_td">10%포인트 적립</td>
						<td class="goods_td"><fmt:formatNumber value="${pvo.price*pvo.count}"/>원</td>
					</tr>
					<c:set var="total_price" value="${total_price+(pvo.price*pvo.count)}"/>
					<c:set var="total_count" value="${total_count+1}"/>
				</c:forEach>
				</c:if> <!-- 바로 구매 경우 -->
				<c:if test="${pvo != null}">
				<tr>
				<input type="hidden" name="pcode" value="${pvo.pcode}">
				<input type="hidden" name="count" value="${pvo.count}">
					<td class="goods_id_td">
						<img id="goods_img" src="${pvo.img}">
						${pvo.title}
					</td>
					<td>${pvo.count}개</td>
					<td><fmt:formatNumber value="${pvo.price}"/>원</td>
					<td class="goods_td">10%포인트 적립</td>
					<c:set var="total_price" value="${pvo.price*pvo.count}"/>
					<td class="goods_td"><fmt:formatNumber value="${total_price}"/>원</td>
				</tr>
				<c:set var="total_count" value="${total_count+1}"/>
				</c:if>
				<tr>
					<td colspan="5" id="go_basket">
						<a href="../basket/cart"><span>장바구니 가기></span></a>
					</td>
				</tr>
			</table>
		</div>
		<div id="goods_total_price">
			<div id="price_main">
				총 ${total_count} 개의 상품금액<br>
				<strong><fmt:formatNumber value="${total_price}"/>원</strong>
			</div>
			<div class="price_img"><img src="/resources/img/purchase_plus.png"></div>
			<div id="price_ship">
				배송비<br>
				<c:if test="${total_price >= 30000}">
				<c:set var="bprice" value="0"/>
				<strong>0원</strong>
				</c:if>
				<c:if test="${total_price < 30000}">
				<c:set var="bprice" value="2500"/>
				<strong>2,500원</strong>
				</c:if>
			</div>
			<div class="price_img"><img src="/resources/img/purchase_right_arrow.png"></div>
			<div id="price_total">
				합계<br>
				<strong><fmt:formatNumber value="${total_price+bprice}"/>원</strong>
			</div>
		</div>
		<div id="purchase_agree">
			<div id="agree_check_all">
				<input type="checkbox" id="agree_all" name="agree_all" onchange="checkAll()"><label for="agree_all">이용약관 및 비회원 주문에 대한 개인정보 수집 이용 동의를 확인하고 전체 동의합니다.</label>
			</div>
			<div class="agree">
				<span><strong>개인정보 수집 이용 동의</strong></span>
				<div class="agree_detail">
				<textarea readonly>
수집 목적 : 서비스 제공 및 계약의 이행, 구매 및 대금결제, 물품배송 또는 청구지 발송, 불만처리 등 민원처리, 
회원관리 등을 위한 목적

수집 항목
- 주문자정보 : 이름, 전화번호, 휴대전화번호, 전자우편주소
- 배송정보 : 수령인, 배송지 주소, 휴대전화번호, 전화번호
- 보유 및 이용 기간 : 배송완료 후 파기(단, 법령에 의하여 보존해야하는 경우 예외)
				</textarea>
				</div>
				<div class="agree_check">
					<input type="checkbox" id="agree1" name="agreecheck" onchange="check_back(this)"><label for="agree1"><strong>(필수)</strong> 비회원 개인정보 수집 이용에 대한 내용을 확인 하였으며 이에 동의 합니다.
					&nbsp<span class="submit_alert">필수사항을 체크해주세요.</span></label>
				</div>
			</div>
			<div class="agree">
				<span><strong>이용약관 동의</strong></span>
				<div class="agree_detail">
				<textarea readonly>
제1조(목적)
이 약관은 주식회사 우아한형제들(이하 “회사”라 한다)이 운영하는 배민문방구 사이버 몰(이하 "몰"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버몰과 “이용자”의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.

제2조(정의)
① "몰"이란 “회사”가 재화 또는 용역을 “이용자”에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
② "이용자”란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 “회원” 및 “비회원”을 말합니다.
③ “회원”이라 함은 "몰"에 개인정보를 제공하여 “회원”등록을 한 자로서, "몰"의 정보를 지속적으로 제공받으며, "몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
④ “비회원”이라 함은 회원가입 하지 않고 "몰"이 제공하는 서비스를 이용하는 자를 말합니다.

제3조(약관 등의 게시와 개정)
① "몰"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보 보호책임자 등을 “이용자”가 쉽게 알 수 있도록 "몰"의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 “이용자”가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
② "몰"은 “이용자”가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 “이용자”가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 “이용자”의 확인을 구하여야 합니다.
③ "몰"은 전자상거래 등에서의 소비자 보호에 관한 법률, 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용 촉진 등에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법 등 관련법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
④ "몰"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, “이용자”에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 “이용자”가 알기 쉽도록 표시합니다.
⑤ "몰"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 “이용자”가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 "몰"에 송신하여 "몰"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.

제4조(“서비스”의 제공 및 변경)
① "몰"은 다음과 같은 업무를 수행합니다.
1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
2. 구매계약이 체결된 재화 또는 용역의 배송
3. 기타 "몰"이 정하는 업무
② "몰"은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
③ "몰"이 제공하기로 “이용자”와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 “이용자”에게 통지 가능한 주소로 즉시 통지합니다.
④ 전항의 경우 "몰"은 이로 인하여 “이용자”가 입은 손해를 배상합니다. 다만, "몰"이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제5조(“서비스”의 중단)
① "몰"은 컴퓨터 등 정보통신설비의 보수점검·교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 “서비스”의 제공을 일시적으로 중단할 수 있습니다. 이 경우 “몰”은 제8조에 정한 방법으로 “회원”에게 통지합니다. 다만, “몰”이 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
② "몰"은 제1항의 사유로 “서비스”의 제공이 일시적으로 중단됨으로 인하여 “이용자” 또는 제3자가 입은 손해에 대하여 책임을 지지 아니합니다.
③ 사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 “서비스”를 제공할 수 없게 되는 경우에는 "몰"은 제8조에 정한 방법으로 “이용자”에게 통지합니다.

제6조(회원가입)
① “이용자”는 "몰"이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
② "몰"은 제1항과 같이 회원으로 가입할 것을 신청한 “이용자”(이하 “가입신청자”라 한다) 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.
1. “가입신청자”가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 "몰"의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
3. 기타 회원으로 등록하는 것이 현저히 지장이 있다고 “몰”이 판단하는 경우
③ 본 조 제1항에 따른 신청에 있어 “회사”는 “가입신청자”에게 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
④ 회원가입계약의 성립시기는 "몰"의 승낙이 회원에게 도달한 시점으로 합니다.
⑤ “회원”은 제15조 제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 "몰"에 대하여 그 변경사항을 알려야 합니다.

제7조(회원탈퇴 및 자격 상실 등)
① “회원”은 "몰"에 언제든지 탈퇴를 요청할 수 있으며 "몰"은 즉시 회원탈퇴를 처리합니다.
② “회원”이 다음 각호의 사유에 해당하는 경우, "몰"은 회원자격을 제한 및 정지시킬 수 있습니다.
1. 가입 신청시에 허위 내용을 등록한 경우
2. "몰"을 이용하여 구입한 재화 등의 대금, 기타 "몰"이용에 관련하여 “회원”이 부담하는 채무를 기일에 지급하지 않는 경우
3. 다른 사람의 "몰" 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
4. "몰"을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
5. “서비스”와 관련하여 “몰”의 임직원, 상담센터 직원 등을 포함한 제3자에 대하여 폭력, 폭언, 욕설, 성희롱, 성추행, 성폭력 등을 가하는 행위(단, 정당방위 등 “회원”의 정당한 사유가 인정되는 경우는 제외합니다.)
③ "몰"이 회원자격을 제한·정지시킨 후, “회원”이 전항의 각 호에 해당하는 행위를 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우, "몰"은 회원자격을 상실시킬 수 있습니다.
④ "몰"이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 “회원”에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

제8조(“회원”에 대한 통지)
① “몰”이 “회원”에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 “회원”이 제공한 전자우편주소, (휴대)전화번호, 주소, “서비스” 로그인 시 동의창 등의 수단으로 통지할 수 있습니다. 다만, “회원” 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
② “몰”은 “회원” 전체에 대한 통지의 경우 7 일 이상 “회사”의 공지사항에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.
③ “회원”은 “몰”에 실제로 연락이 가능한 전자우편, (휴대)전화번호, 주소 등의 정보를 제공하고 해당 정보들을 최신으로 유지하여야 하며 “몰”의 통지를 확인하여야 합니다.
④ 회원정보가 변경되었음에도 “회원”이 해당 사항을 수정하지 않거나 오기재로 인하여 발생하는 모든 손해는 “회원”이 부담하여야 하며, “몰”은 이에 대하여 책임을 지지 않습니다.

제9조(구매신청)
“이용자”는 "몰"에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, "몰"은 “이용자”가 구매신청을 함에 있어서 각 내용을 알기 쉽게 제공하여야 합니다. 단, “회원”인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.
1. 재화 등의 검색 및 선택
2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
3. 약관내용, 청약철회권이 제한되는 서비스, 배송료·설치비 등의 비용부담과 관련한 내용에 대한 확인
4. 이 약관에 동의하고 위 3호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
5. 재화 등의 구매신청 및 이에 관한 확인 또는 "몰"의 확인에 대한 동의
6. 결제방법의 선택

제10조(계약의 성립)
① "몰"은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
3. 기타 구매신청에 승낙하는 것이 "몰" 기술상 현저히 지장이 있다고 판단하는 경우
② "몰"의 승낙이 제12조 제1항의 수신확인통지형태로 “이용자”에게 도달한 시점에 계약이 성립한 것으로 봅니다.
③ "몰"의 승낙의 의사표시에는 “이용자”의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소등에 관한 정보 등을 포함하여야 합니다.

제11조(지급방법)
"몰"에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법 중 가용한 방법으로 할 수 있습니다. 단, "몰"은 “이용자”의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
1. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제
2. 휴대폰 결제
3. 마일리지 등 "몰"이 지급한 포인트에 의한 결제
4. "몰"과 계약을 맺었거나 "몰"이 인정한 상품권에 의한 결제
5. 기타 전자적 지급 방법에 의한 대금 지급 등

제12조(수신확인통지·구매신청 변경 및 취소)
① "몰"은 “이용자”의 구매신청이 있는 경우 “이용자”에게 수신확인통지를 합니다.
② 수신확인통지를 받은 “이용자”는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 "몰"은 배송전에 “이용자”의 요청이 있는 경우에는 지체없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.

제13조(재화 등의 공급)
① "몰"은 “이용자”와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, “이용자”가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, "몰"이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다. 이때 "몰"은 “이용자”가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
② "몰"은 “이용자”가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 "몰"이 약정 배송기간을 초과한 경우에는 그로 인한 “이용자”의 손해를 배상하여야 합니다. 다만 "몰"이 고의·과실이 없음을 입증한 경우에는 그러하지 아니합니다.

제14조(환급)
① "몰"은 “이용자”가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체없이 그 사유를 “이용자”에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
② “회원”의 구매활동, 이벤트 참여 등에 따라 “몰”이 무료로 적립, 부여하는 마일리지, 적립금, 쿠폰(이하 “무료 포인트, 쿠폰”이라 한다)은 현금 환급이 불가하며, “회원” 탈퇴 시 미 사용한 “무료 포인트, 쿠폰”은 소멸됩니다. “몰”은 소멸되는 “무료 포인트, 쿠폰”에 대해서 별도의 보상을 하지 않습니다.

제15조(청약철회 등)
① "몰"과 재화 등의 구매에 관한 계약을 체결한 “이용자”는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다.
② “이용자”는 재화 등을 배송 받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
1. “이용자”에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
2. “이용자”의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우
4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
5. “이용자”의 주문에 따라 개별 생산되는 상품의 경우(다만, 이 경우 “몰”은 “이용자”에게 사전 고지하고 서면(전자문서 포함) 동의를 받기로 합니다)
③ 제2항 제2호 내지 제4호의 경우에 "몰"이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 “이용자”의 청약철회 등이 제한되지 않습니다.
④ “이용자”는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.

제16조(청약철회 등의 효과)
① "몰"은 “이용자”로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 "몰"이 “이용자”에게 재화 등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
② "몰"은 위 대금을 환급함에 있어서 “이용자”가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 “이용자”가 부담합니다. "몰"은 “이용자”에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 "몰"이 부담합니다.
④ “이용자”가 재화 등을 제공받을때 발송비를 부담한 경우에 "몰"은 청약철회시 그 비용을 누가 부담하는지를 “이용자”가 알기 쉽도록 명확하게 표시합니다.

제17조(개인정보의 보호 및 사용)
① "몰"은 “이용자”의 개인정보 수집 시 필요한 최소한의 정보를 수집하기로 하며, 개인정보의 보호 및 사용에 대해서는 관계 법령 및 “회사”의 개인정보처리방침이 적용됩니다.
② "몰"이 “이용자”의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 “이용자”의 동의를 받습니다.
③ 제공된 개인정보는 당해 “이용자”의 동의없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 몰이 집니다. 다만, 다음의 경우에는 예외로 합니다.
1. 배송업무상 배송업체에게 배송에 필요한 최소한의 “이용자”의 정보(성명, 주소, 전화번호)를 알려주는 경우
2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
3. 재화 등의 거래에 따른 대금정산을 위하여 필요한 경우
4. 도용방지를 위하여 본인확인에 필요한 경우
5. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우
④ “몰”이 제3자에게 회원의 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2) 개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 회원에게 알리고 동의를 받아야 합니다.
⑤ “몰”이 제3자에게 구매자의 개인정보를 처리할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보 처리위탁을 받는 자, 2) 개인정보 처리위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. 다만, “서비스” 제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보처리방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.
⑥ “이용자”는 언제든지 "몰"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "몰"은 이에 대해 지체없이 필요한 조치를 취할 의무를 집니다. “이용자”가 오류의 정정을 요구한 경우에는 "몰"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
⑦ "몰" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다.

제18조(“몰“의 의무)
① "몰"은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는데 최선을 다하여야 합니다.
② "몰"은 “이용자”가 안전하게 인터넷 서비스를 이용할 수 있도록 “이용자”의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
③ "몰"이 상품이나 용역에 대한 표시, 광고에 있어 「표시·광고의 공정화에 관한 법률」 등 관련 법령을 준수합니다.
④ "몰"은 “이용자”가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.

제19조(“회원”의 ID 및 비밀번호에 대한 의무)
① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 “회원”에게 있습니다.
② “회원”은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
③ “회원”이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "몰"에 통보하고 "몰"의 안내가 있는 경우에는 그에 따라야 합니다.

제20조(“이용자”의 의무)
① “이용자”는 다음 행위를 하여서는 안됩니다.
1. 신청 또는 변경 시 허위 내용의 등록
2. 타인의 정보 도용
3. "몰"에 게시된 정보의 변경
4. "몰"이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5. "몰" 기타 제3자의 저작권 등 지식재산권에 대한 침해
6. "몰" 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위
② “이용자”는 다음 각 호의 방법으로 “몰”의 업무에 방해가 되는 행위를 하여서는 안됩니다.
1. “몰”이 제공하지 않는 방법으로 “서비스”에 접속하는 행위
2. 리버스엔지니어링, 디컴파일, 크롤링, 서비스 거부 공격, 웹 해킹 등을 포함한 제반 해킹공격
3. “몰”이 제공하는 제반 서비스 및 정보를 복제, 분해, 모방 또는 변경하는 행위
4. 자동 접속 프로그램 또는 해킹 프로그램 등을 통해 정상적인 방법과 다른 방법으로 서비스를 이용하여 “몰”의 서버에 부하를 일으키거나 서비스를 방해하는 행위
5. “몰”의 서비스 제공 목적과 부합하지 않는 목적으로 서비스를 이용하여 "몰"의 서버, DB 등 정보처리자원을 소모하게 하는 행위
6. "몰"의 사전 동의 없이 ID, 패스워드를 제3자에게 양도 또는 대여하거나 제3자로부터 양도 또는 대여받아 사용하는 행위
7. 저작권법, 형법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전산망 보급 확장과 이용촉진에 관한 법률, 전기통신사업법 등 통신망, 서버, 소프트웨어 등의 이용과 관련한 법령을 위반하는 행위

제21조(연결몰과 피연결몰 간의 관계)
① “몰”은 하이퍼링크(하이퍼 링크 대상에는 문자, 그림 및 동화상 등이 포함됨)등의 방식으로 제3자의 인터넷 사이트 등을 연결할 수 있습니다(이하 “피연결몰”이라 한다).
② ”몰”은 ”피연결몰”이 독자적으로 제공하는 재화 및 “이용자”와 “피연결몰”과의 거래에 대하여 어떠한 보증책임을 지지 않습니다.

제22조(지식재산권의 귀속 및 이용제한)
① “몰“에 업로드 된 저작물에 대한 저작권 기타 지식재산권은 ”몰“에 귀속합니다.
② “이용자”는 "몰"을 이용함으로써 얻은 정보 중 "몰"에게 지식재산권이 귀속된 정보를 "몰"의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 아니되며, 임의로 수정, 편집, 가공할 수 없습니다.
③ "몰"은 약정에 따라 “이용자”에게 귀속된 저작권을 사용하는 경우 당해 “이용자”에게 통보하여야 합니다.

제23조(분쟁해결)
① "몰"은 “이용자”가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치·운영합니다.
② "몰"은 “이용자”로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 “이용자”에게 그 사유와 처리일정을 즉시 통보해 드립니다.
③ "몰"과 “이용자”간에 발생한 전자상거래 분쟁과 관련하여 “이용자”의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.

제24조(재판권 및 준거법)
① "몰"과 “이용자”간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 “이용자”의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 “이용자”의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
② "몰"과 “이용자”간에 제기된 전자상거래 소송에는 한국법을 적용합니다.

부칙
1. 이 약관은 2020년 11월 12일부터 적용됩니다.
				</textarea>	
				</div>
				<div class="agree_check">
					<input type="checkbox" id="agree2" name="agreecheck" onchange="check_back(this)"><label for="agree2"><strong>(필수)</strong> 이용약관에 대한 내용을 확인 하였으며 이에 동의 합니다.
					&nbsp<span class="submit_alert">필수사항 체크하세요</span></label>
				</div>
			</div>
		</div>
		<div id="user_detail">
			<span><strong>주문자 정보</strong></span>
			<table>
				<tr>
					<td class="td_title">주문하시는 분</td>
					<td>
						<span id="buyer">${mvo.uname}</span>
					</td>
				</tr>
				<tr>
					<td class="td_title">연락처 번호</td>
					<td>
						<span id="buyer_phone">${mvo.phone}</span>
					</td>
				</tr>
				<tr>
					<td class="td_title">*이메일</td>
					<td>
						<span id="buyer_email">${mvo.email}</span>
					</td>
				</tr>
			</table>
		</div>
		<div id="user_address">
			<span><strong>배송 정보</strong></span>
			<table>
				<tr>
					<td class="td_title">배송지 확인</td>
					<td>
						<input type="radio" name="shipping_loc" id="shipping_loc" checked="checked" onclick="shipping_my(this)" value="0">직접입력&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="shipping_loc" onclick="shipping_my(this)" value="1">주문자정보와 동일
						<input type="hidden" name="bidx" id="bidx" value="${avo.idx}">
						<input type="hidden" id="imsi_addr_name" value="${avo.addr_name}">
						<input type="hidden" id="imsi_target" value="${avo.rname}">
						<input type="hidden" id="imsi_zipNo" value="${avo.zip}">
						<input type="hidden" id="imsi_roadAddrPart1" value="${avo.addr1}">
						<input type="hidden" id="imsi_addrDetail" value="${avo.addr2}">
						<input type="hidden" id="imsi_phone" value="${avo.phone}">
						<input type="hidden" id="imsi_option" value="${avo.soption}">
					</td>
				</tr>
				<tr>
					<td class="td_title">*배송지명</td>
					<td>
						<input type="text" name="addr_name" id="addr_name"><br>
						<span class="submit_alert">배송지명 입력하세요</span>
					</td>
				</tr>
				<tr>
					<td class="td_title">*받으실분</td>
					<td>
						<input type="text" name="rname" id="target"><br>
						<span class="submit_alert">받으실분 입력하세요</span>
					</td>
				</tr>
				<tr>
					<td class="td_title">*받으실 곳</td>
					<td>
						<input type="text" name="zip" id="zipNo" onclick="addOpen()" placeholder="우편번호"> 
						<button type="button" onclick="addOpen()" class="baesong_btn">주소 검색</button>
						<button type="button" onclick="my_address()" id="address_list" class="baesong_btn">나의 주소록</button>
						<br>
						<input type="text" name="addr1" id="roadAddrPart1" onclick="addOpen()" placeholder="도로명주소"><br>
						<input type="text" name="addr2" id="addrDetail" placeholder="상세주소"><br>
						<span class="submit_alert">받으실 곳 입력하세요</span>
					</td>
				</tr>
				<tr>
					<td class="td_title">*연락처 번호</td>
					<td><input type="text" name="phone" id="target_phone" onkeypress="justNum()"><br>
						<span class="submit_alert">휴대폰번호 입력하세요</span>
					</td>
				</tr>
				<tr>
					<td class="td_title">수령 방법</td>
					<td>
						<select name="soption" id="target_option">
							<option value="1">직접수령</option>
							<option value="2">배송 전 연락바랍니다</option>
							<option value="3">부재시 경비실에 맡겨주세요</option>
							<option value="4">부재시 문앞에 놓아주세요</option>
							<option value="5">부재시 택배함에 넣어주세요</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
		<div id="purchase_detail">
			<span><strong>결제 정보</strong></span>
			<table>
				<tr>
					<td class="td_title">상품 합계 금액</td>
					<td>
					<strong><fmt:formatNumber value="${total_price}"/>원</strong>
					</td>
				</tr>
				<tr>
					<td class="td_title">배송비</td>
					<td>
						<input type="hidden" name="ship_price" value="${bprice}">
						<strong><fmt:formatNumber value="${bprice}"/>원</strong>
					</td>
				</tr>
				<tr>
					<td class="td_title">할인 및 적립</td>
					<td>	
						<span>결제 금액의 10% 포인트 적립</span>
						<span>(현재 포인트: ${mvo.spoint})</span><br>
						<span class="my_point">
							<strong><fmt:formatNumber value="${total_price*0.1}"/></strong>point 적립
						</span>
					</td>
				</tr>
				<tr>
					<td class="td_title">최종 결제 금액</td>
					<td><strong><fmt:formatNumber value="${total_price+bprice}"/>원</strong></td>
				</tr>
				<tr>
					<td class="td_title">결제 수단</td>
					<td>
						<input type="radio" name="pay_type" value="0" onclick="sudan_chg(0)" checked="checked">계좌이체 &nbsp;
						<input type="radio" name="pay_type" value="1" onclick="sudan_chg(1)">신용카드 &nbsp;
						<input type="radio" name="pay_type" value="2" onclick="sudan_chg(2)">간편결제
						<input type="hidden" name="state" value="2">
						<div class="sudan" id="first_sudan">
						<br>은행선택 : <select name="bank" id="bank">
								<option value="0">선택</option>
								<option value="1">신한은행</option>
								<option value="2">우리은행</option>
								<option value="3">농협은행</option>
								<option value="4">하나은행</option>
							</select><br>
						<span class="submit_alert">은행 선택하세요</span>
						</div>
						<div class="sudan">
						<br>카드선택 : <select name="card" id="card">
								<option value="0">선택</option>
								<option value="1">신한카드</option>
								<option value="2">우리카드</option>
								<option value="3">농협카드</option>
								<option value="4">하나카드</option>
							</select><br><br>
						할부기간 : <select name="halbu" id="halbu">
								<option value="0">일시불</option>
								<option value="1">1개월</option>
								<option value="2">2개월</option>
								<option value="3">3개월</option>
								<option value="4">4개월</option>
							</select><br>
						<span class="submit_alert">카드사및 할부기간 선택하세요</span>
						</div>
						<div class="sudan">
						<br>통신사 : <select name="com" id="com">
								<option value="0">선택</option>
								<option value="1">SKT</option>
								<option value="2">KT</option>
								<option value="3">LG</option>
								<option value="4">알뜰통신</option>
							</select>
						<br><br>전화번호 : <input type="text" name="pphone" id="pphone"><br>
						<span class="submit_alert">통신사 및 전화번호 입력하세요</span>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div id="purchase_final_price">
			<strong><span>최종 결제 금액 &nbsp;&nbsp;&nbsp;</span> <span id="final_price" class="final_total_price">
			<fmt:formatNumber value="${total_price+bprice}"/>원
			</span></strong>
			<input type="hidden" name="price" id="price" value="${total_price}">
		</div>
		<div id="purchase_button_area">
			<input type="submit" value="결제하기">
		</div>
	</form>
	</div>	
</body>
</html>