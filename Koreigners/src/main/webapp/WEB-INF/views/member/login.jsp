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

<script>

$(function(){
	var logout_check = ${logout_check};
	if(logout_check == 1) {
		$("#logout").append("<h1>You have successfully signed out. Hope to see you again soon!</h1>");
		$("#logout").append("<hr><hr>");	
	}
	
	var auth_check = ${auth_check};
	if(auth_check == 1){
		alert("Please verify your e-mail for unlimited access to our website. :) ");
		
	} else if(auth_check == 2) {
		alert("Registration is completed!"+ "\n"
			+ "Welcome to Koreigners!" + "\n"
			+ "Now you can sign in :)");
	}
	

});
	
	
//로그인 처리 함수
function loginBt() {
	var inputId = $('#mem_id').val();
	var inputPw = $('#mem_pw').val();
	var inputCate = $('input[name=mem_cate]:checked').val();
	var jsonObj = {"inputId":inputId, "inputPw":inputPw, "inputCate":inputCate};
	
	$.ajax({
		url : '/koreigner/login.do',
        type : 'POST',
        contentType: "application/json; charset=UTF-8",
        data : JSON.stringify(jsonObj),
        dataType : 'text',
        success : function(tokenStr){
        	if(tokenStr !='fail'){
        	  	// 로그인 성공
              alert("Hello there! :)"+ "\n" + "Move to the MainPage");
        		sessionStorage.setItem("tokenStr", tokenStr); //세션스토리지에 토큰 저장
              
        		location.href='/koreigner/index.jsp';
        	
        	} else if(tokenStr ==='fail'){
        		// 로그인 실패
              if(inputId == "" || inputPw == ""){
              	alert('Please fill in the blank :(');
              	
             } else if(inputCate == null) {
          	   alert("Please check the type of what you're going to sign in!");
          	   
             } else {
            	alert("There is no such user :(" + "\n" + "Please check your Email or Password");
            	$("#mem_id").val("");
            	$("#mem_pw").val("");
          	   
             }
        	}
        },
        error: function(){
        	alert("로그인 에러");
        }
    });
}
   
	            	


     
      

</script>
<body>
	<div id="login_container">
	<div id="logout"></div>
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
					<a class="a_href" href="resetPassword.do">Forgot your password?</a>
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
				<a class="a_href" href="./join_go.do">Register now</a>
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