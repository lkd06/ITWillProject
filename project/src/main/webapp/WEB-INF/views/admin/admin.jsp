<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>2조 통신사 프로젝트</title>
    <link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">
</head>
<body>

	<jsp:include page="../header.jsp"/>
	
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/관리자.png');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>관리자 페이지 <i class="ion-ios-arrow-forward"></i></span>
          	</p>
            <h1 class="mb-3 bread">관리자 페이지</h1>
          </div>
        </div>
      </div>
    </section>
	<br><br><br>
	
	
	<table width="1100" style="margin: auto;">
		<tr height="200px;">
			<td width="356" style="padding-left: 30px; padding-right: 30px; padding-top: 15px; border: 1px solid #333333" valign="top">
				<font size="6pt;">회원 관리</font>
				<br><hr/><br>
				<img src="/project/resources/images/event/자세히보기.png" width="104" height="42" style="cursor:pointer;" align="right" 
				onclick="javascript:location.href='/project/a_list.action';"/>
			</td>
			
			<td width="15" style="border-bottom: 1px solid #ffffff;"></td>
			
			<td width="356" style="padding-left: 30px; padding-right: 30px; padding-top: 15px; border: 1px solid #333333" valign="top">
			    <font size="6pt;">포인트 관리</font>
				<br><hr/><br>
				<img src="/project/resources/images/event/자세히보기.png" width="104" height="42" style="cursor:pointer;" align="right" 
				onclick="javascript:location.href='/project/a_point.action';"/>
			</td>
			
			<td width="15" style="border-bottom: 1px solid #ffffff;"></td>
			
			<td width="356" style="padding-left: 30px; padding-right: 30px; padding-top: 15px; border: 1px solid #333333" valign="top">
			 	<font size="6pt;">등급 관리</font>
				<br><hr/><br>
				<img src="/project/resources/images/event/자세히보기.png" width="104" height="42" style="cursor:pointer;" align="right" 
				onclick="javascript:location.href='/project/a_grade.action';"/>
			</td>
		</tr>
		
		<tr height="30px;"><td></td><td style="border-top: 1px solid #ffffff;"></td><td></td><td style="border-top: 1px solid #ffffff;"></td><td></td></tr>
		
		<tr height="200px;">
			<td width="356" style="padding-left: 30px; padding-right: 30px; padding-top: 15px; border: 1px solid #333333" valign="top">
				<font size="6pt;">카카오톡 채널관리</font>
				<br><hr/><br>
				<img src="/project/resources/images/event/자세히보기.png" width="104" height="42" style="cursor:pointer;" align="right" 
				 onclick="window.open('https://center-pf.kakao.com/_xlqQQT/chats?stay_signed_in=0');"/>
			</td>
			
			<td width="15" style="border-bottom: 1px solid #ffffff;"></td>
			
			<td width="356" style="padding-left: 30px; padding-right: 30px; padding-top: 15px; border: 1px solid #333333" valign="top">
			    <font size="6pt;">상품 관리</font>
				<br><hr/><br>
				<img src="/project/resources/images/event/자세히보기.png" width="104" height="42" style="cursor:pointer;" align="right" 
				onclick="javascript:location.href='/project/a_cart.action';"/>
			</td>
			
			<td width="15" style="border-bottom: 1px solid #ffffff;"></td>
			
			<!-- <td width="356" style="padding-left: 30px; padding-right: 30px; padding-top: 15px; border: 1px solid #333333" valign="top">
			 	<font size="6pt;">???? 관리</font>
				<br><hr/><br>
				<img src="/project/resources/images/event/자세히보기.png" width="104" height="42" style="cursor:pointer;" align="right" 
				onclick="javascript:location.href='/project/????.action';"/>
			</td> -->
		</tr>
	</table>
	<br><br><br>
	
	<jsp:include page="../footer.jsp"/>


</body>
</html>