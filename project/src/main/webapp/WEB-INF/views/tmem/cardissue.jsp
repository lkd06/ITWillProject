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
<title>Insert title here</title>

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
   
   
   <style>
   
   span{
   font-size:15px;
   font-weight:bold;
	vertical-align:top;
	text-align:center;
	float:center;
   }
   
   td{
   padding:25px;
   margin:5px;
   width:50%;
   table-layout: fixed;
   }
   
   .yap{
   color:#333;
   font-size:24px;
   }
   </style> 
   
<script type="text/javascript">

function requestcard(){
	
	alert("재발급 신청이 완료되었습니다.");

	window.location.assign("/project");
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
	          	<span><a href="/project/tmem.action"><font color="#000000;">멤버십 혜택 </font><i class="ion-ios-arrow-forward"></i></a></span>
          	</p>
            <h1 class="mb-3 bread"><font color="#000000;">제휴사 혜택 </font></h1>
          </div>
        </div>
      </div>
    </section>
  
  
  <div class="container div">
	
		<br/><br/>
<div id="container">	
	 
			<img src="/project/resources/images/tmem/cardissue1.png"/>			
		 
			<span style="font-size:25px;font-weight:bold;">&nbsp;&nbsp;카드 발급 회선 선택 </span>	
		
		<br/>
		<table style="align:center;border:1px solid #ddd;width:100%;height:300px;">
		<tr>	
			<td>
			<span>고객명</span> <br/><br/>
			<span class="yap" >${mdto.getName() }</span> <br/>
			<br/><br/>
			<span >연락처</span><br/><br/>
			<span class="yap"> ${mdto.getPhone()}</span> <br/>
			</td>
			
			<td>
			<span>카드번호</span><br/><br/>
			<span class="yap"> ${mdto.getCardnum()}</span> <br/>
			 <br/><br/>
			 <span>등급</span><br/><br/>
			<span class="yap" > ${mdto.getTmemberGrade()}</span>
			</td>
		
		</tr>
			
			
	</table>
	<br/><br/>	
		 <img src="/project/resources/images/tmem/cardreissue.png" style="float:center; align:center;" onclick="javascript:requestcard();">	
			
  </div>
	 
</div>  
  
  
  
  
  
  
  
  
  
  
  
  
  
        
<br/><br/><br/>

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
  <script src="/project/resources/js/main.js"></script>
</body>
</html>