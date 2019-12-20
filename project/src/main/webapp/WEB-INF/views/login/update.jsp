<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    	function signOut(){
    		var f = document.userInfo;
    		var result = confirm("회원 탈퇴하면 남은 Point는 자동 소멸");
    		
    		alert(result);
    		
    		if(result){
    			f.action ="signout.action";
    			f.submit();
    		}else{
    			return ;
    		}
    	}
    
    	function changeInfo() {
    		var f = document.userInfo;
    		var pw = f.pw.value;
    		
    		if(pw==""){
    			alert("비밀번호 입력하세요");
    			return;
    		}
    		
    		f.action = "update_ok.action";
    		f.submit();
		}
    	
    </script>
    
  </head>
  <body>

	  <jsp:include page="../header.jsp"/>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/회원정보.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>로그인 <i class="ion-ios-arrow-forward"></i></span>
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
          
          		<form action=""  name="userInfo" method="post">
          		<div align="center" style="width: 70%; text-align: left; padding-left: 25%;" >
				  <div class="form-group">
				    <h4><label for="InputEmail1">아이디(Phone)</label></h4>
				    <label for="">${dto.getPhone() }</label>
				  </div>
				  
				  <div class="form-group">
				    <h4><label for="InputPassword1">비밀번호</label></h4>
				    <input type="password" class="form-control" name="pw" id="exampleInputPassword1" placeholder="Password">
				  </div>
				  
				  <div class="form-group">
				    <h4><label for="InputEmail1">이메일</label></h4>
				    <input type="email" class="form-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" value="${dto.getEmail() }">
				  </div>
			
				  <div class="form-group">
				    <h4><label for="exampleInputEmail1">이름</label></h4>
				    <input type="text" class="form-control" name="name" id="exampleInputEmail1" aria-describedby="emailHelp" value="${dto.getName() }">
				  </div>
				  
				  <div class="form-group">
				    <h4><label for="exampleInputEmail1">생년월일</label></h4>
				    <label for="">${dto.getBirth() }</label>
				 
				  </div>
				  
				  <div class="form-group">
				    <h4><label for="exampleInputEmail1">포인트</label></h4>
				    <label for=""><fmt:formatNumber value="${dto.getPoint() }"/>점</label>
				  </div>
				  
				  <div>
				  	<input type="hidden" name="phone"  value="${dto.getPhone() }">
				  	<input type="hidden" name="point" value="${dto.getPoint() }">
				  </div>
				  <div align="center">
				  <button  type="button" onclick="changeInfo();" class="btn btn-primary">수정</button>
				  <button  type="button" onclick="signOut();" class="btn btn-primary">회원탈퇴</button>
				  </div>
				</div>
				</form>
				
          </div>
        </div>
        
      </div>
    </section>

    
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