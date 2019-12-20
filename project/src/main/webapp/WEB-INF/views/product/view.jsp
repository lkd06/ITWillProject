<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp= request.getContextPath();
	String pageNum = request.getParameter("pageNum");
	String content2 = request.getParameter("content2");
	String subject= request.getParameter("subject");
	
%>
<style>
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
  </head>
  <body>
	  
	<jsp:include page="../header.jsp"/>
	
    
    <section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/요금제.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>상품서비스 <i class="ion-ios-arrow-forward"></i></span>
	          	<span><a href="price.action">요금제 <i class="ion-ios-arrow-forward"></i></a></span>
	          	<span><a href="list.action">요금제 리스트 <i class="ion-ios-arrow-forward"></i></a></span>
          	</p>
            <h1 class="mb-3 bread">요금제 상세보기</h1>
          </div>
        </div>
      </div>
    </section>
    
    
    
    
    <!-- 본문시작 -->
    <div style="background-color: #CD0E2C; width: 100%; height: 300px; color: #ffffff;  font-size: 30pt;">
	   	<div class="container" style="height: 300px; padding-top: 20px;">
			<table>
				<tr>
					<td style="color: #ffffff;">
						<font size="3pt">${hMap.get('content1') }</font><br>
						<font size="6pt" style="font-weight: bold;">${dto.subject }</font><br>
						<font size="2pt">${hMap.get('content2') }</font>
					</td>
					<td width="10%"></td>
					<td>
						<div style="border: 1px solid #e0e0e0; background-color: #ffffff; width: 338px; height: 250px; margin-left: 65%; color: #000000; padding-left: 20px; padding-top: 30px;">
							<font size="3pt;">월정액(부가세포함)</font><br>
							<font size="5pt;" style="font-weight: bold;"><fmt:formatNumber value="${dto.price }" pattern="#,##0" />원</font><br>
							<c:if test="${memDTO!=null }">
								<div id="btn2">
									<a href="updatepriceN.action?num=${dto.getNum()}" style="color: #ffffff">요금제 변경</a>
								</div>
							</c:if>
							<font size="2pt;"><br>데이터&emsp;&emsp;&emsp; ${dto.gb }</font><br>
							<font size="2pt;">음성&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp; ${dto.tel }</font><br>
							<font size="2pt;">문자&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp; ${dto.content }</font><br>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<br><br><br><br>
	
	
	<div class="container" style="height: auto;"  align="center" >
	<br>
		<div>
			<div>
				<font size="5pt;" style="color: #000000;" >${hMap.get('content3') }</font><br>
				<font size="2pt;" color="#000000" style="text-align: center;">${hMap.get('info1') }</font><br>
			</div>
			
			<%if(subject.equals("T플랜맥스") || subject.equals("T플랜스페셜") || content2.equals("0플랜") || content2.equals("히어로") || content2.equals("5GX")){%>
			${hMap.get('image') }<br>
			
			<div style="width: 800px; height:auto; background-color: #fafafa;" align="left">
			<br>
				<font size="5pt;"style="color: #000000;">${hMap.get('content4') }</font>
				<table style="width: 800px;">
					<tr class="tg">
						<td><img src="/project/resources/data/vip.png"/></td>				
						<td>${hMap.get('vip') }</td>
					</tr>
					<tr class="tg">
						<td><img src="/project/resources/data/free.png"/></td>
						<td>${hMap.get('free') }</td>
					</tr>
					<tr class="tg">
						<td><img src="/project/resources/data/flo.png"/></td>
						<td>${hMap.get('flo') }</td>
					</tr>
				</table>
			</div> 
			<%}%>
			
			
			<div style="width: 800px; height:auto; background-color: #FAFAFA;" align="center">
				<br>
				<font style="font-weight: bold;" size="8pt;" color="#000000">${dto.gb }</font><br>
				<font size=5pt;>${hMap.get('content5') }</font>
				${hMap.get('image2') }
				<br><br><br><br>
			</div>
			
			<br><br>
			
			<%if(content2.equals("T플랜") || content2.equals("히어로")){%>
				<font size=5pt; color="#000000">음성/문자 알아보기</font>
				<br><br>
				<img src="/project/resources/data/sms.png"/><br>	
				<font size=5pt; color="#000000">
					${dto.tel }<br>
					부가통화300분<br>
					SMS/MMS 기본제공<br>
				</font>
			 <%}%>
			 
			 <br><br><br><br>
			
			
		</div>
		
		<hr>
		
		<div class="tab">
		    <ul>
		        <li data-id="con1" class="on">집전화, 이동전화 무제한</li>
		        <li data-id="con2">문자 기본제공</li>
		        <li data-id="con3">할인 제도</li>
		        <li data-id="con4">혜택 안내</li>
		        <li data-id="con5">기타</li>
		    </ul>
		    
		    <div id="con1" class="conBox on" align="left">
		    	<br>
				▶ 아래의 경우에 해당 시, 본 요금제의 이용을 제한할 수 있음<br>
				- 일 음성 통화량이 600분을 초과하는 횟수가 월 중 3회를 넘는 경우<br>
				- 당월 총 음성 통화량이 10,000분을 초과하는 경우<br>
				- 텔레마케팅 / 폰팅 등과 같이 음성통화를 광고/상업적 목적으로 이용하는 경우<br><br>
				
				▶ 이용 제한 시, 해당 회선에 SMS로 무료이용 중단을 통지하며, 이후 통화량은 종량 과금<br>
				   (단, 광고/상업적 목적의 이용 시 표준요금제로 자동 전환)<br><br>
				▶ 부가통화 및 영상통화<br>
				- 전국 대표번호(15XX, 16XX, 18XX 등), 개인번호서비스(050, 060 등), 0130, 011-200, 011-700, 지역번호+153/141/700 등의 통화 1초 이용 시 부가통화 제공량에서 1초 차감<br>
				- 단, 영상통화 (HD Voice 영상통화 포함) 1초 이용 시 부가통화 제공량에서 1.66초 차감<br>
		    </div>
		    
		    <div id="con2" class="conBox">
		   		<br>
		        ▶ SMS, MMS(텍스트형, 멀티미디어형)<br><br>
				▶ 아래의 경우 해당 시, 본 요금제 및 서비스 이용을 제한할 수 있음<br>
				- 일 사용량이 200건을 초과하는 횟수가 월 중 10회를 넘는 경우<br>
				- 광고성 스팸 메시지 발송과 같이 상업적 목적으로 이용하거나 물리적 장치 또는 자동발송 프로그램을 이용하는 경우<br><br>
				▶ 이용 제한 시, 해당 회선에 SMS로 무료이용 중단을 통지하며, 이후 통화량은 종량 과금<br>
				   (단, 광고/상업적 목적의 이용 시 표준요금제로 자동 전환)<br><br>
				▶ 상업용 목적이 아닌 생계형 다량 문자 이용자(택배업 종사자, 콜택시 운전원, 신용카드 배달원, 대리운전업 종사자 등의 개인)의 경우 별도 확인 절차를 통해 상기 기준 예외 적용 가능<br>
				- 신청방법 : SK텔레콤 고객센터 및 지점 등을 통해 재직 증명서 및 사원증 사본 제출 후 별도 신청, 6개월마다 갱신 필요<br><br>
				▶ 상기 조건 외, 방송통신위원회 스팸방지 종합대책에 의거 일 최대 발송량은 500건으로 제한<br>
		    </div>
		    
		    <div id="con3" class="conBox">
		    	<br>
				▶ 온가족플랜/온가족프리 중복가입 가능<br>
				   (가족 그룹 회선 수 인정, 기존 온가족무료 고객도 가입 가능)<br><br>
				▶ 우량고객 요금할인 중복 가입 불가<br><br>
				▶ 선택 약정할인제도 가입 가능<br><br>
				▶ T끼리 온가족할인제도 가입 가능<br>
				   (가족 합산 연수 20년 이상 시 월정액의 10%, 30년 이상 시 월정액의 30% 할인 적용)<br><br>
				▶ 요금약정할인제도의 경우, 가입 가능(기 가입 고객을 대상으로 요금약정 가입 상태 유지)하나 요금할인은 제공되지 않음<br>
				   (T플랜은 요금할인이 기 반영된 순액형 요금제이기 때문)<br><br>
				▶ 장기 가입 할인 및 레인보우포인트 적립 제외<br>
		    </div>
		    
		    <div id="con4" class="conBox">
		    	<br>
				① T멤버십 VIP 제공<br>
				▶ T플랜 맥스 및 T플랜 스페셜 가입 고객에게 기본 제공 : 연 6회 영화 무료 관람, 패밀리 레스토랑/편의점 등 다양한 제휴처 혜택 제공<br>
				▶ 1~15일에 요금제 가입 시 다음 달 1일 / 16일 이후 가입 시 다음 달 16일에 자동으로 VIP 승급<br><br>
				② 음악과 TV를 무제한으로: FLO 앤 데이터 & wavve 앤 데이터 무료제공<br>
				▶ T플랜 맥스, T플랜 스페셜 고객은 FLO 앤 데이터 / wavve 앤 데이터 무료 이용 가능 (서비스 가입 시 무료 혜택 제공)<br><br>
				③ 분실파손 보험<br>
				▶ 분실파손보험 (T All케어100/i100) 가입 및 이용 시, 해당 이용요금에 대해 멤버십 할인으로 이용요금을 지원 (T플랜 맥스 : 100% 할인 / T플랜 스페셜 : 50% 할인)<br>
				▶ 분실파손보험은 가입가능 단말 기종에 한하여 대리점 · 고객센터를 통해 별도 신청 필요 (보험상품으로 본인 동의 필수, 신규 · 기변 30일 이내에 가입가능)<br>
		    </div>
		    
		    <div id="con5" class="conBox">
		    	<br>
				▶ 3G/LTE 스마트폰만 가입 가능<br>
				   (비 스마트폰 가입 불가)<br><br>
				▶ T끼리 T내는 요금제 가입 불가<br><br>
				▶ 본 요금제 가입 시, T ring plus 부가서비스 자동 가입<br><br>
				▶ T map 기본형 무료 제공<br>
				   (단, T map 이용 가능 단말에 한정)<br><br>
				▶ 데이터를 이용한 음성통화는 기본 제공량까지 이용 가능<br><br>
				▶ T가족모아데이터 공유(가능 요금제에 한함), 데이터 선물하기, 데이터 함께쓰기, 2nd Device공유는 아래의 한도까지 이용 가능<br><br>
		    </div>
		</div>
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