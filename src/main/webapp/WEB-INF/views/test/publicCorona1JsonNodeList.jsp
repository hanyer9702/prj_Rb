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
	<br>node : <c:out value="${node}"/>
	<br>node.header : <c:out value="${node.get('header')}"/>
	<br>node.header.resultCode : <c:out value="${node.get('header').get('resultCode')}"/>
	<br>node.header.resultCode : <c:out value="${fn:replace(node.get('header').get('resultCode'), '&quot;','')}"/>
	<br>resultCode : <c:out value="${resultCode}"/>
	<br>node.header.resultMsg : <c:out value="${fn:replace(node.get('header').get('resultMsg'), '&quot;','')}"/>
	
	<br>node.body.pageNo : <c:out value="${fn:replace(node.get('body').get('pageNo'), '&quot;','')}"/>
	
	<br>node.header.items : <c:out value="${node.get('body').get('items')}"/>
	<br>node.header.items : <c:out value="${node.get('body').get('items').get('1').get('MM')}"/>
	
	<script src="/resources/common/_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>