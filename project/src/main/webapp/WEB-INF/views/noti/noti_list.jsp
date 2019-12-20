<%@page import="com.exe.dto.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		function searchData() {
			
			var f = document.searchForm;
			
			f.action = "/project/noti_list.action";
			f.submit();
		}
		
		var array=["red","#FF5E00","yellow","green","blue","#5F00FF","#000000"];
		var cnt=0;
		window.onload=function(){
			ff();
		}
		
		function ff(){
			if(cnt==7) cnt=0;
			f.style.color=array[cnt++];
			setTimeout("ff()",50);
		}
		
	</script>
  </head>
<body>
	
	<jsp:include page="../header.jsp"/>
	
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/Galaxy.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>고객지원 <i class="ion-ios-arrow-forward"></i></span> 
	          	<span><a href="noti_list.action">공지사항 <i class="ion-ios-arrow-forward"></i></a></span>
          	</p>
            <h1 class="mb-3 bread">공지사항</h1>
          </div>
        </div>
      </div>
    </section>
	
	
<form action="" name="searchForm" method="post">
	<table width="1100" style="margin: auto;">
		<tr height="30px;"></tr>
		<tr style="height: 90px;">
		    <td colspan="2" style="font-size: 40px; font-weight: bold; color: #333333;">공지사항을 확인해보세요</td>
		</tr>
		<tr>
			<td>
				<font style="font-size: 30px;"><b>구분</b>&nbsp;&nbsp;</font>
				
				<select name="category" style="height: 50px; width: 150px;">
					<option value="">선택하세요</option>
					<option value="요금제">요금제</option>
					<option value="다이렉트 샵">다이렉트 샵</option>
					<option value="멤버십">멤버십</option>
					<option value="기타">기타</option>
				</select>&nbsp;&nbsp;
				
				<input type="button" value="검색" class="btn btn-primary py-3 px-5" onclick="searchData();">
				<br/><br/>
			</td>
			<%
				MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
				String message = (String)session.getAttribute("message");
				if(dto==null){
				}else {
					if(dto.getAdmin().equals("O")) {
			%>
			<td align="right" valign="top" style="padding-top: 5px;">
				<input type="button" value="공지하기" class="btn btn-primary py-3 px-5" onclick="location.href='/project/noti_created.action';">
			</td>
			<%}} %>
		</tr>
	</table>
	
	<input type="hidden" name="searchKey" value="category">
	
	<table width="1100" style="margin: auto;">
		<tr><td bgcolor="#ea002c" colspan="5"></td></tr>
		<tr style="height: 10px;"><td colspan="5"></td></tr>
		
		<tr align="center" style="font-weight: bold;">
			<td>번호</td>
			<td width="150">구분</td>
			<td>제목</td>
			<td width="200">등록일</td>
			<td width="100">조회수</td>
		</tr>
		
		<tr style="height: 10px;"><td colspan="5"></td></tr>
		<tr><td bgcolor="#e6e6e6" colspan="5"></td></tr>
		<tr style="height: 10px;"><td colspan="5"></td></tr>
		
		<c:forEach var="dto" items="${lists }">
			<tr style="border-bottom: 1px solid #e6e6e6; height: 50px;">
				<td align="center">${dto.num}</td>
				<td align="center">${dto.category }</td>
				<td style="padding-left: 30px;">
					<a href="${articleUrl}&num=${dto.num}">${dto.subject }</a>
				</td>
				<td align="center">${dto.created }</td>
				<td align="center">${dto.hitCount }</td>
			</tr>
		</c:forEach>
		
		<tr style="height: 10px;"><td colspan="5"></td></tr>
		
		<tr align="center">
			<td colspan="5"><br/>
				<c:if test="${dataCount!=0 }">
					${pageIndexList }
				</c:if>
				<c:if test="${dataCount==0 }">
					<font id="f" size="5">등록된 게시물이 없습니다.</font>
				</c:if>
			</td>
		</tr>
	</table>
	<br><br><br>
</form>
	
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