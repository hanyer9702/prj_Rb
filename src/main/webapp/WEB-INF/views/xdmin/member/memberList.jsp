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
	 <form id="formList" name="formList" method="get" action="memberList">
	 	<input type="hidden" id="thisPage" name="thisPage" value="<c:out value="${vo.thisPage}" default="1"/>">
	 	<input type="hidden" id="rowNumToShow" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow}" default="5"/>">
	 	<input type="hidden" id="ifmmSeq" name="ifmmSeq">
	 	<input type="hidden" name="checkboxSeqArray" >
		 <section>
		 		<h3>회원 목록</h3>
		 		
		 		<div class="modalM">
			 		<!-- Button trigger modal -->
					<button type="button" class="btn btn-primary modalBtn" data-bs-toggle="modal" data-bs-target="#exampleModal">
					  검색
					</button>
					
					
			 	</div>
		 		
		 		
			 		<div class="middle_sec">
				 		<div class="row row-cols-2 row-cols-sm-4 g-3 align-items-center">
					 		<div class="col-6 col-sm-3">
					 			<select class="form-select" id="ifmmDelNy" name="ifmmDelNy">
								  <option value="" selected>삭제여부</option>
								  <option value="0" <c:if test="${vo.ifmmDelNy eq 0}">selected</c:if>>N</option>
								  <option value="1" <c:if test="${vo.ifmmDelNy eq 1}">selected</c:if>>Y</option>
								</select>
					 		</div>
					 		<div class="col-6 col-sm-3">
					 			<select class="form-select" name="shOptionDate" id="shOptionDate">
								  <option value=""  selected>선택</option>
								  <option value="1" <c:if test="${vo.shOptionDate eq 1}">selected</c:if>>등록일</option>
								  <option value="2" <c:if test="${vo.shOptionDate eq 2}">selected</c:if>>수정일</option>
								  <option value="3" <c:if test="${vo.shOptionDate eq 3}">selected</c:if>>생일</option>
								</select>
					 		</div>
					 		<div class="col-6 col-sm-3">
					 			<fmt:parseDate var="shDateStart" value="${vo.shDateStart }" pattern="yyyy-MM-dd HH:mm:ss"/>
					 			<input type="text" id="shDateStart" name="shDateStart" class="form-control" value="<fmt:formatDate value="${shDateStart }" pattern="yyyy-MM-dd" />" placeholder="시작일">
								<%--<input type="text" id="shDateStart" name="shDateStart" class="form-control" value="${vo.shDateStart}" placeholder="시작일"> --%>
					 		</div>
					 		<div class="col-6 col-sm-3">
					 			<fmt:parseDate var="shDateEnd" value="${vo.shDateEnd }" pattern="yyyy-MM-dd HH:mm:ss"/>
					 			<input type="text" id="shDateEnd" name="shDateEnd" class="form-control" value="<fmt:formatDate value="${shDateEnd }" pattern="yyyy-MM-dd" />" placeholder="종료일">
					 			<%-- <input type="text" id="shDateEnd" name="shDateEnd" class="form-control" value="${vo.shDateEnd}" placeholder="종료일"> --%>
					 			<%-- <fmt:formatDate value="${vo.shDateEnd}" pattern="yyyy-MM-dd"/> --%>
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
					 			<button type="button" id="btnReset" class="btn btn-outline-danger" onclick="location.href='memberList';">초기화</button>
					 		</div>
				 		</div>
			 		</div>
			 	
		 	</section>
		 	<section>
		 		<div class="row align-items-center">
		 			<div class="col-6 col-sm-3">
		 				<h4 style="float: left;">Total : ${vo.totalRows}</h4>
		 			</div>
	 				<!-- <form class="col-2 col-sm-1 offset-4 offset-sm-8 px-1 px-sm-3" id="" name="" method="get"> -->
					<div class="col-2 col-sm-1 offset-4 offset-sm-8 px-1 px-sm-3">
		 				<select class="form-select form-select-sm" id="selectRowNumShow" onchange="changeSelectedValue()">
							<option value="5" <c:if test="${vo.rowNumToShow eq 5}">selected</c:if>>5</option>
							<option value="10" <c:if test="${vo.rowNumToShow eq 10}">selected</c:if>>10</option>
							<option value="20" <c:if test="${vo.rowNumToShow eq 20}">selected</c:if>>20</option>
						</select>
					</div>
					<!-- </form> -->
		 		</div>
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
		 		<div>
					<nav aria-label="..."> 
					  <ul class="pagination justify-content-center">
					    <c:if test="${vo.startPage gt vo.pageNumToShow}">
							<%-- <li class="page-item"><a class="page-link" href="memberList?rowNumToShow=${vo.rowNumToShow}&thisPage=${vo.startPage - 1}">&laquo;</a></li> --%>
							<li class="page-item"><a class="page-link" href="javascript:goList(${vo.startPage - 1})">&laquo;</a></li>
						</c:if>
						<c:forEach begin="${vo.startPage}" end="${vo.endPage}" varStatus="i">
							<c:choose>
								<c:when test="${i.index eq vo.thisPage}">
						                <li class="page-item active"><a class="page-link" href="javascript:goList(${i.index})">${i.index}</a></li>
								</c:when>
								<c:otherwise>             
						                <li class="page-item"><a class="page-link" href="javascript:goList(${i.index})">${i.index}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>     
						<c:if test="${vo.endPage ne vo.totalPages}">                
						                <li class="page-item"><a class="page-link" href="javascript:goList(${vo.endPage + 1})">&raquo;</a></li>
						</c:if>
					  </ul>
					</nav>
					
					<div style="float:left;" role="group">
					  <button type="button" class="btn btn-primary" onclick="javascript:goForm()">등록</button>
					</div>
					<div style="float:right;" role="group">
					  <button type="button" class="btn btn-danger" onclick="javascript:btnUpdateDel()">목록에서 삭제</button>
					  <button type="button" class="btn btn-dark" onclick="javascript:btnDelete()">DB에서 삭제</button>
					</div>
		 		</div>
		 	</section>
	 	</form>
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
	 <script src="/resources/common/jquery/jquery-ui-1.13.1.custom/jquery-ui.js"></script>
	 
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
		
		goList = function(seq){
			$("#thisPage").val(seq);
			$("#formList").submit();
		} 
		
		goListModal = function(seq){
			$("#thisPage").val(seq);
			$("#formList").submit();
		} 
		
		goView = function(seq){
			$("#ifmmSeq").val(seq);
			$("#formList").attr("action","memberView");
			$("#formList").submit();
		} 
		
		goForm = function(){
			$("#formList").attr("action","memberForm");
			$("#formList").submit();
		} 
		
		function changeSelectedValue(){
		    var rowNumSelect = document.getElementById("selectRowNumShow");
		      
		    var selectedValue = rowNumSelect.options[rowNumSelect.selectedIndex].value;
		  
		    $("#rowNumToShow").val(selectedValue);
			$("#formList").submit();
		}
		
		/* btnUpdateDel = function(){
			var num = confirm("진짜로 DB에서 삭제 하시겠습니까?");
			var checkbox = $("input[name=checkboxSeq]:checked");
			
			var col0 = "";
			var col1 = "";
						
			checkbox.each(function(i){
				
				var tr = checkbox.parent().parent().parent().eq(i);
				var td = tr.children();
				
				col0 = td.eq(1).text();
				col1 = td.eq(2).text();
			});
			
			alert(col0);
			alert(col1); 
			
			if(num){
				$("#ifmmSeq").val(col1);
				$("#formList").attr("action","memberDelete");
				$("#formList").submit();
			} else {
				return false;
			}
		} */
		
		btnUpdateDel = function(){
			
			var checkboxSeqArray = [];
			
			$("input[name=checkboxSeq]:checked").each(function() { 
				checkboxSeqArray.push($(this).val());
			});
			
			$("input:hidden[name=checkboxSeqArray]").val(checkboxSeqArray);
											
			var num = confirm("목록에서 삭제 하시겠습니까?");
			
			if(num){
									
				$("#formList").attr("action", "memberMultiUele").submit();
			}
		}
		
		btnDelete = function(){
			var checkboxSeqArray = [];
			
			$("input[name=checkboxSeq]:checked").each(function() { 
				checkboxSeqArray.push($(this).val());
			});
			
			$("input:hidden[name=checkboxSeqArray]").val(checkboxSeqArray);
			
			var num = confirm("진짜로 DB에서 삭제 하시겠습니까?");
			
			if(num){			
				$("#formList").attr("action", "memberMultiDele").submit();
			}
		}
		
		
		$("#checkboxAll").click(function(){
			if($("#checkboxAll").is(":checked")) $("input[name=checkboxSeq]").prop("checked",true);
			else $("input[name=checkboxSeq]").prop("checked",false);
		});
		
		
		$(document).ready(function(){ 
			$("#shDateStart").datepicker();
		});
		$(document).ready(function(){ 
			$("#shDateEnd").datepicker();
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
	</script>
	 
	 <script src="/resources/common/_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>