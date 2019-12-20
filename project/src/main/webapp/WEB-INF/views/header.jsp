<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>2조 통신사 프로젝트</title>
    <link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">
    
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

    
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="/project/">IT<span>Telecom</span></a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="nav nav-tabs">
			  <li class="nav-item">
			    <a class="nav-link" href="/project/">메인</a>
			  </li>
			  
			  <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">상품서비스</a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="price.action">요금제</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="prize.action">결합상품</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="service_main.action">부가서비스</a>
			    </div>
			  </li>
			  
			  <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">다이렉트 샵</a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="phone_shop_list.action">휴대폰</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="ac_shop_list.action">액세서리</a>
			    </div>
			  </li>
			  
			  <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">멤버십</a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="tjoin.action">가입</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="tmem.action">혜택</a>
			    </div>
			  </li>
			  
			  <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">혜택/이벤트</a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="s_index.action">혜택/할인</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="event_list.action">이벤트</a>
			    </div>
			  </li>
			  
			  <li class="nav-item dropdown">
			    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">고객지원</a>
			    <div class="dropdown-menu">
			      <!-- <a class="dropdown-item" href=".action">매장찾기</a>
			      <div class="dropdown-divider"></div> -->
			      <a class="dropdown-item" href="qna_list.action">Q&A</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="noti_list.action">공지사항</a>
			    </div>
			  </li>
			  
			  <li style="width: 150px;">
			  </li>
			  
			  <li>
			  	<jsp:include page="kakao.jsp"/>
			  </li>
			</ul>
	      </div>
	    </div>
	  </nav>
    
  
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
  <script src="/project/resources/js/google-map.js"></script>
  <script src="/project/resources/js/main.js"></script>
    
</body>
</html>