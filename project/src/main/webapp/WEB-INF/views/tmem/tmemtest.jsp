<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
  <head>
    <title>2조 통신사 프로젝트</title>
    <link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	
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
	<link rel="stylesheet" type="text/css" href="/project/resources/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="/project/resources/slick/slick-theme.css"/>
	<link rel="stylesheet" href="/project/resources/css/tab.css"> 
	
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 		 
<style>

</style>
<!-- <script type="text/javascript">jQuery.noConflict();</script> -->
<script type="text/javascript">


jQuery(function(){
	
	$(".tab ul li").bind("click", function() {
		
		$(".tabcontent ul li").addClass('on');
		$(".t1").addClass('on');
		$(".t2").addClass('on'); 
		$(".sCon").addClass('on');
		$(".tab ul li").off('click');
		$(".tab .tabcontent ul").addClass('slider');	
		$('.slider').slick();
				
				
			/* 	{  
			infinite: true,
	        slidesToShow: 3,
	        slidesToScroll: 3
	    });  */
	});
});
  
 //$(".tab .tabcontent ul li .btnclose").click(function(){
		
jQuery(function(){
	
	$(".tab .tabcontent ul li .btnclose").on("click",function(){
		  

		$(".tabcontent ul li").removeClass('on');	
		$(".tab .tabcontent ul li .sCon").removeClass("on"); 	
		$(".tab ul li .t2").removeClass('on');			
		$(".tab ul li .t1").removeClass('on');	
		$('.slider').slick('unslick');
		//$(".tab ul li").on('click');
		});
	});
 
</script>
  </head>
  <body>
    
    <section>
    	<div class="container"></div>
    </section>
    
	 <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="hi.jsp">Auto<span>road</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="index.html" class="nav-link">Home</a></li>
	          <li class="nav-item active"><a href="tmem.action" class="nav-link">T멤버쉽</a></li>
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
            <h1 class="mb-3 bread">About Us</h1>
          </div>
        </div>
      </div>
    </section> 
    

    <section class="ftco-section services-section"> 
      <div class="container">

      	<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
          	<span class="subheading">Our Services</span>
            <h2 class="mb-2">Our Services</h2>
          </div>
        </div>
        <div class="row d-flex">
        
        
                <div class="tab">
	   	 <div class="tabcontent">
		 	 <ul class="slider">
		  
	  			<li><img src="/project/resources/images/Q.png" id="qimg"/><br/>
		  			<p id="t1" class="t1">멤버십 회원이 되려면 어떻게 해야 하나요?
		  			<button id="btnclose" class="btnclose" ></button> 		
		  			</p> 	
		       		<p id="t2" class="t2">**텔레콤 고객이라면 누구나 멤버십 카드 신청하기를 통해 멤버십 회원으로 가입하실 수 있습니다.</p> 	         
	  <!-- 큰block내용--> 
	  				 <div id="sCon"  class="sCon">  
	  				 
						<img src="/project/resources/images/scon195.png" /> 
					</div> <!-- id="sCon"  -->
      			</li>
		          
		        <li id="con2"> <img src="/project/resources/images/Q.png" id="qimg" /><br/>
			       	<p id="t1" class="t1"> 멤버십으로 혜택을 받을 수 있는 제휴처는 어디인가요?
			       	<button id="btnclose" class="btnclose" ></button> </p>
			      	<p id="t2" class="t2">베이커리,피자,쇼핑,커피 등 10여개의 제휴처에서 풍성하고 다양한 혜택을 받으실 수 있습니다.</p> 
		      	 		
		      	 		<div id="sCon"  class="sCon">  
		      	 			<img src="/project/resources/images/scon295.png" />
		      	 			
		      	 		</div>
		      	 </li>
	        
		        <li id="con3"> <img src="/project/resources/images/Q.png" id="qimg" /><br/>
			   	  <p id="t1" class="t1"> 멤버십 VIP 등급이면 어떤 혜택이 있나요?
			   	  <button id="btnclose" class="btnclose" ></button> </p>
			        <p id="t2" class="t2">VIP Pick,컬처 등 VIP 고객님만의 전용 혜택을 누릴 수 있습니다.</p> 
			       			       
		       			<div id="sCon"  class="sCon">  
		      	 			<img src="/project/resources/images/scon395.png" />
		      	 		</div>
   
	      		  </li>
	        
	       		 <li id="con4"> <img src="/project/resources/images/Q.png" id="qimg"/><br/>
		     	 	<p id="t1" class="t1">   멤버십 제휴처를 이용하면 데이터를 무료로 받을 수 있다면서요?
		     	 	<button id="btnclose" class="btnclose" ></button> </p>
		       		<p id="t2" class="t2">쿠폰형 멤버십 제휴처에서 할인받으시면, 데이터쿠폰으로 돌려드립니다.</p> 
		       	
		       			<div id="sCon"  class="sCon">  
		      	 			<img src="/project/resources/images/scon495.png" />
		      	 		</div> 
	        </li>
	       
	    </ul>
	    </div>
	    </div>
	    
   <br/><br/> 
    <img src="/project/resources/images/cardgo.png" usemap="#gojoin"/>   
    	<map name="gojoin" >
			<area shape="rect" coords="756,13, 901, 56" href="appcard.action" >
		</map>
		
		
   </div>
 </section>
 
    <section class="ftco-section services-section img" style="background-image: url(/project/resources/images/bg_2.jpg);">
    	<div class="overlay"></div>
    	<div class="container">
    		<div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
          	
            <h2 class="mb-3">제휴사 혜택</h2>
            <span class="subheading" style="font-size:20px">** 텔레콤 만의 풍성한 제휴사 혜택을 만나보세요.</span>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services services-2">
              <div class="media-body py-md-4 text-center">
              	<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-route"></span></div>
                <h3>영화공연</h3>
                <p><a href="coupon.action?brandCate=1&brandName=megabox">메가박스</a></p>
                <p><a href="coupon.action?brandCate=1&brandName=cgv">CGV</a></p>
                <p><a href="coupon.action?brandCate=1&brandName=lotte">롯데시네마</a></p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services services-2">
              <div class="media-body py-md-4 text-center">
              	<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-select"></span></div>
                <h3>베이커리</h3>
                <p><a href="coupon.action?brandCate=2&brandName=pariscro">파리크로와상</a></p>
                <p><a href="coupon.action?brandCate=2&brandName=parisbage">파리바게트</a></p>
                <p><a href="coupon.action?brandCate=2&brandName=toure">뚜레쥬르</a></p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services services-2">
              <div class="media-body py-md-4 text-center">
              	<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-rent"></span></div>
                <h3>편의점</h3>
              <p><a href="coupon.action?brandCate=3&brandName=cu">CU</a></p>
              <p><a href="coupon.action?brandCate=3&brandName=ministop">미니스톰</a></p>
              <p><a href="coupon.action?brandCate=3&brandName=seven">7eleven</a></p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services services-2">
              <div class="media-body py-md-4 text-center">
              	<div class="icon d-flex align-items-center justify-content-center"><span class="flaticon-review"></span></div>
                <h3>까페</h3>
                <p><a href="coupon.action?brandCate=4&brandName=droptop">드롭탑</a></p>
                <p><a href="coupon.action?brandCate=4&brandName=smoothieKing">스무디킹</a></p>
                <p><a href="coupon.action?brandCate=4&brandName=angelInus">엔젤리너스</a></p>
                
              </div>
            </div>      
          </div>
    		</div>
    	</div>
    </section>
