<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <link rel="stylesheet" href="/project/resources/css/event.css">
  </head>
  <body>
    
 <jsp:include page="../header.jsp"/>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/할인2.png');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>혜택/이벤트 <i class="ion-ios-arrow-forward"></i></span> 
	          	<span><a href="s_index.action">혜택/할인 <i class="ion-ios-arrow-forward"></i></a></span>
          	</p>
            <h1 class="mb-3 bread">요금할인</h1>
          </div>
        </div>
      </div>
    </section>
	 <br/><br/>
	  
<table width="1100" border="0" style="margin: auto;">
  <tr style="height: 90px;">
      <td colspan="3" class="tablesub">장기고객 혜택</td>
    </tr>
	<tr align="center" valign="middle" class="titletr">
		<td class="titleSubck" onclick="location.href='/project/s_vis_cou.action';"><font color="#ffffff">리필쿠폰</font></td>
		<td class="titleSub" onclick="location.href='/project/s_vis_memup.action';">IT멤버십 업그레이드</td>
	</tr>
</table>
<br/><br/>


<table width="1100" border="0" style="margin: auto;">
<tr>
	<td>
	<h2>기본제공<br/>
	데이터를 2배로<br/>
	리필할 수 있는<br/>
	<b>무료쿠폰</b></h2><br/><br/>
	<font style="font-size: 12px;">
	- 음성 선택 시 20% 리필 (요금제에 따라 기본제공<br/>
	&nbsp;&nbsp;음성통화량 대신 영상/부가통화 리필 가능)<br/>
	- IT플랜 라지/패밀리/Data 인피니티/0플랜 라지 가입<br/>
	&nbsp;&nbsp;고객이 데이터 리필을 선택 시, 별도의 기준을<br/>
	&nbsp;&nbsp;적용합니다.<br/>
	&nbsp;&nbsp;(라지 : 15GB, 패밀리 : 20GB, Data 인피니티는<br/>
	&nbsp;&nbsp;데이터 무제한으로 데이터 리필 이용 불가, 0플랜<br/>
	&nbsp;&nbsp;라지 : 20GB)</font>
	<br/>
	<img src="/project/resources/images/event/리필하기.png" width="104" height="52" alt=""/></td>
	<td align="center">
    <img src="/project/resources/images/event/무료쿠폰.png" width="786" height="376" alt=""/></td>
</tr>
</table>
<br/>


<div align="right">
<a href="#" style="padding-right: 400px;">
<button class="btn btn-primary" >위로
</button>
</a>
</div>


<br/><br/><br/>
<jsp:include page="../footer.jsp"/>


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