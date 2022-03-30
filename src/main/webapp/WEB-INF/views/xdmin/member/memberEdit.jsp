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
	<div>
		 <%@include file="../include/top.jsp"%>
		 
		 <section>
		 	<h3 class="p-1">회원 수정</h3>
		 	<form id="formEdit" name="formEdit" method="post" action="memberUpdt" class="needs-validation" novalidate>
		 		<input type="hidden" id="thisPage" name="thisPage" value="${vo.thisPage}">
				<input type="hidden" id="shOption" name="shOption" value="${vo.shOption}">
				<input type="hidden" id="shValue" name="shValue" value="${vo.shValue}">
				<input type="hidden" id="rowNumToShow" name="rowNumToShow" value="${vo.rowNumToShow}">
				<input type="hidden" id="ifmmSeq" name="ifmmSeq" value="${vo.ifmmSeq}">
		 		<div class="row g-3 p-2">
				  <div class="mb-3 col-sm-6">
				    <label for="userName" class="form-label">이름</label>
				    <input type="text" class="form-control" id="ifmmName" name="ifmmName" value="${rt.ifmmName}" required disabled>
					<div class="invalid-feedback">
						이름을 입력하세요.
					</div>
				  </div>
				  <div class="col-sm-6 row align-items-center mb-3 ps-3">
				  	<label for="" class="form-label">성별</label>
					  <!-- <div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmGenderCd" id="ifmmGenderCdM" value="3" required>
						  <label class="form-check-label" for="ifmmGenderCdM">
						    남성
						  </label>
						</div>
						<div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmGenderCd" id="ifmmGenderCdW" value="4" required>
						  <label class="form-check-label" for="ifmmGenderCdW">
						    여성
						  </label>
						</div> -->
						<c:forEach items="${codeGender}" var="itemGender" varStatus="statusGender">
							<%-- <option value="<c:out value="${itemGender.ifcdSeq}"/>" <c:if test="${item.kbmmGenderCd eq itemGender.ifcdOrder }">selected</c:if> ><c:out value="${itemGender.ifcdName}"/></option> --%>
							<div class="form-check col-3 col-md-2">
								<input class="form-check-input" type="radio" name="ifmmGenderCd" id="ifmmGenderCd<c:out value="${itemGender.ifcdSeq}"/>" value="<c:out value="${itemGender.ifcdSeq}"/>" required <c:if test="${rt.ifmmGender eq itemGender.ifcdName}">checked</c:if> disabled>
								<label class="form-check-label" for="ifmmGenderCd<c:out value="${itemGender.ifcdSeq}"/>">
									<c:out value="${itemGender.ifcdName}"/>
								</label>
							</div>
						</c:forEach>
					</div>
					<div class="col-sm-6">
						<label for="userId" class="form-label">아이디</label>
						<div class="input-group mb-3 row">
						  <div class="col-12">
							  <input type="text" class="form-control ifmmId" id="ifmmId" name="ifmmId" value="${rt.ifmmId}" disabled>
						  </div>
						  <div class="col-12">
							  <font id = "checkId" class="px-1" style="font-size:13px;"></font>
						  </div>
						</div>
					</div>
				  <div class="mb-3 col-sm-6">
				    <label for="userPassword" class="form-label">비밀번호</label>
				    <div>
				    	<span id="passChange" style="margin-top: 15px;"	class="badge bg-secondary" data-bs-toggle="modal" data-bs-target="#passwordChangeModal">비밀번호 변경</span>
				  	</div>
				  </div>
				  <div class="mb-3 col-sm-6">
				    <label for="userBirth" class="form-label">생일</label>
				    <input type="text" class="form-control" id="ifmmDob" name="ifmmDob" value="${rt.ifmmDob}" disabled>
				  </div>
				  <div class="mb-3 col-sm-6">
				  	<label for="ifnaSeq" class="form-label">국적</label>
				  	<select class="form-select" id="ifnaSeq" name="ifnaSeq" disabled>
					  <option selected>선택하세요</option>
					  <option value="1" <c:if test="${rt.ifnaName eq '대한민국'}">selected</c:if>>대한민국</option>
					  <option value="2" <c:if test="${rt.ifnaName eq '미국'}">selected</c:if>>미국</option>
					  <option value="3" <c:if test="${rt.ifnaName eq '캐나다'}">selected</c:if>>캐나다</option>
					</select>
				  </div>
				  <div class="mb-3 col-sm-8 g-2">
				  	<label for="userZipcode" class="form-label">주소</label>
				  	<div class="input-group mb-2">
					  <input type="text" class="form-control" id="ifmaZipcode" name="ifmaZipcode" value="${rt.ifmaZipcode}" readonly>
					  <!-- <input type="text" class="form-control" id="ifmaZipcode" name="ifmaZipcode"> -->
					  <button class="btn btn-outline-secondary" type="button" id="userAddressButton" onclick="execDaumPostcode()">주소찾기</button>
					</div>
				    <input type="text" class="form-control mb-2" id="ifmaAddress1" name="ifmaAddress1" value="${rt.ifmaAddress1}" readonly>
				    <!-- <input type="text" class="form-control mb-2" id="ifmaAddress1" name="ifmaAddress1"> -->
				    <input type="text" class="form-control mb-2" id="ifmaAddress2" name="ifmaAddress2" value="${rt.ifmaAddress2}" placeholder="상세주소" required>
				    <input type="text" class="form-control" id="ifmaAddress3" name="ifmaAddress3" placeholder="참고항목">
				  </div>
				  <div class="mb-3 col-sm-6 row g-2 align-items-center">
				  	<label for="userMobile" class="form-label">핸드폰</label>
				  	<div class="col-3 col-md-2">
						<select class="form-select form-select-sm" id="ifmpTelecomCd" name="ifmpTelecomCd">
							<option selected>통신사</option>
							<!-- <option value="28">SKT</option>
							<option value="29">KT</option>
							<option value="30">LG</option>
							<option value="31">기타</option> -->
							<c:forEach items="${codeTelecom}" var="itemTelecom" varStatus="statusTelecom">
								<option value="${itemTelecom.ifcdSeq}" <c:if test="${rt.ifmpTelecomCd eq itemTelecom.ifcdSeq}">selected</c:if>><c:out value="${itemTelecom.ifcdName}"/></option>
							</c:forEach>
						</select>
					</div>
					<div class="col-2 col-md-3">
						<input type="text" class="form-control" id="ifmpNumber1" name="ifmpNumber1" size="2" value="${rt.ifmpNumber1}">
					</div>
					<div class="col-auto">-</div>
					<div class="col-3">
						<input type="text" class="form-control" id="ifmpNumber2" name="ifmpNumber2"	size="3" value="${rt.ifmpNumber2}">
					</div>
					<div class="col-auto">-</div>
					<div class="col-3">
						<input type="text" class="form-control" id="ifmpNumber3" name="ifmpNumber3" size="3" value="${rt.ifmpNumber3}">
					</div>
				  </div>
				  <div class="col-sm-6 row align-items-center mb-3 ps-3">
				  	<label for="" class="form-label">모바일 마케팅 수신 동의</label>
					  <div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmSmsConsentNy" id="ifmmSmsConsentY" value="1" <c:if test="${rt.ifmmSmsConsentNy eq 1}">checked</c:if>>
						  <label class="form-check-label" for="ifmmSmsConsentY">
						    동의
						  </label>
						</div>
						<div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmSmsConsentNy" id="ifmmSmsConsentN" value="0" <c:if test="${rt.ifmmSmsConsentNy eq 0}">checked</c:if>>
						  <label class="form-check-label" for="ifmmSmsConsentN">
						    비동의
						  </label>
						</div>
					</div>
				<div class="mb-3 col-sm-6 row g-2 align-items-center">
				  	<label for="userMobile" class="form-label">전화번호</label>
					<div class="col-3">
						<input type="text" class="form-control" id="ifmpPhone1" name="ifmpPhone1"	size="3" value="${rt.ifmpPhone1}">
					</div>
					<div class="col-auto">-</div>
					<div class="col-4">
						<input type="text" class="form-control" id="ifmpPhone2" name="ifmpPhone2"	size="3" value="${rt.ifmpPhone2}">
					</div>
					<div class="col-auto">-</div>
					<div class="col-4">
						<input type="text" class="form-control" id="ifmpPhone3" name="ifmpPhone3" size="3" value="${rt.ifmpPhone3}">
					</div>
				  </div>
				  <div class="mb-3 col-sm-6 row g-2 align-items-center">
				  	<label for="userMobile" class="form-label">팩스</label>
					<div class="col-3">
						<input type="text" class="form-control" id="ifmpFax1" name="ifmpFax1"	size="3" value="${rt.ifmpFax1}">
					</div>
					<div class="col-auto">-</div>
					<div class="col-4">
						<input type="text" class="form-control" id="ifmpFax2" name="ifmpFax2"	size="3" value="${rt.ifmpFax2}">
					</div>
					<div class="col-auto">-</div>
					<div class="col-4">
						<input type="text" class="form-control" id="ifmpFax3" name="ifmpFax3" size="3" value="${rt.ifmpFax3}">
					</div>
				  </div>
				  <div class="col-sm-6 mb-3">
				  	<label for="userEmail" class="form-label">이메일</label>
				  	<div class="row g-3 align-items-center">
						<div class="col-6 col-md-7">
							<input type="text" id="ifmeEmailAccount" name="ifmeEmailAccount" class="form-control" value="${rt.ifmeEmailAccount}">
						</div>
						<div class="col-1 col-md-auto">
							@
						</div>
						<div class="col-5 col-md-4">
							<select class="form-select" id="ifmeEmailDomainCd" name="ifmeEmailDomainCd">
								<option selected>이메일</option>
									<!-- <option value="16">naver.com</option>
									<option value="17">daum.net</option>
									<option value="18">gmail.com</option>
									<option value="19">직접입력</option> -->
									<c:forEach items="${codeEmailDomain}" var="itemEmailDomain" varStatus="statusEmailDomain">
										<option value="${itemEmailDomain.ifcdSeq}" <c:if test="${rt.ifmeEmailDomainCd eq itemEmailDomain.ifcdSeq}">selected</c:if>><c:out value="${itemEmailDomain.ifcdName}"/></option>
									</c:forEach>
							</select>
						</div>
					</div>
				  </div>
				  <div class="col-sm-6 row align-items-center mb-3 ps-3">
				  	<label for="" class="form-label">이메일 마케팅 수신 동의</label>
					  <div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmEmailConsentNy" id="ifmmEmailConsentY" value="1" <c:if test="${rt.ifmmEmailConsentNy eq 0}">checked</c:if>>
						  <label class="form-check-label" for="ifmmEmailConsentY">
						    동의
						  </label>
						</div>
						<div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmEmailConsentNy" id="ifmmEmailConsentN" value="0" <c:if test="${rt.ifmmEmailConsentNy eq 1}">checked</c:if>>
						  <label class="form-check-label" for="ifmmEmailConsentN">
						    비동의
						  </label>
						</div>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="userRecommender" class="form-label">추천인</label>
					    <input type="text" class="form-control" id="ifmmRecommenderName" name="ifmmRecommenderName" value="${rt.ifmmRecommenderName}" disabled>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="ifmmSavedCd" class="form-label">개인정보유효기간 동의</label>
					    <select class="form-select" id="ifmmSavedCd" name="ifmmSavedCd">
								<option selected>기간</option>
								<!-- <option value="5">1년</option>
								<option value="6">2년</option>
								<option value="7">3년</option>
								<option value="8">5년</option>
								<option value="9">10년</option>
								<option value="10">탈퇴시</option> -->
								<c:forEach items="${codeAgreePeriod}" var="itemAgreePeriod" varStatus="statusAgreePeriod">
									<option value="${itemAgreePeriod.ifcdSeq}" <c:if test="${rt.ifmmSavedCd eq itemAgreePeriod.ifcdSeq}">selected</c:if>><c:out value="${itemAgreePeriod.ifcdName}"/></option>
								</c:forEach>
						</select>
					</div>
					<div class="mb-3 col-sm-6">
						<label for="ifjqQuestionCd" class="form-label">비밀번호 찾기 문제</label>
						<select id="ifjqQuestionCd" name="ifjqQuestionCd" class="form-select">
							<option selected>질문</option>
							<!-- <option value="61">내가 태어난 병원은?</option>
							<option value="62">내가 졸업한 초등학교는?</option>
							<option value="63">가장 친한 친구는?</option>
							<option value="64">아버지 성함은?</option>
							<option value="65">존경하는 인물은?</option> -->
							<c:forEach items="${codeQuestion}" var="itemQuestion" varStatus="statusQuestion">
								<option value="${itemQuestion.ifcdSeq}" <c:if test="${rt.ifjqQuestionCd eq itemQuestion.ifcdSeq}">selected</c:if>><c:out value="${itemQuestion.ifcdName}"/></option>
							</c:forEach>
						</select>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="ifjqAnswer" class="form-label">비밀번호 찾기 답</label>
					    <input type="text" class="form-control" id="ifjqAnswer" name="ifjqAnswer" value="${rt.ifjqAnswer}">
					</div>
					<div class="mb-3 col-sm-6">
						<label for="ifaoSnsTypeCd" class="form-label">SNS</label>
						<select id="ifaoSnsTypeCd" name="ifaoSnsTypeCd"	class="form-select">
							<option selected>sns선택</option>
							<!-- <option value="34">페이스북</option>
							<option value="35">인스타그램</option>
							<option value="36">트위터</option>
							<option value="37">카톡</option> -->
							<c:forEach items="${codeSns}" var="itemSns" varStatus="statusSns">
								<option value="${itemSns.ifcdSeq}" <c:if test="${rt.ifaoSnsTypeCd eq itemSns.ifcdSeq}">selected</c:if>><c:out value="${itemSns.ifcdName}"/></option>
							</c:forEach>
						</select>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="ifaoUrl" class="form-label">홈페이지</label>
					    <input type="text" class="form-control" id="ifaoUrl" name="ifaoUrl" value="${rt.ifaoUrl}">
					</div> 
					<div class="col-sm-6 row align-items-center mb-3 ps-4 me-2">
				  		<label for="ifmmMarriageCd" class="form-label">결혼여부</label>
					 	 <!-- <div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmMarriageCd" id="ifmmMarriageCdY" value="12">
						  <label class="form-check-label" for="ifmmMarriageCdY">
						    기혼
						  </label>
						</div>
						<div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmMarriageCd" id="ifmmMarriageCdN" value="11">
						  <label class="form-check-label" for="ifmmMarriageCdN">
						    미혼
						  </label>
						</div> -->
						<c:forEach items="${codeMarriageNy}" var="itemMarriageNy" varStatus="statusMarriageNy">
							<div class="form-check col-3 col-md-2">
								<input class="form-check-input" type="radio" name="ifmmMarriageCd" id="ifmmMarriageCd<c:out value="${itemMarriageNy.ifcdSeq}"/>" value="<c:out value="${itemMarriageNy.ifcdSeq}"/>" required <c:if test="${rt.ifmmMarriageCd eq itemMarriageNy.ifcdSeq}">checked</c:if>>
								<label class="form-check-label" for="ifmmMarriageCd<c:out value="${itemMarriageNy.ifcdSeq}"/>">
									<c:out value="${itemMarriageNy.ifcdName}"/>
								</label>
							</div>
						</c:forEach>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="userWeddingAniversary" class="form-label">결혼기념일</label>
					    <input type="text" class="form-control" id="ifmmMarriageDate" name="ifmmMarriageDate" value="${rt.ifmmMarriageDate}">		
				  </div>
				  <div class="mb-3 col-sm-6">
					    <label for="userChildrenNum" class="form-label">자녀수</label>
					    <input type="text" class="form-control" id="ifmmChildrenNum" name="ifmmChildrenNum" value="${rt.ifmmChildrenNum}">
					</div>
					<div class="mb-3 col-auto">
					    <label for="userColor" class="form-label">좋아하는 색깔</label>
					    <input type="color" class="form-control" id="ifmmFavoriteColor" name="ifmmFavoriteColor" value="${rt.ifmmFavoriteColor}">
					</div>
					<div class="mb-3">
						<label for="userHobby" class="form-label">취미</label>
						<div class="mb-3">
							<!-- <input type="checkbox" class="btn-check" id="ifmhHobbyCd1" name="ifmhHobbyCd1" value="38" autocomplete="off">
							<label class="btn btn-outline-primary" for="ifmhHobbyCd1">독서</label>
							<input type="checkbox" class="btn-check" id="ifmhHobbyCd2" name="ifmhHobbyCd2" value="39" autocomplete="off"> 
							<label class="btn btn-outline-primary" for="ifmhHobbyCd2">걷기</label> 
							<input type="checkbox" class="btn-check" id="ifmhHobbyCd3" name="ifmhHobbyCd3" value="40" autocomplete="off">
							<label class="btn btn-outline-primary" for="ifmhHobbyCd3">달리기</label>
							<input type="checkbox" class="btn-check" id="ifmhHobbyCd4" name="ifmhHobbyCd4" value="41" autocomplete="off"> 
							<label class="btn btn-outline-primary" for="ifmhHobbyCd4">자전거타기</label> 
							<input type="checkbox" class="btn-check" id="ifmhHobbyCd5" name="ifmhHobbyCd5" value="42" autocomplete="off">
							<label class="btn btn-outline-primary" for="ifmhHobbyCd5">뜨개질</label>
							<input type="checkbox" class="btn-check" id="ifmhHobbyCd6" name="ifmhHobbyCd6" value="43" autocomplete="off"> 
							<label class="btn btn-outline-primary" for="ifmhHobbyCd6">종이접기</label> 
							<input type="checkbox" class="btn-check" id="ifmhHobbyCd7" name="ifmhHobbyCd7" value="44" autocomplete="off">
							<label class="btn btn-outline-primary" for="ifmhHobbyCd7">조각하기</label> -->
							<c:set var="listCodeHobby" value="${MemberServiceImpl.selectListCachedCode('12')}"/>
							<c:forEach items="${listCodeHobby}" var="itemHobbyCode" varStatus="statusHobbyCode">
								<input type="checkbox" class="btn-check" id="ifmhHobbyCd<c:out value="${itemHobbyCode.ifcdSeq}"/>" name="ifmhHobbyCdArray" value="${itemHobbyCode.ifcdSeq}" autocomplete="off">
								<label class="btn btn-outline-primary" for="ifmhHobbyCd<c:out value="${itemHobbyCode.ifcdSeq}"/>"><c:out value="${itemHobbyCode.ifcdName}"/></label>
							</c:forEach>
							
						</div> 
					</div>
					<div class="mb-3">
						<label for="userIntroduce" class="form-label">자기소개</label>
						<textarea class="form-control" id="ifmmDesc" name="ifmmDesc" rows="3"><c:out value="${rt.ifmmDesc}"/></textarea>
					</div>
				</div>
			  <button type="button" class="btn btn-danger m-2" onclick="javascript:goList(${rt.ifmmSeq})">돌아가기</button>
			  <button type="submit" id="btnSubmit" class="btn btn-warning m-2 float-end" onclick="javascript:goUpdt(${rt.ifmmSeq})">수정</button>
			</form>
		 
		 </section>
		 
 	</div>
	
	<!-- modal passwordChange -->

	<div class="modal fade" id="passwordChangeModal" tabindex="-1" aria-labelledby="passwordChangeModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="passwordChangeModalLabel">비밀번호 변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form class="row g-3 needs-validation" id="passwordChangeForm" name="passwordChangeForm" method="post" action="updtPassword" enctype="multipart/form-data" novalidate>
					<div class="modal-body">
						<div class="mb-3">
							<label for="passwordCurrent" class="col-form-label">현재 비밀번호</label> 
							<input type="password" class="form-control" id="passwordCurrent"name="passwordCurrent" required>
							<div class="invalid-feedback">
						      </div>
						        <font id="checkPassword" style="font-size:13px;">현재 비밀번호를 입력하세요.</font>
						</div>
						<div class="mb-3">
							<label for="passwordChange" class="col-form-label">변경 비밀번호</label>
							 <input type="password" id="passwordChange" name="passwordChange" class="form-control"  required>
							 <div class="invalid-feedback">
						     	<font id="">변경할 비밀번호를 입력하세요.</font>
						    </div>
						</div>
						<div class="mb-3">
							<label for="passwordChangeAgain" class="col-form-label">변경 비밀번호 재입력</label> 
							<input type="password" id="ifmmPassword" name="ifmmPassword" class="form-control"  required>
							<div class="invalid-feedback">
						    </div>
						      <font id="passwordChangeAgainFont" style="font-size:13px;">변경할 비밀번호를 한번 더 입력하세요.</font>
						</div>
						<input type="hidden" id="thisPage" name="thisPage" value="${vo.thisPage}">
						<input type="hidden" id="shOption" name="shOption" value="${vo.shOption}">
						<input type="hidden" id="shValue" name="shValue" value="${vo.shValue}">
						<input type="hidden" id="rowNumToShow" name="rowNumToShow" value="${vo.rowNumToShow}">
						<input type="hidden" id="ifmmSeq" name="ifmmSeq" value="${rt.ifmmSeq}">
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">취소</button>
						<%-- <button type="button" class="btn btn-primary" onclick="javascript:updtPasswordfunc(${rt.ifmmSeq})">변경하기</button> --%>
						<button type="submit" class="btn btn-primary" data-bs-dismiss="modal">변경하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- modal passwordChange end -->
	
	<!-- Modal id check false -->
	<!-- <div class="modal fade" id="userIdModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="userIdCheck">아이디 중복 확인</h5>
					<button type="button" class="btn-close"	data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">중복된 아이디입니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div> -->
	<!-- modal id check false end -->
	
	
	
	<%@include file="../include/footer.jsp"%>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	 <script src="/resources/xdmin/js/validation.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
	 <script src="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
	 
	 <script type="text/javascript">
		/* $("#btnSubmit").on("click", function(){
			if(!checkNull($("#ifmmName"), $("#ifmmName").val(), "이름을 입력하세요!")) return false;
			if(!checkNull($("#ifmmId"), $("#ifmmId").val(), "아이디를 입력하세요!")) return false;
		}) */
		
		$(document).ready(function(){
			<c:forEach items="${listHobby}" var="itemHobby" varStatus="statusHobby">
				$("input[id=ifmhHobbyCd"+${itemHobby.ifmhHobbyCd}+"]").prop("checked",true);
			</c:forEach>
		});
		
		$(document).ready(function(){ 
			$("#ifmmDob").datepicker();
		});
		$(document).ready(function(){ 
			$("#ifmmMarriageDate").datepicker();
		});
		
		$.datepicker.setDefaults({
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		    yearSuffix: '년'
		});
		
		// 유효하지 않은 필드가 있는 경우 양식 제출을 비활성화하기 위한 예제 스타터 JavaScript
		(function () {
		  'use strict'

		  // 사용자 정의 부트스트랩 유효성 검사 스타일을 적용하려는 모든 양식을 가져옵니다.
		  var forms = document.querySelectorAll('.needs-validation')

		  // 루프를 돌고 제출을 방지합니다.
		  Array.prototype.slice.call(forms)
		    .forEach(function (form) {
		      form.addEventListener('submit', function (event) {
		        if (!form.checkValidity()) {
		          event.preventDefault()
		          event.stopPropagation()
		        }

		        form.classList.add('was-validated')
		      }, false)
		    })
		})()
		
		goList = function(seq){
			$("#ifmmSeq").val(seq);
			$("#formEdit").attr("action","memberView");
			$("#formEdit").submit();
		} 
		goUpdt = function(seq){
			$("#ifmmSeq").val(seq);
			$("#formEdit").attr("action","memberUpdt");
			$("#formEdit").submit();
		} 
		
		/* updtPasswordfunc = function(seq){
			alert(seq);
			$("#ifmmSeq").val(seq);
			$("#passwordChangeForm").attr("action","updtPassword");
			$("#passwordChangeForm").submit();
		}  */
		
		$(document).ready(function(){	
			$("#passwordChangeForm").submit(function(event){
				submitForm();
				return false;
			});
		});
		
		function submitForm(){
			let ifmmPassword = $('#ifmmPassword').val();
			let ifmmSeq = $('#ifmmSeq').val();
			
			 $.ajax({
				type: "POST",
				url: "/updtPassword",
				data: {ifmmPassword: ifmmPassword, ifmmSeq: ifmmSeq},
				dataType : 'json',
				success: function(response){
					/* $("#passwordChangeModal").modal('hide'); */
					$(".modal-fade").modal("hide");
					$(".modal-backdrop").remove();
				},
				error: function(){
					alert("Error");
				}
			});
		}
		
		/* $('#passwordChangeForm').submit(function() {
			
			$("#passwordChangeForm").attr("action","updtPassword");

		}); */
		
		$('#ifmmPassword').focusout(function(){
			let p1 = $('#passwordChange').val();
			let p2 = $('#ifmmPassword').val();
			
			if(p1 == p2){
				$('#passwordChangeAgainFont').html('');
			} else{
				$('#passwordChangeAgainFont').html('비밀번호가 같지 않습니다.');
				$('#passwordChangeAgainFont').attr('color','red');
			}
		})
		
		$('#passwordCurrent').focusout(function(){
			let passwordCurrentVal = $('#passwordCurrent').val();
			let ifmmSeq = $('#ifmmSeq').val();
			
			$.ajax({
				url : "/PasswordCheck",
				type : "post",
				data : {ifmmPassword: passwordCurrentVal, ifmmSeq: ifmmSeq},
				dataType : 'json',
				success : function(result){
					if(result == 0){
						$('#checkPassword').html('비밀번호가 틀렸습니다.');
						$('#checkPassword').attr('color','red');
					} else{
						$('#checkPassword').html('');
						$('#checkPassword').attr('color','green');
					}
				},
				error : function(){
					alert("서버요청실패");
				}
			})
		})
		
		
	</script>
	
	
	
	
	<!-- 지도 -->
	<script>
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("ifmaAddress3").value = extraAddr;
	                
	                } else {
	                    document.getElementById("ifmaAddress3").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('ifmaZipcode').value = data.zonecode;
	                document.getElementById("ifmaAddress1").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("ifmaAddress2").focus();
	            }
	        }).open();
	    }
	</script>
	
	<!-- 지도 -->
	 
	<script src="/resources/common/_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
