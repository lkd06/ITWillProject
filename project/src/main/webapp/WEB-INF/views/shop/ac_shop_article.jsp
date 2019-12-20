<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>2조 통신사 프로젝트</title>
<link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/project/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/project/resources/css/animate.css">
<link rel="stylesheet" href="/project/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/project/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/project/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/project/resources/css/aos.css">
<link rel="stylesheet" href="/project/resources/css/ionicons.min.css">
<link rel="stylesheet" href="/project/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/project/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="/project/resources/css/flaticon.css">
<link rel="stylesheet" href="/project/resources/css/icomoon.css">
<link rel="stylesheet" href="/project/resources/css/style.css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		$("#order").click(function(){
			
			if(${empty phone }){
				alert("로그인 화면으로");
				return "redirect:/";
			}
			
			var num = ${dto.num };
			window.location="payment.action?pro_num="+num+"&pro_type=acshop";
		});
	});
	
</script>
</head>
<body style="background: #f8f8f9;">
    
<jsp:include page="../header.jsp"/>

<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/apple Watch.jpg');" data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
      <div class="col-md-9 ftco-animate pb-5">
      	<p class="breadcrumbs">
       	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
       	<span>다이렉트 샵 <i class="ion-ios-arrow-forward"></i></span> 
       	<span><a href="ac_shop_list.action">액세서리 <i class="ion-ios-arrow-forward"></i></a></span>
      	</p>
        <h1 class="mb-3 bread">상품 상세보기</h1>
      </div>
    </div>
  </div>
</section>
<br><br>
<form name="myform">
<table style="margin: auto;" width="1200px;">
<tr>
	<td valign="top" style="width: 600px; padding-top: 30px;">
		<img src="/project/resources/images/ac_shop/${dto.imageName }" style="width: 600px;">
	<td>
	<td>
		<table width="600px;">
		<tr>
			<td colspan="2">		
				<h2>${dto.subject }</h2>
			</td>
		</tr>
		<tr><td colspan="2"><hr color="#e6e6e6"></td></tr>
		<tr>
			<td style="width: 100px; height: 60px; padding-left: 10px;">
			가격
			</td>
			<td style="color: #333333; font-weight: bold; font-size: 20px;">
			<fmt:formatNumber value="${dto.price }"/>원
			</td>
		</tr>
		<tr><td colspan="2"><hr color="#e6e6e6"></td></tr>
		<tr>
			<td style="width: 100px; height: 60px; padding-left: 10px;">
			상품설명
			</td>
			<td>
				${dto.content }
			</td>
		</tr>
		</table>
	</td>
</tr>
<tr><td colspan="3"><hr color="#e6e6e6"></td></tr>
<tr>
	<td colspan="3" align="center">
		<a id="order" class="btn btn-primary" style="width: 150px; height: 50px; font-size: 20px;">주문하기</a>	
	</td>
</tr>
</table>
</form>  
<br><br>

<jsp:include page="../footer.jsp"/>
    
  

<!-- loader -->
<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


<script src="/project/resources/js/jquery.min.js"></script>
<script src="/project/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/project/resources/js/popper.min.js"></script>
<script src="/project/resources/js/bootstrap.min.js"></script>
<script src="/project/resources/js/jquery.easing.1.3.js"></script>
<script src="/project/resources/js/jquery.waypoints.min.js"></script>
<script src="/project/resources/js/jquery.stellar.min.js"></script>
<script src="/project/resources/js/owl.carousel.min.js"></script>
<script src="/project/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/project/resources/js/aos.js"></script>
<script src="/project/resources/js/jquery.animateNumber.min.js"></script>
<script src="/project/resources/js/bootstrap-datepicker.js"></script>
<script src="/project/resources/js/jquery.timepicker.min.js"></script>
<script src="/project/resources/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/project/resources/js/google-map.js"></script>
<script src="/project/resources/js/main.js"></script>
    
</body>
</html>