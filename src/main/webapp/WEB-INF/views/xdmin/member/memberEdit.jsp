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
		 	<h3 class="p-1">회원 등록</h3>
		 	<form id="" name="" method="get" action="memberInst">
		 		<div class="row g-3 p-2">
				  <div class="mb-3 col-sm-6">
				    <label for="userName" class="form-label">이름</label>
				    <input type="text" class="form-control" id="ifmmName" name="ifmmName" value="${rt.ifmmName}">
				  </div>
				  <div class="col-sm-6 row align-items-center mb-3 ps-3">
				  	<label for="" class="form-label">성별</label>
					  <div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmGenderCd" id="ifmmGenderCdM" value="3">
						  <label class="form-check-label" for="ifmmGenderCdM">
						    남성
						  </label>
						</div>
						<div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmGenderCd" id="ifmmGenderCdW" value="4">
						  <label class="form-check-label" for=""ifmmGenderCdW"">
						    여성
						  </label>
						</div>
					</div>
					<div class="col-sm-6">
						<label for="userId" class="form-label">아이디</label>
						<div class="input-group mb-3">
						  <input type="text" class="form-control" id="ifmmId" name="ifmmId">
						  <button class="btn btn-outline-secondary" type="button" id="userIdCheckButton" data-bs-toggle="modal" data-bs-target="#userIdModal">중복확인</button>
						</div>
					</div>
				  <div class="mb-3 col-sm-6">
				    <label for="userPassword" class="form-label">비밀번호</label>
				    <input type="password" class="form-control" id="ifmmPassword" name="ifmmPassword">
				  </div>
				  <div class="mb-3 col-sm-6">
				    <label for="userBirth" class="form-label">생일</label>
				    <input type="date" class="form-control" id="ifmmDob" name="ifmmDob">
				  </div>
				  <div class="mb-3 col-sm-6">
				  	<label for="ifnaSeq" class="form-label">국적</label>
				  	<select class="form-select" id="ifnaSeq" name="ifnaSeq">
					  <option selected>선택하세요</option>
					  <option value="1">한국</option>
					  <option value="2">미국</option>
					  <option value="3">캐나다</option>
					</select>
				  </div>
				  <div class="mb-3 col-sm-8 g-2">
				  	<label for="userZipcode" class="form-label">주소</label>
				  	<div class="input-group mb-2">
					  <!-- <input type="text" class="form-control" id="userZipcode" disabled readonly> -->
					  <input type="text" class="form-control" id="ifmaZipcode" name="ifmaZipcode">
					  <button class="btn btn-outline-secondary" type="button" id="userAddressButton" data-bs-toggle="modal" data-bs-target="#userAddressModal">주소찾기</button>
					</div>
				    <!-- <input type="text" class="form-control mb-2" id="userAddress1" disabled readonly> -->
				    <input type="text" class="form-control mb-2" id="ifmaAddress1" name="ifmaAddress1">
				    <input type="text" class="form-control" id="ifmaAddress2" name="ifmaAddress2" placeholder="상세주소">
				  </div>
				  <div class="mb-3 col-sm-6 row g-2 align-items-center">
				  	<label for="userMobile" class="form-label">핸드폰</label>
				  	<div class="col-3 col-md-2">
						<select class="form-select form-select-sm" id="ifmpTelecomCd" name="ifmpTelecomCd">
							<option selected>통신사</option>
							<option value="28">SKT</option>
							<option value="29">KT</option>
							<option value="30">LG</option>
							<option value="31">기타</option>
						</select>
					</div>
					<div class="col-2 col-md-3">
						<input type="text" class="form-control" id="ifmpNumber1" name="ifmpNumber1" size="2">
					</div>
					<div class="col-auto">-</div>
					<div class="col-3">
						<input type="text" class="form-control" id="ifmpNumber2" name="ifmpNumber2"	size="3">
					</div>
					<div class="col-auto">-</div>
					<div class="col-3">
						<input type="text" class="form-control" id="ifmpNumber3" name="ifmpNumber3" size="3">
					</div>
				  </div>
				  <div class="col-sm-6 row align-items-center mb-3 ps-3">
				  	<label for="" class="form-label">모바일 마케팅 수신 동의</label>
					  <div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmSmsConsentNy" id="ifmmSmsConsentY" value="1">
						  <label class="form-check-label" for="ifmmSmsConsentY">
						    동의
						  </label>
						</div>
						<div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmSmsConsentNy" id="ifmmSmsConsentN" value="0">
						  <label class="form-check-label" for="ifmmSmsConsentN">
						    비동의
						  </label>
						</div>
					</div>
				<div class="mb-3 col-sm-6 row g-2 align-items-center">
				  	<label for="userMobile" class="form-label">전화번호</label>
					<div class="col-3">
						<input type="text" class="form-control" id="ifmpPhone1" name="ifmpPhone1"	size="3">
					</div>
					<div class="col-auto">-</div>
					<div class="col-4">
						<input type="text" class="form-control" id="ifmpPhone2" name="ifmpPhone2"	size="3">
					</div>
					<div class="col-auto">-</div>
					<div class="col-4">
						<input type="text" class="form-control" id="ifmpPhone3" name="ifmpPhone3" size="3">
					</div>
				  </div>
				  <div class="mb-3 col-sm-6 row g-2 align-items-center">
				  	<label for="userMobile" class="form-label">팩스</label>
					<div class="col-3">
						<input type="text" class="form-control" id="ifmpFax1" name="ifmpFax1"	size="3">
					</div>
					<div class="col-auto">-</div>
					<div class="col-4">
						<input type="text" class="form-control" id="ifmpFax2" name="ifmpFax2"	size="3">
					</div>
					<div class="col-auto">-</div>
					<div class="col-4">
						<input type="text" class="form-control" id="ifmpFax3" name="ifmpFax3" size="3">
					</div>
				  </div>
				  <div class="col-sm-6 mb-3">
				  	<label for="userEmail" class="form-label">이메일</label>
				  	<div class="row g-3 align-items-center">
						<div class="col-6 col-md-7">
							<input type="text" id="ifmeEmailAccount" name="ifmeEmailAccount" class="form-control">
						</div>
						<div class="col-1 col-md-auto">
							@
						</div>
						<div class="col-5 col-md-4">
							<select class="form-select" id="ifmeEmailDomainCd" name="ifmeEmailDomainCd">
							  <option selected>이메일</option>
							  <option value="16">naver.com</option>
							  <option value="17">daum.net</option>
							  <option value="18">gmail.com</option>
							  <option value="19">직접입력</option>
							</select>
						</div>
					</div>
				  </div>
				  <div class="col-sm-6 row align-items-center mb-3 ps-3">
				  	<label for="" class="form-label">이메일 마케팅 수신 동의</label>
					  <div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmEmailConsentNy" id="ifmmEmailConsentY" value="1">
						  <label class="form-check-label" for="ifmmEmailConsentY">
						    동의
						  </label>
						</div>
						<div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmEmailConsentNy" id="ifmmEmailConsentN" value="0">
						  <label class="form-check-label" for="ifmmEmailConsentN">
						    비동의
						  </label>
						</div>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="userRecommender" class="form-label">추천인</label>
					    <input type="text" class="form-control" id="ifmmRecommenderName" name="ifmmRecommenderName">
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="ifmmSavedCd" class="form-label">개인정보유효기간 동의</label>
					    <select class="form-select" id="ifmmSavedCd" name="ifmmSavedCd">
								<option selected>기간</option>
								<option value="5">1년</option>
								<option value="6">2년</option>
								<option value="7">3년</option>
								<option value="8">5년</option>
								<option value="9">10년</option>
								<option value="10">탈퇴시</option>
						</select>
					</div>
					<div class="mb-3 col-sm-6">
						<label for="ifjqQuestionCd" class="form-label">비밀번호 찾기 문제</label>
						<select id="ifjqQuestionCd" name="ifjqQuestionCd" class="form-select">
							<option selected>질문</option>
							<option value="61">내가 태어난 병원은?</option>
							<option value="62">내가 졸업한 초등학교는?</option>
							<option value="63">가장 친한 친구는?</option>
							<option value="64">아버지 성함은?</option>
							<option value="65">존경하는 인물은?</option>
						</select>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="ifjqAnswer" class="form-label">비밀번호 찾기 답</label>
					    <input type="text" class="form-control" id="ifjqAnswer" name="ifjqAnswer">
					</div>
					<div class="mb-3 col-sm-6">
						<label for="ifaoSnsTypeCd" class="form-label">SNS</label>
						<select id="ifaoSnsTypeCd" name="ifaoSnsTypeCd"	class="form-select">
							<option selected>sns선택</option>
							<option value="34">페이스북</option>
							<option value="35">인스타그램</option>
							<option value="36">트위터</option>
							<option value="37">카톡</option>
						</select>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="ifaoUrl" class="form-label">홈페이지</label>
					    <input type="text" class="form-control" id="ifaoUrl" name="ifaoUrl">
					</div> 
					<div class="col-sm-6 row align-items-center mb-3 ps-4 me-2">
				  		<label for="ifmmMarriageCd" class="form-label">결혼여부</label>
					  <div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmMarriageCd" id="ifmmMarriageCdY">
						  <label class="form-check-label" for="ifmmMarriageCdY">
						    기혼
						  </label>
						</div>
						<div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmMarriageCd" id="ifmmMarriageCdN">
						  <label class="form-check-label" for="ifmmMarriageCdN">
						    미혼
						  </label>
						</div>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="userWeddingAniversary" class="form-label">결혼기념일</label>
					    <input type="date" class="form-control" id="ifmmMarriageDate" name="ifmmMarriageDate">		
				  </div>
				  <div class="mb-3 col-sm-6">
					    <label for="userChildrenNum" class="form-label">자녀수</label>
					    <input type="text" class="form-control" id="ifmmChildrenNum" name="ifmmChildrenNum">
					</div>
					<div class="mb-3 col-auto">
					    <label for="userColor" class="form-label">좋아하는 색깔</label>
					    <input type="color" class="form-control" id="ifmmFavoriteColor" name="ifmmFavoriteColor">
					</div>
					<div class="mb-3">
						<label for="userHobby" class="form-label">취미</label>
						<div class="mb-3">
							<input type="checkbox" class="btn-check" id="ifmhHobbyCd1" name="ifmhHobbyCd1" value="38" autocomplete="off">
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
							<label class="btn btn-outline-primary" for="ifmhHobbyCd7">조각하기</label>
						</div>
					</div>
					<div class="mb-3">
						<label for="userIntroduce" class="form-label">자기소개</label>
						<textarea class="form-control" id="ifmmDesc" name="ifmmDesc" rows="3"></textarea>
					</div>
				</div>
			  <button type="button" class="btn btn-danger m-2" onclick="location.href='memberList'">돌아가기</button>
			  <button type="submit" class="btn btn-primary m-2 float-end">등록</button>
			</form>
		 
		 </section>
		 
 	</div>
	 
	<!-- Modal id check -->
	<div class="modal fade" id="userIdModal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="userIdCheck">아이디 중복 확인</h5>
					<button type="button" class="btn-close"	data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">사용 가능한 아이디입니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"	data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal id check end -->
	
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
	 
	 
	<!-- modal address -->
	
	<div class="modal fade" id="userAddressModal" tabindex="-1">
	  <div class="modal-dialog" >
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">주소 검색</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
	      </div>
	      <div class="modal-body">
	        <form>
	          <div class="mb-3">
	            <input type="text" class="form-control" id="recipient-name" placeholder="예) 판교역로 235, 분당 주공, 삼평동 681">
	          </div>
	          <div class="mb-3">
	            <div style="margin: 10px;">
	            	<h4>tip</h4>
	            	<h6>아래와 같은 조합으로 검색을 하시면 더욱 정확한 결과가 검색됩니다.<h6></h6><br>
	            	
	            	<h6>도로명 + 건물번호</h6>
	            	<h6 class="b6">예) 판교역로 235, 제주 첨단로 242</h6>
	            	<h6>지역명(동/리) + 번지</h6>
	            	<h6 class="b6">예) 삼평동 681, 제주 영평동 2181</h6>
	            	<h6>지역명(동/리) + 건물명(아파트명)</h6>
	            	<h6 class="b6">예) 분당 주공, 연수동 주공3차</h6>
	            	<h6>사서함명 + 번호</h6>
	            	<h6 class="b6">예) 분당우체국사서함 1~100</h6>
	            </div>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- modal address end -->
	
	<%@include file="../include/footer.jsp"%>
	 
	<script src="/resources/common/_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
