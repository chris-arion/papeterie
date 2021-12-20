/**
 * 
 */

$(document).ready(function(){
	//alert("onload");
	calc_price();
	
	$("#allCheck").click(function () {
		if ($("#allCheck").is(":checked") == true) {
			console.log("true");
			$("input:checkbox").prop("checked", true);	// ok
		}
		else {
			console.log("false");
			$("input:checkbox").prop("checked", false);
		}
		
		calc_price();
	});
	
	
});

function calc_price() {
	var item_cnt = 0;	// 상품 종류 수량
	var item_price = 0;	// 전체 상품 금액
	
	var rowData = new Array(); 
	var tdArr = new Array();
	var checkbox = $("input[name=cartchk]:checked");
	 
	// 체크된 체크박스 값을 가져온다
	checkbox.each(function(i) {
	
		// checkbox.parent() : checkbox의 부모는 <td>이다.
		// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();
		item_cnt++;
				
		// 체크된 row의 모든 값을 배열에 담는다.
		rowData.push(tr.text());
				
		// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
		var price = td.eq(5).text();
		price = price.replace("원", "");
		price = price.replace(",", "");
		price = price.trim();
		console.log(price);
		item_price += parseInt(price);

	});

	console.log("item_cnt = " + item_cnt + ", item_price = " + item_price);
	var totalprice = item_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	var shiptotal = (item_price + 3000).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	$("#price_main_cnt").text(item_cnt);
	$("#price_main_total").text(totalprice);
	$("#price_total_plus").text(shiptotal);
}

function cart_process(mode) {
	// 선택한 상품 개수
    var checkedCnt = $("#cartFrm input:checkbox[name='cartchk']:checked").length;
    console.log("checkedCnt = " + checkedCnt);

	if (parseInt(checkedCnt) >= parseInt(1)) {
	    // 모드에 따른 메시지 및 처리
	    if (mode == "cartDelete") {
	        msg = "선택한 상품을 장바구니에서 삭제 하시겠습니까?";
	    } else if (mode == "cartToWish") {
	        msg = "선택한 상품을 찜리스트에 담으시겠습니까?";
	    } else if (mode == "orderSelect") {
	        msg = "선택한 상품만 주문합니다.";
	    }

	    if (confirm(msg)) {
	    /*
		    if (parseInt(checkedCnt) >= parseInt(1)) {
				$("#cartFrm input[name='mode']").val(mode);            
				$("#cartFrm").attr("method", "post");            
				$("#cartFrm").attr("target", "ifrmProcess");            
				$("#cartFrm").attr("action", "../basket/cart_proc");            
				$("#cartFrm").submit();            
		        return true;
		    }
		*/
		}
	}
	else {
		alert("선택하지 않았습니다.");
	}

}