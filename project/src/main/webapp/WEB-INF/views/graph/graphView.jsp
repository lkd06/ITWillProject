<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
  </head>
  <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
  <script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
  <script type="text/javascript">

  function printGraph(){
  		$.ajax({url:"graph_test.action",
  			data:{year:'${year}',month:'${month}'},
  			success:function(result){
  				$("#graphPrinter").html(result);
  			}});
  		setTimeout("printGraph()",5000);
  		
  	}
  
    $(document).ready(function(){
    	printGraph();
    	$("#year").change(function(){
        	window.location.href="userinfo.action?year="+$("#year option:selected").val()+
        			"&month="+$("#month option:selected").val();
        });

        $("#month").change(function(){
        	window.location.href="userinfo.action?year="+$("#year option:selected").val()+
			"&month="+$("#month option:selected").val();
        });
        
        $("#sendData").click(function(){

        	if($("#receivePhone").val()==""){
        		alert("전화번호 입력");
        		return;
        	}
        	if($("#Data").val()==""){
        		alert("전송 데이터 입력");
        		return;
        	}
        	//phone는 session에서 꺼내서 사용
        	//존재하는 phone인지, 데이터를 보낼 수 있는지에 따라 다른 alert();
        	
        	$.ajax({
        		url:"sendData",
        		dataType:"json",
        		type:"POST",
        		data:{
        			receivePhone:$("#receivePhone").val(),
        			sendData:$("#Data").val()
        		},
        		success:function(result){
        			alert(result);
        		},error:function(request,status,error){
	 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 			}
        	});
        	
        });
  	});
    
    
  </script>
  
  <body>

    
    <div style="width: 60%; margin: auto;">
		<select id="year">
			<c:forEach var="i" begin="1" end="3">
				<option value="${year-4+i }">${year-4+i }</option>
			</c:forEach>
			<option value="${year }" selected="selected">${year }</option>
			<c:forEach var="i" begin="1" end="3">
				<option value="${year+i }">${year+i }</option>
			</c:forEach>
		</select>년 &nbsp;
	
		<select id="month">
			<c:forEach var="i" begin="1" end="12">
				<c:if test="${i==month }">
					<option value="${i }" selected="selected">${i }</option>
				</c:if>
				
				<c:if test="${i!=month }">
					<option value="${i }">${i }</option>
				</c:if>
			</c:forEach>
		</select>월
		
		<br><br>
	
	   	<span id="graphPrinter">
	     	<c:import url="/graph_test.action"/>
	   	</span>
		
		<div >
			<div><input type="tel" placeholder="phone" id="receivePhone"></div>
			<div><input type="number" placeholder="Data" id="Data"> </div>
			<br>
			<div><button type="button"  id="sendData" class="btn btn-primary">선물하기</button> </div>
		</div>
		
    </div>
    <br><br>


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