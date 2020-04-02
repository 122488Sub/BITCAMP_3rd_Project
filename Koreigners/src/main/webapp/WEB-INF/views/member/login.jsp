<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	response.addHeader("length", "10");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="resources/css/member/login.css" rel="stylesheet" type="text/css">
	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="bootstrap/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="bootstrap/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="bootstrap/css/custom.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/member/login.js"></script>


<script>
$(function(){
	
	var logout_check = ${logout_check};
	if(logout_check == 1) {
		$("#notice").text("You have successfully signed out. Hope to see you again soon!");
	}
	
	var pw_reset = ${pw_reset};
	if(pw_reset == 1) {
		$("#notice").text("If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.");
	}
	

});
</script>
<body>

	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2 id="notice"></h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    
	<div id="login_container">
		<h1>Login Page</h1>
		<div class="login">
		  <form class="form" id="loginForm" method="post">
			<ul>
				<li class="logLi">
					<span class="returnText">
						<input type="radio" name="mem_cate" value="p" required>Person
						<input type="radio" name="mem_cate" value="c" required>Company
					</span>
				</li>
				<li class="logLi">
					<span>
						<input type="email" id="mem_id" name="mem_id" class="input_box" placeholder="Email address" 
																			data-val-required="Please enter your email address." 
																			data-val-email="Please enter a valid email address.">
					</span>
					<p id="idCheck"></p>
				</li>
				<li class="logLi">
					<span>
						<input type="password" id="mem_pw" name="mem_pw" class="input_box" placeholder="Password" 
																			data-val-required="Please enter your password."> 
					</span>
					<p id="pwCheck"></p> 
				</li>
				<li class="logLi">
					<label class="returnText">
						<input type="checkbox" id="autoLogin" name="autoLogin" value="1" checked /> Remember Me
					</label>
					<span class="returnText">
						<a class="p_href" href="resetPwMail_go.do">Forgot your password?</a>
					</span>
				</li>
				<li class="logLi">
					<span>
						<input type="button" class="button" value="Sign In" onclick="javascript:loginBt()">
					</span>
					
				</li>
			</ul>
		</form>
	 </div>
	 
		  <p class="returnText">
			<span>
				"Don't have an account? "
				<a class="a_href" href="register_go.do">Register now</a>
			</span>
	 	 </p>
	 	 <br>
	
	
	<div  id="login_url">		
		<div>
			<a href="${naver_url }"><img width="230px" src="resources/img/member/naver_login_button_en_green.png" alt="Naver Login" /></a>
		</div>
		<div class="google_url">
			<a href="${google_url }"><img width="237px " src="resources/img/member/google_login_button_en.png" alt="Google Login" /></a>
		</div>
	<!-- <img width="237px " src="https://lh3.googleusercontent.com/a-/AAuE7mAi-BWk0T7fwtp4tqzdqN78sltbKgYUjUSn4Bsr7Q" alt="Google Login" />  -->
	</div>
	<!-- 
	<div>
		<a href="
				https://accounts.google.com/o/oauth2/v2/auth?
				scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&
				access_type=offline&
				include_granted_scopes=true&
				state=state_parameter_passthrough_value&
				redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fbiz%2Fgoogle%2Fcallback&
				response_type=code&
				client_id=827596090618-mqtpscfc7k5b7lombqamaps3h9vmv698.apps.googleusercontent.com">로그인</a>
	</div>  -->
</div>
</body>
</html>