<%@page import="com.exe.dto.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  </head>
  <body>
    
	  <jsp:include page="../header.jsp"/>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/apple Watch.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> <span>다이렉트 샵 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">액세서리</h1>
          </div>
        </div>
      </div>
    </section>
	
	
	<%-- <jsp:include page="image.jsp"/> --%>
	
    <section class="ftco-section">
    	<div class="container">
    		<div style="padding-left: 80%;">
	    		<%
	    		MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
          		String message = (String)session.getAttribute("message");
          		if(dto==null){
          		}else {
	    			if(dto.getAdmin().equals("O")) {
	    		%>
	    		<a href="ac_shop_created.action">
	    			<input type="submit" value="상품 등록하기" class="btn btn-primary py-3 px-5">
	    		</a>
	    		<%}} %>
    		</div>
    		<br><br><br><br>
    		
    		<table>
    		<c:forEach var="i" begin="1" end="12" step="1">
				<div class="row">
				    <div class="col-md-3">
						<c:if test="${lists.size()>i-1 }">
				    	<c:if test="${i%4==1 }">
							<tr>
						</c:if>
							<td width="200" align="center" style="padding: 10px;">
					    		<div class="car-wrap ftco-animate">
					    			<div class="img d-flex align-items-end">
					    				<a href="ac_shop_article.action?num=${lists.get(i-1).num }" title="${lists.get(i-1).imageName }">
											<img src="/project/resources/images/ac_shop/${lists.get(i-1).imageName }" width="255" height="250">
										</a>
				    				</div>
				    				<div class="text p-4 text-center">
				    					<h2 class="mb-0">${lists.get(i-1).subject }</h2>
				    					<span><fmt:formatNumber value="${lists.get(i-1).price }"/>원</span>
				    					<a href="ac_shop_article.action?num=${lists.get(i-1).num }" class="btn btn-black btn-outline-black mr-1">상세보기</a>
				    				</div>
				    			</div>
				    		</td>
	    				</c:if>
	    				<c:if test="${i%4==0 } || ${i%4==4 }">
							</tr><tr height="20px;"><td colspan="4"></td></tr>
						</c:if>
				    </div>
				</div>
    		</c:forEach>
    		</table>
    		
    		
    		<div class="row mt-5">
	          	<div class="col text-center">
	            	<div class="block-27">
						<c:if test="${dataCount!=0 }">
							${pageIndexList }
						</c:if>
						<c:if test="${dataCount==0 }">
							등록된 게시물이 없습니다.
						</c:if>
	            	</div>
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