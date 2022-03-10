<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<%-- <c:choose>
	<c:when test="${fn:length(list) eq 0}">
		<tr>
			<td class="text-center" colspan="9">There is no data!</td>
		</tr>	
	</c:when>
	<c:otherwise>
		<c:forEach items="${list}" var="item" varStatus="status">	
		
		<c:out value="${item.ifmmSeq}"/> | <c:out value="${item.ifmmId}"/> | <c:out value="${item.ifmmName}"/> <br>
		
		</c:forEach>
	</c:otherwise>
</c:choose>	  --%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="uTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>yerin's html projects</title>
<style type="text/css">
 	table, th, td {
 		border: 1px solid black;
 		border-collapse: collapse;
	 }
	 
	 th, td {
	 	padding: 5px;
	 }
</style>
</head>

<body>
	 memberList.jsp
	<table border="1">
		<tr>
			<th>no</th>
			<th>이름</th>
			<th>아이디</th>
			<th>주소</th>
			<th>모바일</th>
			<th>국적</th>
		</tr>
		<c:choose>
			
				<c:when test="${fn:length(list) eq 0}">
					<tr>
						<td class="text-center" colspan="9">There is no data!</td>	
					</tr>
				</c:when>
				<c:otherwise>
				
					<c:forEach items="${list}" var="item" varStatus="status">	
						<tr>
						
							<td><c:out value="${item.ifmmSeq}"/></td>
							<td><a href="/infra/member/memberView?ifcdSeq=${item.ifmmSeq}"><c:out value="${item.ifmmName}"/></a></td>
							<td><c:out value="${item.ifmmId}"/></td>
							<td><c:out value="${item.ifmaAddress1}"/></td>
							<td><c:out value="${item.ifmpNumberDash}"/></td>
							<td><c:out value="${item.ifnaName}"/></td>
						
						</tr>
					</c:forEach>
				
				</c:otherwise>
			
		</c:choose>
		
	</table>
	<a href="/infra/member/memberForm.jsp">등록</a>
</body>
</html>