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
	 <div> <!-- offset -->
	 	<header class="container-fluid">
	 		<div class="row">
	 			<div class="col-11 col-sm-6">
	 				<img style="max-width:15%;" class="mainIcon" alt="" src="/resources/xdmin/image/icon_main_128.png" onclick="location.href='memberList';">
		 			<h1 style="display: inline-block; padding-left: 10px;">RB</h1>
	 			</div>
	 			<div class="col-1 col-sm-4 offset-sm-2">
	 				<div style="float: right; max-length:20%; display: inline-block; padding-left: 10px;">
		 				<h5>icebear(manager)</h5>
		 				<h5>administrator</h5>
		 			</div>
	 				<div class="circle" style="float: right;">
	 				<img alt="" src="/resources/icebear.jpg">
		 			</div>
	 			</div>
	 		</div>
	 	</header>
	 	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="#">Navbar</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNav">
		      <ul class="navbar-nav">
		        <li class="nav-item">
			    <a class="nav-link active" aria-current="page" href="#">Home</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">회원관리</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">상품관리</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">배송관리</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#">시스템관리</a>
				  </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	 </div>
	 <script src="/resources/common/_bootstrap/bootstrap-5.1.3-dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>