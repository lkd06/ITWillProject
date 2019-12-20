<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
  <head>
    <title>2조 통신사 프로젝트</title>
    <link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
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
<link rel="stylesheet" href="/project/resources/js/bootstrap.min.js">
<link rel="stylesheet" href="/project/resources/css/manycotton.css">
<style type="text/css">
.a{
	font-size: 30px;
	color: #000000;
}
	
tr{
	border-bottom: 1px solid;
	height: 80px;
}
	
.font{
	color: red;
	font-weight: bold;
}
</style>
 </head>
  
  <body>
	
    <jsp:include page="../header.jsp"/>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/부가.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> <span>부가서비스 <i class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">부가서비스</h1>
				</div>
			</div>
		</div>
	</section>

   	
   	<div class="container top">
   		<span class="a"> 
   		<b>부가서비스</b>
   		</span>
   		
   		<br><br>
		<jsp:include page="slider.jsp"/>
			
		
		<table style="width: 100%; color: #000000;">
			<tr style="border-bottom: 1px solid #c0c0c0;">
				<td colspan="5"></td>
			</tr>
			
			<c:forEach var="dto" items="${lists }">
				<tr class="data" style="border-bottom: 1px solid #c0c0c0;">
					<td colspan="3" class="name" style="padding-left: 10px;" align="left">
						<font size="4pt">${dto.name } </font><br/> 
						<font size="2pt">${dto.content } </font><br/> 
					</td>
					
					<c:if test="${dto.price==0 }">
						<td class="price" style="color: red;" align="center" ><b>무료</b></td>
					</c:if>
					<c:if test="${dto.price!=0 }">
						<td class="price" style="color: red;" align="center" ><b><fmt:formatNumber value="${dto.price }" pattern="#,##0"/>원</b></td>
					</c:if>
					
					<td style="padding-right: 20px; padding-top: 20px;" align="right">
						<a href="service_view.action?num=${dto.num}&list=${dto.list}"><img src="/project/resources/image/5.png"/></a>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		
		<br><br><br><br>


		<div align="right">
	   		<a href="service_list.action"><img src="/project/resources/image/12.JPG"/></a>
	   	</div>
	   	
	   	<br><br>
	   	
   	</div>
   	
   	
   	
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