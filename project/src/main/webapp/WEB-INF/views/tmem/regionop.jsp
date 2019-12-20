<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();  
    String areano = request.getParameter("areano");
    
%>

<!-- t2no 가 1번인 지역에 selected -->
<option>선택</option>
<c:forEach var="list" items="${lists}">
<c:choose>
<c:when test="${list.t2no eq 1}">
	<option value="${list.region}" selected="selected">${list.region}</option>
	    
	     <script>
	    sessionStorage.setItem("sRegion","${list.region}");
	    </script>  

</c:when>
<c:otherwise>
	<option value="${list.region}" >${list.region}</option>
</c:otherwise>
</c:choose>
</c:forEach>


<%-- <option >선택</option>
<c:forEach var="list" items="${lists}">
<option value="${list.region}" >${list.region}</option>
</c:forEach> --%>
