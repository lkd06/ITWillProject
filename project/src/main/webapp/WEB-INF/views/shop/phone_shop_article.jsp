<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.exe.dto.MemberDTO"%>
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
<link rel="stylesheet" href="/project/resources/css/shop_phone.css">
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
   
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#order").click(function(){
			
			if(${empty phone }){
				alert("로그인 화면으로");
				return "redirect:/";
			}
			
			var num = ${dto.num };
			window.location="payment.action?pro_num="+num+"&pro_type=pshop";
		});
	});

</script>
</head>
<body style="background: #f8f8f9;">
    
	  <jsp:include page="../header.jsp"/>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/아이폰11Pro.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>다이렉트 샵 <i class="ion-ios-arrow-forward"></i></span> 
	          	<span><a href="phone_shop_list.action">휴대폰 <i class="ion-ios-arrow-forward"></i></a></span>
          	</p>
            <h1 class="mb-3 bread">상품 상세보기</h1>
          </div>
        </div>
      </div>
    </section>
    <br><br>
<br/><br/>

	<span id="result_text"></span>
	<form name="myform" method="post">
	<table style="margin: auto;" width="1200px;">
	<tr>
		<td valign="top" style="width: 600px; padding-top: 30px;">
			<img src="/project/resources/images/phone_shop/${dto.imageName }" style="width: 600px;">
		</td>
		<td valign="top" style="width: 600px; padding-top: 30px;">
			<table width="600">
				<tr>
					<td colspan="2" style="width: 200px; height: 60px; padding-left: 10px;">
						<h2>${dto.subject }</h2>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; height: 60px; padding-left: 10px;">
					출고가 
					</td>
					<td align="right" style="color: #333333; font-weight: bold;">
					<fmt:formatNumber value="${dto.price }"/>원
					</td>
				</tr>
				<tr>
					<td style="width: 100px; height: 60px; padding-left: 10px;">
					색상
					</td>
					<td>
						<input type="radio" name="color" value="레드와인" checked="checked" onclick="checkedValue();"/><font style="color: #FF0000; font-size: 30px;">●</font>&nbsp;&nbsp;
						<input type="radio" name="color" value="다크블랙"/><font style="color: #333333; font-size: 30px;">●</font>&nbsp;&nbsp;
						<input type="radio" name="color" value="그린핑크"/><font style="color: #FFC4FF; font-size: 30px;">●</font>&nbsp;&nbsp;
						<input type="radio" name="color" value="화이트옐로우"/><font style="color: #FFE400; font-size: 30px;">●</font>
						<span id="result1"></span><br/>
					</td>
				</tr>
				<tr>
					<td style="width: 100px; height: 60px; padding-left: 10px;">
					용량
					</td>
					<td>
						<select style="width: 500px; height: 50px;">
							<option>1G</option>
							<option>10G</option>
							<option>16G</option>
							<option>32G</option>
							<option>64G</option>
							<option>128G</option>
							<option>256G</option>
							<option>512G</option>
							<option>1T</option>
						</select>
					</td>
				</tr>
				<tr><td colspan="2"><hr color="#e6e6e6"></td></tr>
				<tr>
					<td style="width: 100px; height: 60px; padding-left: 10px;">
					가입유형
					</td>
					<td>
						<label>
							<input type="checkbox" name="join" checked="checked">&nbsp;&nbsp;<font>기기변경</font>
						</label>&nbsp;&nbsp;
						<label>
							<input type="checkbox" name="join">&nbsp;&nbsp;<font>번호이동</font>
						</label>&nbsp;&nbsp;
						<label>
							<input type="checkbox" name="join">&nbsp;&nbsp;<font>신규가입</font>
						</label>
					</td>
				</tr>
				<tr><td colspan="2"><hr color="#e6e6e6"></td></tr>
				<tr>
					<td style="width: 100px; height: 120px; padding-left: 10px;">
					이용방법
					</td>
					<td style="font-size: 17px;">
						<label>
							<input type="radio" name="month" id="(${dto.price }+(${dto.price }*3/100))/12" value="${priceDTO.getPrice() }*92/100" onclick="CheckChoice(this);">&nbsp;12개월 분할상환
						</label>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="month" id="(${dto.price }+(${dto.price }*3/100))/24" value="${priceDTO.getPrice() }*92/100" onclick="CheckChoice(this);">&nbsp;24개월 분할상환
						</label><br>
						<label>
							<input type="radio" name="month" id="(${dto.price }+(${dto.price }*3/100))/30" value="${priceDTO.getPrice() }*92/100" onclick="CheckChoice(this);">&nbsp;30개월 분할상환
						</label>
						<label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="month" id="${dto.price }" value="${priceDTO.getPrice() }" onclick="CheckChoice(this);">&nbsp;일시불 분할상환
						</label><br>
						<label>
							<input type="radio" name="month" disabled onclick="CheckChoice(this);">&nbsp;렌탈
						</label>
					</td>
				</tr>
				<tr><td colspan="2"><hr color="#e6e6e6"></td></tr>
				<tr>
					<td style="width: 100px; height: 60px; padding-left: 10px;">
					요금제
					</td>
					<td>
						<font style="color: #333333;">${priceDTO.getSubject() }</font><br>
						<font style="color: #333333; font-weight: bold;"><fmt:formatNumber value="${priceDTO.getPrice() }"/>원/월</font>
					</td>
				</tr>
				<tr><td colspan="2"><hr color="#e6e6e6"></td></tr>
				<%-- <tr>
					<td style="width: 100px; height: 150px; padding-left: 10px;">
					할인방법
					</td>
					<td>
						<label>
							<input type="radio" name="dc" id="0" value="${priceDTO.getPrice() }-(${priceDTO.getPrice() }*8/100)" onclick="CheckChoice(this);">&nbsp;12개월 요금할인
						</label><br>
						<label>
							<input type="radio" name="dc" id="0" value="${priceDTO.getPrice() }-(${priceDTO.getPrice() }*8/100)" onclick="CheckChoice(this);">&nbsp;24개월 할인요금
						</label><br>
						<label>
							<input type="radio" disabled name="dc" id="0" value="${priceDTO.getPrice() }" onclick="CheckChoice(this);" checked="checked">&nbsp;단말 할인
						</label><br>
					</td>
				</tr>
				<tr><td colspan="2"><hr color="#e6e6e6"></td></tr> --%>
			</table>
		</td>
	</tr>
	<tr>
		<td width="200" align="right" colspan="2">
			<a id="order" class="btn btn-primary" style="width: 150px; height: 50px; font-size: 20px;">주문하기</a>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="padding-left: 350px;">${dto.content }</td>
	</tr>
	<!-- <tr><td colspan="2"><br><hr color="#e6e6e6"><br><br></td></tr> -->
	</table>
	<br><br><br>
	<br><br><br>
	
	<!-- 하단 바 -->
	<table class="menu" style="color: #ffffff;" height="100">
		<tr align="center">
			<td rowspan="2" width="320"></td>
			<td width="200">
				월 단말 분할상환금
			</td>
			<td rowspan="2" class="bartd">
				+
			</td>
			<td width="200">
				월 통신요금
			</td>
			<td rowspan="2" class="bartd">
				=
			</td>
			<td colspan="2" width="200">
				월 예상 납부금액
			</td>
			<td>
				실제 구매금액
			</td>
			<td rowspan="2" width="300"></td>
		</tr>
		
		<tr>
			<td class="bottombartd">
				<input type="text" name="total" readonly onFocus="this.blur();" value="0" class="bottombarinput"> 원
			</td>	
			<td class="bottombartd">
				<input type="text" name="total2" readonly onFocus="this.blur();" value="0" class="bottombarinput"> 원
			</td>	
			<td class="bottombartd">
				<input type="text" name="total3" readonly onFocus="this.blur();" value="0" class="bottombarinput"> 원
			</td>	
			<td align="left" style="font-size: 10px;">
				<font style="color: #5AAEFF;">분할상환 수수료</font> 3%포함
			</td>
			<td class="bottombartd">
				<fmt:formatNumber value="${dto.price }"/>원
			</td>
		</tr>
	</table>
	</form>
	
	<!-- 유의사항 -->
	<table width="1100" border="0" style="margin: auto" id="foots">
	<tr>
		<td valign="top" class="bottomcon">
			<b>유의사항</b><br/><br/>
			<font style="font-size: 15px;">
			구매 시 유의사항</font>
		</td>
		<td class="bottomcon2">
			<b>구매 시 유의사항</b><br/><font style="font-size: 12px;">
			- <b>아이챌린지 호비 월정액</b> 상품이 2019년 6월 30일(일)에 종료될 예정입니다.<br/>
			&nbsp;&nbsp;7월 1일(월)부터 해당 상품의 신규가입이 중단되니 이용에 참고해주시기 바랍니다.<br/>
			&nbsp;&nbsp;내가고른패키지 혜택은 SK텔레콤에서 정한 상품 중 2개 이상을 이용해야만 받으실 수 있으며, 그 중 하나는 반드시 회사가 지정한 메인 상품을<br/> 
			&nbsp;&nbsp;선택하셔야 합니다.<br/>
			- <b>메인 상품</b>: 인공지능 TV B tv X NUGU, NUGU candle, 스마트플러그, 문 열림 센서, My Hero, FLO 월 300회 듣기 이용권, FLO 무제한 듣기 이용권<br/>
			- <b>제휴 상품</b>: 아이챌린지 호비 월정액, B tv 슈퍼키즈클럽 월정액 서비스<br/>
			- NUGU candle과 스마트플러그, 문 열림 센서, My Hero 상품은 T world 다이렉트에서 가입할 수 없으며, SK텔레콤 매장에서만 가입하실 수 있습니다.<br/>
			- 아이챌린지 월령 프로그램 상품의 경우 SK텔레콤 매장에서는 가입할 수 없으며, T world 다이렉트를 통해서만 가입하실 수 있습니다.<br/>
			- T world 다이렉트에서 구매할 경우, B tv X NUGU를 반드시 선택하셔야 합니다.<br/>
			- B tv X NUGU가 포함된 한 개 이상의 상품을 선택하여 전화로 가입 신청을 하실 수 있습니다.<br/>
			- 기가 인터넷 + B tv 프라임 이상 요금제(36개월 약정)의 신규 가입 고객님만 B tv x NUGU를 할인된 가격에 구매하실 수 있습니다.<br/>
			- 다른 상품으로 바꾸거나 약정 기간을 변경하면 B tv x NUGU 할인 혜택을 받으실 수 없습니다.<br/>
			- 상품에 대해 궁금한 사항은 1670-2001로 문의해 주시기 바랍니다.</font><br/><br/><br/>
		</td>
		</tr>
	</table>



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
<script src="/project/resources/js/jquery-1.7.2.min.js"></script>
<script src="/project/resources/js/shop_phone.js"></script>
    
  </body>
</html>