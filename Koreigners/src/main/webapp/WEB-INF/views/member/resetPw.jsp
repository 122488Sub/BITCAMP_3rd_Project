<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
<style>
	.center {
		float: none;
		margin: 0 auto;
	}
	
	.signIn {
		width: 30%;
		height: 40px;
		color: white;
		background-color: #0B3B39;
		border: 1px solid #0B3B39;
		border-radius: .25em;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#rePw").blur(function(){
			var pw1 = $("#newPw").val();
			var pw2 = $("#rePw").val();
			if(pw1 == pw2) {
				$("#checkPw").text("");
				$("#submit").attr("disabled", false);
			} else {
				$("#checkPw").text("Passwords are not same.");
				$("#checkPw").css("color", "red");
				$("#submit").attr("disabled", true);
			}
		});
	});
</script>
</head>
<body>

<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Reset/Change Your password</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    
    <form action="resetPw.do" method="post">
	<div class="cart-box-main">
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 center" style="text-align:center">
				<div class="mb-3">
					<div class="title-left">
	                    <h1 style="font-size:2em; font-weight:700">Reset your Password</h1>
	                </div>
				</div>
				<div style="margin-bottom:50px">
					<div class="col-md-8 center">
						<input type="password" id="newPw" name="mem_pw" class="form-control mb-2" placeholder="New Password">			
					</div>
					<div class="col-md-8 center">
						<input type="password" id="rePw" name="re_mem_pw" class="form-control mb-2" placeholder="Re-enter New Password">			
						
						<span id="checkPw"></span>
					</div>
				</div>
				<div class="mb-3 center">
					<input type="hidden" name="mem_id" value="${mem_id }">
					<input type="hidden" name="mem_cate" value="${mem_cate }">
					<input type="hidden" name="resetPwType" value="forgot">
					<input type="submit" value="reset password" class="signIn">
				</div>			
				<hr>
			</div>
		</div>
	</div>
	</form>

</body>
</html>