/**
 * 
 */
 
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
 	var price = document.getElementById("goods_price").innerText.replace("원","").replace(",","");
 	price = parseInt(price);
 	price = comma(price*cnt);
 	document.getElementsByClassName("center_count")[here].innerText = cnt;
 	document.goods_form.count.value = cnt;
 	document.getElementsByClassName("option_price")[here].innerText = price+"원";
 	document.getElementById("total_price").innerText = price+"원";
 }
