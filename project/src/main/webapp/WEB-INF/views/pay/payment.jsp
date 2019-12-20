<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
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
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    
	<script type="text/javascript">
		
		window.onload = function(){
			$("#proCount").val(1);
			$("#point").val(0);
			var price = ${dto.getPrice() };
			$("#price").empty();
			$("#price").append(price);
			$("#price").val(price);
		}
		
		$(document).ready(function(){
			
			$("#proCount").click(function(){
				if($("#proCount").val()<1) $("#proCount").val(1);
				var price = ${dto.getPrice() };
				$.ajax({
					url:"calculate.action",
					dataType:"text",
					data:{
						count:$("#proCount").val(),
						price:price
					},type:"POST",
					success:function(args){
						$("#price").empty();
						$("#price").append(args);
						$("#price").val(args);
					},error:function(){
						alert("error");
					}
				});
			});
			
			$("#point").keyup(function(){
				if($("#point").val()<0) {
					$("#point").val(0);
				}else if($("#point").val() > ${mdto.getPoint() }) {
					$("#point").val(${mdto.getPoint() });
				}
				var price = $("#price").val();
				var point = $("#point").val();
				
				$("#price").empty();
				$("#price").append(price-point);
			});
		});

		
		function pay(phone,name,subject,price,point,tmemberGrade,proCount) {
			
			var f = document.myform;
			
			var phone = f.phone.value;
			var name = f.name.value;
			var subject = f.subject.value;
			var point = f.point.value;
			var tmemberGrade = f.tmemberGrade.value;
			var pro_num = f.pro_num.value;
			var paid = "paid";
			var pro_type = f.type.value;
			var proCount = f.proCount.value;
			var price = (f.price.value*proCount)-point;
			
			location.href="<%=cp %>/pay1.action?phone="+phone+"&name="+name+"&subject="+subject+"&point="+point
					+"&price="+price+"&tmemberGrade="+tmemberGrade+"&pro_count="+proCount
					+"&pro_num="+pro_num+"&paid="+paid+"&pro_type="+pro_type;
		}
		
		window.onload = function(){
			$("#proCount").val(1);
			$("#point").val(0);
			var price = ${dto.getPrice() };
			$("#price").empty();
			$("#price").append(price);
			$("#price").val(price);
		}
	
		$(document).ready(function(){
			
			$("#proCount").click(function(){
				if($("#proCount").val()<1) $("#proCount").val(1);
				var price = ${dto.getPrice() };
				$.ajax({
					url:"calculate.action",
					dataType:"text",
					data:{
						count:$("#proCount").val(),
						price:price
					},type:"POST",
					success:function(args){
						$("#price").empty();
						$("#price").append(args);
						$("#price").val(args);
					},error:function(){
						alert("error");
					}
				});
			});
			
			$("#point").keyup(function(){
				if($("#point").val()<0) {
					$("#point").val(0);
				}else if($("#point").val() > ${mdto.getPoint() }) {
					$("#point").val(${mdto.getPoint() });
				}
				var price = $("#price").val();
				var point = $("#point").val();
				
				$("#price").empty();
				$("#price").append(price-point);
			});

			/* 
			//구매
			$("#pay").click(function(){
				$.ajax({
					url:"pay.action",
					dataType:"text",
					data:{
						point: $("#point").val(),
						pro_num: $("#pro_num").val(),
						pro_count: $("#proCount").val(),
						price: $("#price").val()-$("#point").val(),
						paid:"paid",
						pro_type:$("#type").val(),
						subject:$("#subject").val()
					},type:"POST",
					success:function(args){
						location.href="payView.action";
					},error:function(){
						alert("pay error");
					}
				});
			});
			 */
			
			//장바구니
			$("#bag").click(function(){
				$.ajax({
					url:"pay.action",
					dataType:"text",
					data:{
						pro_num: $("#pro_num").val(),
						pro_count: 1,
						price: ${dto.getPrice() },
						point: $("#point").val(),
						paid:"unpaid",
						pro_type:$("#type").val()
					},type:"POST",
					success:function(args){
						location.href="bagView.action";
					},
					error:function(request,status,error){
						alert("bag error");
					    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					   }
				});
			});
		});
		
	</script>
    
  </head>
  <body style="background-color: #6b6060;"> <!-- style="background-color: #6b6060" -->
  
  <jsp:include page="../header.jsp"/>
  
  
  	<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/결제.png');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs"><span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
          	<span>결제 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-3 bread">결제 </h1>
          </div>
        </div>
      </div>
    </section>
    <br><br>
    
