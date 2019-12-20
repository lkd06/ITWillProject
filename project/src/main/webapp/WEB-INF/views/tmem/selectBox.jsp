<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();  
    String brandName = request.getParameter("brandName");
%>

<option value="">전체</option>.

<c:forEach var="it" items="${it}">
	<c:choose>
		<c:when test="${it eq brandName}">
			<option value="${it }" selected="selected">${selectmap.get(it)} </option>
		</c:when>
		<c:otherwise>
			<option value="${it }" >${selectmap.get(it)} </option>
		</c:otherwise>
	</c:choose>
</c:forEach>

