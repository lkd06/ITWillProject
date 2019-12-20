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
	
	$(document).ready(function(){
		$("#sendID").click(function(){
			var selectedID = $("#phone").attr("value");
			opener.document.getElementById("phone").value = selectedID;
			window.close();
		});
		
		$("#idCheck").click(function(){
			if(isNaN($("#phone").val())){
				alert("숫자만 입력");
				return;
			}
			
			var phone= document.getElementById('phone').value;
			location.href="idCh.action?phone=" + phone;
		});
	 });
	
</script>

</head>
<body>

<section class="ftco-section services-section">
      <div class="container">
      	<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
          
				  <div class="form-group">
				    <label for="InputEmail1">Phone(ID)</label>
				    <input type="text" class="form-control" name="phone" aria-describedby="emailHelp" id="phone" value="${phone }">
				    <input type="button" class="btn btn-primary" id="idCheck" value="중복확인">
				    
				  </div>
          </div>
        </div>
        <br>
        ${message }
			<c:if test="${message=='사용가능한 ID 입니다.' }">
				<br>
				
				<button type="button"  id="sendID">ID 사용</button>
			</c:if>

	</div>
</section>


</body>
</html>