<%@page import="com.exe.dto.MemberDTO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
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
<title>2조 통신사 프로젝트</title>

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
	
	f.action = "/project/event_list.action";
	f.submit();
}

</script>

 <script>
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
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/할인2.png');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
          	<span>혜택/이벤트 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">이벤트</h1>
          </div>
        </div>
      </div>
    </section>
<br><br>
<form action="" name="searchForm" method="post">
<table width="1100" border="0" style="margin: auto;">
<tr>
	<td>
		<h1>진행중인 이벤트</h1><br>
	</td>
</tr>
<tr>
	<td>
	총 <font color="red">${dataCount }</font> 건
	</td>
	<td align="right">
		<select name="category" style="height: 50px; width: 150px;">
					<option value="">선택하세요</option>
					<option value="진행중인 이벤트">진행중인 이벤트</option>
					<option value="지난 이벤트">지난 이벤트</option>
				</select>&nbsp;&nbsp;
				<input type="button" value="검색" class="btn btn-primary py-3 px-5" onclick="searchData();">
				<br/><br/>
	</td>
</tr>
<%	
	MemberDTO dto = (MemberDTO)session.getAttribute("memDTO");
	if(dto==null){
	} else if(dto.getAdmin().equals("O")) {
%>
<tr>
	<td align="right" colspan="2">
		<a href="event_created.action">
			<input type="button" value="상품 등록하기" class="btn btn-primary py-3 px-5">
		</a>
		<input type="hidden" name="searchKey" value="category">
	</td>
</tr>
<%} %>
</table>


<table width="1100" style="margin: auto;">
<c:forEach var="i" begin="1" end="10" step="1">
	<c:if test="${lists.size()>i-1 }">
	   	<c:if test="${i%2==1 }">
			<tr height="30px;"><td colspan="4" style="border-bottom: 1px solid #ffffff; border-top: 1px solid #ffffff;"></td></tr>
			<tr>
		</c:if>
			<td style="border: 1px solid #e6e6e6; width: 500">
				<a href="event_article.action?num=${lists.get(i-1).num }" title="${lists.get(i-1).subjectImageName }">
					<img src="/project/resources/images/event/${lists.get(i-1).subjectImageName }" width="540" height="250"><br>
				</a><br/>
				<a href="event_article.action?num=${lists.get(i-1).num }" 
				style="padding-left: 30px; color: #333333; font-size: 20px;"><b>${lists.get(i-1).subject }</b></a><br/>
				<b style="padding-left: 30px;">기간&nbsp;&nbsp; : &nbsp;&nbsp;</b>${lists.get(i-1).startDay }&nbsp;&nbsp; ~ &nbsp;&nbsp;${lists.get(i-1).endDay }<br><br>
				<input type="hidden" value="${lists.get(i-1).category }">
			</td>
			<td width="10" style="border-bottom: 1px solid #ffffff; border-top: 1px solid #ffffff;"></td>
		</c:if>
		<c:if test="${i%2==0 } || ${i%2==2 }">
			</tr>
	</c:if>
</c:forEach>
<tr>
	<td align="center" colspan="4" height="100">
		<c:if test="${dataCount!=0 }">
		${pageIndexList }
		</c:if>
		<c:if test="${dataCount==0 }">
		<font id="f" size="5">등록된 게시물이 없습니다.</font>
	</c:if>
	</td>
</tr>
</table>
</form>
<br><br><br><br>
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