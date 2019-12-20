<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3조 통신사 프로젝트</title>
<style type="text/css">
 
.tab{
    height:auto;
   /*  overflow:hidden; */
}
 
.tab ul{
    padding:0;
    margin:0;
    list-style:none;
    width:1200px; 
    align:left;
    height:auto;
    overflow:hidden;
}
 
.tab ul li{
    display:inline-block;
    width:25%;
    font-size:17px;
    font-weight:bold;
    float:left; 
    line-height:100px;
    text-align:center;
    cursor:pointer;
    background:#f4f4f4;
    border:1px solid #ccc;
}
 
.tab ul li:hover,
.tab ul li.on{
    background:white;
}
 
.tab .conBox{
    width:1200px; 
    height:auto;    
    overflow:hidden;     
    background:white;
    display:none;
    /* valign:center; */
    text-align:left;
    border:1px solid #ccc;
    

}
 
.tab .conBox.on{
    display:block;
  /*   text-align:left; */
    font-color:black;
    font-size:17px;
    padding: 35px 70px 35px 20px;
    align:center;
}
 
 
table{
	width:80%;
	align:center;
	margin-left:auto;
	margin-right: auto;
	float:center;
}
 
div .div {	
	width:100%;
	align:center;
	margin:auto;
	background-color:#cccff;
}


.tg{
	valign:middle;
	text-align:center;
	padding:30px;
	margin:auto;
	border:1px solid;
	border-collapse:collapse
}



a{
	font-color:black;
  
}

li a:hover {
	font-color:black;
 	background-color: white;
}

.menu a{cursor:pointer;}
.menu .hide{display:none;}

.hidden{
 	display:none;
}


</style>
<script src="/project/resources/js/jquery.min.js"></script>
<script type="text/javascript">

	function popup(){
/* 		windowm.open('carlife.action','_blank','toolbar=0,location=0,status=1,width=670,height=700,top=5,left=50'); */
		
		var url= "carlife.action";    //팝업창 페이지 URL
		var winWidth = 1000;
	    var winHeight = 700;
	    var popupOption= "width="+winWidth+", height="+winHeight;    //팝업창 옵션(optoin)
	    
		window.open(url,"",popupOption);
	}
		
	

	$(function(){
        $(".tab ul li").click(function(){ 
            $(".tab ul li").removeClass('on');
            $(".tab .conBox").removeClass('on');
            
            $(this).addClass('on');
            
          //  alert($(this)); Obeject obeject
            
            $("#"+$(this).data('id')).addClass('on');
            
          //  alert("#"+$(this).data('id')); //#con2
        });
    });
	
	
</script>
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
    
</head>
<body>

    <!-- <section>
    	<div class="container"></div>
    </section> -->
    
    
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
            <h1 class="mb-3 bread"><font color="#000000;">멤버십 가입</font></h1>
          </div>
        </div>
      </div>
    </section> 
        
<br/><br/><br/>

<div class="container div">

<h3><span style="font-weight:bold">멤버십 이용안내</span></h3>
<p align="center">
<span style="color:red; font-size:20px">T멤버십 카드 종류 및 이용안내</span><br/>
<span style="color:black;font-size:35px; font-weight:bold">	급이 다른 IT 텔레콤만의 혜택</span><br/>
	
<span style="font-size:15px">다양한 제휴사의 할인 혜택을 sk 텔레콤 t멤버십 카드 한 장으로 누려보세요.</span>
</p>

<br/><br/>

<table style="border:1px solid">
	<tr style="border:1px solid">
	<td>
		<img src="/project/resources/images/tmem/yap81.png" usemap="#buttonmap" />
		<map name="buttonmap" >
			<area shape="rect" coords="611,225, 738, 265" href="appcard.action" >
			<area shape="rect" coords="750, 225, 978, 265"  href="" onClick="popup()">
		</map>	
	</td>
	</tr>
	
	<tr style="border:1px solid">
	<td align="center">
	<img src="/project/resources/images/tmem/oo1.png" />
	<img src="/project/resources/images/tmem/oobar101.png" usemap="#goapp"/>
	<map name="goapp" >
			<area shape="rect" coords="750,15, 879, 48" href="tmem.action" >
	</map>
	</td>
	</tr>
</table>

<br/><br/>


	<div class="tab div">
	    <ul>
	        <li data-id="con1" class="on"><img src="/project/resources/images/tmem/website.png"/>&nbsp;&nbsp;&nbsp;웹사이트</li>
	        <li data-id="con2"><img src="/project/resources/images/tmem/mobileapp.png" />&nbsp;&nbsp;&nbsp;모바일 앱</li>
	        <li data-id="con3"><img src="/project/resources/images/tmem/servicecenter.png" />&nbsp;&nbsp;&nbsp;고객센터</li>
	        <li data-id="con4"><img src="/project/resources/images/tmem/pmap.png" />&nbsp;&nbsp;&nbsp;즉시 발급점</li>
	    </ul>
	   <br/><br/>
	   
	    <div id="con1" class="conBox on">
	   	 <h3 class="hidden">웹사이트</h3>
	   	 - 모바일 카드는 신청 즉시 발급해 드리며, 플라스틱 카드를 신청하신 경우 약 2주 후 수령 가능합니다.
		<br/> - 신청경로 :<a href="tmem.action" > tmembership.tworld.co.kr</a>
		<br/>- 멤버십 가입 &gt; 멤버십 카드 신청/변경
	 		 <a href="appcard.action" >카드 신청하기</a>
		 </div>
	   
	    <div id="con2" class="conBox">
	    <h3 class="hidden">모바일 앱</h3>
	       - T멤버십 애플리케이션을 통해 카드 발급 신청을 하실 경우 모바일카드는 신청 즉시 발급해 드리며, 
	   <br/>&nbsp; 플라스틱 카드를 신청하신 경우 약 2주 후 수령 가능합니다. 	
		<br/>- 신청경로 : 마이페이지 > 설정 > T멤버십 신청/변경
		<!-- <br/><img src="/project/resources/images/tmem/appdownbtn.png" /> -->
	    </div>
	    
	    <div id="con3" class="conBox">
	    <h3 class="hidden">고객센터</h3>
	       - 모바일 카드는 신청 즉시 발급해 드리며, 플라스틱 카드를 신청하신 경우 약 2주 후 수령 가능합니다.
		 <br/>- 간편한 휴대폰인증(M고객센터)을 통해 가입 신청 가능합니다.
		 <br/>- SK텔레콤 휴대폰에서 지역번호 없이 114(무료), 일반전화 1599-0011(유료)
	    </div>

		<div id="con4" class="conBox">
		<h3 class="hidden">즉시 발급점</h3>
	       	  - 휴대폰이 본인 명의가 아닐 경우 멤버십카드 발급이 불가합니다.
		 <br/>- 결제기능 및 멤버십 더블 혜택이 있는 멤버십카드는 즉시발급 영업점 및 고객센터를 통한 신청이 불가합니다.
		 <br/>- 모바일 카드의 경우 신청 즉시 애플리케이션을 통해 발급, 플라스틱 카드의 경우 카드 즉시 발급점을 통해 
		 <br/>- 바로 발급받아 사용 가능합니다. 
		<!-- <br/> <img src="/project/resources/images/tmem/pmapbtn.png" /> -->
	    </div>
	    
</div> <!-- tab  -->
	
	<br/><br/>
	<img src="/project/resources/images/tmem/joinnote.png"  />
	<br/><br/>

</div> <!-- container  -->


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