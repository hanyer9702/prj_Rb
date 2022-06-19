<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<body>

<c:forEach items="${list}" var="item" varStatus="status">
	<c:out value="${item.ifmmSeq}"/>
	<br><c:out value="${item.ifmmId}"/>
	<br><c:out value="${item.ifmmName}"/>
	<br><c:out value="${item.ifmmDob}"/>
	<br>---------------------------------------------<br>
</c:forEach>

</body>