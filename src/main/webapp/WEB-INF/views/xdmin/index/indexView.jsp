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

	<%-- sessSeq: <c:out value="${sessSeq }"/><br>
sessName: <c:out value="${sessName }"/><br>
sessId: <c:out value="${sessId }"/><br>
<c:if test="${not empty sessSeq}">
	<button type="button" class="btn btn-danger btn-sm" name="" id="btnLogout"><i class="fa-solid fa-power-off"></i></button>
</c:if>
 --%>
	<span>sessSeq: <c:out value="${sessSeq }"/> </span><br>
	<span>sessName: <c:out value="${sessName }"/> </span><br>
	<span>sessId: <c:out value="${sessId }"/> </span><br>
	<br>
	
	<c:if test="${not empty sessSeq}">
		<button type="button" class="btn btn-danger" id="btnLogout">로그아웃</button>
	</c:if>

	<%@include file="../include/footer.jsp"%>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
	 <script src="/resources/xdmin/js/validation.js"></script>
	 <script src="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
	 <script src="/resources/common/_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
	 <script type="text/javascript">
	 	$("#btnLogout").on("click",function(){
	 		$.ajax({
				async: true 
				,cache: false
				,type: "post"
				,url: "/member/logoutProc"
				,data : { "sessSeq" : $("#sessSeq").val(), "sessId" : $("#sessId").val()}
				,success: function(response) {
					if(response.rt == "success") {
						location.href = "/member/loginForm";
					} else {
						alert("오류");
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
	 	});
	 		
	 </script>
</body>
</html>