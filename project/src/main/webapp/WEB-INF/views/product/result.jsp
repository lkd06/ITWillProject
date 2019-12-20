<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<table style="width: 100%; color: #000000;">
		<c:forEach var="dto" items="${lists }">

		<tr align="center" style="border-bottom: 1px solid #c0c0c0;" class="data">
			<td colspan="6" class="subject">${dto.subject }</td>
			<td class="gb" style="color: red;"><b>${dto.gb }</b></td>
			<td class="tel">${dto.tel }</td>
			<td class="content">${dto.content }</td>
			<td class="price" style="color: red;"><b><fmt:formatNumber value="${dto.price }" pattern="#,##0"/>원</b></td>
			<td class="list">${dto.list }</td>
			<td style="padding-top: 20px;">
			<a href="view.action?num=${dto.num}&content2=${dto.content2}&subject=${dto.subject}"><img src="/project/resources/image/5.png"/></a>
			</td>
		</tr>
		
		</c:forEach>
</table>
