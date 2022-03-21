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
	section{
		padding: 10px;
	}
	h3{
		text-align: center;
	}
	.middle_sec{
		border: 1px solid #BDBDBD;
		margin: 5px;
		padding: 10px;
	}
	.middle_sec div{
		padding-bottom: 5px;
	}
	.modalM{
		display:none;
	}
	/* h1{
		font-size: 3rem;
	}
	h5{
		font-size: 2rem;
	} */
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
</style>
</head>
<body>
	 <%@include file="../include/top.jsp"%>
	 
	 <section>
	 		<h3>회원 목록</h3>
	 		
	 		<div class="modalM">
		 		<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary modalBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">
				  검색
				</button>
				
				
		 	</div>
	 		
	 		<form id="" name="" method="get" action="memberList">
		 		<div class="middle_sec">
			 		<div class="row row-cols-2 row-cols-sm-4 g-3 align-items-center">
				 		<div class="col-6 col-sm-3">
				 			<select class="form-select">
							  <option selected>Open this select menu</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
							</select>
				 		</div>
				 		<div class="col-6 col-sm-3">
				 			<select class="form-select">
							  <option selected>Open this select menu</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
							</select>
				 		</div>
				 		<div class="col-6 col-sm-3">
				 			<input type="text" id="startDate" class="form-control" placeholder="시작일">
				 		</div>
				 		<div class="col-6 col-sm-3">
				 			<input type="text" id="endDate" class="form-control" placeholder="종료일">
				 		</div>
				 		<div class="col-6 col-sm-3">
				 			<select class="form-select" name="shOption" id="shOption">
							  <option value=""  selected>선택</option>
							  <option value="1" <c:if test="${vo.shOption eq 1}">selected</c:if>>이름</option>
							  <option value="2" <c:if test="${vo.shOption eq 2}">selected</c:if>>id</option>
							  <option value="3" <c:if test="${vo.shOption eq 3}">selected</c:if>>주소</option>
							  <option value="4" <c:if test="${vo.shOption eq 4}">selected</c:if>>전화번호</option>
							</select>
				 		</div>
				 		<div class="col-6 col-sm-3">
				 			<input type="text" id="shValue" class="form-control" placeholder="검색어" name="shValue" <c:if test="${vo.shValue ne null}">value="${vo.shValue}"</c:if>>
				 		</div>
				 		<div>
				 			<button type="submit" id="btnSubmit" class="btn btn-outline-secondary">검색</button>
				 			<button type="reset" id="btnReset" class="btn btn-outline-danger">초기화</button>
				 		</div>
			 		</div>
		 		</div>
		 	</form>
	 	</section>
	 	<section>
	 		<div class="row align-items-center">
	 			<div class="col-6 col-sm-3">
	 				<h4 style="float: left;">Total : ${vo.totalRows}</h4>
	 			</div>
 				<form class="col-2 col-sm-1 offset-4 offset-sm-8 px-1 px-sm-3" id="" name="" method="get">
	 				<select class="form-select form-select-sm" id="selectRowNumShow" onchange="location.href=this.value">
						<option value="memberList?rowNumToShow=5" <c:if test="${vo.rowNumToShow eq 5}">selected</c:if>>5</option>
						<option value="memberList?rowNumToShow=10" <c:if test="${vo.rowNumToShow eq 10}">selected</c:if>>10</option>
						<option value="memberList?rowNumToShow=20" <c:if test="${vo.rowNumToShow eq 20}">selected</c:if>>20</option>
					</select>
				</form>
	 		</div>
	 		<div class="table-responsive-xxl">
	 			<table class="table table-hover table-light"> 
					<tr class="table-secondary">
						<td>
							<div class="form-check">
							  <input class="form-check-input" type="checkbox" value="" id="delCheck">
							</div>
						</td>
						<td>이름</td>
						<td>아이디</td>
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
										  <input class="form-check-input" type="checkbox" value="" id="delCheck">
										</div>
									</td>
									<td><a href="memberView?ifmmSeq=${item.ifmmSeq}"><c:out value="${item.ifmmName}"/></a></td>
									<td><c:out value="${item.ifmmId}"/></td>
									<td><c:out value="${item.ifmaAddress}"/></td>
									<td><c:out value="${item.ifmpNumberDash}"/></td>
									<td><c:out value="${item.ifmeEmailFull}"/></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
	 		</div>
	 		<div>
				<nav aria-label="..."> 
				  <ul class="pagination justify-content-center">
				    <c:if test="${vo.startPage gt vo.pageNumToShow}">
						<li class="page-item"><a class="page-link" href="memberList?rowNumToShow=${vo.rowNumToShow}&thisPage=${vo.startPage - 1}">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${vo.startPage}" end="${vo.endPage}" varStatus="i">
						<c:choose>
							<c:when test="${i.index eq vo.thisPage}">
					                <li class="page-item active"><a class="page-link" href="memberList?rowNumToShow=${vo.rowNumToShow}&thisPage=${i.index}">${i.index}</a></li>
							</c:when>
							<c:otherwise>             
					                <li class="page-item"><a class="page-link" href="memberList?rowNumToShow=${vo.rowNumToShow}&thisPage=${i.index}">${i.index}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>     
					<c:if test="${vo.endPage ne vo.totalPages}">                
					                <li class="page-item"><a class="page-link" href="memberList?rowNumToShow=${vo.rowNumToShow}&thisPage=${vo.endPage + 1}">&raquo;</a></li>
					</c:if>
				  </ul>
				</nav>
				
				<div class="btn-group" style="float:right;" role="group">
				  <button type="button" class="btn btn-primary" onclick="location.href='memberForm'">등록</button>
				  <button type="button" class="btn btn-danger">삭제</button>
				</div>
	 		</div>
	 	</section>
	 	
	 	<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <form id="" name="" method="get" action="memberList">
			      <div class="modal-body">
			        <div class="row row-cols-2 row-cols-sm-4 g-3 align-items-center">
				 		<div class="col-6 col-sm-3">
				 			<select class="form-select">
							  <option selected>Open this select menu</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
							</select>
				 		</div>
				 		<div class="col-6 col-sm-3">
				 			<select class="form-select">
							  <option selected>Open this select menu</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
							</select>
				 		</div>
				 		<div class="col-6 col-sm-3">
				 			<input type="text" id="startDate" class="form-control" placeholder="시작일">
				 		</div>
				 		<div class="col-6 col-sm-3">
				 			<input type="text" id="endDate" class="form-control" placeholder="종료일">
				 		</div>
				 		<div class="col-6 col-sm-3">
				 			<select class="form-select" name="shOption" id="shOptionModal">
							  <option value="" selected>선택</option>
							  <option value="1" <c:if test="${vo.shOption eq 1}">selected</c:if>>이름</option>
							  <option value="2" <c:if test="${vo.shOption eq 2}">selected</c:if>>id</option>
							  <option value="3" <c:if test="${vo.shOption eq 3}">selected</c:if>>주소</option>
							  <option value="4" <c:if test="${vo.shOption eq 4}">selected</c:if>>전화번호</option>
							</select>
				 		</div>
				 		<div class="col-6 col-sm-3">
				 			<input type="text" id="shValueModal" name="shValue" class="form-control" placeholder="검색어">
				 		</div>
	 				</div>
			      </div>
			
			      <div class="modal-footer">
			        <button type="submit" id="btnSubmit2" class="btn btn-outline-secondary">검색</button>
				 	<button type="button" class="btn btn-outline-danger">초기화</button>
			 		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		     	 </div>
		      </form>
		    </div>
		  </div>
		</div>
 		<!-- modal end -->
	 
	 <%@include file="../include/footer.jsp"%>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
	 <script src="/resources/xdmin/js/validation.js"></script>
	 
	 <script type="text/javascript">
		$("#btnSubmit").on("click", function(){
			if(!checkNull($("#shOption"), $("#shOption").val(), "항목을 선택하세요!")) return false;
			if(!checkNull($("#shValue"), $("#shValue").val(), "검색어를 입력하세요!")) return false;
		})
		
		$("#btnSubmit2").on("click", function(){
			if(!checkNull($("#shOptionModal"), $("#shOptionModal").val(), "항목을 선택하세요!")) return false;
			if(!checkNull($("#shValueModal"), $("#shValueModal").val(), "검색어를 입력하세요!")) return false;
		})
		
		$("#btnReset").on("click", function(){
			$("#shOption").val('');
			$("#shValue").val('');
		})
	</script>
	 
	 <script src="/resources/common/_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>