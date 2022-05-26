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
	<div class="table-responsive-xxl">
		<table class="table table-hover table-light"> 
			<tr class="table-secondary">
				<td>
					<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="checkboxAll" name="checkboxAll">
					</div>
				</td>
				<td>번호</td>
				<td>이름</td>
				<td>아이디</td>
				<td>성별</td>
				<td>주소</td>
				<td>모바일</td>
				<td>이메일</td>
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
							<td>
								<div class="form-check">
								  <input type="checkbox" class="form-check-input" id="checkboxSeq" name="checkboxSeq" value="<c:out value="${item.ifmmSeq}"/>">
								</div>
							</td>
							<%-- <td><a href="memberView?ifmmSeq=${item.ifmmSeq}"><c:out value="${item.ifmmName}"/></a></td> --%>
							<td><c:out value="${item.ifmmSeq}"/></a></td>
							<td><a href="javascript:goView(${item.ifmmSeq})"><c:out value="${item.ifmmName}"/></a></td>
							<td><c:out value="${item.ifmmId}"/></td>
							<td> 
								<c:set var="listCodeGender" value="${MemberServiceImpl.selectListCachedCode('2')}"/>
								<c:forEach items="${listCodeGender}" var="itemGender" varStatus="statusGender">
									<c:if test="${item.ifmmGenderCd eq itemGender.ifcdSeq}"><c:out value="${itemGender.ifcdName}"/></c:if>
								</c:forEach>
							</td>
							<td><c:out value="${item.ifmaAddress}"/></td>
							<%-- <td><c:out value="${item.ifmpNumberDash}"/></td> --%>
							<td>
								<c:choose>
			                		<c:when test="${fn:length(item.ifmpNumber) eq 10 }">
										<c:out value="${fn:substring(item.ifmpNumber,0,3)}"/>
										-<c:out value="${fn:substring(item.ifmpNumber,3,6)}"/>
										-<c:out value="${fn:substring(item.ifmpNumber,6,10)}"/>
			                		</c:when>
			                		<c:otherwise>
										<c:out value="${fn:substring(item.ifmpNumber,0,3)}"/>
										-<c:out value="${fn:substring(item.ifmpNumber,3,7)}"/>
										-<c:out value="${fn:substring(item.ifmpNumber,7,11)}"/>
			                		</c:otherwise>
			               		</c:choose>
			               		<%-- <c:set var="numberPhone" value="${item.ifmpNumber }"/>
			                	<c:choose>
			                		<c:when test="${fn:length(numberPhone) eq 10 }">
										<c:out value="${fn:substring(numberPhone,0,3)}"/>
										- <c:out value="${fn:substring(numberPhone,3,6)}"/>
										- <c:out value="${fn:substring(numberPhone,6,10)}"/>
			                		</c:when>
			                		<c:otherwise>
										<c:out value="${fn:substring(numberPhone,0,3)}"/>
										- <c:out value="${fn:substring(numberPhone,3,7)}"/>
										- <c:out value="${fn:substring(numberPhone,7,11)}"/>
			                		</c:otherwise>
			               		</c:choose> --%>
							</td>
							<td><c:out value="${item.ifmeEmailFull}"/></td>
						</tr> 
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	
	<script src="/resources/common/_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>