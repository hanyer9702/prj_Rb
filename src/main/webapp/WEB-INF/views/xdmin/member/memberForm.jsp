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
		 	<form id="" name="" method="post" action="memberInst">
		 		<div class="row g-3 p-2">
				  <div class="mb-3 col-sm-6">
				    <label for="userName" class="form-label">이름</label>
				    <input type="text" class="form-control" id="ifmmName" name="ifmmName">
				  </div>
				  <div class="col-sm-6 row align-items-center mb-3 ps-3">
				  	<label for="" class="form-label">성별</label>
					  <div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmGender" id="userGenderMan" value="3">
						  <label class="form-check-label" for="userGenderMan">
						    남성
						  </label>
						</div>
						<div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="ifmmGender" id="userGenderWoman" value="4">
						  <label class="form-check-label" for="userGenderWoman">
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
				  	<label for="userNationality" class="form-label">국적</label>
				  	<select class="form-select">
					  <option selected>선택하세요</option>
					  <option value="1">한국</option>
					  <option value="2">미국</option>
					  <option value="3">캐나다</option>
					</select>
				  </div>
				  <div class="mb-3 col-sm-8 g-2">
				  	<label for="userZipcode" class="form-label">주소</label>
				  	<div class="input-group mb-2">
					  <input type="text" class="form-control" id="userZipcode" disabled readonly>
					  <button class="btn btn-outline-secondary" type="button" id="userAddressButton" data-bs-toggle="modal" data-bs-target="#userAddressModal">주소찾기</button>
					</div>
				    <!-- <input type="text" class="form-control" id="userZipcode" disabled readonly> -->
				    <input type="text" class="form-control mb-2" id="userAddress1" disabled readonly>
				    <input type="text" class="form-control" id="userAddress2" placeholder="상세주소">
				  </div>
				  <div class="mb-3 col-sm-6 row g-2 align-items-center">
				  	<label for="userMobile" class="form-label">핸드폰</label>
				  	<div class="col-3 col-md-2">
						<select class="form-select form-select-sm">
							<option selected>통신사</option>
							<option value="1">SKT</option>
							<option value="2">KT</option>
							<option value="3">LG</option>
							<option value="4">알뜰폰</option>
						</select>
					</div>
					<div class="col-2 col-md-3">
						<input type="text" class="form-control" id="userMobile1" name="userMobile1" size="2">
					</div>
					<div class="col-auto">-</div>
					<div class="col-3">
						<input type="text" class="form-control" id="userMobile2" name="userMobile2"	size="3">
					</div>
					<div class="col-auto">-</div>
					<div class="col-3">
						<input type="text" class="form-control" id="userMobile3" name="userMobile3" size="3">
					</div>
				  </div>
				  <div class="col-sm-6 row align-items-center mb-3 ps-3">
				  	<label for="" class="form-label">모바일 마케팅 수신 동의</label>
					  <div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="userMobileAgree" id="userMobileAgreeOk">
						  <label class="form-check-label" for="userMobileAgreeOk">
						    동의
						  </label>
						</div>
						<div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="userMobileAgree" id="userMobileAgreeNo">
						  <label class="form-check-label" for="userMobileAgreeNo">
						    비동의
						  </label>
						</div>
					</div>
				<div class="mb-3 col-sm-6 row g-2 align-items-center">
				  	<label for="userMobile" class="form-label">전화번호</label>
					<div class="col-3">
						<select class="form-select form-select-sm">
							<option selected>지역번호</option>
							<option value="1">02</option>
							<option value="2">031</option>
							<option value="3">032</option>
							<option value="4">033</option>
							<option value="5">041</option>
							<option value="6">042</option>
							<option value="7">043</option>
							<option value="8">051</option>
							<option value="9">052</option>
							<option value="10">053</option>
							<option value="11">054</option>
							<option value="12">055</option>
							<option value="13">061</option>
							<option value="14">062</option>
							<option value="15">063</option>
							<option value="16">064</option>
						</select>
					</div>
					<div class="col-auto">-</div>
					<div class="col-4">
						<input type="text" class="form-control" id="userMobile2" name="userPhone2"	size="3">
					</div>
					<div class="col-auto">-</div>
					<div class="col-4">
						<input type="text" class="form-control" id="userMobile3" name="userPhone3" size="3">
					</div>
				  </div>
				  <div class="mb-3 col-sm-6 row g-2 align-items-center">
				  	<label for="userMobile" class="form-label">팩스</label>
					<div class="col-3">
						<input type="text" class="form-control" id="userMobile2" name="userFax1"	size="3">
					</div>
					<div class="col-auto">-</div>
					<div class="col-4">
						<input type="text" class="form-control" id="userMobile2" name="userFax2"	size="3">
					</div>
					<div class="col-auto">-</div>
					<div class="col-4">
						<input type="text" class="form-control" id="userMobile3" name="userFax3" size="3">
					</div>
				  </div>
				  <div class="col-sm-6 mb-3">
				  	<label for="userEmail" class="form-label">이메일</label>
				  	<div class="row g-3 align-items-center">
						<div class="col-6 col-md-7">
							<input type="text" id="userEmail" name="userEmail" class="form-control">
						</div>
						<div class="col-1 col-md-auto">
							@
						</div>
						<div class="col-5 col-md-4">
							<select class="form-select">
							  <option selected>이메일</option>
							  <option value="1">naver.com</option>
							  <option value="2">daum.net</option>
							  <option value="3">gmail.com</option>
							  <option value="4">직접입력</option>
							</select>
						</div>
					</div>
				  </div>
				  <div class="col-sm-6 row align-items-center mb-3 ps-3">
				  	<label for="" class="form-label">이메일 마케팅 수신 동의</label>
					  <div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="userEmailAgree" id="userEmailAgreeOk">
						  <label class="form-check-label" for="userEmailAgreeOk">
						    동의
						  </label>
						</div>
						<div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="userEmailAgree" id="userEmailAgreeNo">
						  <label class="form-check-label" for="userEmailAgreeNo">
						    비동의
						  </label>
						</div>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="userRecommender" class="form-label">추천인</label>
					    <input type="text" class="form-control" id="userRecommender">
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="userSave" class="form-label">개인정보유효기간 동의</label>
					    <select class="form-select">
								<option selected>기간</option>
								<option value="1">1년</option>
								<option value="2">3년</option>
								<option value="3">5년</option>
								<option value="4">10년</option>
								<option value="5">탈퇴시</option>
						</select>
					</div>
					<div class="mb-3 col-sm-6">
						<label for="userPasswordQuestion" class="form-label">비밀번호 찾기 문제</label>
						<select id="userPasswordQuestion" name="userPasswordQuestion"	class="form-select">
							<option selected>질문</option>
							<option value="1">내가 졸업한 초등학교는?</option>
							<option value="2">제일 친한 친구는?</option>
							<option value="3">아버지 성함은?</option>
						</select>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="userPasswordAnswer" class="form-label">비밀번호 찾기 답</label>
					    <input type="text" class="form-control" id="userPasswordAnswer">
					</div>
					<div class="mb-3 col-sm-6">
						<label for="userSns" class="form-label">SNS</label>
						<select id="userSns" name="userSns"	class="form-select">
							<option selected>sns선택</option>
							<option value="1">인스타그램</option>
							<option value="2">페이스북</option>
							<option value="3">트위터</option>
						</select>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="userHomepage" class="form-label">홈페이지</label>
					    <input type="text" class="form-control" id="userHomepage">
					</div>
					<div class="col-sm-6 row align-items-center mb-3 ps-4 me-2">
				  		<label for="" class="form-label">결혼여부</label>
					  <div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="userMarriage" id="userMarriageY">
						  <label class="form-check-label" for="userMarriageY">
						    기혼
						  </label>
						</div>
						<div class="form-check col-3 col-md-2">
						  <input class="form-check-input" type="radio" name="userMarriage" id="userMarriageN">
						  <label class="form-check-label" for="userMarriageN">
						    미혼
						  </label>
						</div>
					</div>
					<div class="mb-3 col-sm-6">
					    <label for="userWeddingAniversary" class="form-label">결혼기념일</label>
					    <input type="date" class="form-control" id="userWeddingAniversary">		
				  </div>
				  <div class="mb-3 col-sm-6">
					    <label for="userChildrenNum" class="form-label">자녀수</label>
					    <input type="text" class="form-control" id="userChildrenNum">
					</div>
					<div class="mb-3 col-auto">
					    <label for="userColor" class="form-label">좋아하는 색깔</label>
					    <input type="color" class="form-control" id="userColor">
					</div>
					<div class="mb-3">
						<label for="userHobby" class="form-label">취미</label>
						<div class="mb-3">
							<input type="checkbox" class="btn-check" id="userHobby1" autocomplete="off">
							<label class="btn btn-outline-primary" for="userHobby1">영화보기</label>
							<input type="checkbox" class="btn-check" id="userHobby2" autocomplete="off"> 
							<label class="btn btn-outline-primary" for="userHobby2">음악감상</label> 
							<input type="checkbox" class="btn-check" id="userHobby3" autocomplete="off">
							<label class="btn btn-outline-primary" for="userHobby3">등산</label>
							<input type="checkbox" class="btn-check" id="userHobby4" autocomplete="off"> 
							<label class="btn btn-outline-primary" for="userHobby4">달리기</label> 
							<input type="checkbox" class="btn-check" id="userHobby5" autocomplete="off">
							<label class="btn btn-outline-primary" for="userHobby5">운동</label>
							<input type="checkbox" class="btn-check" id="userHobby6" autocomplete="off"> 
							<label class="btn btn-outline-primary" for="userHobby6">악기연주</label> 
							<input type="checkbox" class="btn-check" id="userHobby7" autocomplete="off">
							<label class="btn btn-outline-primary" for="userHobby7">독서</label>
						</div>
					</div>
					<div class="mb-3">
						<label for="userIntroduce" class="form-label">자기소개</label>
						<textarea class="form-control" id="userIntroduce" rows="3"></textarea>
					</div>
				</div>
			  <button type="button" class="btn btn-danger m-2">돌아가기</button>
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