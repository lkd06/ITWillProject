<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

a{
color:red;
font-size:21px;
font-style:arial;
float:left;
}
</style>

<script type="text/javascript">


function closepopup(){

	if(document.getElementById("check").checked){
		setCookie("popupYN","N",1);
	}
	window.close();
}

function setCookie(name,value,expiredays){
	
	var date=new Date();
	date.setDate(date.getDate() + expiredays);
	document.cookie=escape(name) + "="+escape(value)+"; expires="+date.toUTCString();
	
}

</script>
</head>
<body>
<div id="container">
<img src="/project/resources/image/calevent.png" width="450px" height="250px">
<br>
<a onclick="window.open('http://192.168.16.13:8080/project/event_article.action?num=1');"> 이벤트 확인하러 가기</a><br><br>
<input type="checkbox" name="popup" value="Y" id="check" />오늘 하루동안 이 창을 열지 않음
<input type="button" value="닫기" style="float:right;" onclick="closepopup();"/>
</div>
</body>
</html>