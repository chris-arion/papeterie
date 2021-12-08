/**
 * 
 */
 
 
 
 // 일정스크롤 내릴시 픽스드
 $(window).scroll(function(){
    if ($(window).scrollTop() >= 50) {
       $('.top_head').addClass('fixed-header');
       $('.top_head_second').css('display','none');
       $('.top-logo-text3').css('display','block');
    }
    else {
       $('.top_head').removeClass('fixed-header');
       $('.top_head_second').css('display','block');
       $('.top-logo-text3').css('display','none');
    }
});  



// 카테고리 서브메뉴 숨기기,보이기
function view_sub(n)
{
	document.getElementsByClassName("sub")[n].style.visibility="visible";
}

function hide_sub(n)
{
	document.getElementsByClassName("sub")[n].style.visibility="hidden";
}