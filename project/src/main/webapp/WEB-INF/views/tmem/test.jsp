<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
  <head>
    <title>3조 통신사 프로젝트</title>
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
		 
<script type="text/javascript">

jQuery(function(){
	
	$(".tab ul li").on("click", function() {
		
		$(".tabcontent ul li").addClass('on');
		$(".t1").addClass('on');
		$(".t2").addClass('on'); 
		$(".sCon").addClass('on');
		$(".tab ul li").off('click');
		$(".tab .tabcontent ul").addClass('slider');	
		$('.slider').slick();
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
    
	 <jsp:include page="../header.jsp"/>
    
     <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/멤버십.jpeg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/"><font color="#000000;">메인 </font><i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span><font color="#000000;">멤버십 </font><i class="ion-ios-arrow-forward"></i></span>
          	</p>
            <h1 class="mb-3 bread"><font color="#000000;">멤버십 혜택 </font></h1>
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
		  			<li><img src="/project/resources/images/tmem/Q.png" id="qimg"/><br/>
			  			<p id="t1" class="t1">멤버십 회원이 되려면 어떻게 해야 하나요?
			  			<button id="btnclose" class="btnclose" ></button> 		
			  			</p> 	
			       		<p id="t2" class="t2">**텔레콤 고객이라면 누구나 멤버십 카드 신청하기를 통해 멤버십 회원으로 가입하실 수 있습니다.</p> 	         
		  <!-- 큰block내용--> 
		  				 <div id="sCon"  class="sCon">  	  				 
							<img src="/project/resources/images/tmem/scon195.png" /> 
						</div> <!-- id="sCon"  -->
	      			</li>
		          
			        <li id="con2"> <img src="/project/resources/images/tmem/Q.png" id="qimg" /><br/>
				       	<p id="t1" class="t1"> 멤버십으로 혜택을 받을 수 있는 제휴처는 어디인가요?
				       	<button id="btnclose" class="btnclose" ></button> </p>
				      	<p id="t2" class="t2">베이커리,피자,쇼핑,커피 등 10여개의 제휴처에서 풍성하고 다양한 혜택을 받으실 수 있습니다.</p> 	      	 		
			      	 		<div id="sCon"  class="sCon">  
			      	 			<img src="/project/resources/images/tmem/scon295.png" />			      	 			
			      	 		</div>
			      	 </li>
	        
			        <li id="con3"> <img src="/project/resources/images/tmem/Q.png" id="qimg" /><br/>
				   	  <p id="t1" class="t1"> 멤버십 VIP 등급이면 어떤 혜택이 있나요?
				   	  <button id="btnclose" class="btnclose" ></button> </p>
				        <p id="t2" class="t2">VIP Pick,컬처 등 VIP 고객님만의 전용 혜택을 누릴 수 있습니다.</p> 			       			       
			       			<div id="sCon"  class="sCon">  
			      	 			<img src="/project/resources/images/tmem/scon395.png" />
			      	 		</div>   
		      		  </li>
	        
		       		 <li id="con4"> <img src="/project/resources/images/tmem/Q.png" id="qimg"/><br/>
			     	 	<p id="t1" class="t1">   멤버십 제휴처를 이용하면 데이터를 무료로 받을 수 있다면서요?
			     	 	<button id="btnclose" class="btnclose" ></button> </p>
			       		<p id="t2" class="t2">쿠폰형 멤버십 제휴처에서 할인받으시면, 데이터쿠폰으로 돌려드립니다.</p> 	       	
			       			<div id="sCon"  class="sCon">  
			      	 			<img src="/project/resources/images/tmem/scon495.png" />
			      	 		</div> 
		     	   </li>       
		   	 </ul>
		   </div>
		 </div>
	   </div>
   <br/><br/> 
    <img src="/project/resources/images/tmem/cardgo.png" usemap="#gojoin"/>   
    	<map name="gojoin" >
			<area shape="rect" coords="756,13, 901, 56" href="appcard.action" >
		</map>	
		
		</div>
 	</section>
 
    <section class="ftco-section services-section img" style="background-image: url(/project/resources/images/tmem/bg_2.jpg);">
    	<div class="overlay"></div>
    	<div class="container">
    		<div class="row justify-content-center mb-5">
	          <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
	            <h2 class="mb-3">제휴사 혜택</h2>
	            <span class="subheading" style="font-size:20px">IT 텔레콤 만의 풍성한 제휴사 혜택을 만나보세요.</span>
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
	                <p><a href="coupon.action?brandCate=3&brandName=ministop">미니스톱</a></p>
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

  

		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row no-gutters">
					<div class="col-md-6 p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url(/project/resources/images/멤버십.jpg);">
					</div>
					<div class="col-md-6 wrap-about py-md-5 ftco-animate">
	          <div class="heading-section mb-5 pl-md-5">
	          	<span class="subheading">About us</span>
	            <h2 class="mb-4">Choose A Perfect Car</h2>

	            <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
	            <p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country. But nothing the copy said could convince her and so it didnât take long until a few insidious Copy Writers ambushed her, made her drunk with Longe and Parole and dragged her into their agency, where they abused her for their.</p>
	            <p><a href="#" class="btn btn-primary">Search Vehicle</a></p>
	          </div>
					</div>
				</div>
			</div>
		</section>

  <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a onclick="window.open('https://twitter.com/')"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a onclick="window.open('https://www.facebook.com/')"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a onclick="window.open('https://instagram.com/')"><span class="icon-instagram"></span></a></li>
              </ul>
              <p>
              	<a href="noti_article.action?num=4">이용약관</a>&nbsp;&nbsp;|&nbsp; &nbsp;
              	<a href="noti_article.action?num=5">개인정보 처리방침</a>&nbsp;&nbsp;|&nbsp;&nbsp;
              	<a href="noti_article.action?num=6">개인정보 이용내역</a>&nbsp;&nbsp;|&nbsp;&nbsp;
              	<a href="noti_article.action?num=7">책임의 한계와 법적 고지</a>
              </p>
              <p>
              	<a href="s_fee_bok.action">요금할인</a>&nbsp;&nbsp;|&nbsp; &nbsp;
              	<a href=".action">이벤트</a>&nbsp;&nbsp;|&nbsp; &nbsp;
              	<a onclick="window.open('https://www.cleanmobile.or.kr/indexs.html')">이용전화 파파라치 신고센터</a>&nbsp;&nbsp;|&nbsp;&nbsp;
              	<a onclick="window.open('https://www.notm.or.kr/index')">개인정보 파파라치 신고센터</a>
              </p>
            </div>
            <div class="ftco-footer-widget mb-4">
              <p>
	              서울특별시 강남구 테헤란로 123 여삼빌딩 10,15층&nbsp; &nbsp;
	              대표 : 아이티윌&nbsp; &nbsp;
	              판매허가번호 : 강남구 1호
	          </p>
	          <p>
	              고객센터 : 휴대폰 국번없이 114(무료) 또는 080-114-1004(무료), 
	              국번없이 1599-1599(유료) 
	              인터넷/집전화 고객센터 : 080-123-1234(무료) 또는 1000-2000(유료)
              </p>
            </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">
			<p>Copyright &copy;
				<script>document.write(new Date().getFullYear());</script> 
				All rights reserved | This page with 
				<i class="icon-heart color-danger" aria-hidden="true"></i> 
				by 
				<a onclick="window.open('https://www.itwill.co.kr/')" target="_blank">IT WILL</a>
			</p>
          </div>
        </div>
      </div>
    </footer>

    <br/><br/><br/>
  

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