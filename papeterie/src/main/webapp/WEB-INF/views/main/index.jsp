<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PAPETERIE</title>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="/resources/css/style.css">
<style>
.slider img{margin:0 auto;}
	
	.bx-wrapper{
	border:none;
	box-shadow:none;
	}
	
	.bx-wrapper,
.bx-viewport,
.bx-wrapper img {
    height:500px;
} 
	
</style>
<script>
$(document).ready(function(){
	   $('.slider').bxSlider({
		   auto: true,
		   autoHover: true
	   });
	 });
</script>
</head>
<body>
	<div class="slider">
    <div>
      <img src="/resources/img/main1.jpg">
    </div>
    <div>
      <img src="/resources/img/main2.jpg">
    </div>
    <div>
      <img src="/resources/img/main3.gif">
    </div>
    <div>
      <img src="/resources/img/main4.gif">
    </div>
    <div>
      <img src="/resources/img/main5.gif">
    </div>
    <div>
      <img src="/resources/img/main6.gif">
    </div>
</div>
	<div id="section">/main/index</div>

</body>
</html>