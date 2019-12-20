<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp= request.getContextPath();
	String list= request.getParameter("list");
	int num = Integer.parseInt(request.getParameter("num"));
	
%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<html>
  <head>
    <title>2조 통신사 프로젝트</title>
    <link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
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
    <link rel="stylesheet" href="/project/resources/js/bootstrap.min.js">
    <link rel="stylesheet" href="/project/resources/css/manycotton.css">
<style type="text/css">
#btn2 {
	width: 280px;
	height: 40px;
	font-size:16px;
	font-family: 'Nanum Gothic';
	color: white;
	line-height: 40px;
	text-align: center;
	background: #f76252;
	border: solid 1px grey;
	border-radius: 20px;
}

.tg{
	height:100px;
	valign:middle;
	text-align:left;
	padding:30px;
	margin:auto;
	border-bottom:1px solid #e0e0e0;
	border-collapse:collapse
}

.tab{
	color:#000000;
	font-size:10pt;
    width:800px;
    height:500px;
    overflow:hidden;
}
 
.tab ul{
    padding:0;
    margin:0;
    list-style:none;
    width:100%:
    height:auto;
    overflow:hidden;
}
 
.tab ul li{
    display:inline-block;
    width:20%;
    float:left;
    line-height:40px;
    text-align:center;
    cursor:pointer;
}
 
.tab ul li:hover,
.tab ul li.on{
    background:#e0e0e0;
}
 
.tab .conBox{
    width:100%;
    height:auto;
    overflow:hidden;
    min-height:200px;
    display:none;
    text-align:left;
}
 
