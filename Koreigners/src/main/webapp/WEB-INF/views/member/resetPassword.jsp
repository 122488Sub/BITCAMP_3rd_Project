<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
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
		<h1>Forgot Password??</h1>
		<hr><hr>
		<form action="resetPwMail.do" method="post">
			<div>
				<h3>Please enter your registered Email to create new password</h3>
				Email :	<input type="text" name="email">
			</div>
			<div>
				<input type="submit" value="send reset instructions">
			</div>
		</form>
	</div>

</body>
</html>