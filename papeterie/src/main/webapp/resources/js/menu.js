/**
 * 
 */

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

$( '#tothetop' ).click( function() {
    var htmloffset = $( 'html' ).offset();
    $( 'html, body' ).animate( { scrollTop : htmloffset.top }, 400 );
});


function view_sub(n)
{
	document.getElementsByClassName("sub")[n].style.visibility="visible";
}

function hide_sub(n)
{
	document.getElementsByClassName("sub")[n].style.visibility="hidden";
}

