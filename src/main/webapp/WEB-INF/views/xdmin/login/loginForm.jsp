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
	a{
		text-decoration: none;
		color: black;
	}
	a:hover{
		color: black;
		text-decoration: underline;
	}
	.linksns{
		cursor: pointer;
	}
	.linksq{
		padding: 40px;
		color: gray;
	}
	.linksen{
		padding-top: 20px;
	}
	.top_body{
		background-color: #EAEAEA;
		height: 100%;
	}
	.middle_body{
		width: 700px;
		padding: 80px;
		padding-top: 50px; 
		padding-bottom: 0px;
		background-color: white;
		margin-left: auto;
		margin-right: auto;
		height: 100%;
	}
	.ad{
		width: 300px;
		cursor: pointer;
	}
</style>
</head>
<body>
	<div class="top_body">
		<div class="middle_body">
			<header>
				<img class="mainIcon" alt="" src="/resources/xdmin/image/icon_main_128.png" onclick="location.href='';">
				<button type="button" style="float: right; margin-top: 40px; background-color: white; border: 1px solid #BDBDBD;">비로그인 주문조회</button>
			</header>
			<section>
				 <form action="" method="post" id="" name="" enctype="multipart/form-data">
				 	<div class="form-check" style="margin-bottom: 20px;">
						<input class="form-check-input" type="checkbox" value="" id="keepLogin">
						<label class="form-check-label" for="keepLogin">
							로그인 유지
						</label>
				 	</div>
				 	<div>
				 		<div class="mb-3 mar">
						    <input type="text" class="form-control form-control-lg" id="ifmmId" name="ifmmId" placeholder="아이디/인증 이메일">
						  </div>
						  <div class="mb-3">
						  	<input type="password" class="form-control form-control-lg" id="ifmmPassword" name="ifmmPassword" placeholder="비밀번호">
						  </div>
						  <div class="d-grid gap-2">
						  	<button type="button" class="btn btn-primary btn-lg" id="btnLogin" name="">로그인</button>
						  </div>
				 	</div>
				 	<div class="row g-3 align-items-center" style="padding-top: 20px; min-width: 500px;">
						<div class="col-auto" style="margin-left:auto;">
							<a href="">아이디 찾기</a>
						</div>
						<div class="col-auto">|</div>
						<div class="col-auto">
							<a href="">비밀번호 찾기</a>
						</div>
						<div class="col-auto">|</div>
						<div class="col-auto" style="margin-right:auto;">
							<a href="">회원가입</a>
						</div>
					</div>
					<div class="row g-3 align-items-center" style="min-width: 565px;">
						<div class="col-auto linksq" style="margin-left:auto;">
							<div class="circle linksns" onclick="location.href='';" style="float: none;">
								<img alt="" src="/resources/xdmin/image/icon_naver_128.png">
							</div>
							<div class="linksns linksen">
								<div>네이버 로그인</div>
							</div>
						</div>
						<div class="col-auto linksq">
							<div class="circle linksns" onclick="location.href='';">
								<img alt="" src="/resources/xdmin/image/icon_kakao_128.png">
							</div>
							<div class="linksns linksen">
								<div>카카오 로그인</div>
							</div>
						</div>
						<div class="col-auto linksq" style="margin-right:auto;">
							<div class="circle linksns" onclick="location.href='';">
								<img alt="" src="/resources/xdmin/image/icon_facebook_128.png">
							</div>
							<div class="linksns linksen">
								<div>페이스북 로그인</div>
							</div>
						</div>
					</div>
				 </form>
				 <div style="margin-left: 25%;">
				 	<img class="ad" alt="" src="/resources/xdmin/image/ad.png">
				 </div>
			</section>
			<footer>
				<span class="bottom_span">Copyright © rebecca Co., Ltd. ALl Rights Reserved.</span>
			</footer>
		 </div>
	 </div>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
	 <script src="/resources/xdmin/js/validation.js"></script>
	 <script src="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
	 <script src="/resources/common/_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
	 <script type="text/javascript">
	 	$("#btnLogin").on("click",function(){
	 		
	 		if(!checkNull($("#ifmmId"), $("#ifmmId").val(), "아이디를 입력하세요.")) return false;
	 		if(!checkNull($("#ifmmPassword"), $("#ifmmPassword").val(), "비밀번호를 입력하세요.")) return false;
	 		
	 		$.ajax({
				async: true 
				,cache: false
				,type: "post"
				,url: "/member/loginProc"
				,data : { "ifmmId" : $("#ifmmId").val(), "ifmmPassword" : $("#ifmmPassword").val()}
				,success: function(response) {
					if(response.rt == "success") {
						location.href = "/index/indexView";
					} else {
						alert("회원없음");
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