<form name="myform" method="post">
<table width="1300" style="margin: auto;">
<tr valign="top" style="padding-top: 10px;">
	<td>
		<h2 style="color: #ffffff;">주문자 정보</h2><br>
		<table style="width: 600px; color: #ffffff;">
		<tr>
			<td height="40">아이디</td>
			<td style="background-color: #847979; padding-left: 10px;">${mdto.getPhone() }</td>
		</tr>
		<tr height="20"><td></td></tr>
		<tr>
			<td>이름</td>
			<td style="background-color: #847979; padding-left: 10px;">${mdto.getName() }</td>
		</tr>
		<tr height="20"><td></td></tr>
		<tr>
			<td>생년월일</td>
			<td style="background-color: #847979; padding-left: 10px;">${mdto.getBirth() }</td>
		</tr>
		<tr height="20"><td></td></tr>
		<tr>
			<td>이메일</td>
			<td style="background-color: #847979; padding-left: 10px;">${mdto.getEmail() }</td>
		</tr>
		<tr height="20"><td></td></tr>
		<tr>
			<td>등급</td>
			<td style="background-color: #847979; padding-left: 10px;">${mdto.getTmemberGrade() }</td>
		</tr>
		<tr height="20"><td></td></tr>
		<tr>
			<td>보유포인트</td>
			<td style="background-color: #847979; padding-left: 10px;"><fmt:formatNumber value="${mdto.getPoint() }"/></td>
		</tr>
		</table>
	</td>
	<td width="20">
	</td>
	<td>
		<h2 style="color: #ffffff;">고객님의 주문 정보</h2><br>
		<table style="width: 600px; background-color: #ffffff;">
			<tr style="width: 600px;">
				<td style="width: 400px;padding-top: 30px;padding-left: 20px;font-size: 25pt;">${dto.getSubject() }</td>
				<td align="right" valign="bottom" style="padding-left: 20px;padding-right: 20px;"><fmt:formatNumber value="${dto.getPrice() }"/>원</td>
			</tr>
			<tr><td colspan="2" style="padding-left: 20px;padding-right: 20px;"><hr color="#e6e6e6"></td></tr>
			<tr>
				<td style="width: 300px; padding-left: 20px;">수량</td>
				<td align="right" style="padding-left: 20px;padding-right: 20px;"><input type="number" id="proCount"></td>
			</tr>
			<tr><td colspan="2" style="padding-left: 20px;padding-right: 20px;"><hr color="#e6e6e6"></td></tr>
			<tr>
				<td style="width: 300px; padding-left: 20px;">포인트</td>
				<td align="right" style="padding-right: 20px;">
				-&nbsp;&nbsp;<input type="text" name="point" id="point">
				</td>
			</tr>
			<tr><td colspan="2" style="padding-left: 20px;padding-right: 20px;"><hr color="#e6e6e6"></td></tr>
			<!-- 
			<tr>
				<td style="width: 300px; padding-left: 20px;">배송</td>
				<td align="right" style="padding-left: 20px;padding-right: 20px;">기본배송료 : 2500원</td>
			</tr>
			<tr><td colspan="2" style="padding-left: 20px;padding-right: 20px;"><hr color="#e6e6e6"></td></tr>
			 -->
			<tr>
				<td colspan="2" align="right" style="padding-right: 20px;">최종 주문가격</td>
			</tr>
			<tr>
				<td colspan="2" align="right" style="padding-right: 20px;"><h1><label id="price"></label>원</h1><br><br></td>
			</tr>
			<tr>
				<td style="width: 300px; padding-left: 20px;" colspan="2"><input type="radio" style="padding: 10px;" checked="checked">온라인결제 결제</td>
			</tr>
			<tr><td colspan="2" height="10"></td></tr>
			<!-- 
			<tr>
				<td colspan="2" style="padding-left: 20px; padding-right: 20px; background-color: #FAFAEA; font-size: 18px;">
				<b>구매</b> 버튼을 클릭하시면 신용카드 결제창이 나타나 결제를<br>진행하실 수 있습니다.</td>
			</tr>
			 -->
			<tr><td colspan="2" height="10"></td></tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" id="pro_num" name="pro_num" value="${dto.getNum() }">
					<input type="hidden" id="type" name="type" value="${type }">
					<input type="hidden" name="phone" value="${mdto.getPhone() }">
					<input type="hidden" name="name" value="${mdto.getName() }">
					<input type="hidden" name="subject" value="${dto.getSubject() }">
					<input type="hidden" name="price" value="${dto.getPrice() }">
					<input type="hidden" name="tmemberGrade" value="${mdto.getTmemberGrade() }">
					<!-- <button type="button" class="btn btn-primary" id="pay">구매</button> -->
					<input type="button" style="width: 560px; height: 50px;" class="btn btn-primary" onclick="pay('${phone }','${name }','${subject }','${price }','${point }','${tmemberGrade }','${proCount }');" value="구매"><br>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" style="width: 560px; height: 50px;" class="btn btn-primary" id="bag">장바구니</button>
				</td>
			</tr>
			<tr><td colspan="2" height="30"></td></tr>
		</table>
	</td>
</tr>
</table>
</form>

	<br><br>
		
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