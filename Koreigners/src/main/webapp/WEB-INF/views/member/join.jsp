<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
<style>
	#container {
		border: 5px solid lightblue;
		width: 500px; height: 370px;
		margin: 0 auto;
		margin-top: 10px;
		margin-bottom: 10px;
		text-align: center;
	}
	hr {
		width: 320px;
		margin-left: 80px;
		margin-top: 10px;
		
	}
	.input_box {
		width: 270px;
	}
	.a_href {
		font-size: 12px;
	}
	.text {
		margin-left: -40%;
	}
	.button {
		background-color: #4CAF50;
 		border: none;
	  	color: white;
	  	padding: 10px 30px;
	  	text-align: center;
	  	text-decoration: none;
	  	display: inline-block;
	  	font-size: 16px;
	  	margin: 8px 2px;
	  	cursor: pointer;
	  	border-radius: 8px;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<script>

$(function(){

// 닉네임 중복 검사
	$("#mem_name").blur(function() {
		$.ajax({
			url : './nickCheck.do',
			type : 'post',
			data : $("#regiForm").serialize(),
			success : function(data) {
				console.log("data : " + data);	
				
				if(data == 1) {
					// 1 : 닉네임 중복되는 문구
					$("#getMemberNick").text("Nickname has already been taken :p");
					$("#getMemberNick").css("color", "red");
					$("#submit").attr("disabled", true);
					
				} else {
					// 0 : 사용가능
					$("#getMemberNick").text("It's available!!");
					$("#getMemberNick").css("color", "blue");
					$("#submit").attr("disabled", false);
					
					// Nickname 입력란의 빈 공백일경우
					if($('#mem_name').val() == ""){
						$('#getMemberNick').text('Please fill in the blank :(');
						$('#getMemberNick').css('color', 'red');
						$("#submit").attr("disabled", true);				
					}
				}
			}, 
			error : function() {
				console.log("실패");
			}
		});
	});

	
// 아이디(이메일) 중복 검사
	$("#mem_id").blur(function() {
		$.ajax({
			url : './idCheck.do',
			type : 'post',
			data : $("#regiForm").serialize(),
			success : function(data) {
				console.log("data : " + data);	
				
				if(data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#getMemberEmail").text("Email has already been taken :p");
					$("#getMemberEmail").css("color", "red");
					$("#submit").attr("disabled", true);
					
				} else {
					
					var idRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
					
					if(idRegExp.test($('#mem_id').val())){
						// 0 : 사용가능
						$("#getMemberEmail").text("It's available!!");
						$("#getMemberEmail").css("color", "blue");
						$("#submit").attr("disabled", false);
						
						// Email 입력란의 빈 공백일경우
					} else if($('#mem_id').val() == ""){
						$('#getMemberEmail').text('Please fill in the blank :(');
						$('#getMemberEmail').css('color', 'red');
						$("#submit").attr("disabled", true);				
						
						//유효성검사에 실패했을 경우
					} else {
						$('#getMemberEmail').text('Please write your Email correctly :(');
						$('#getMemberEmail').css('color', 'red');
						$("#submit").attr("disabled", true);				
					}
				}
			}, 
			error : function() {
				console.log("실패");
			}
		});
	});
						
	
	$("#mem_pw").blur(function() {
		var pw = $("#mem_pw").val();
		if(pw.length < 6 || pw.length > 20){
			$('#password_check').text('Please enter the password at least 6 characters(maximum:20)');
			$('#password_check').css('color', 'red');
			$("#submit").attr("disabled", true);
		} else {
			$("#password_check").text("It's available!!");
			$("#password_check").css("color", "blue");
			$("#submit").attr("disabled", false);
		}
	});

});
</script>

<body>

	<div id="container">
		<h1>Create Account</h1>
		<hr>
		<br>
		<form id="regiForm" action="/koreigner/join.do" method="post">
			<input type="hidden" name="mem_cate" value="p">
			<div>
				<span class="text">
					<label>Nickname *</label>
				</span>
				<br>
					<input type="text" id="mem_name" name="mem_name" class="input_box" placeholder="Name" required>
					<div id="getMemberNick"></div>
			</div>
			<br>
			<div>
				<span class="text">
					<label>Email *</label>
				</span>
				<br>
					<input type="text" id="mem_id" name="mem_id" class="input_box" placeholder="email address" required>
					<div id="getMemberEmail"></div>
			</div>
			<br>
			<div>
				<span class="text">
					<label>Password *</label>
				</span>
				<br>
					<input type="password" id="mem_pw" name="mem_pw" class="input_box" placeholder="At least 6 characters" required>
					<div id="password_check"></div>
			</div>
			<br>
			<hr>
			Are you an Employer? <a class="a_href" href="job_join.do">click here</a>
			<br>
			<div>			
				<input type="submit" id="submit" class="button" value="Create Account">
			</div>
		</form>
		
	</div>
</body>
</html>