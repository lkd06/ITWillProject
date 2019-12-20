<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

</head>
<body>

	<form action="login.action" method="post">
		Phone : <input type="text" name="phone" value="${phone }"> 
		PW: <input type="password" name="pw">
		<input type="submit" value="로그인">
		<a href="signup.action">회원가입</a>
	</form>

	 

	  

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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/project/resources/js/google-map.js"></script>
	<script src="/project/resources/js/main.js"></script>
</body>
</html>