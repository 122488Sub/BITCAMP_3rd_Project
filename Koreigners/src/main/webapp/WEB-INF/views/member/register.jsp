<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입</title>
<link href="resources/css/header.css" rel="stylesheet" type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<link href="resources/css/member/register.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/member/register.js"></script>
</head>
<body>

	<div id="container">
		<h1>Create Account</h1>
		<hr>
		<br>
		<form id="regiForm" action="join.do" method="post">
			<input type="hidden" name="mem_cate" value="p">
			<div>
				<span class="text">
					<label>Nickname *</label>
				</span>
				<br>
					<input type="text" id="mem_name" name="mem_name" class="input_box" placeholder="Name" required>
					<div id="getMemberNick"></div>
			</div>
			<br>
			<div>
				<span class="text">
					<label>Email *</label>
				</span>
				<br>
					<input type="text" id="mem_id" name="mem_id" class="input_box" placeholder="email address" required>
					<div id="getMemberEmail"></div>
			</div>
			<br>
			<div>
				<span class="text">
					<label>Password *</label>
				</span>
				<br>
					<input type="password" id="mem_pw" name="mem_pw" class="input_box" placeholder="At least 6 characters" required>
					<div id="password_check"></div>
			</div>
			<br>
			<hr>
			Are you an Employer? <a class="a_href" href="job_join.do">click here</a>
			<br>
			<div>			
				<input type="submit" id="submit" class="button" value="Create Account">
			</div>
		</form>
		
	</div>
</body>
</html>