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
<style type="text/css">
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

	<table style="padding-top: 20px; width: 100%;">
		<tr align="center" style="height: 50px;	background-color: #f7f7f7; border-top:1px solid; border-bottom: 1px solid #c0c0c0;"> 
			<td colspan="3"><b>상품명(이용요금)</b></td>
			<td><b>이용요금</b></td>
			<td></td>
		</tr>
		
		<c:forEach var="dto" items="${lists }">

		<tr class="data" style="border-bottom: 1px solid #c0c0c0;">
			<td colspan="3" class="name" style="padding-left: 10px;" align="left">
				<font size="4pt">${dto.name } </font><br/> 
				<font size="2pt">${dto.content } </font><br/> 
			</td>
			<c:if test="${dto.price==0 }">
			<td class="price" align="center"><b>무료</b></td>
			</c:if>
			<c:if test="${dto.price!=0 }">
			<td class="price" align="center"><b><fmt:formatNumber value="${dto.price }" pattern="#,##0"/>원</b></td>
			</c:if>
			<td style="padding-top: 20px; padding-right: 20px;"align="right">
			<a href="service_view.action?num=${dto.num}&list=${dto.list}"><img src="/project/resources/image/5.png"/></a>
			</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>
