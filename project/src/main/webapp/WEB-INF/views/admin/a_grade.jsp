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
	          	<span><a href="admin.action">관리자 페이지 <i class="ion-ios-arrow-forward"></i></a></span>
          	</p>
            <h1 class="mb-3 bread">등급 관리</h1>
          </div>
        </div>
      </div>
    </section>
	<br><br><br>
	
	
	<table width="1000" style="margin: auto;">
		<tr><td bgcolor="#ea002c" colspan="7"></td></tr>
		<tr style="height: 10px;"><td colspan="7"></td></tr>
		
		<tr align="center" style="font-weight: bold;">
			<td width="160">아이디</td>
			<td width="110">이름</td>
			<td width="70">관리자</td>
			<td width="150">생일</td>
			<td width="110">등급</td>
			<td width="100">포인트</td>
			<td width="400">등급 변경</td>
		</tr>
		
		<tr style="height: 10px;"><td colspan="7"></td></tr>
		<tr><td bgcolor="#e7e7e7" colspan="7"></td></tr>
		
		<c:forEach var="dto" items="${lists }">
			<tr style="border-bottom: 1px solid #e7e7e7; height: 50px;">
				<td align="center">${dto.phone }</td>
				<td align="center">${dto.name }</td>
				<td align="center">${dto.admin }</td>
				<td align="center">${dto.birth }</td>
				<td align="center">${dto.tmemberGrade }</td>
				<td align="center">${dto.point }</td>
				<td align="center">
					<input type="button" onclick="javascript:location.href='/project/a_grade_ok.action?phone=${dto.phone }&tmemberGrade=Bronze';" class="btn btn-primary py-3 px-4" value="Bronze">
					<input type="button" onclick="javascript:location.href='/project/a_grade_ok.action?phone=${dto.phone }&tmemberGrade=Silver';" class="btn btn-primary py-3 px-4" value="Silver">
					<input type="button" onclick="javascript:location.href='/project/a_grade_ok.action?phone=${dto.phone }&tmemberGrade=Gold';" class="btn btn-primary py-3 px-4" value="Gold">
					<input type="button" onclick="javascript:location.href='/project/a_grade_ok.action?phone=${dto.phone }&tmemberGrade=VIP';" class="btn btn-primary py-3 px-4" value="VIP">
				</td>
			</tr>
		</c:forEach>
		
		<tr><td bgcolor="#ea002c" colspan="7"></td></tr>
	</table>
	<br><br><br>
	
	<jsp:include page="../footer.jsp"/>


</body>
</html>