<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<html lang="en">
  <head>
    <title>Autoroad - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
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
    
    
    <link rel="stylesheet" href="/project/resources/css/css/style.css" type="text/css" />
    <link rel="stylesheet" href="/project/resources/css/css/article.css" type="text/css" />
  
 <script type="text/javascript">
 
 window.onload = function() {
	  var input = document.getElementById("content").focus();
	}
 
  </script>
 
  
  <script type="text/javascript">
  
  function sendIt(){
	 
	  f = document.subUpdate;

	  f.action = "boardListUpdate_ok.action";

	  f.submit();
	  
	  
  }
  
  
  </script>

  
  <style type="text/css">

#btn1 {
	margin-right: -5px;
	font-weight: bold;
	border: 1px solid #black;
	background-color: rgba(0, 0, 0, 0);
	color: #black;
	padding: 5px;
	border-radius: 5px;
}

#btn2 {
	margin-left: 5px;
	font-weight: bold;
	border: 1px solid #black;
	background-color: rgba(0, 0, 0, 0);
	color: #black;
	padding: 5px;
	border-radius: 5px;
}

#btn3 {
	margin-right: -5px;
	font-weight: bold;
	border: 1px solid #black;
	background-color: rgba(0, 0, 0, 0);
	color: #black;
	padding: 5px;
	border-radius: 5px;
	
	
}
</style>
  
  
  
  
  </head>
  <body>
    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="index.html">Auto<span>road</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
	          <li class="nav-item active"><a href="login.action" class="nav-link">Login</a></li>
	          <li class="nav-item"><a href="pricing.html" class="nav-link">Pricing</a></li>
	          <li class="nav-item"><a href="car.html" class="nav-link">Our Car</a></li>
	          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>About us <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">게시판</h1>
          </div>
        </div>
      </div>
    </section>
    
    <!-- 여기서부터 -->  
    
    <table style="width: 1100px; margin: auto;">
      <tr style="height: 90px;">
         <td style="font-size: 40px; font-weight: bold; color: #333333;">중고마켓<img src="<%=cp%>/resources/images/image2.JPG"></td>
      </tr>   
    </table> 
    <br/>
    <br/>
    <br/>
    
    <form action="" name="subUpdate" method="post">
    <table style="width: 1100px; margin: auto;">
    <tr><td bgcolor="#ea002c" colspan="4"></td></tr>
    <tr style="height: 10px;"><td colspan="4"></td></tr>
    <tr>
        <td width="150" style="border-right: 1px; solid:#e6e6e6;" align="center">
        <b>작성자</b>${dto.userName }
        </td>
        <td>
        <font style="font-weight: bold; font-size: 30px; color: #333333; padding-left: 50px;">
        ${dto.subject }</font>
        </td>
        <td width="200" align="center" style="border-right: 1px solid #e6e6e6;">
        <b>등록일</b>${dto.created }
        </td>
        <td width="200" align="center">
        <b>조회수</b>${dto.hitCount }
        </td>
    </tr>
    <tr height="15"><td colspan="4" style="border-bottom: 2px solid; border-bottom-color: #ea002c;"></td></tr>
    
    <tr>
        <td style="padding-left: 30px;" colspan="4">
        <br/><br/>
        
        <textarea id="content" name="content" style="width: 100%; height: 300px; font-size: 20px; padding-left: 0px;">${dto.content }
        </textarea>
       
        <input type="hidden" name="pageNum" value="${pageNum }"/>
        <input type="hidden" name="num" value="${dto.num }">
        <br/><br/><br/>
        </td>
    </tr>    
    <tr>
        <td align="right" style="padding-right: 30px;" colspan="4">
        <b>아이피</b>${dto.ipAddr }
        </td>
    </tr>    
    
    <tr height="15"><td style="border-bottom: 1px solid #e6e6e6;" colspan="4"></td></tr>
    <tr>
        <td align="right" style="padding-right: 30px;" colspan="4">
        <br/>
<%--    <input type="button" value="삭제" class="btn btn-primary"
        onclick="javascript:location.href='<%=cp%>/boardListDelete.action?num=${dto.num}&${params }';">
        <input type="button" value="목록" class="btn btn-primary" 
        onclick="javascript:loacation.href='<%=cp%>/boardList.action?num=${params }';"> 
--%>
      

      
        <button type="submit" id="btn1" value="수정"
        onclick="sendIt();">수정</button>
        
	    <button id="btn2" value="삭제"  
	    onclick="javascript:location.href='boardListDelete.action?num=${dto.num}&${params }';">삭제</button>
	
	    <button type="button" id="btn3" value="리스트"  
	    onclick="javascript:location.href='boardList.action?${params }';">목록</button>
 
	
	    </td>        
    </tr>
               
    </table>
    </form>
 
    
    <br/>
    
    <!-- 댓글 기능 -->
    <form action="" method="post" name="myReply">
    <table style="width: 1100px; margin: auto;">
    <tr height="15px"><td style="border-bottom: 5px; solid:#e6d4a6;" colspan="3"></td></tr>
    <tr>
        <td width="100px" bordercolor="#e6e6e6" align="center" style="font-weight: bold;">
        댓글<br/>달기
        </td>
        <td>
        <textarea rows="3" cols="58" class="boxTA" style="height: 100px; width: 900px;" name="content"></textarea>
        </td>
        <td width="50px">
        <input type="hidden" name="num" value="${dto.num }">
        <input type="hidden" name="pageNum" value="${pageNum }">
        <button type="submit" onclick="sendIt1();" class="btn btn-primary" 
        style="width: 100px; height: 100px;">등록</button>
        </td>
     </tr>
     <tr height="15px"><td style="border-top: 3px; solid:#e6d4a6;" colspan="3"></td></tr>
    </table>   
    </form>
    <br/>
    <table style="width: 1100px; margin: auto;">
    <c:forEach var="dto1" items="${list }">
    <tr>
        <td width="70px" colspan="4" style="padding-left: 25px;">
        <img src="<%=cp%>/resources/images/image6.JPG"></td>
        <td width="600px" colspan="4" style="padding-left: 15px;"><b style="color: #FF7012; font-size: 18px;">이름 ${dto1.name }</b><br/><b style="font-size: 15px;">${dto1.content}</b></td>
        <td width="100px" colspan="4" style="padding-left: 20px;"><b style="font-size: 15px;">${dto1.originalCreated }</b></td>                                                                    
    <tr height="30px"><td style="border-top: 3px; solid:#e6d4a6;" colspan="4"></td></tr>
    </c:forEach>     
    </table>
    <br/><br/><br/>

    <!-- 여기까지 -->
    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">About Autoroad</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Information</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Services</a></li>
                <li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
                <li><a href="#" class="py-2 d-block">Best Price Guarantee</a></li>
                <li><a href="#" class="py-2 d-block">Privacy &amp; Cookies Policy</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Customer Support</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">FAQ</a></li>
                <li><a href="#" class="py-2 d-block">Payment Option</a></li>
                <li><a href="#" class="py-2 d-block">Booking Tips</a></li>
                <li><a href="#" class="py-2 d-block">How it works</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

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