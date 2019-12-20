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
		<td class="titleSub" onclick="location.href='/project/s_vis_cou.action';">리필쿠폰</td>
		<td class="titleSubck" onclick="location.href='/project/s_vis_memup.action';"><font color="#ffffff">IT멤버십 업그레이드</font></td>
		
	</tr>
</table>
<br/><br/>


<table width="1100" style="margin: auto;">

<tr>
	<td width="400">
	<h2>T멤버십<br/>
	<b>업그레이드</b></h2><br/><br/>
	<font style="font-size: 12px;">
	IT멤버십 등급 업그레이드의 상세 적용 조건은<br/>
	'IT멤버십 바로가기(아래 버튼)' 페이지에서<br/>
	확인하실 수 있습니다.</font><br/><br/>
	<img src="/project/resources/images/event/나의멤버십확인.png" width="195" height="52" alt=""/><br/>
	<img src="/project/resources/images/event/멤버십바로가기.png" width="196" height="52" alt=""/></td>
	<td>
	
	<table width="700" border="1" height="500">
	<tr class="bor" align="center">
		<td rowspan="2" class="bor bort borl">
		<b>연간누계 납부금액</b>
		</td>
		<td rowspan="2" class="bor bort">
		<b>일반고객</b>
		</td>
		<td colspan="2" class="bort borr">
		<b>장기가입고객</b>
		</td>
	</tr>
	<tr class="bor" align="center">
		<td>
		<b>2~5년</b>
		</td>	
		<td class="borr">
		<b>5년 이상</b>
		</td>
	</tr>
	<tr align="center">
		<td class="bor borl">
		90만원 이상 ~
		</td>
		<td rowspan="2" class="bor">
		Gold
		</td>
		<td class="bor">
		VIP
		</td>
		<td rowspan="2" class="bor borr">
		VIP
		</td>
	</tr>
	<tr class="bor" align="center">
		<td class="borl">
		60만원 이상 ~ 90만원 미만
		</td>
		<td rowspan="2">
		Gold
		</td>
	</tr>
	<tr class="bor" align="center">
		<td class="bor borl">
		48만원 이상 ~ 60만원 미만
		</td>
		<td rowspan="3" class="bor">
		Silver
		</td>
		<td rowspan="2" class="bor borr">
		Gold
		</td>
	</tr>
	<tr class="bor" align="center">
		<td class="borl">
		36만원 이상 ~ 48만원 미만
		</td>
		<td rowspan="2">
		Silver
		</td>
	</tr>
	<tr class="bor" align="center">
		<td class="borl">
		36만원 미만
		</td>
		<td class="borl">
		Silver
		</td>
	</tr>
	</table>
	
	</td>
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