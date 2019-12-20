<%@ page session="false" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp= request.getContextPath();
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/project/resources/js/ajaxUtil.js"></script>
<style>
.btn {
  border: none;
  outline: none;
  background-color: #ffffff;
  cursor: pointer;
  font-size: 15px;
}

.active{
  color:red;
  font-weight: bold;
}
</style>

</head>
<body>

	<div>
  		<span class="font" style="float: left">전체(${dataCount }) >${str2 }</span>의 요금제 리스트입니다. 
  	</div>

	<table style="width: 100%; color: #000000;">
		<tr align="center" style="height: 50px; background-color: #f7f7f7; border-top:1px solid;  border-bottom: 1px solid #c0c0c0;"> 
			<td colspan="7"><b>상품명</b></td>
			<td><img src="/project/resources/image/d.png"/></td>
			<td><img src="/project/resources/image/tel.png"/></td>
			<td><img src="/project/resources/image/msg.png"/></td>
			<td><b>월정액</b></td>
			<td><b>24개월약정시</b></td>
			<td></td>
		</tr>
		<c:forEach var="dto" items="${lists }">

		<tr align="center" style="border-bottom: 1px solid #c0c0c0;" class="data">
			<td colspan="6" class="subject">${dto.subject }</td>
			<td class="gb"><b>${dto.gb }</b></td>
			<td class="tel">${dto.tel }</td>
			<td class="content">${dto.content }</td>
			<td class="price"><b><fmt:formatNumber value="${dto.price }" pattern="#,##0"/>원</b></td>
			<td class="list">${dto.list }</td>
			<td style="padding-top: 20px;">
			<a href="view.action?num=${dto.num}&content2=${dto.content2}&subject=${dto.subject}"><img src="/project/resources/image/5.png"/></a>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<br/>
	<div align="center">
		<button id="listadd" style="padding: 0; border: 1px solid #dcdcdc; width:70%; height:40px; background-color: #f7f7f7"><b>리스트 더 보기</b></button>
	</div>
	
	<br><br>
	
	<script>
		$('.data:gt(10)').hide().last().after();
		
		$("#listadd").click(function(){
        var a = this;
	        $('.data:not(:visible):lt(5)').fadeIn(function(){
		         if ($('.data:not(:visible)').length == 0){
		        	 $(a).remove();
		         }
	        }); return false;
    	}) 
	</script>

</body>
</html>
