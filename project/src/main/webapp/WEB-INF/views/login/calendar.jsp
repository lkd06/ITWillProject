<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();  
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/project/resources/css/calendar.css">

<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#checkingevent").on("click",function(){	

		$.ajax({
			type:"post",
			url:"checkevent.action",
			dataType: 'text',   // 데이터 타입을 Json으로 변경
			contentType: 'application/json',
			success:function(result){
				if(result){
					alert("출석완료되었습니다.");
				}
				else if(result==''){
					alert("이미 출석한 날짜입니다.");			
				};
			},
			error:function(request,status,error){
				alert("출석이벤트 에러"+error);
			}		
		});	
	});	
});

$(function(){
	$("#eventpoint").on("click",function(){
		
		$.ajax({
			type:"post",
			url:"addeventpoint.action",
			dataType:"text",
			success:function(result){
			alert(result);
			},
			error:function(request,status,error){
				alert("addpoint 에러 :"+error);
			}
		});
	});
});


function clsbtn1(){
	//self.close();
	location.reload();
}

</script>
<style>

#evenfont{
font-size:35px; 
color:red;   
font-weight: bold; 
float:center; 
font-family:"Arial Black"; 
text-shadow: 2px 2px 6px gray;
}

.dbtn1{

display:inline-block;
background-color:#ea002c;
color:white;
width:85px;
height:45px;
float:right;
margin:2px;
font-size:14px;
font-weight:bold;
font-style:arial;

}

.dbtn2{
display:inline-block;
margin:2px;
width:65px;
height:45px;
background-color:#ea002c;
color:white;
font-size:14px;
font-weight:bold;
float:right; 
font-style:arial;
}

.dbtn3{

width:85px;
height:45px;
background-color:#ea002c;
color:white;
font-size:14px;
font-weight:bold;
float:right; 
margin:2px;
padding:0px;
font-style:arial;
}

} 
</style>
</head>
<body>

<form name="calendarFrm" id="calendarFrm" action="" method="GET">

<div class="calendar" >
<br><br>
<span id="evenfont"> 출석하고 데이터 받자! </span>

	<!--날짜 네비게이션  -->
	<div class="navigation">
		<a class="before_after_year" href="./calendar.action?year=${today_info.search_year-1}&month=${today_info.search_month-1}">
			&lt;&lt;
		<!-- 이전해 -->
		</a> 
		<a class="before_after_month" href="./calendar.action?year=${today_info.before_year}&month=${today_info.before_month}">
			&lt;
		<!-- 이전달 -->
		</a> 
		<span class="this_month">
			&nbsp;${today_info.search_year}. 
			<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
		</span>
		<a class="before_after_month" href="./calendar.action?year=${today_info.after_year}&month=${today_info.after_month}">
		<!-- 다음달 -->
			&gt;
		</a> 
		<a class="before_after_year" href="./calendar.action?year=${today_info.search_year+1}&month=${today_info.search_month-1}">
			<!-- 다음해 -->
			&gt;&gt;
		</a>
		
		<input type="button"  class="dbtn2"value="닫기"  onclick="javascript:location.href='/project/';">
		<input type="button" class="dbtn3" value="포인트받기"  id="eventpoint" >
		<input type="button" class="dbtn1" value="출석하기"  id="checkingevent" >
		
	</div>

<table class="calendar_body">

<thead>
	<tr bgcolor="#CECECE">
		<td class="day sun" >
			일
		</td>
		<td class="day" >
			월
		</td>
		<td class="day" >
			화
		</td>
		<td class="day" >
			수
		</td>
		<td class="day" >
			목
		</td>
		<td class="day" >
			금
		</td>
		<td class="day sat" >
			토
		</td>
	</tr>
</thead>
<tbody>
	

	<tr>
		<c:forEach var="dateList" items="${dateList}" varStatus="date_status"> 
			<c:choose>
				<c:when test="${dateList.value=='today'}">
					<td class="today">				
						<div class="date">
						 ${dateList.date} <br/>		
					 
					 <c:if test="${map.containsKey(dateList.date) }">
					<img src="/project/resources/image/check110.png"/>
					 </c:if>
						</div>
						
					</td>
				</c:when>	
				<c:when test="${date_status.index%7==6}"> 
					<td class="sat_day">
						<div class="sat">
							${dateList.date}	<br/>	
						</div>
						
					 	 <c:if test="${map.containsKey(dateList.date) }">
							 <img src="/project/resources/image/check110.png"/> <!-- <img src="/project/resources/image/check60.png"/> -->
						 </c:if>
						<div>
						
						</div>
					</td>
				</c:when>
				
				<c:when test="${date_status.index%7==0}">
	</tr>
	<tr>	
					<td class="sun_day">
						<div class="sun">
							${dateList.date}
							<br/>
							  	 <c:if test="${map.containsKey(dateList.date) }">
								<img src="/project/resources/image/check110.png"/> <!-- <img src="/project/resources/image/check60.png"/> -->
								 </c:if>
						</div>
						<div>
						</div>
					</td>
							</c:when>
							
							
							<c:otherwise>
					<td class="normal_day">
						<div class="date">
							${dateList.date}<br/>
							 	 <c:if test="${map.containsKey(dateList.date) }">
								 <img src="/project/resources/image/check110.png"/> <!-- <img src="/project/resources/image/check60.png"/> -->
								 </c:if>
						</div>
						<div>
						
						</div>
					</td>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</tr>
		
</tbody>

</table>
</div>
</form>

</div>


</body>
</html>