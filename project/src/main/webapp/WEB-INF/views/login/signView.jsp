<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
 <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
 var pwCheckValue = false;
    $(document).ready(function(){
    	$("#idCheck").click(function(){
			if(isNaN($("#phone").val())){
				alert("숫자만 입력");
				return;
			}
    		window.name="ID 중복확인";
    		var phone = document.getElementById('phone').value;
    		window.open("idCh.action?phone="+phone,"_blank","top=0,left=0,width=400,height=250,toolbar=0,status=0,resizable=no,scrollbars=no");
    	});
    	
		$("#insertData").click(function(){
			var sendphone = document.getElementById('phone').value;
			if(sendphone==""){
				alert("ID 중복확인");
				return;
			}
			if(!pwCheckValue){
				alert("PW 확인");
				return;
			}
			
			var sendpw = document.getElementById('pw').value;
			var sendemail = document.getElementById('email').value;
			var sendname = document.getElementById('name').value;
			var sendbirth = document.getElementById('birth').value;
			
			if(sendpw==""||sendemail==""||sendname==""||sendbirth==""){
				alert("입력 미완료");
				return;
			}
			
			$.post("signup.action",{
				phone : sendphone,
				pw : sendpw,
				email : sendemail,
				name : sendname,
				birth : sendbirth
			},function(result){
				//alert("seccess");
				//window.location="graphview.action";
				window.location="/project/";
			});
			
		});
		
		$("#pwCheck").keyup(function(){
			var pw = $("#pw").val();
			var pwCheck = $("#pwCheck").val();
			//pwCheckValue = pw.equals(pwCheck);
			//if(pw===pwCheck) pwCheckValue=(pw===pwCheck);
			pwCheckValue=(pw==pwCheck);
			
			$.ajax({
				url:"pwCh.action",
				dataType:"text",
				data:{
					pw : $("#pw").val(),
					pwCheck : $("#pwCheck").val()
				},
				type:"GET",
				success:function(args){ //list
					//alert($("#checkMess").val());
					$("#checkMess").empty();
					
					$("#checkMess").append(args);
				},
				error:function(request,status,error){
			        alert(" error = " + error); // 실패 시 처리
			       }
			});			
			//location.href="pwCh.action?pwCheck="+check;
		});
		
	 });
</script>

</head>
<body>

<!-- <form method="post" name="signup"> -->
          	<!-- 나중에 ID 중복체크도. -->
				   
				  <div align="left" style="width: 800px; padding-left: 25%;">
				    <h3><label>아이디(Phone)</label></h3>
				    <input type="tel" class="form-control"  id="phone" aria-describedby="emailHelp" placeholder="Phone Number" >
				    <button type="button" class="btn btn-primary" onclick="" id="idCheck">중복확인</button>
				  </div>
				  <br>
				  
				  
				  <div align="left" style="width: 800px; padding-left: 25%;">
				    <h3><label for="InputPassword1">비밀번호</label></h3>
				    <input type="password" class="form-control" id="pw" placeholder="Password">
				  </div>
				  <br>
				  
				  <div align="left" style="width: 800px; padding-left: 25%;">
				    <h3><label for="InputPassword1">비밀번호 확인</label></h3>
				    <input type="password" class="form-control" id="pwCheck" placeholder="Password Check">
				  </div>
				  <div id="checkMess"></div>
				  <br>
				  
				  <div align="left" style="width: 800px; padding-left: 25%;">
				    <h3><label for="InputEmail1">이메일</label></h3>
				    <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" placeholder="Email">
				    <center><small id="emailHelp" class="form-text text-muted">이메일 형식에 맞게 작성해주세요.</small></center>
				  </div>
				  
				  <div align="left" style="width: 800px; padding-left: 25%;">
				    <h3><label for="exampleInputEmail1">이름</label></h3>
				    <input type="text" class="form-control" name="name"  id="name" aria-describedby="emailHelp" placeholder="Name">
				  </div>
				  <br>
				  
				  <div align="left" style="width: 800px; padding-left: 25%;">
				    <h3><label for="exampleInputEmail1">생년월일</label></h3>
				    <input type="date" class="form-control" name="birth"  id="birth" aria-describedby="emailHelp" placeholder="Birth">
				  </div>
				  <br>
				   
				  <button type="button" class="btn btn-primary" onclick="" id="insertData">회원가입</button>
					  
				  
<!-- 			</form> -->

</body>
</html>