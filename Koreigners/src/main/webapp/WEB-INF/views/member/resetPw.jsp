<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
<style>
#container {
		width: 700px;
		margin: 0 auto;
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

	<div id="container">
		<h1>Reset/Change Your Password</h1>
		<hr><hr>
		<form action="resetPw.do" method="post">
			<div>
				New Password :	<input type="password" id="newPw" name="mem_pw">
			</div>
			<div>
				Re-enter New Password :	<input type="password" id="rePw" name="re_mem_pw">
				<span id="checkPw"></span>
			</div>
			<div>
				<input type="hidden" name="mem_id" value="${mem_id }">
				<input type="hidden" name="mem_cate" value="${mem_cate }">
				<input type="hidden" name="resetPwType" value="forgot">
				<input type="submit" value="reset password">
			</div>
		</form>
	</div>

</body>
</html>