<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE - add address</title>
<link rel="stylesheet" href="/resources/css/style.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
{
  new daum.Postcode({
      oncomplete: function(data) {
          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
              addr = data.roadAddress;
          } else { // 사용자가 지번 주소를 선택했을 경우(J)
              addr = data.jibunAddress;
          }

          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.frm.zip.value = data.zonecode; // 우편번호
          document.frm.addr1.value = addr;  // 주소
          // 커서를 상세주소 필드로 이동한다.
          document.frm.addr2.focus();
      }
  }).open();
}
</script>
</head>
<body>
<form action="add_ok" method="post" name="frm" id="frm">
	<table>
		<tr>
			<td>배송지명</td>
			<td><input type="text" name="addr_name"></td>
		</tr>
		<tr>
			<td>받는 분</td>
			<td><input type="text" name="rname"></td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td><input type="text" name="zip" readonly onclick="juso_search()"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" name="addr1" readonly onclick="juso_search()"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="text" name="addr2"></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="checkbox" name="sdefault">기본 배송지로 설정</td>
		</tr>
		<tr>
			<td>요청사항</td>
			<td>
				<select id="soption" name="soption">
					<option value="0">배송 요청사항을 선택해 주세요</option>
					<option value="1">직접수령 하겠습니다</option>
					<option value="2">배송 전 연락바랍니다</option>
					<option value="3">부재 시 경비실에 맏겨주세요</option>
					<option value="4">부재 시 문앞에 놓아주세요</option>
					<option value="5">부재 시 택배함에 넣어주세요</option>
				</select>
			</td>
		</tr>
	</table>
</form>
</body>
</html>