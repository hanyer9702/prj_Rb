<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<jsp:useBean id="MemberServiceImpl" class="com.rbproject.store.modules.member.MemberServiceImpl"/>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="uTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/resources/common/_bootstrap/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/common/css/style.css" rel="stylesheet" type="text/css">
<link href="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.css" rel="stylesheet">
<title>한예린</title>
<style type="text/css">
	
</style>
</head>
<body>
	<%@include file="../include/top.jsp"%>

	<span>sessSeq: </span><br>
	<span>sessName: </span><br>
	<span>sessId: </span><br>
	<br>
	<button type="button" class="btn btn-danger" onclick="location.href='/member/loginForm';">로그아웃</button>

	<%@include file="../include/footer.jsp"%>

	<script src="/resources/common/_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>