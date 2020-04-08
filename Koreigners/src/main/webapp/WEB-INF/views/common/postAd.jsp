<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <style type="text/css">
    	#default {height: 775px;}
    	p {font-size: 25px;}
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.center {
		float:none;
		margin: 0 auto;
	}
	
	.button-style {
		width: 60%;
		font-size: 1.5em;
		font-weight: 700;
		border-radius: .25rem;
	}
</style>
</head>
<body>

<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Post an AD</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    
    <div class="cart-box-main">
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-10 col-lg-6 center" style="text-align:center">
				<div class="mb-3">
					<div class="title-left">
	                    <h2 class="font-weight-bold">Choose where you are going to post!</h2>
	                </div>
	                <hr class="mb-3">
					<div>
						<c:if test="${user.mem_cate eq 'c' }">
							<button class="btn hvr-hover button-style" onclick="location.href='hireWrite_go.do'">Job</button>
						</c:if>
						<c:if test="${user.mem_cate eq 'p' }">
							<button class="btn hvr-hover button-style" onclick="location.href='myPage_go.do?type=resume'">Job</button>
						</c:if>
						<c:if test="${empty user }">
							<button class="btn hvr-hover button-style" onclick="location.href='myPage_go.do?type=resume'">Job</button>						
						</c:if>
					</div>
					<br>
					<div>
						<button class="btn hvr-hover button-style" onclick="location.href='house_insert.do'">House</button>
					</div>
					<br>
					<div>
						<button class="btn hvr-hover button-style" onclick="location.href='resale_go.do'">Resale</button>
					</div>
					<br>
					<div>
						<button class="btn hvr-hover button-style" onclick="location.href='InfoInsert_go.do'">Information</button>
					</div>
				</div>
    		</div>
		</div>
	</div>
</body>
</html>