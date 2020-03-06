<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="resources/css/header.css" rel="stylesheet" type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<link href="resources/css/member/login.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/member/login.js"></script>

<script>
$(function(){
	
	var logout_check = ${logout_check};
	if(logout_check == 1) {
		$("#notice").append("<h1>You have successfully signed out. Hope to see you again soon!</h1>");
		$("#notice").append("<hr><hr>");	
	}
	
	var pw_reset = ${pw_reset};
	if(pw_reset == 1) {
		$("#notice").append("<h1>If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.</h1>");
		$("#notice").append("<hr><hr>");
	}
	

});
</script>
<body>
	<div id="login_container">
	<div id="notice"></div>
	<h1>Login Page</h1>
	<form class="form" id="loginForm" method="post">
		<ol>
			<li>
				<span>
					<input type="radio" name="mem_cate" value="p" required>Person
					<input type="radio" name="mem_cate" value="c" required>Company
				</span>
			</li>
			<li>
				<span>
					<input type="email" id="mem_id" name="mem_id" class="input_box" placeholder="Email address" data-val-required="Please enter your email address." data-val-email="Please enter a valid email address.">
					<p id="idCheck"></p>
				</span>
			</li>
			<li>
				<span>
					<input type="password" id="mem_pw" name="mem_pw" class="input_box" placeholder="Password" data-val-required="Please enter your password.">
					<p id="pwCheck"></p> 
				</span>
			</li>
			<li>
				<span>
					<a class="a_href" href="resetPwMail_go.do">Forgot your password?</a>
				</span>
			</li>
			<li>
				<span>
					<input type="button" value="Sign In" onclick="javascript:loginBt()">
				</span>
			</li>
		</ol>
		<p>
			<span>
				"Don't have an account? "
				<a class="a_href" href="register_go.do">Register now</a>
			</span>
		</p>
	</form>
	<div>
		<a href="${naver_url }"><img width="200" src="resources/img/member/naver_login_button_en_green.png" alt="Naver Login" /></a>
	</div>
	<div>
		<a href="${google_url }"><img width="200" src="resources/img/member/google_login_button_en.png" alt="Google Login" /></a>
		</div>
	</div>
</body>
</html>