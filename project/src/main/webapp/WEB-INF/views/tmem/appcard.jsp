<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();  
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>2조 통신사 프로젝트</title>
    <link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">

 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
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
    
<script type="text/javascript">  
   function alertlogin(){
	   	   
	   alert("로그인이 필요한 메뉴입니다.");
   }   
</script>  
</head>
<body>
    <section>
    	<div class="container"></div>
    </section>
   
	 <jsp:include page="../header.jsp"/>
    
     <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/멤버십.jpeg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/"><font color="#000000;">메인 </font><i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span><font color="#000000;">멤버십 </font><i class="ion-ios-arrow-forward"></i></span>
	          	<span><a href="/project/tjoin.action"><font color="#000000;">멤버십 가입 </font><i class="ion-ios-arrow-forward"></i></a></span> 
          	</p>
            <h1 class="mb-3 bread"><font color="#000000;">멤버십 카드 </font></h1>
          </div>
        </div>
      </div>
    </section>  
    <br/><br/>
<div class="container">
	
	<img src="/project/resources/images/tmem/appcard_note.png" />

	신규 발급/재발급	
	다양한 제휴사의 할인 혜택을 카드 한 장으로 누려보세요.
	
	<br/><br/><br/>
	

	<table>
		<tr>
			<td>
				<img src="/project/resources/images/tmem/Image1.png" usemap="#1" />
					<map name="1">
						<area shape="rect" coords="115,228,267,266" href="tjoin.action">
					</map>
			</td>
			
			<td>
				<img src="/project/resources/images/tmem/Image2.png" usemap="#2" />	<!-- 재발급  -->
					<map name="2"> 
			<!-- 로그인을 했을 경우 이동  -->
			<c:if test="${!empty mdto }">
					<area shape="rect" coords="107,228,275,266" href="cardissue.action">			
			</c:if>
			<c:if test="${empty mdto }">
					<area shape="rect" coords="107,228,275,266" href="javascript:alertlogin();">			
			</c:if>
					</map>		
			</td>
			
			<td>
				<img src="/project/resources/images/tmem/Image3.png" usemap="#3"/>
					<map name="3">
						<area shape="rect" coords="99,227,284,266" href="">
					</map>
			</td>
		</tr>	
	</table>
	
	<br/><br/><br/>
	<img src="/project/resources/images/tmem/Image_note.png" />

<br/><br/><br/>
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