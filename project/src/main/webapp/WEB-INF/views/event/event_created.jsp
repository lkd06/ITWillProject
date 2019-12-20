<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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
            <h1 class="mb-3 bread">이벤트</h1>
          </div>
        </div>
      </div>
    </section>
	
<br/><br/>
<!-- 상단제목 -->
<table width="1100" style="margin: auto;">
<tr style="height: 90px;">
	<td style="font-size: 40px; font-weight: bold; color: #333333;">어떤 이벤트를 만들어볼까요?</td>
</tr>
<tr>
	<td style="font-size: 25px; padding-left: 15px;">
		이벤트 글쓰기
	</td>
</tr>
</table>


<!-- 본문내용 -->
<form action="event_created_ok.action" method="post" enctype="multipart/form-data">
<table width="1100" style="margin: auto;" border="0">
<tr><td bgcolor="#ea002c" colspan="4"></td></tr>
<tr style="height: 10px;"><td colspan="4"></td></tr>
<tr>
	<td style="font-size: 30px; color: #333333; width: 150px; border-right: 1px solid #e6e6e6" align="center">
		<b>구&nbsp;&nbsp;분</b>
	</td>
	<td style="font-size: 25px; padding-left: 15px; width: 250px;">
		<input type="radio" name="category" value="진행중인 이벤트">&nbsp;&nbsp;진행중인 이벤트
	</td>
	<td style="font-size: 25px; padding-left: 15px; width: 250px;">
		<input type="radio" name="category" value="지난 이벤트">&nbsp;&nbsp;지난 이벤트
	</td>
</tr>

<tr height="15"><td colspan="4"></td></tr>
<tr><td style="border-bottom: 1px solid #e6e6e6;" colspan="4"></td></tr>
<tr height="15"><td colspan="4"></td></tr>

<tr>
	<td style="font-size: 30px; color: #333333; width: 150px; border-right: 1px solid #e6e6e6" align="center">
		<b>날&nbsp;&nbsp;짜</b>
	</td>
	<td style="font-size: 25px; padding-left: 15px; width: 475px;" colspan="2">
	시작일 : <input type="date" name="startDay" value="시작일">
	</td>
	<td style="font-size: 25px; padding-left: 15px; width: 475px;" colspan="2">
	마감일 : <input type="date" name="endDay" value="마감일">
	</td>
</tr>

<tr height="15"><td colspan="4"></td></tr>
<tr><td style="border-bottom: 1px solid #e6e6e6;" colspan="5"></td></tr>
<tr height="15"><td colspan="4"></td></tr>

<tr>
	<td style="font-size: 30px; color: #333333; width: 150px; border-right: 1px solid #e6e6e6" align="center">
		<b>제&nbsp;&nbsp;목</b>
	</td>
	<td colspan="4" style="padding-left: 15px;">
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
	<td colspan="4" style="padding-left: 15px;">
		<textarea rows="30" cols="100" class="boxTA" style="height: 500px; width: 900px;" name="content"></textarea>
	</td>
</tr>

<tr height="15"><td colspan="4"></td></tr>
<tr height="15"><td style="border-bottom: 1px solid #e6e6e6;" colspan="4"></td></tr>
<tr height="15"><td colspan="4"></td></tr>
<tr>
	<td colspan="4" style="padding-left: 400px;">
		본문[<b>제목</b>] 사진 - <input type="file" name="upload" value="subjectImageName">
	</td>
</tr>
<tr>
	<td colspan="4" style="padding-left: 400px;">
		본문[<b>내용</b>] 사진 - <input type="file" name="upload2" value="contentImageName">
	</td>
</tr>
<tr>
	<td align="center" colspan="4">
		<br>
		<input type="button" class="btn btn-primary" style="width: 200px; height: 50px; font-size: 20px;" 
		value="리스트" onclick="javascript:location.href='event_list.action';">&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary" style="width: 200px; height: 50px; font-size: 20px;">글올리기</button>
	</td>
</tr>
</table>

</form>
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="/project/resources/js/google-map.js"></script>
  <script src="/project/resources/js/main.js"></script>
    
</body>
</html>