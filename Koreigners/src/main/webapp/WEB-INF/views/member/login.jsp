<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	response.addHeader("length", "10");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>


<style>
	.center {
		float: none;
		margin: 0 auto;
	}
	
	.signIn {
		width: 100%;
		height: 40px;
		color: white;
		background-color: #0B3B39;
		border: 1px solid #0B3B39;
		border-radius: .25em;
	}
</style>

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

	<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2 id="notice">Welcome to KOREIGNERS!</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    
    <form class="form" id="loginForm" method="post">
	<div class="cart-box-main">
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-10 col-lg-4 center" style="text-align:center">
				<div class="mb-3">
					<div class="title-left">
	                    <h1 style="font-size:2em; font-weight:700">Login</h1>
	                </div>
	                <div class="col-md-10 center">
		                <div class="row">
		                	<div class="col-md-6">
		                		<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" id="login0" name="mem_cate" value="p" required>
									<label class="custom-control-label" for="login0">Person</label>
		                		</div>
		                	</div>
		                	<div class="col-md-6">
		                		<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" id="login1" name="mem_cate" value="c" required>
									<label class="custom-control-label" for="login1">Company</label>
		                		</div>
		                	</div>
		                </div>
	                </div>
				</div>
				<div class="mb-3">
					<div class="col-md-10 center">
						<input type="email" id="mem_id" name="mem_id" class="form-control mb-2" placeholder="Email address">
						<input type="password" id="mem_pw" name="mem_pw" class="form-control" placeholder="Password">						
					</div>
				</div>
				<div class="col-md-6 mb-3 center">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" id="autoLogin" name="autoLogin" class="custom-control-input" value="1" checked>
						<label class="custom-control-label" for="autoLogin">Remember Me</label>
					</div>
				</div>
				<div class="mb-3">
					<input type="button" value="Sign In" class="signIn" onclick="javascript:loginBt()">
				</div>			
				<hr>
				<div class="center">
					<div class="mb-3">
						<a class="p_href" href="resetPwMail_go.do">Forgot your password?</a>
					</div>
					<p class="font-weight-bold">Don't have an account?</p>
					<a class="font-weight-bold" style="color:firebrick; font-size:1.2em" href="register_go.do"><u>Register now</u></a>
				</div>
			</div>
		</div>
	</div>
	</form>
	
	<%-- <div  id="login_url">		
		<div>
			<a href="${naver_url }"><img width="230px" src="resources/img/member/naver_login_button_en_green.png" alt="Naver Login" /></a>
		</div>
		<div class="google_url">
			<a href="${google_url }"><img width="237px " src="resources/img/member/google_login_button_en.png" alt="Google Login" /></a>
		</div>
	</div> --%>
	<!-- <img width="237px " src="https://lh3.googleusercontent.com/a-/AAuE7mAi-BWk0T7fwtp4tqzdqN78sltbKgYUjUSn4Bsr7Q" alt="Google Login" />  -->
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
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/member/login.js"></script>
</body>
</html>