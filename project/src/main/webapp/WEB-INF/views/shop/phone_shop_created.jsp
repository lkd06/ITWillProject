<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>2조 통신사 프로젝트</title>
    <link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">
    
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
		
		function sendIt(){
			
			var f = document.myForm;
			
			str = f.subject.value;
			str = str.trim();
			if(!str){
				alert("상품명을 입력해주세요");
				f.subject.focus();
				return;
			}
			f.subject.value = str;
			
			
			str = f.price.value;
			str = str.trim();
			if(!str){
				alert("가격을 입력해주세요");
				f.price.focus();
				return;
			}
			f.price.value = str;
			
			
			str = f.content.value;
			str = str.trim();
			if(!str){
				alert("내용을 입력해주세요");
				f.content.focus();
				return;
			}
			f.content.value = str;
			
			/* 
			str = f.upload.value;
			str = str.trim();
			if(!str){
				alert("파일을 선택해주세요");
				f.upload.focus();
				return;
			}
			f.upload.value = str;
			 */
			
			f.action = "<%=cp %>/phone_shop_created_ok.action";
			f.submit();
		}
		
	</script>
	
</head>
<body>

	<jsp:include page="../header.jsp"/>

    <section class="hero-wrap hero-wrap-2 js-fullheight" style=" background-image: url('/project/resources/images/아이폰11Pro.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>다이렉트 샵 <i class="ion-ios-arrow-forward"></i></span> 
	          	<span><a href="phone_shop_list.action">휴대폰 <i class="ion-ios-arrow-forward"></i></a></span>
          	</p>
            <h1 class="mb-3 bread">상품 등록</h1>
          </div>
        </div>
      </div>
    </section>
	
    <section class="ftco-section testimony-section ftco-no-pt ftco-no-pb">
      <div class="container">
      	<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
            
            <br><br>
          	<form name="myForm" method="post" enctype="multipart/form-data">
				   
				  <div align="left" style="width: 800px; padding-left: 25%;">
				    <h3><label>상품명</label></h3>
				    <input type="tel" class="form-control" name="subject">
				  </div>
				  <br>
				  
				  <div align="left" style="width: 800px; padding-left: 25%;">
				    <h3><label for="exampleInputEmail1">가격</label></h3>
				    <input type="text" class="form-control" name="price">
				  </div>
				  <br>
				  
				  <div align="left" style="width: 800px; padding-left: 25%;">
				    <h3><label for="exampleInputEmail1">내용</label></h3>
				    <textarea rows="30" cols="65" class="boxTA" style="height: 200px;" name="content"></textarea>
				  </div>
				  <br>
				  
				  <div align="left" style="width: 800px; padding-left: 25%;">
				    <h3><label for="exampleInputEmail1">파일</label></h3>
				    <input type="file" class="form-control" name="upload">
				  </div>
				  <br>
				   
				  <input type="button" class="btn btn-primary" onclick="sendIt();" value="상품등록">
				</form>
          </div>
        </div>
      </div>
    </section>
	
	
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