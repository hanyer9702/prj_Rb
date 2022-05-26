<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="uTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/resources/common/_bootstrap/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/common/css/style.css" rel="stylesheet" type="text/css">
<title></title>
<style type="text/css">
		
</style>
</head>
<body>
	<br>aaa : <c:out value="${resultCode }"/>
	<br>aaa : <c:out value="${resultMsg }"/>
	<br>aaa : <c:out value="${pageNo }"/>
	<br>aaa : <c:out value="${totalCount }"/>
	<br>aaa : <c:out value="${numOfRows }"/>
	<br>aaa : <c:out value="${items }"/>
	<br>aaa : <c:out value="${fn:length(items) }"/>
	
	<c:forEach items="${items }" var="item" varStatus="status">
		<c:out value="${item.YYYY }"/>
		<br><c:out value="${item.MM }"/>
		<br><c:out value="${item.KIT_PROD_QTY }"/>
		<br><c:out value="${item.KIT_EXPRT_QTY }"/>
		<br><c:out value="${item.KIT_STOCK_QTY }"/>
	</c:forEach>
	
	<script src="/resources/common/_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>