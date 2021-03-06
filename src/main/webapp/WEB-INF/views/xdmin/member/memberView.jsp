<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<jsp:useBean id="MemberServiceImpl" class="com.rbproject.store.modules.member.MemberServiceImpl"/>

<% pageContext.setAttribute("br", "\n"); %>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="uTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/resources/common/_bootstrap/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/common/css/style.css" rel="stylesheet" type="text/css">
<title>한예린</title>
<style type="text/css">
	td, th{
		white-space:nowrap;
		word-break:nowrap;
	}
	.circle{
		width: 60px;
		height: 60px;
	}
	.circle img{
		top: 4px;
		left: 4px;
	}
	header{
		padding: 20px;
		display: block;
	}
	@media screen and (max-width:540px){
		h5{
			display:none;
		}
		h1{
			font-size:20px;
		}
		.circle{
		width: 45px;
		height: 45px;
		}
		.circle img{
			top: 3px;
			left: 4px;
			width: 35px;
			height: 35px;
		}
		.middle_sec{
			display: none;
		}
		.modalM{
			display: block;
			text-align: center;
		}
		.modalBtn{
			display: inline;
			margin-left: auto;
			margin-right: auto;
		}
	}
	.b6{
		color: blue;
	}
</style>
</head>
<body>
	 <%@include file="../include/top.jsp"%>
	 
	 <section>
		<div class="table-responsive">
			<table class="table table-bordered">
				<tr>
					<th style="width: 15%">이름</th>
					<td style="width: 35%"><c:out value="${rt.ifmmName}"/></td>
					<th style="width: 15%">성별</th>
					<td style="width: 35%"><c:out value="${rt.ifmmGender}"/></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><c:out value="${rt.ifmmId}"/></td>
					<th>비밀번호</th>
					<td>***********</td>
				</tr>
				<tr>
					<th>생일</th>
					<td><c:out value="${rt.ifmmDob}"/></td>
					<th>국적</th>
					<td><c:out value="${rt.ifnaName}"/></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="3"><c:out value="${rt.ifmaAddress}"/></td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td><c:out value="${rt.ifmpNumberDash}"/></td>
					<th>모바일 마케팅 수신 동의</th>
					<%-- <td><c:out value="${rt.ifmmSmsConsentNy}"/></td> --%>
					<td>
						<c:choose>
							<c:when test="${rt.ifmmSmsConsentNy eq 0}">
								동의하지 않음
							</c:when>
							<c:when test="${rt.ifmmSmsConsentNy eq 1}">
								동의함
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><c:out value="${rt.ifmpHomeNumber}"/></td>
					<th>팩스</th>
					<td><c:out value="${rt.ifmpFaxNumber}"/></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><c:out value="${rt.ifmeEmailFull}"/></td>
					<th>이메일 마케팅 수신 동의</th>
					<%-- <td><c:out value="${rt.ifmmEmailConsentNy}"/></td> --%>
					<td>
						<c:choose>
							<c:when test="${rt.ifmmEmailConsentNy eq 0}">
								동의하지 않음
							</c:when>
							<c:when test="${rt.ifmmEmailConsentNy eq 1}">
								동의함
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>개인정보유효기간 동의</th>
					<td colspan="3"><c:out value="${rt.ifmmSaved}"/></td>
				</tr>
				<tr>
					<th>비밀번호 찾기 문제</th>
					<td><c:out value="${rt.ifjqQuestion}"/></td>
					<th>비밀번호 찾기 답</th>
					<td><c:out value="${rt.ifjqAnswer}"/></td>
				</tr>
				<tr>
					<th>SNS</th>
					<td><c:out value="${rt.ifmmSns}"/></td>
					<th>홈페이지</th>
					<td><c:out value="${rt.ifaoUrl}"/></td>
				</tr>
				<tr>
					<th>결혼여부</th>
					<td><c:out value="${rt.ifmmMarriage}"/></td>
					<th>결혼기념일</th>
					<td><c:out value="${rt.ifmmMarriageDate}"/></td>
				</tr>
				<tr>
					<th>자녀수</th>
					<td><c:out value="${rt.ifmmChildrenNum}"/></td>
					<th>좋아하는 색깔</th>
					<td>
						<!-- <div class="mb-3 row"> class="form-control col-1"-->
							<input type="color" id="userColor" value="${rt.ifmmFavoriteColor}" disabled>
						<!-- </div> -->
					</td>
				</tr>
				<tr>
					<th>취미</th>
					<td colspan="3">
						<c:set var="listCodeHobby" value="${MemberServiceImpl.selectListCachedCode('12')}"/>
						<c:forEach items="${listHobby}" var="itemHobby" varStatus="statusHobby">
							<c:forEach items="${listCodeHobby}" var="itemHobbyCode" varStatus="statusHobbyCode">
								<c:if test="${itemHobby.ifmhHobbyCd eq itemHobbyCode.ifcdSeq}"><c:out value="${itemHobbyCode.ifcdName}"/> </c:if>
							</c:forEach>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>자기소개</th>
					<td colspan="3">
						<%-- <p>${fn:replace(item.ifmmDesc, br, '<br/>')}</p> --%>
            			<p><c:out value="${fn:replace(rt.ifmmDesc, br, '<br/>')}" escapeXml = "false"/></p>
					</td>
				</tr>
			</table>
			<button type="button" class="btn btn-success" onclick="javascript:goList()">목록</button>
			<div class="float-end">
				<button type="button" class="btn btn-warning" onclick="javascript:goEdit(${rt.ifmmSeq})">수정</button>
				<button type="button" class="btn btn-danger" onclick="javascript:btnUpdateDel(${rt.ifmmSeq})">목록에서 삭제</button>
				<button type="button" class="btn btn-dark" onclick="javascript:btnDelete(${rt.ifmmSeq})">DB에서 삭제</button>
			</div>
		</div>
	</section>
	<form id="formView" name="formView" method="post" action="">
		<input type="hidden" id="thisPage" name="thisPage" value="${vo.thisPage}">
		<input type="hidden" id="shOption" name="shOption" value="${vo.shOption}">
		<input type="hidden" id="shValue" name="shValue" value="${vo.shValue}">
		<input type="hidden" id="rowNumToShow" name="rowNumToShow" value="${vo.rowNumToShow}">
		<input type="hidden" id="ifmmSeq" name="ifmmSeq" value="${vo.ifmmSeq}">
		<!-- <input type="submit"> -->
	</form>
	
	<!-- modal delete s -->

	<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원 삭제</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
				</div>
				<div class="modal-body">정말로 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-danger" onclick="location.href='memberList'">삭제</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- modal delete e -->
	 
	 <%@include file="../include/footer.jsp"%>
	 <script src="/resources/common/_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 

	<script type="text/javascript">
		goList = function(){
			$("#formView").attr("action","memberList");
			$("#formView").submit();
		} 
		goEdit = function(seq){
			$("#ifmmSeq").val(seq);
			$("#formView").attr("action","memberEdit");
			$("#formView").submit();
		} 
		
		btnDelete = function(seq){
			var num = confirm("진짜로 DB에서 삭제 하시겠습니까?");
			
			if(num){
				$("#ifmmSeq").val(seq);
				$("#formView").attr("action","memberDelete");
				$("#formView").submit();
			} else {
				return false;
			}
		}
		
		btnUpdateDel = function(seq){
			var num = confirm("목록에서 삭제 하시겠습니까?");
			
			if(num){
				$("#ifmmSeq").val(seq);
				$("#formView").attr("action","memberUpdateDel");
				$("#formView").submit();
			} else {
				return false;
			}
		}
		
	</script>
</body>
</html>