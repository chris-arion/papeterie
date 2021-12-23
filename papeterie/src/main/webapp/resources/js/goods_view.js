/**
 * 
 */

// 카트에 사용할 변수
var count = 1;

window.onload = function(){
	Next_qna(1);
	Next_review(1);
}

function Goods_Menu_Move(n){
	var offset = $(".goods_data_menu").eq(n).offset().top;
 	$('html, body').animate({scrollTop : offset-100}, 400);
}
 
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
 
function count_goods(my){
 	var class_name = my.className;
 	var class_cnt = document.getElementsByClassName(class_name).length;
 	var here = "";
 	for(i=0;i<class_cnt; i++){
 		if(my == document.getElementsByClassName(class_name)[i]){
 			here = i;
 		}
 	}
 	var cnt = parseInt(document.getElementsByClassName("center_count")[here].innerText);
 	if(my.value == "-"){
 		if(cnt > 1){
 			cnt--;
 		}
 	}
 	else{
 		cnt++;
 	}
 	// 선택 수량 저장
 	count = cnt;
 	var price = document.getElementById("goods_price").innerText.replace("원","").replace(",","");
 	price = parseInt(price);
 	price = comma(price*cnt);
 	document.getElementsByClassName("center_count")[here].innerText = cnt;
 	document.goods_form.count.value = cnt;
 	document.getElementsByClassName("option_price")[here].innerText = price+"원";
 	document.getElementById("total_price").innerText = price+"원";
}

