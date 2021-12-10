/**
 * 
 */
 
 function Goods_Menu_Move(n){
        var offset = $(".goods_data_menu").eq(n).offset().top;
        $('html, body').animate({scrollTop : offset-100}, 400);
    }


