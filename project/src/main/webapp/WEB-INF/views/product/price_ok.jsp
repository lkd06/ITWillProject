<%@ page session="false" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/project/resources/js/ajaxUtil.js"></script>

    <title>2조 통신사 프로젝트</title>
    <link rel="shortcut icon" type="image x-icon" href="/project/resources/images/it.png">
<style>

strong{
	font-size:15pt;
	padding-left: 20px;
}

#desc {
    display: inline-block;
    width: 660px;
    vertical-align: middle;
    color: #666;
    font-size: 16px;
    line-height: 23px;
    letter-spacing: -1px;
    font-weight: normal;
}

#gxs.show{
	background-color: red;
}


</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#gxs").hide();
	$("#tplans").hide();
	$("#zeros").hide();
	$("#weeks").hide();
	$("#heros").hide();
	
 	$('#gx img').click(function() {
 		
 		$.ajax({
 			type:"POST",
 			url:"price_ok.action",
 			data:{content2:$('#5gx').val()},		
 			success:function(result){
 				$('#result').html(result);
 			},
 			error:function(e){
 				alert(e.responseText);
 			}
 		});
 		
 		if($("#gxs").css("display")=="none"){
 			$("#gxs").show();
 			$("#gx").css('background-color','#434159');
 			$("#gx strong").css('color','white');
 			$("#gx #desc").css('color','white');
 		}else{
 			$("#gxs").hide();
 			$("strong").css('color','#000000');
 			$("#gx #desc").css('color','#666');
 			$("#gx").css("background-color","white");
 		}	    
	}); 
 	
	$('#tplan img').click(function() {
		
		$.ajax({
 			type:"POST",
 			url:"price_ok.action",
 			data:{content2:$('#t플랜').val()},		
 			success:function(result){
 				$('#result_tplan').html(result);
 			},
 			error:function(e){
 				alert(e.responseText);
 			}
 		});
 		
 		if($("#tplans").css("display")=="none"){
 			$("#tplans").show();
 			$("#tplan").css('background-color','#434159');
 			$("#tplan strong").css('color','white');
 			$("#tplan #desc").css('color','white');
 		}else{
 			$("#tplans").hide();
 			$("strong").css('color','#000000');
 			$("#tplan #desc").css('color','#666');
 			$("#tplan").css("background-color","white");
 		}	    
	});
	
	$('#zero img').click(function() {
		
		$.ajax({
 			type:"POST",
 			url:"price_ok.action",
 			data:{content2:$('#zeroplan').val()},		
 			success:function(result){
 				$('#result_0plan').html(result);
 			},
 			error:function(e){
 				alert(e.responseText);
 			}
 		});
 		
 		if($("#zeros").css("display")=="none"){
 			$("#zeros").show();
 			$("#zero").css('background-color','#434159');
 			$("#zero strong").css('color','white');
 			$("#zero #desc").css('color','white');
 		}else{
 			$("#zeros").hide();
 			$("strong").css('color','#000000');
 			$("#zero #desc").css('color','#666');
 			$("#zero").css("background-color","white");
 		}	    
	});
	
	$('#week img').click(function() {
		
		$.ajax({
 			type:"POST",
 			url:"price_ok.action",
 			data:{content2:$('#weekplan').val()},		
 			success:function(result){
 				$('#result_week').html(result);
 			},
 			error:function(e){
 				alert(e.responseText);
 			}
 		});
 		
 		
 		if($("#weeks").css("display")=="none"){
 			$("#weeks").show();
 			$("#week").css('background-color','#434159');
 			$("#week strong").css('color','white');
 			$("#week #desc").css('color','white');
 		}else{
 			$("#weeks").hide();
 			$("strong").css('color','#000000');
 			$("#week #desc").css('color','#666');
 			$("#week").css("background-color","white");
 		}	    
	});
	
	$('#hero img').click(function() {
		
		$.ajax({
 			type:"POST",
 			url:"price_ok.action",
 			data:{content2:$('#heroplan').val()},		
 			success:function(result){
 				$('#result_hero').html(result);
 			},
 			error:function(e){
 				alert(e.responseText);
 			}
 		});
 		
 		
 		if($("#heros").css("display")=="none"){
 			$("#heros").show();
 			$("#hero").css('background-color','#434159');
 			$("#hero strong").css('color','white');
 			$("#hero #desc").css('color','white');
 		}else{
 			$("#heros").hide();
 			$("strong").css('color','#000000');
 			$("#hero #desc").css('color','#666');
 			$("#hero").css("background-color","white");
 		}	    
	});
});

