<%@page import="java.util.Calendar"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	DecimalFormat df = new DecimalFormat("00");
	Calendar currentCalendar = Calendar.getInstance();

	//현재 날짜 구하기
	String strYear = Integer.toString(currentCalendar.get(Calendar.YEAR));
	String strMonth = df.format(currentCalendar.get(Calendar.MONTH) + 1);
	String strDay = df.format(currentCalendar.get(Calendar.DATE));
	String strDate = strYear + '/' + strMonth + '/' + strDay;
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>2조 통신사 프로젝트</title>
<link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">
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

<script type="text/javascript">
    
    	function  checkInfo() {
    		var f = document.userInfo;
    		var pw = f.pw.value;
    		
    		if(pw==""){
    			alert("비밀번호 입력");
    			return;
    		}
    		
    		f.action = "checkpw.action";
    		f.submit();
		}
    	
    </script>

<style type="text/css">
#a {
	color: #ffffff;
	float: left;
	width: 33%;
	height: 320px;
	font-size: 15pt;
	padding: 40px 30px 55px 40px;
}
</style>

</head>
<body>

	<jsp:include page="../header.jsp" />

	<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/회원정보.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> <span>로그인 <i class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">회원정보</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section services-section">

		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<form action="" name="userInfo" method="post">
						<div style="width: 100%;">
							<div id="a" style="background-color: #ea002c;" align="left">
								${dto.getName() }님 
								<font size="2pt">
								(${dto.getEmail() })<br>
								접속일 : <%=strDate %>
								</font>
								<hr>
								휴대폰<br> 
								<c:if test="${dto2 =='O'}">
									${dto.getPhone() }<br>
								</c:if>
								<c:if test="${dto2 =='X'}">
									<c:if test="${dto.getPhone().length()==11 }">
										${dto.getPhone().substring(0,3) }-${dto.getPhone().substring(3,7) }-${dto.getPhone().substring(7) }<br>
									</c:if>
									<c:if test="${dto.getPhone().length()!=11 }">
										${dto.getPhone() }<br>
									</c:if>
								</c:if> 
								
								<font size="2pt">(${dto.getName() })</font><br>
								<font size="3pt"><input type="password"  name="pw" id="exampleInputPassword1" placeholder="Password"></font>
								<button type="button" onclick="checkInfo();" class="btn btn-primary">확인</button>
								
							</div>

							<div id="a" style="background-color: #333333;" align="left">
								요금제<br> 
								<font size="4pt">- ${dto.getPriceName() }</font>
								<font size="2pt"><a href="list.action">&nbsp;&nbsp;(변경하기)</a></font>
								<hr>
								부가서비스
								<font size="2pt"><a href="service_list.action">&nbsp;&nbsp;(가입하기)</a></font><br>
								<c:forEach var="dto2" items="${lists }">
									<font size="4pt">- ${dto2.getName() } </font>
									<font size="2pt"><a href="deleteservice.action?servicename=${dto2.getServicename() }">&nbsp;&nbsp;(해지하기)
									</a></font>
									<br>
								</c:forEach>
							</div>
							
							<div id="a" style="background-color: #666666;" align="left">
								멤버십 포인트 <br>
								<br><hr>
								<div align="right">
									<font size="6pt;"><fmt:formatNumber value="${dto.getPoint() }"/>점</font>
								</div>
							</div>
						</div>

						<div>
							<input type="hidden" name="birth" value="${dto.getBirth() }">
							<input type="hidden" name="name" value="${dto.getName() }">
							<input type="hidden" name="email" value="${dto.getEmail() }">
							<input type="hidden" name="phone" value="${dto.getPhone() }">
							<input type="hidden" name="point" value="${dto.getPoint() }">
						</div>
					</form>
					
				</div>
			</div>
			
			<hr>
			
			<div>
				<div style="width: 40%; float: left; border-right: 1px solid #eaeaea;" align="center">
					<c:import url="/graphview.action" />
				</div>
				
				<div align="center">
					<c:import url="/paygraph.action"/>
				</div>
				
				<div align="right">
					<a href="bagView.action"><button type="button"  class="btn btn-primary">장바구니</button></a>
					<a href="payView.action"><button type="button"  class="btn btn-primary">결제내역</button></a>
				</div>
				
				
			</div>
		</div>
		
	
	</section>


	<jsp:include page="../footer.jsp" />

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


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