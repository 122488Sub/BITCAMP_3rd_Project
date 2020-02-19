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
		width: 700px;
		margin: 0 auto;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<script>

$(function(){

// 닉네임 중복 검사
	$("#mem_name").blur(function() {
		var name = $('#mem_name').val();
		$.ajax({
			url : '/koreigner/nickCheck.do?mem_name='+ name,
			type : 'get',
			success : function(data) {
				console.log("data : " + data);	
				
				if(data == 1) {
					// 1 : 닉네임 중복되는 문구
					$("#nick_check").text("Nickname has already been taken :p");
					$("#nick_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
					
				} else {
					// 0 : 사용가능
					$("#nick_check").text("It's available!!");
					$("#nick_check").css("color", "blue");
					$("#reg_submit").attr("disabled", false);
			
					if(name == ""){
						
						$('#nick_check').text('Please fill in the blank :(');
						$('#nick_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);				
						
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
		var id = $('#mem_id').val();
		$.ajax({
			url : '/koreigner/idCheck.do?mem_id='+ id,
			type : 'get',
			success : function(data) {
				console.log("data : " + data);	
				
				if(data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("Email has already been taken :p");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
					
				} else {
					
					var idRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
					
					if(idRegExp.test(id)){
						// 0 : 사용가능
						$("#id_check").text("It's available!!");
						$("#id_check").css("color", "blue");
						$("#reg_submit").attr("disabled", false);
			
					} else if(id == ""){
						
						$('#id_check').text('Please fill in the blank :(');
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);				
						
					} else {
						
						$('#id_check').text('Please write your Email correctly :(');
						$('#id_check').css('color', 'red');
						$("#reg_submit").attr("disabled", true);				
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
			$("#reg_submit").attr("disabled", true);
		} else {
			$("#password_check").text("It's available!!");
			$("#password_check").css("color", "blue");
			$("#reg_submit").attr("disabled", false);
		}
	});

});
</script>

<body>




    <div id="wrap">
        <section id="section1">
        <div id="wrap">    
            <ul id="header">
                <a href="#"><li id="logo"> <p>Koreigner</p></li></a>
                <ul id="menu_wrap">  
                    <li class="menu"><a href="#">Home</a></li>
                    <li class="menu"><a href="#">Job</a></li>
                    <li class="menu"><a href="house_main.do">House</a></li>
                    <li class="menu"><a href="#">Resale</a></li>
                    <li class="menu"><a href="#">Community</a></li>
                    <li class="menu"><a href="#"></a></li>
                    <li class="menu"><a href="login_go.do">Sign in</a></li>
                    <li class="menu"><a href="join_go.do">Register</a></li>
                    <li class="menu"><a href="#"></a></li>
                </ul>
            </ul>
            <div id="header_bottom">
               <a href="#">
                <div id="post_btn">
                    <div id="btn_txt">
                        Post an ad
                    </div>
                </div>
                </a>            
            </div>
         </div>
        </section>
        <section id="section2">
            section2
            <section id="section2_content">
				<div id="container">
					<h1>Create Account</h1>
					<hr><hr>
					
					<form action="join.do" method="post">
					Are you an Employer? 기업회원이세요? <a href="job_join.do">click here</a>
					<input type="hidden" name="mem_cate" value="p">
					<hr>
						<div>
							<label for="mem_name">Nickname</label>
								<input type="text" id="mem_name" name="mem_name">
							<div id="nick_check"></div>
						</div>
						<hr>
						<div>
							<label for="mem_id">Email</label>
								<input type="text" id="mem_id" name="mem_id">
							<div id="id_check"></div>
						</div>
						<hr>
						<div>
							<label for="mem_pw">Password</label>
								<input type="password" id="mem_pw" name="mem_pw">
							<div id="password_check">Make sure it's at least 6 characters(maximum:20)</div>
						</div>
						<hr>
						<div>			
							<input type="submit" id="reg_submit" value="Create Account">
						</div>
					</form>
					
				</div>
				</section>
        </section>
        <div id="footer">footer</div>
    </div>
</body>
</html>