<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div>
	<ul>
		<li class="tabs"><a href="#">Profile Setting</a></li>
		<li class="tabs"><a href="#">Resume</a></li>
		<li class="tabs"><a href="#">Wishlist</a></li>
		<li class="tabs"><a href="#">My Ads</a></li>
	</ul>
</div>
	<form action="#">
		<div>
			<label for="nickName">Nickname</label>
			<input type="text" name="mem_nick" value="">
		</div>
		<div>
			<label for="id">ID(Email)</label>
			<input type="text" name="mem_id" value="">
		</div>
		<div>
			<label for="name">Name</label>
			<input type="text" name="mem_name">
		</div>
		<div>
			<label for="phone">Phone number</label>
			<input type="text" name="mem_phone">
		</div>
		<div>
			<label for="birth">Birthday</label>
			<input type="text" name="mem_birth">
		</div>
		<div>
			<label for="gender">Gender</label>
			  <input type="radio" name="gender" value="M">Male
	          <input type="radio" name="gender" value="F">Female
		</div>
		<div>
			<label for="address">Address</label>
			<input type="text" name="mem_address">
		</div>
		<div>
			<label for="nationality">Nationality</label>
			<input type="text" name="mem_nationality">
		</div>
		<div>
			<label for="name">Mail Service</label>
	          <input type="radio" name="mailling_fl" value="T">agree
	          <input type="radio" name="mailling_fl" value="F">do not agree
		</div>
		<div>
			<label for="name">SMS Service</label>
	          <input type="radio" name="sms_fl" value="T">agree
	          <input type="radio" name="sms_fl" value="F">do not agree
		</div>
	</form>
</body>
</html>