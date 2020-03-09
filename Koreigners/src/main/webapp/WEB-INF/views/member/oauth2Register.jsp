<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Naver or Google Register Page</title>
	<link href="${contextPath}/resources/css/register.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
<body>
	
	<div id="register_container">
		<h1>Create Account</h1>
		<div class="login">
		  <form class="form" action="${contextPath}/setRegister.do" method="post">
			<ul>
				<c:if test="${snsMemVO.mem_image != null }">
					<li>
						<img src="${snsMemVO.mem_image }" alt="photo">
					</li>
				</c:if>
				<li>
					<span class="returnText">
						<input type="radio" name="mem_cate" value="p" required>Person
						<input type="radio" name="mem_cate" value="c" required>Company
					</span>
				</li>
				<li>
					<span class="spanText"> Your name *
						<input type="text" id="login-email" name="mem_name" class="input_box" value="${snsMemVO.mem_name }" readonly>
					</span>
				</li>
				<li>
					<span class="spanText"> Email *
						<input type="email" id="login-email" name="mem_id" class="input_box" value="${snsMemVO.mem_id }" readonly>
					</span>
				</li>
				<li>
					<span class="spanText"> Locale *
						<input type="text" id="login-email" name="mem_nationality" class="input_box" value="${snsMemVO.mem_nationality }" readonly>
					</span>
				</li>
				<li>
				<hr>
					<span class="spanText">Are you an Employer? 
						<a class="a_href" href="job_join.do">click here</a>
					</span>
				</li>
				<li>
					<span>
						<input type="submit" class="button" value="Create Account">
						<input type="hidden" name="mem_pw" value="${snsMemVO.mem_pw }">
						<input type="hidden" name="mem_image" value="${snsMemVO.mem_image }">
					</span>
				</li>
			</ul>
		</form>
	 </div>
 </div>
	 
	<div id="footer">footer</div>	
</body>
</html>