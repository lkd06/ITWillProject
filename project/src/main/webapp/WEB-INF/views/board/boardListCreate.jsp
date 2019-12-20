<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<html lang="en">
  <head>
    <title>Autoroad - Free Bootstrap 4 Template by Colorlib</title>
    <script type="text/javascript">
    function sendIt(){
	f = document.myForm;
	str = f.category1.value;
	if(!jQuery('input[name="category1"]:checked').val()){
	   alert('구분을 선택해주세요');
	   jQuery('input[name="category1"]').focus();
	   return false;
	}
	
	str = f.category2.value;
	if(!jQuery('input[name="category2"]:checked').val()){
	   alert('종류를 선택해주세요');
	   jQuery('input[name="category2"]').focus();
	   return false;
	}
	
	str = f.subject.value;
	str = str.trim();
	if(!str){
		alert("\n제목을 입력해주세요");
		f.subject.focus();
		return;
	}
	
	str = f.content.value;
	str = str.trim();
	if(!str){
		alert("\n내용을 입력해주세요");
		f.subject.focus();
		return;
	}
	

	f.action = "boardListCreate_ok.action";
	f.submit();
}
</script>

<script type="text/javascript">
 function radioClick1() {
 var checkvalue = $('input:radio[name="category1"]:checked').val();
 switch (checkvalue ) {
                    case 구매:
                        break;

                    case 판매:
                        break;

  }

    }

</script>



<script type="text/javascript">
 function radioClick2() {
 var checkvalue = $('input:radio[name="category2"]:checked').val();
 switch (checkvalue ) {
                    case 휴대폰:
                        break;

                    case 악세서리:
                        break;

                    case 데이터:
                        break;
  }

    }

</script>




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
    
    
    <link rel="stylesheet" href="/project/resources/css/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="/project/resources/css/css/created.css" type="text/css"/>
    <script type="text/javascript" src="/project/resources/js/util.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
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
	          <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
	          <li class="nav-item"><a href="pricing.html" class="nav-link">Pricing</a></li>
	          <li class="nav-item"><a href="car.html" class="nav-link">Our Car</a></li>
	          <li class="nav-item"><a href="blog.html" class="nav-link">Blog</a></li>
	          <li class="nav-item active"><a href="contact.html" class="nav-link">Contact</a></li>
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
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Contact <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">글쓰기</h1>
          </div>
        </div>
      </div>
    </section>
    
<table style="width:1100px; margin: auto;">
<tr style="height: 90px; border-bottom-color: #eaeaea;">
    <td style="font-size:40px; font-weight:bold; color: #333333;">&nbsp;중고마켓<img style="height: 80px; width: 80px;" src="<%=cp %>/resources/images/image4.JPG"></td>
</tr>
</table>

<br/>
<br/>
<br/>
    
<form action="" name="myForm" method="post" enctype="multipart/form-data">
<table style="width:1100px; margin: auto;">
<tr style="height: 10px;"><td colspan="4"></td></tr>
<tr>
	<td style="font-size: 20px; color: #333333; width: 150px; border-right: 1px solid #e6e6e6;" align="center">
	<b>구&nbsp;&nbsp;분</b>
	</td>
    <td style="font-size: 20px; font-weight: bold;">&nbsp;
	<input type="radio" name="category1" checked="checked" value="구매" onclick="radioClick1();"/>&nbsp;구매
    </td>
    <td style="font-size: 20px; font-weight: bold;">
    <input type="radio" name="category1" value="판매" onclick="radioClick1();"/>&nbsp;판매
    </td>
</tr>
<tr height="15"><td style="border-bottom: 1px solid; border-bottom-color: #e6e6e6;" colspan="4"></td></tr>
<tr height="15"></tr>
<tr>
    <td style="font-size: 20px; color: #333333; width: 150px; border-right: 1px solid #e6e6e6;" align="center">
	<b>종&nbsp;&nbsp;류</b>
	</td>
	<td style="font-size: 20px; font-weight: bold;;">&nbsp;	
	<input type="radio" name="category2" checked="checked" value="휴대폰" onclick="radioClick2();"/>&nbsp;휴대폰
	</td>
	<td style="font-size: 20px; font-weight: bold;">
	<input type="radio" name="category2" value="악세서리" onclick="radioClick2();"/>&nbsp;악세서리
	</td>
	<td style="font-size: 20px; font-weight: bold;" >
	<input type="radio" name="category2" value="데이터" onclick="radioClick2();"/>&nbsp;데이터&nbsp;&nbsp;&nbsp;&nbsp;
	</td>		
</tr>
<tr height="15"><td colspan="4"></td></tr>
<tr height="15"><td style="border-bottom: 2px solid; border-bottom-color: #ea002c;" colspan="4"></td></tr>
<tr height="15"><td colspan="4"></td></tr>
<tr>
	<td style="font-size: 30px;  color: #333333; width: 150px; border-right: 1px solid #e6e6e6" align="center">
	<b>제&nbsp;&nbsp;목</b>
	</td>
	<td colspan="3" style="padding-left: 15px;">
	<input type="text" name="subject" style="width: 900px;">
	</td>
</tr>
<tr height="15"><td colspan="4"></td></tr>
<tr><td style="border-bottom: 1px solid #e6e6e6;" colspan="4"></td></tr>
<tr height="15"><td colspan="4"></td></tr>
<tr>
	<td style="font-size: 30px; color: #333333; width: 150px; border-right: 1px solid #e6e6e6" align="center">
	<b>내&nbsp;&nbsp;용</b>
	</td>
	<td colspan="3" style="padding-left: 15px;">
	<textarea rows="30" cols="100"  style="height: 500px; width: 900px;" name="content"></textarea>
	</td>
</tr>
<tr height="15"><td colspan="4"></td></tr>
<tr height="15"><td style="border-bottom: 1px solid #e6e6e6;" colspan="4"></td></tr>
<tr height="15"><td colspan="4"></td></tr>
<tr height="15"><td colspan="4"></td></tr>

<tr>
<td><input type="file" name="upload"/>
<input type="hidden" name="mode" value="save"/><br/></td>
</tr>

<tr>   
	<td align="center" colspan="4">
	<button type="submit" class="btn btn-primary" style="width: 200px;; height: 50px; font-size: 20px;" onclick="sendIt();">작성하기</button>
	</td>
</tr>
</table>
</form>
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