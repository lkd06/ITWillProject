<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String type = request.getParameter("pro_type");
	if(type=="pshop" || type.equals("pshop")){
		type = "phone_shop";
	}else if(type=="acshop" || type.equals("acshop")){
		type = "ac_shop";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>2조 통신사 프로젝트</title>
    <link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">
</head>
<body>

<jsp:include page="../header.jsp"/>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/결제.png');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>다이렉트 샵 <i class="ion-ios-arrow-forward"></i></span>
          	</p>
            <h1 class="mb-3 bread">결제완료</h1>
          </div>
        </div>
      </div>
    </section>
    <br><br>

<table width="700" style="margin: auto;">
<tr>
	<td align="center" colspan="2">
		<h1><b>결제 정보</b></h1>
	</td>
</tr>
<tr><td height="20" background="#ffffff" colspan="2"></td></td>
<tr>
	<td colspan="2" align="center">
	<img src="/project/resources/images/<%=type %>/${subject }.jpg" style="width: 300px; height: 300px;"><br><br>
	<h3>결제완료가 완료되었습니다.</h3>
	</td>
</tr>
<tr><td colspan="2"><hr color="#E6E6E6"></td></tr>
<tr>
	<td height="50">
		결제상품
	</td>
	<td align="right">
		${subject }
	</td>
</tr>
<tr>
	<td height="50">
		수량
	</td>
	<td align="right">
		${pro_count }개
	</td>
</tr>
<tr><td colspan="2"><hr color="#E6E6E6"></td></tr>
<tr>
	<td style="color: #333333; font-weight: bold; height: 50px;">
		결제금액
	</td>
	<td align="right">
		<font color="#FF0000"><b><fmt:formatNumber value="${price }"/></b></font>원
	</td>
</tr>
<tr><td colspan="2"><hr color="#E6E6E6"></td></tr>
<tr>
	<td height="50">
		구매자 이름
	</td>
	<td align="right">
		${name }
	</td>
</tr>
<tr>
	<td height="50">
		구매자 전화번호
	</td>
	<td align="right">
		${phone }
	</td>
</tr>
<tr>
	<td height="50">
		회원등급
	</td>
	<td align="right">
		${tmemberGrade }
	</td>
</tr>
<tr><td colspan="2"><hr color="#E6E6E6"></td></tr>
<tr>
	<td colspan="2" align="center">
		<a href="product.action?type=${pro_type }&num=${pro_num }"><font style="font-size: 20px; font-weight: bold;">상품정보보기</font></a>&nbsp;&nbsp;
		<a href="payView.action"><font style="font-size: 20px; font-weight: bold;">결제내역보기</font></a>
	</td>
</tr>
</table>

<br><br><br>
<jsp:include page="../footer.jsp"/>
    
</body>
</html>