function add_cart_fn(pcode)
{
	$.ajax({
		url : "../basket/add_cart",
		method : "GET",
		data : {
			pcode : pcode,
			count : count
		},
		cache : false,
		success : function(data) {
			//console.log("return OK");
			//console.log(data);
			if (data.trim() != null) {
				if (confirm("장바구니로 이동하시겠습니까?")) {
					location="../basket/cart";
				}
			}
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	});
}

function add_wish_fn(pcode) {
	//alert(pcode);
	$.ajax({
		url : "../basket/addwish",
		method : "GET",
		data : {
			pcode : pcode
		},
		cache : false,
		success : function(data) {
			if (data.trim() != null) {
				$("#goods_addwish").css("background-color", "yellow");
			}
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	});

}function Next_review(p){
	$.ajax({
		url : "next_review",
		method : "post",
		data : {
			"review_p" : p
		},
		datatype : "json",
		success : function(res){
			var review_p = res.review_p;
			var review_c = res.review_c;
			var review_sp = res.review_sp;
			var review_ep = res.review_ep;
			var reviewlist = res.reviewlist;
			var a = "";
			var b = "";
			
			for(var i=0; i<reviewlist.length; i++){
				a = a+"<tr>";
				a = a+"<td class='td_name'>"+reviewlist[i].score+"</td>";
				a = a+"<td class='td_title'><a href='javascript:view_review("+i+")'>"+reviewlist[i].content+"</a></td>";
				a = a+"<td class='td_user'>"+reviewlist[i].userid+"</td>";
				a = a+"<td>"+reviewlist[i].regdate+"</td>";
				a = a+"</tr>";
				a = a+"<tr class='review_content'>";
				a = a+"<td colspan='4'><div class='review_content_x' onclick='hide_review(this)'>x</div>"+reviewlist[i].content;
				a = a+"<div><img src='"+reviewlist[i].filename+"'></div>";
				a = a+"</td>";
				a = a+"</tr>";
			}
			b = b+"<tr>";
			b = b+"<td colspan='4'>";
			if(review_sp == 1){
				b = b+"이전";
			}
			else{
				b = b+"<a href='javascript:Next_review("+(review_sp-1)+")'>이전</a>";
			}
			for(var i=review_sp; i<=review_ep; i++){
				b = b+"&nbsp";
				if(i == review_p){
					b = b+"<a href='javascript:Next_review("+i+")' style='color:red'>"+i+"</a>";
				}
				else{
					b = b+"<a href='javascript:Next_review("+i+")'>"+i+"</a>";
				}
				b = b+"&nbsp";
			}
			if(review_ep == review_c){
				b = b+"다음";
			}
			else{
				b = b+"<a href='javascript:Next_review("+(review_ep+1)+")'>다음</a>";
			}
			b = b+"</td>";
			b = b+"</tr>";
			
			$("#review_list").html(a);
			$("#review_end").html(b);
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	})

}

function Next_qna(p){
	$.ajax({
		url : "next_qna",
		method : "post",
		data : {
			"qna_p" : p
		},
		datatype : "json",
		success : function(res){
			var qna_p = res.qna_p;
			var qna_c = res.qna_c;
			var qna_sp = res.qna_sp;
			var qna_ep = res.qna_ep;
			var qnalist = res.qnalist;
			var a = "";
			var b = "";
			
			for(var i=0; i<qnalist.length; i++){
				a = a+"<tr>";
				a = a+"<td class='td_name'>"+qnalist[i].name+"</td>";
				a = a+"<td class='td_title'><a href='javascript:view_qna("+i+")'>"+qnalist[i].title+"</a></td>";
				a = a+"<td class='td_dap'>"+qnalist[i].dap+"</td>";
				a = a+"<td>"+qnalist[i].writeday+"</td>";	
				a = a+"</tr>";
				a = a+"<tr class='qna_content'>";
				a = a+"<td colspan='4'><div class='qna_content_x' onclick='hide_qna(this)'>x</div>"+qnalist[i].content+"</td>";
				a = a+"</tr>";
			}
			b = b+"<tr>";
			b = b+"<td colspan='4'>";
			if(qna_sp == 1){
				b = b+"이전";
			}
			else{
				b = b+"<a href='javascript:Next_qna("+(qna_sp-1)+")'>이전</a>";
			}
			for(var i=qna_sp; i<=qna_ep; i++){
				b = b+"&nbsp";
				if(i == qna_p){
					b = b+"<a href='javascript:Next_qna("+i+")' style='color:red'>"+i+"</a>";
				}
				else{
					b = b+"<a href='javascript:Next_qna("+i+")'>"+i+"</a>";
				}
				b = b+"&nbsp";
			}
			if(qna_ep == qna_c){
				b = b+"다음";
			}
			else{
				b = b+"<a href='javascript:Next_qna("+(qna_ep+1)+")'>다음</a>";
			}
			b = b+"</td>";
			b = b+"</tr>";
			
			$("#qna_list").html(a);
			$("#qna_end").html(b);
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	});
}

function add_wish_fn(pcode) {
	//alert(pcode);
	$.ajax({
		url : "../basket/addwish",
		method : "GET",
		data : {
			pcode : pcode
		},
		cache : false,
		success : function(data) {
			if (data.trim() != null) {
				$("#goods_addwish").css("background-color", "yellow");
			}
		},
		error : function(request, status, error) {
			console.log("return FAIL");
			console.log("code: " + request.status + ", message: " + request.responseText + ", error: " + error);
		}
	});
}
 function view_review(n){
 	var cnt = $('.review_content').length;
 	for(var i=0; i<cnt; i++){
 		document.getElementsByClassName("review_content")[i].style.display = "none";
 	}
 	document.getElementsByClassName("review_content")[n].style.display = "table-row";
 }
 function hide_review(my){
 	var index = $(".review_content_x").index(my);
 	document.getElementsByClassName("review_content")[index].style.display = "none";
 }
 
 function view_qna(n){
 	var cnt = $('.qna_content').length;
 	for(var i=0; i<cnt; i++){
 		document.getElementsByClassName("qna_content")[i].style.display = "none";
 	}
 	document.getElementsByClassName("qna_content")[n].style.display = "table-row";
 }
 function hide_qna(my){
 	var index = $(".qna_content_x").index(my);
 	document.getElementsByClassName("qna_content")[index].style.display = "none";
 }
 