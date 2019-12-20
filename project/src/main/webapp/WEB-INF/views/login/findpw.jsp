<%@ page contentType="text/html; charset=UTF-8"%>
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
<!-- 일단 phone, email 확인 후 메일 전송 -->
<link rel="stylesheet" href="/project/resources/css/style.css">
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>

<script type="text/javascript">
	 $(document).ready(function(){
	 	$("#findpw").click(function(){
	 		
	 		var phone = $("#phone").val();
	 		if(phone==""){
	 			alert("phone 미입력");
	 			return;
	 		}
	 		
	 		var email = $("#email").val();
	 		if(email==""){
	 			alert("이메일 미입력");
	 			return;
	 		}
	 		
	 		$.ajax({
	 			url:"findInfo",
	 			dataType:"json",
	 			type:"POST",
	 			data:{
	 				phone:phone,
	 				email:email
	 			},
	 			success:function(result){
	 				if(result!=""){
	 					alert(result);
	 					return;
	 				}
	 				//alert("메일 전송 만들자");
	 				window.close();
	 			},error:function(request,status,error){
	 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 			}
	 		});
	 		//window.close();
	 	});
	 });
 </script>
 
</head>
<body>
	<div style="width: 100%; padding-left:10%;  margin-top: 2%; padding-right: 10%;" >
		<div style="display: inline-block; width: 100%;" align="left" > 
			<div>
			<h2>비밀번호 찾기</h2>
			비밀번호를 잊으셨나요?<br>아이디와 이메일을 입력해주세요.
			</div><br>
			<font color="#000000;" style="font-size: 12px; font-weight: bold;">아이디(Phone)<br></font>
			<input type="text" id="phone"   class="form-control">

			<font color="#000000;" style="font-size: 12px; font-weight: bold;">Email</font>
			<input id="email"   class="form-control">
			
			<div style="width: 100%; height: 60px;" align="center">
				<br><button type="submit" id="findpw" class="btn btn-primary" style="width: 40%; height: 100%;">찾기</button>
			</div>
			
		</div>
	</div>
</body>
</html>