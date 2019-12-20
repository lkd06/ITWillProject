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
    <title>2조 통신사 프로젝트</title>
    <link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">
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
<link rel="stylesheet" href="/project/resources/css/event.css">
</head>
<body style="background-color: aliceblue;">
    
	<jsp:include page="../header.jsp"/>
    
	<section class="hero-wrap hero-wrap-2 js-fullheight" style="background-image: url('/project/resources/images/결합.png');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
          	<p class="breadcrumbs">
	          	<span class="mr-2"><a href="/project/">메인 <i class="ion-ios-arrow-forward"></i></a></span> 
	          	<span>상품서비스 <i class="ion-ios-arrow-forward"></i></span> 
          	</p>
            <h1 class="mb-3 bread">결합상품</h1>
          </div>
        </div>
      </div>
    </section>
	

	<!-- 위 배너 -->
	<table width="100%" border="0" bgcolor="#d4effe">
		<tr>
			<td align="center">
		    	<img src="/project/resources/images/prize/내가고른홈패키지.png" width="1188" height="330" alt=""/>
			</td>
		</tr>
	</table>
	<br/><br/>
	
	<!-- 중간내용 테이블 -->
	<form name="myform">
	
	<table width="1100" border="0" style="margin: auto">
		<!-- 첫번째 줄 -->
		<tr height="30">
			<td bgcolor="#ffffff" align="center" rowspan="2">
				<img src="/project/resources/images/prize/nugu.jpg" width="198" height="250" alt=""/>
			</td>
			<td class="checktd">
				<label class="containers" >
					<input type="checkbox" id=4400 value=0 onclick="CheckChoice(this);" checked="checked" disabled="disabled">
					<span class="checkmark"></span>
				</label>
			</td>
			<td width="30"></td>
			<td bgcolor="#ffffff" align="center" rowspan="2">
		    	<img src="/project/resources/images/prize/키즈클럽.jpg" width="198" height="250" alt=""/>
			</td>
			<td class="checktd">
				<label class="containers">
					<input type="checkbox" id=9900 value=3300 onclick="CheckChoice(this);">
					<span class="checkmark"></span>
				</label>
			</td>
		</tr>
		<tr height="250">
			<td class="centertableTDcontent" valign="top">
				<img src="/project/resources/images/prize/필수선택.png" width="81" height="31"/><br/><br/>
				<b>말하는 대로 보여주는 똑똑한 TV</b><br/>
				인공지능 TV B tv X NUGU<br/>
				<font class="contentfont">
				TV 켜기, 음악 듣기, 동화 읽어주기까지<br/>
				말 한마디로 해결하세요.</font><br/><br/>
				임대료
				<font size="+2" color="#f76252"><b>4,400</b></font> 원/월
			</td>
			<td width="30"></td>
			<td class="centertableTDcontent" valign="top">
				<img src="/project/resources/images/prize/1개월무료.png" width="84" height="32"/><br/> <br/>
				<b>인기 키즈 영상 콘텐츠를 마음껏!</b><br/>
				B tv 슈퍼키즈클럽 월정액 서비스<br/>
				<font class="contentfont">
				밖에서는 모바일로, 집에서는 TV로!<br/>
				키즈 콘텐츠를 마음껏 즐기세요.</font><br/><br/>
				<font size="+2" color="#f76252"><b>9,900</b></font>원/월 <font color="#e6e6e6">&nbsp;&nbsp;<STRIKE>13,200</STRIKE></font>
			</td>
		</tr>
		<tr height="30px"><td colspan="5"></td></tr>
		
		<!-- 두번째 줄 -->
		<tr>
			<td bgcolor="#ffffff" align="center" rowspan="2">
				<img src="/project/resources/images/prize/300ȸ.jpg" width="198" height="250"/>
			</td>
			<td class="checktd">
				<label class="containers">
					<input type="checkbox" id=3190 value=1100 onclick="CheckChoice(this);">
					<span class="checkmark"></span>
				</label>
			</td>
			<td width="30"></td>
			<td bgcolor="#ffffff" align="center" rowspan="2">
		    	<img src="/project/resources/images/prize/무제한.jpg" width="198" height="250" alt=""/>
			</td>
			<td class="checktd">
				<label class="containers">
					<input type="checkbox" id=6490 value=2000 onclick="CheckChoice(this);">
					<span class="checkmark"></span>
				</label>
			</td>
		</tr>
		<tr height="250">
			<td class="centertableTDcontent" valign="top">
				<img src="/project/resources/images/prize/뮤직.png" width="78" height="27"/><br/><br/>
				<b>지금, 당신의 음악 FLO</b><br/>
				FLO 앤 데이터<br/>
				<font class="contentfont">
				FLO 듣기 무제한 서비스와<br/>
				전용 데이터 3GB로 음악을 즐겨보세요. </font><br/><br/>
				<font size="+2" color="#f76252"><b>3,190</b></font>원/월 <font color="#e6e6e6"><STRIKE>4,290</STRIKE></font>
			</td>
			<td width="30"></td>
			<td class="centertableTDcontent" valign="top">
				<img src="/project/resources/images/prize/뮤직.png" width="78" height="27" alt=""/><br/><br/>
				<b>지금, 당신의 음악 FLO</b><br/>
				FLO 무제한 듣기 이용권<br/>
				<font class="contentfont">
				하루 종일 들어도 좋아요.<br/>
				제한 없이 음악을 즐겨보세요.</font><br/><br/>
				<font size="+2" color="#f76252"><b>6,490</b></font>원/월 <font color="#e6e6e6">&nbsp;&nbsp;<STRIKE>8,490</STRIKE></font>
			</td>
		</tr>
		<tr height="30px"><td colspan="5"></td></tr>
		
		<!-- 세번째 줄 -->
		<tr>
			<td bgcolor="#ffffff" align="center" rowspan="2">
				<img src="/project/resources/images/prize/3gb모바일.jpg" width="198" height="250" alt=""/>
			</td>
			<td class="checktd">
				<label class="containers">
					<input type="checkbox" id=7900 value=0 onclick="CheckChoice(this);">
					<span class="checkmark"></span>
				</label>
			</td>
			<td width="30"></td>
			<td bgcolor="#ffffff" align="center" rowspan="2">
				<img src="/project/resources/images/prize/3gb모조리.jpg" width="198" height="250" alt=""/>
			</td>
			<td class="checktd"> 
				<label class="containers">
					<input type="checkbox" id=9000 value=0 onclick="CheckChoice(this);">
					<span class="checkmark"></span>
				</label>
			</td>
		</tr>
		<tr height="250">
			<td class="centertableTDcontent" valign="top">
				<img src="/project/resources/images/prize/뮤직.png" width="78" height="27" alt=""/><br/><br/>
				<b>지금, 당신의 음악 FLO</b><br/>
				FLO 앤 데이터<br/>
				<font class="contentfont">
				FLO 듣기 무제한 서비스와<br/>
				전용 데이터 3GB로 음악을 즐겨보세요.</font><br/><br/>
				<font size="+2" color="#f76252"><b>7,900</b></font>원/월 <font color="#e6e6e6">&nbsp;&nbsp;<STRIKE>7,900</STRIKE></font>
			</td>
			<td width="30"></td>
			<td class="centertableTDcontent" valign="top">
				<img src="/project/resources/images/prize/뮤직.png" width="78" height="27" alt=""/><br/><br/>
				<b>지금, 당신의 음악 FLO</b><br/>
				FLO 앤 데이터 플러스<br/>
				<font class="contentfont">
				모바일 기기 및 NUGU에서 FLO가 보유한<br/>
				음악을 무제한으로 즐겨보세요. </font><br/><br/>
				<font size="+2" color="#f76252"><b>9,000</b></font>원/월 <font color="#e6e6e6">&nbsp;&nbsp;<STRIKE>9,000</STRIKE></font>
			</td>
		</tr>
		<tr height="30px"><td colspan="5"></td></tr>
		
		<!-- 네번째 줄 -->
		<tr>
			<td bgcolor="#ffffff" align="center" rowspan="2">
		    	<img src="/project/resources/images/prize/1인.jpg" width="198" height="250" alt=""/>
			</td>
			<td class="checktd">
				<label class="containers">
					<input type="checkbox" id=7900 value=0 onclick="CheckChoice(this);">
					<span class="checkmark"></span>
				</label>
			</td>
			<td width="30"></td>
			<td bgcolor="#ffffff" align="center" rowspan="2">
		    	<img src="/project/resources/images/prize/2인.jpg" width="198" height="250" alt=""/>
			</td>
			<td class="checktd">
				<label class="containers">
					<input type="checkbox" id=13100 value=0 onclick="CheckChoice(this);">
					<span class="checkmark"></span>
				</label>
			</td>	
		</tr>
		<tr height="250">
			<td class="centertableTDcontent" valign="top">
				<img src="/project/resources/images/prize/미디어.png" width="82" height="32" alt=""/><br/><br/>
				<b>초시대의 동영상 생활</b><br/>
				wavve 콘텐츠 팩<br/>
				<font class="contentfont">
				지상파, 종편 실시간 TV 등 HD급 영상을<br/>
				무제한으로 즐겨보세요.(1인용)</font><br/><br/>
				<font size="+2" color="#f76252"><b>7,900</b></font>원/월 <font color="#e6e6e6">&nbsp;&nbsp;<STRIKE>7,900</STRIKE></font>
			</td>
			<td width="30"></td>
			<td class="centertableTDcontent" valign="top">
				<img src="/project/resources/images/prize/미디어.png" width="82" height="32" alt=""/><br/><br/>
				<b>초시대의 동영상 생활</b><br/>
				wavve 콘텐츠 팩 플러스<br/>
				<font class="contentfont">
				지상파, 종편 실시간 TV 등 HD급 영상을<br/>
				무제한으로 즐겨보세요.(2인용)</font><br/><br/>
				<font size="+2" color="#f76252"><b>13,100</b></font>원/월 <font color="#e6e6e6">&nbsp;&nbsp;<STRIKE>13,100</STRIKE></font>
			</td>
		</tr>
		<tr height="30px"><td colspan="5"></td></tr>
		
		<!-- 다섯번째 줄 -->
		<tr>
			<td bgcolor="#ffffff" align="center" rowspan="2">
				<img src="/project/resources/images/prize/1gb1인.jpg" width="198" height="250" alt=""/>
			</td>
			<td class="checktd">
				<label class="containers">
					<input type="checkbox" id=9900 value=0 onclick="CheckChoice(this);">
					<span class="checkmark"></span>
				</label>
			</td>
			<td width="30"></td>
			<td bgcolor="#ffffff" align="center" rowspan="2">
		    	<img src="/project/resources/images/prize/1gb2인.jpg" width="198" height="250" alt=""/>
			</td>
			<td class="checktd">
				<label class="containers">
					<input type="checkbox" id=12300 value=0 onclick="CheckChoice(this);">
					<span class="checkmark"></span>
				</label>
			</td>
		</tr>
		<tr height="250">
			<td class="centertableTDcontent"" valign="top">
				<img src="/project/resources/images/prize/미디어.png" width="82" height="32" alt=""/><br/><br/>
				<b>초시대의 동영상 생활</b><br/>
				wavve 앤 데이터<br/>
				<font style="font-size: 12px; line-height: 100%;">
				매일 제공되는 wavve 전용 데이터 1GB로<br/>
				데이터 걱정 없이 마음껏 즐기세요. (1인용)</font><br/><br/>
				<font size="+2" color="#f76252"><b>9,900</b></font>원/월 <font color="#e6e6e6">&nbsp;&nbsp;<STRIKE>9,900</STRIKE></font>
			</td>
			<td width="30"></td>
			<td class="centertableTDcontent" valign="top">
			    <img src="/project/resources/images/prize/미디어.png" width="82" height="32" alt=""/><br/><br/>
				<b>초시대의 동영상 생활</b><br/>
				wavve 앤 데이터 플러스<br/>
				<font style="font-size: 12px; line-height: 100%;">
				매일 제공되는 wavve 전용 데이터 1GB로<br/>
				데이터 걱정 없이 마음껏 즐기세요. (2인용)</font><br/><br/>
				<font size="+2" color="#f76252"><b>12,300</b></font>원/월 <font color="#e6e6e6">&nbsp;&nbsp;<STRIKE>12,300</STRIKE></font>
			</td>
		</tr>
	</table>
	<br/><br/><br/>	  

	<!-- 패키지 테이블 -->
	<table width="1100" border="0" style="margin: auto">
		<tr>
			<td align="center">
				<h2><b>많은 고객님들이 선택한 아래의 패키지 조합을 참고하세요</b></h2>
				<br/><br/>
			</td>	
		</tr>
		<tr>
			<td>
				<img src="/project/resources/images/prize/홈극장패키지.png" width="1100" height="275" alt=""/>
		    </td>	
		</tr>
		<tr height="20"><td></td></tr>
		<tr>
			<td>
				<img src="/project/resources/images/prize/모바일문화생활패키지.png" width="1100" height="275" alt=""/>
		    </td>	
		</tr>
		<tr height="20"><td></td></tr>
		<tr>
			<td>
				<img src="/project/resources/images/prize/스마트육아패키지.png" width="1100" height="275" alt=""/>
		    </td>	
		</tr>
	</table>
	<br/><br/>
	  
	
	<!-- 하단 바 위 내용 -->
	<table width="100%" border="0" style="margin: auto">
	<tr bgcolor="#7979c;" height="150">
		<td align="center" style="color: #ffffff;">
			<h2 style="color: #ffffff;">내가고른'홈'패키지, T월드 매장에서도 만나보실 수 있습니다.</h2>
			더 자유롭게, 더 다양한 상품을 할인된 가격에 구매해보세요.
		</td>	
	</tr>
	<tr height="100">
		<td></td>	
	</tr>
	</table>
	
	<!-- 하단 바 -->
	<table class="menu" style="color: #ffffff;" height="100">
		<tr align="center">
			<td rowspan="2" width="500"></td>
			<td width="200">
				정상가격
			</td>
			<td rowspan="2" class="bartd">
				-
			</td>
			<td width="200">
				할인금액
			</td>
			<td rowspan="2" class="bartd">
				=
			</td>
			<td width="200">
				월 예상 납부금액
			</td>
		</tr>
		<tr>
			<td class="bottombartd">
				<input type="text" name="total" readonly onFocus="this.blur();" value="4400" class="bottombarinput"> 원
			</td>	
			<td class="bottombartd">
				<input type="text" name="total2" readonly onFocus="this.blur();" value="0" class="bottombarinput"> 원
			</td>	
			<td class="bottombartd">
				<input type="text" name="total3" readonly onFocus="this.blur();" value="4400" class="bottombarinput"> 원
			</td>	
			<td align="left">
				(VAT 포함)
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
	
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
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
<script src="/project/resources/js/event.js"></script>
	
</body>
</html>