</script>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"/>
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'/>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'/>
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet"/>
<link rel="stylesheet" href="/project/resources/css/open-iconic-bootstrap.min.css"/>
<link rel="stylesheet" href="/project/resources/css/animate.css"/>
<link rel="stylesheet" href="/project/resources/css/owl.carousel.min.css"/>
<link rel="stylesheet" href="/project/resources/css/owl.theme.default.min.css"/>
<link rel="stylesheet" href="/project/resources/css/magnific-popup.css"/>
<link rel="stylesheet" href="/project/resources/css/aos.css"/>
<link rel="stylesheet" href="/project/resources/css/ionicons.min.css"/>
<link rel="stylesheet" href="/project/resources/css/bootstrap-datepicker.css"/>
<link rel="stylesheet" href="/project/resources/css/jquery.timepicker.css"/>
<link rel="stylesheet" href="/project/resources/css/flaticon.css"/>
<link rel="stylesheet" href="/project/resources/css/icomoon.css"/>
<link rel="stylesheet" href="/project/resources/css/style.css"/>
</head>
<body>


<div class="container"  style="height:auto;">
	<div id="gx">
		<hr/>
		<input type="hidden" value="5GX" id="5gx"/>
		<strong style="color: #000000; padding-right: 190px;">5GX 플랜<img src="/project/resources/image/5g.png"/></strong>
		<span id="desc">데이터도 콘텐츠도 자유롭게! 초시대의 요금 플랜</span>
		<img src="/project/resources/image/3.png"/>
		<hr/>
		<div id="gxs" style="background-color: #ebebee; height:auto;" align="center">
			<div style="background-color: #ffffff;  width:95%;">
				<div id="result"></div>
			</div>
			<br/>
		</div>
	</div>
		
	<div id="tplan">
		<input type="hidden" value="T플랜" id="t플랜"/>
		<strong style="color: #000000; padding-right: 225px;">T플랜<img src="/project/resources/image/lte.png"/></strong>
		<span id="desc">막강한 데이터&콘텐츠 혜택, LTE 라이프의 완성!</span>
		<img src="/project/resources/image/3.png" />
		<hr/>
		<div id="tplans" style="background-color: #ebebee; height: auto;" align="center">
			<div style="background-color: #ffffff;  width:95%;">
				<div id="result_tplan"></div>
			</div>
			<br/>
		</div>
	</div>
	
	<div id="zero" >
		<input type="hidden" value="0플랜" id="zeroplan"/>
		<strong style="color: #000000; padding-right: 225px;">0플랜<img src="/project/resources/image/lte.png"/></strong>
		<span id="desc" >무엇이든 할 수 있는 '0을 위한 혜택'</span>
		<img src="/project/resources/image/3.png" />
		<hr/>
		<div id="zeros" style="background-color: #ebebee; height: auto;" align="center">
			<div style="background-color: #ffffff;  width:95%;">
				<div id="result_0plan"></div>
			</div>
			<br/>
		</div>
	</div>
	
	<div id="week">
		<input type="hidden" value="주말" id="weekplan"/>
		<strong style="color: #000000; padding-right: 235px;">주말<img src="/project/resources/image/lte.png"/></strong>
		<span id="desc" >주말전용 데이터를 더 드리는 청소년 요금제</span>
		<img src="/project/resources/image/3.png" />
		<hr/>
		<div id="weeks" style="background-color: #ebebee; height: auto;" align="center">
			<div style="background-color: #ffffff;  width:95%;">
				<div id="result_week"></div>
			</div>
			<br/>
		</div>
	</div>
	
	<div id="hero">
		<input type="hidden" value="히어로" id="heroplan"/>
		<strong style="color: #000000; padding-right: 220px;">히어로<img src="/project/resources/image/lte.png"/></strong>
		<span id="desc" >초시대의 병영생활, 0히어로 군인요금제</span>
		<img src="/project/resources/image/3.png"/>
		<hr/>
		<div id="heros" style="background-color: #ebebee; height: auto;" align="center">
			<div style="background-color: #ffffff;  width:95%;">
				<div id="result_hero"></div>
			</div>
			<br/>
		</div>
	</div>
</div>

    
</body>
</html>
