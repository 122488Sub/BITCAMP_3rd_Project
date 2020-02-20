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
</head>
<body>

	<div id="container">
		<h1>Reset Your Password</h1>
		<hr><hr>
		<form action="resetPw.do" method="post">
			<div>
				New Password :	<input type="password" name="password">
				<input type="hidden" name="id" value="${id }">
			</div>
			<div>
				<input type="submit" value="reset password">
			</div>
		</form>
	</div>

</body>
</html>