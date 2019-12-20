<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="com.exe.dto.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>3조 통신사 프로젝트</title>

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

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
var win_set = function(){
	document_height = $(document).height();
	document_scrollTop = $(document).scrollTop(); 
	window_height = $(window).height();
	foots_height = $("#foots").height();
	gap = document_height - foots_height - window_height; 
	bottom = document_scrollTop - gap ; 

	if(document_scrollTop > gap){
		$(".menu").css("bottom", bottom+"px");
	}else{
		$(".menu").css("bottom","0");
	}
}
  
$(document).ready(function(){
	win_set();
});
$(window).resize(function(){
	win_set();
});
$(window).scroll(function (){
	win_set();
});
</script>
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
       	<span><a href="event_list.action">이벤트 <i class="ion-ios-arrow-forward"></i></a></span>
      	</p>
        <h1 class="mb-3 bread">이벤트 상세보기</h1>
      </div>
    </div>
  </div>
</section>
<br><br>

<form name="myform">
<table width="1300" border="0" style="margin: auto;">
<tr>
	<td colspan="3">
		<h2><b>${dto.category }</b></h2><br><hr>
	</td>
</tr>
<tr>
	<td width="900">
		<img src="/project/resources/images/event/${dto.contentImageName }" width="100%">
	</td>
	<td width="50"></td>
	<td width="300" align="center" valign="top" style="padding-top: 30px;">
		<table border="1" width="300" height="300">
			<tr valign="top">
				<td style="padding: 30px; border: 1px solid #e6e6e6;">
					<h3><b>${dto.subject }</b></h3>
					${dto.content }<br><br>
					<img src="/project/resources/images/event/이벤트페이지.gif">&nbsp;&nbsp;${dto.startDay } ~ ${dto.endDay }
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td colspan="3"><hr></td>
</tr>
</table>
</form>
<br><br>


<table width="1300" style="margin: auto;">
<tr><td style="height: 1px; background-color: #7e7e7e;"></td></tr>
<tr>
	<td style="padding: 10px; font-size: 20px;">
		<b>[이전글]</b>&nbsp;&nbsp;:&nbsp;&nbsp; 
		<c:if test="${!empty preSubject }">
			<a href="/project/event_article.action?${params }&num=${preBoardNum }" style="color: #333333">${preSubject }</a>
		</c:if>
		<c:if test="${empty preSubject }">
			<font id="f">이전글이 없습니다.</font>
		</c:if>
	</td>
</tr>
<tr><td style="height: 1px; background-color: #e6e6e6;"></td></tr>
<tr>
	<td style="padding: 10px; font-size: 20px;">
		<b>[다음글]</b>&nbsp;&nbsp;:&nbsp;&nbsp;
		<c:if test="${!empty nextSubject }">
			<a href="/project/event_article.action?${params }&num=${nextBoardNum }" style="color: #333333">${nextSubject }</a>
		</c:if>
		<c:if test="${empty nextSubject }">
			<font id="f">다음글이 없습니다.</font>
		</c:if>
	</td>
</tr>
<tr><td style="height: 1px; background-color: #7e7e7e;"></td></tr>
<tr>
	<td colspan="3" align="center"><br>
		<input type="button" style="width: 150px; height: 80px; font-size: 30px;" value="목록" class="btn btn-primary" onclick="javascript:location.href='event_list.action?pageNum=${pageNum }';">
		<%MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
		if(dto==null){
		}else if(dto.getAdmin().equals("O")) {%>
		<input type="button" style="width: 150px; height: 80px; font-size: 30px;" value="삭제" class="btn btn-primary" onclick="javascript:location.href='event_deleted.action?num=${dto.num }&pageNum=${pageNum }';">
		<%} %>
	</td>
</tr>
</table>
<br>
<div align="right">
<a href="#" style="padding-right: 300px;">
<button class="btn btn-primary" >위로
</button>
</a>
</div>
<br><br>
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