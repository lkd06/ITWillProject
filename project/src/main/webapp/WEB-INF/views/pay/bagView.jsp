<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>2조 통신사 프로젝트</title>
    <link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">
    <script src="/project/resources/js/jquery.min.js"></script> 
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	<style>
		.bagbtn{
		  background-color: #c9c9c9;
		  border: none;
		  color: white;
		  padding: 15px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  font-size: 12px;
		  margin: 2px 2px;
		  cursor: pointer;
		  border-radius: 8px;
		
		}
	</style> 

<script type="text/javascript">
	
	$(document).ready(function(){
		$("#order").click(function(){
			
			if(${empty phone }){
				alert("로그인 화면으로");
				return "redirect:/";
			}
			
			var num = ${pdto.pro_num };
			var type = ${pdto.pro_type };
			window.location="payment.action?pro_num="+num+"&pro_type="+type;
		});
	});
	
</script>
</head>
<body>


<jsp:include page="../header.jsp"/>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/장바구니.png');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>결제 <i class="ion-ios-arrow-forward"></i></span>
          	</p>
            <h1 class="mb-3 bread">장바구니</h1>
          </div>
        </div>
      </div>
    </section>
    <br><br>
    
	<div class="container" style="margin: auto;">
		<div class="container div">
		<h1><b>장바구니</b></h1>
		<br>
		
	    <table style="height: auto;">
	    	<tr style="border-bottom: 1px solid; text-align:center; font-weight:bold;size:35px;">
	    		<td style="width:200px;">상품</td>
	    		<td style="width:400px;">상품명</td>
	    		<td style="width:200px">상품종류</td>
	    		<!-- <td style="width:100px">수량</td> -->
	    		<td style="width:200px">가격</td>
	    		<td style="width:150px">구매일</td>
	    		<td style="width:250px">상품정보</td>
	    		<td style="width:250px">주문 / 삭제</td>
	    	</tr>
	    	
	    	<c:forEach var="pdto" items="${buyList }">
	    
		    	<tr style="border-bottom:1px solid #c9c9c9; padding:10px; text-align:center; ">
		    	
		    		<td>
				    	<c:if test="${pdto.pro_type=='acshop' }">
				    	  	<img src="/project/resources/images/ac_shop/${pdto.imageName }" style="width:100px;height:100px;float:left;vertical-align:middle;padding-left: 20px;"/>
				    	</c:if>
				    	<c:if test="${pdto.pro_type=='pshop' }">
				    	  	<img src="/project/resources/images/phone_shop/${pdto.imageName }" style="width:100px;height:100px;float:left;vertical-align:middle;padding-left: 20px;"/>
				    	</c:if>
		    		</td>
		    		<td>${pdto.subject }</td>
		    		<td>
			    		<c:if test="${pdto.pro_type=='acshop'}">
			    			액세서리   		
			    		</c:if>
			    		<c:if test="${pdto.pro_type=='pshop'}">
			    			핸드폰   		
			    		</c:if>
		    		</td>
		    		<%-- <td>${pdto.pro_count }개</td> --%>
		    		<td><fmt:formatNumber value="${pdto.price }"/>원</td>
		    		<td>${pdto.pay_day }</td>
		    		<td>
		    			<a href="product.action?type=${pdto.pro_type }&num=${pdto.pro_num }">상품정보 보기</a>
		    		</td>
		    		<td>
				    	<input type="hidden" name="pro_num" id="pro_num"value="${pdto.pro_num }" />
						<!-- <input type="button" value="구매" class="bagbtn" id="order"> -->
				    	<input type="button" value="주문하기" class="bagbtn" onclick="location.href='payment.action?pro_num=${pdto.pro_num }&pro_type=${pdto.pro_type }'" />
				    	<input type="button" value="삭제하기" class="bagbtn"  onclick="location.href='deletebaginfo.action?pro_num=${pdto.pro_num }'" />
		    		</td>
		    	</tr>
	    	</c:forEach>
	    </table>
	    <br><br><br>
	    </div>
    </div>
    
    <jsp:include page="../footer.jsp"/>
    
</body>
</html>