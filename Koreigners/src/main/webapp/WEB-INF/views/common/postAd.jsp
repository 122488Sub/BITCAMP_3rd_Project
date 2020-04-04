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
<script>

</script>
</head>
<body>

<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2></h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
<div></div>
	<div>
		<c:if test="${user.mem_cate eq 'c' }">
			<a href="hireWrite_go.do">Job</a>
		</c:if>
		<c:if test="${user.mem_cate eq 'p' }">
			<a href="myPage_go.do?type=resume">Job</a>
		</c:if>
		<c:if test="${empty user }">
			<a href="login_go.do">Job</a>
		</c:if>
	</div>
	<br><br><br><br>
	<div>
		<a href="hireWrite_go.do">Hire</a>
	</div>
	<br>
	<div>
		<a href="house_insert.do">House</a>
	</div>
	<br>
	<div>
		<a href="resale_go.do">Resale</a>
	</div>
</body>
</html>