<div id=tab>
    <section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">Special</span>
            <h2 class="mb-3">스페셜 혜택</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
              <div class="item">
              
             
                <div class="testimony-wrap text-center py-4 pb-5">
                  <div class="user-img mb-4" style="background-image: url(/project/resources/images/jeju.png);background-size:95px;">
                  </div>
                  <div class="text pt-4">
                  <p class="name">제주도 멤버십</a></p>
                   <p class="mb-4">제주도 주요 관광지에서 T멤버십 할인 혜택 제공!</p> 
                   <!-- <a href="tevent.action?eventName=jeju"> -->
                   <a href="tevent.action?eventName=jeju"><img src="/project/resources/images/morebtn.png" style="align:center;width:120px; height:40px;"/></a>  
                 	
                 </div>
                </div>
                
                
              </div>
              <div class="item">
                <div class="testimony-wrap text-center py-4 pb-5">
                  <div class="user-img mb-4" style="background-image: url(/project/resources/images/tpass.png); background-size:90px;">
                  </div>
                  <div class="text pt-4">
                  <p class="name">T 해피패스</p>
                  <p class="mb-4">입장권 및 관람권 파격할인!</p>   
                  <a href="tevent.action?eventName=happypass"><img src="/project/resources/images/morebtn.png" style="align:center;width:120px; height:40px;"/></a>
                             
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap text-center py-4 pb-5">
                  <div class="user-img mb-4" style="background-image: url(/project/resources/images/tableevent.png);background-size:90px;">
                  </div>
                  <div class="text pt-4">
                  <p class="name">Table 행사</p>
                   <p class="mb-4">T멤버십 고객님을 위한 최고의 미식 이벤트!</p>   
                   <a href="tevent.action?eventName=tableevent"><img src="/project/resources/images/morebtn.png" style="align:center;width:120px; height:40px;"/></a>
                                              
                  </div>
                </div>
              </div>
   
            </div>
          </div>
        </div>
      </div>
    </section>
</div>
</div>
		

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
  <script src="/project/resources/js/main.js"></script>
  <script src="/project/resources/slick/slick.js"></script>  
  </body>
</html>