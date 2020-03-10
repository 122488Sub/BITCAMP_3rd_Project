<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <style type="text/css">
    	#default {height: 775px;}
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		var auth_check = ${auth_check};
		if(auth_check == 0) {
			alert("Please verify your e-mail for unlimited access to our website.");
		}
	});
</script>
</head>
<body>
<div id="default">

</div>
</body>
</html>