.tab .conBox.on{
    display:block;
}
</style>
  </head>

  <body>
	  
    <jsp:include page="../header.jsp"/>
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/부가.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
						<span>부가서비스 <i class="ion-ios-arrow-forward"></i></span>
						<span><a href="service_list.action">리스트 <i class="ion-ios-arrow-forward"></i></a></span>
					</p>
					<h1 class="mb-3 bread">자세히보기</h1>
				</div>
			</div>
		</div>
	</section>
    
    <!-- 본문시작 -->
    <div style="height: 300px; color: #ffffff; background-color: #4e67b5; width: 100%; font-size: 30pt;">
	   	<div class="container" style="height: 300px; padding-top: 20px;" align="center">
			<table style="width: 90%;">
				<tr align="center">
					<td style="text-align: left; color: #ffffff;">
						<font size="6pt" style="font-weight: bold;">${dto.name }</font><br>
						<font size="2pt">${hMap.get('content1') }</font>
					</td>
					<td width="20%"></td>
					<td style="text-align: left;">
						<div style="border: 1px solid #e0e0e0; background-color: #ffffff; width: 338px; height: 250px;  color: #000000; padding-left: 20px; padding-top: 30px;">
							<font size="3pt;">이용요금(부가세포함)</font><br>
							
							<c:if test="${dto.price==0 }">
								<font size="5pt;" style="font-weight: bold;">무료</font><br><br>
							</c:if>
							<c:if test="${dto.price!=0 }">
								<font size="5pt;" style="font-weight: bold;"><fmt:formatNumber value="${dto.price }" pattern="#,##0" />원</font><br><br>
							</c:if>
							
							<div id="btn2">				
								<a href="serviceinsert.action?num=${dto.num }" style="color: #ffffff">가입</a>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<br><br>
	
	
	<div class="container" style="height: auto; color: #000000;"  align="center" >
		<%if(num==1 || num==3 || num==4 || num==6){ %>
			${hMap.get('image0') }<br>
		<%}else if(num==2 || num==5){ %>
			${hMap.get('image4') }<br>
		<%} %>
		<br><br>
		<%if(num==1 || num==2 || num==4 || num==5){ %>
		${hMap.get('content2') }<br>
		
		<br><br>
		
		<div style="width: 70%; background-color: #fafafa; padding-left: 10px;" align="left">
			<table style="border-bottom: 0; color: #000000; width: 100%;">
				<tr style="border-bottom: 0;"><td colspan="2">${hMap.get('info1') }</td></tr>
				<tr style="height: 100px; border-bottom: 0;">
					<td>${hMap.get('image1') }</td>
					<td>${hMap.get('content3') }<br></td>
				</tr>
				
				<tr style="border-bottom: 0;"><td colspan="2">${hMap.get('info2') }</td></tr>
				<tr style="height: 100px; border-bottom: 0;">
					<td>${hMap.get('image2') }</td>
					<td>${hMap.get('content4') }<br></td>
				</tr>
				
				<tr style="border-bottom: 0;"><td colspan="2">${hMap.get('info3') }</td></tr>
				<tr style="height: 100px; border-bottom: 0;">
					<td>${hMap.get('image3') }</td>
					<td>${hMap.get('content5') }<br></td>
				</tr>
			</table>
		</div>
		<br><br><br>
		
		
		${hMap.get('content6') }<br><Br>
		
		<font size="5">이용요금</font><br><br>
		<font size="5" color="#4e68b5">월 <fmt:formatNumber value="${dto.price }" pattern="#,##0" />원(부가세 포함)<br><br></font>
		<div style="padding-left: 20%;" align="left">
			<font size="2pt">${hMap.get('content7') }</font>
		</div>
		<%} %>
		<br>
		<hr>
		
		<div class="tab">
		    <ul>
		        <li data-id="con1" class="on">가입/해지 유의사항</li>
		        <li data-id="con2">이용 요금 관련</li>
		    </ul>
		    
		    <div id="con1" class="conBox on" align="left">
		    	<br>
				 ▶ wavve앱의 LIVE, VOD (방송/영화) 사용 데이터만 전용 데이터에 포함됩니다.<br>
 				 - wavve 앱 다운로드 및 업그레이드, wavve 서비스 내 메뉴/이미지, 외부 웹페이지에서 제공되는 서비스(TV컷, 광고, 이벤트 등)는 전용데이터에 포함되지 않습니다.<br>
				 - 가입 회선으로 테더링 이용 시 wavve 전용 데이터 이용이 제한될 수 있습니다.<br><br>

				 ▶ 가입 및 해지<br>
				 - SK텔레콤 대리점/지점, T world, 고객센터를 통해서 가입/해지 가능<br>
				 - 가입 신청 후, 발송되는 문자에 첨부된 URL (http://member.wavve.co.kr/skt)을 통해 wavve 서비스에 접속하여 인증 완료 필수 (미 완료 시 혜택 미 제공, 월 정액 미 청구)<br><br>
				 ▶ wavve 앤 데이터 서비스에서 제공하는 콘텐츠 및 전용 데이터 혜택은 본 서비스를 가입한 회선 및 ID에 한하여 적용<br>
				   (타 회선에 해당 ID로 접속하여도 이용 불가)<br><br>
				 ▶ 이동전화 회선의 이용 정지 시에도 wavve 앤 데이터 상품 월정액 부과<br><br>
				 ▶ wavve 앤 데이터 상품은 콘텐츠 제공사와의 제휴 계약 변경/종료에 따라 월정액이 변경되거나 이용이 중단될 수 있으며, 이 경우 T world를 통해 사전 고지 예정입니다.<br>
				 ▶ 3개월 100원 프로모션 혜택 안내<br>
				 - 대상고객 : ’19년 5월 10일 ~ 12월 31일 내에 ‘wavve 앤 데이터’ 가입한 고객<br>
				 - 혜택 : 가입한 월을 포함하여 최대 3개월간 매월 100원에 이용가능 (9,800원 할인)<br>
 			 	   예) 5월 10일에 가입한 고객은 7월 31일까지 매월 100원에 이용 가능
		    </div>
		    <div id="con2" class="conBox">
		   		<br>
				 ▶ 월 중 가입/해지 시에는 이용 일수에 비례하여 일할 과금<br>
				 ▶ 3개월간 100원/월 프로모션은 ‘wavve 앤 데이터’에 처음 가입 고객님께, 최초 가입 시점부터 최대 3개월간 적용<br><br>
				 ▶ 3개월 100원 프로모션 적용기간이 지나면 자동으로 월정액 정상 과금 (정상 과금 이전에 안내 문자 발송)<br><br>
				 ▶ wavve에서 이미 유료 이용권을 사용하는 경우 ‘wavve 앤 데이터’가 중복 가입 되지 않음<br><br>
				 ▶ ‘wavve 앤 데이터’의 무료/할인 혜택은 wavve앱 또는 웹에서 제공하는 다른 할인 프로모션과 중복 제공되지 않음<br><br>
				 ▶ 5GX 플래티넘 / 5GX 프라임 / T플랜 맥스 / T플랜 스페셜 요금제 가입에 따른 혜택으로, ‘wavve 앤 데이터’ 무료혜택을 3개월 이상 받은 이후에는 3개월 100원 프로모션이 적용되지 않음<br><br>
				 ▶ 5GX 플래티넘 / 5GX 프라임 / T플랜 맥스 / T플랜 스페셜 요금제 가입에 따른 혜택으로 ‘wavve 앤 데이터’를 무료로 이용하던 중에 요금제를 변경하면 ‘wavve 앤 데이터’ 월정액(9,900원)이 정상 청구됨<br><br>
				 ▶ 5GX 프라임 / T플랜 스페셜 요금제 가입 고객은 FLO 앤 데이터 / wavve 앤 데이터 / wavve 콘텐츠 팩 중 한 서비스만 무료 적용되며, 두 서비스를 가입한 경우, ‘월 청구금액이 더 큰 서비스’가 자동 무료적용. ‘월청구금액이 더 적은 서비스’는 가입 후 최대 3개월 내에는 100원/월 프로모션이 적용된 후 정상 과금 됨    
		    </div>
		</div>
		<br><br>

	</div>
	
	<!-- 본문끝 -->
	
	<jsp:include page="../footer.jsp"/> 

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


	<!-- tab -->
	<script>
    $(function(){
        $(".tab ul li").click(function(){ 
            $(".tab ul li").removeClass('on');
            $(".tab .conBox").removeClass('on');
            $(this).addClass('on');
            $("#"+$(this).data('id')).addClass('on');
        });
    });
	</script>

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
  <script src="/project/resources/js/list.js"></script>
  </body>
</html>