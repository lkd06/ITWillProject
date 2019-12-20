<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	          	<span><a href="admin.action">관리자 페이지 <i class="ion-ios-arrow-forward"></i></a></span>
          	</p>
            <h1 class="mb-3 bread">상품 관리</h1>
          </div>
        </div>
      </div>
    </section>
	<br><br><br>
	
	
	<table width="1000" style="margin: auto;">
		<tr><td bgcolor="#ea002c" colspan="7"></td></tr>
		<tr style="height: 10px;"><td colspan="7"></td></tr>
		
		<tr align="center" style="font-weight: bold;">
			<td width="150">아이디(Phone)</td>
			<td width="150">등급</td>
			<td width="150">상품</td>
			<td width="250">상품명</td>
			<td width="100">수량</td>
			<td width="150">구매일<br>(YY/MM/DD)</td>
			<td width="200">가격</td>
		</tr>
		
		<tr style="height: 10px;"><td colspan="7"></td></tr>
		<tr><td bgcolor="#e6e6e6" style="height: 5px;" colspan="7"></td></tr>
		
		<c:forEach var="dto" items="${lists }">
			<tr style="border-bottom: 1px solid #e6e6e6; height: 60px;">
				<td align="center">${dto.phone }</td>
				<td align="center">${dto.grade }</td>
				<td align="center">
					<c:if test="${dto.pro_type=='acshop' }">
						액세서리
					</c:if>
					<c:if test="${dto.pro_type=='pshop' }">
						휴대폰
					</c:if>
				</td>
				<td align="center">${dto.subject }</td>
				<td align="center">${dto.pro_count }개</td>
				<td align="center">${dto.pay_day }</td>
				<td align="center"><fmt:formatNumber value="${dto.price }"/>원</td>
			</tr>
		</c:forEach>
		
		<tr><td bgcolor="#ea002c" colspan="7"></td></tr>
	</table>
	<br><br><br>
	
	<jsp:include page="../footer.jsp"/>


</body>
</html>