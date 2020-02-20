<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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
//로그인

$(function(){
	var auth_check = ${auth_check};
	if(auth_check == 1){
		alert("Registration is completed!"+ "\n"
		       + "Welcome to Koreigners!" + "\n"
		       + "Now you can sign in :)");
	}
});
/*
//로그인
function getLoginData() {
	
	  var obj = new Object();
      obj.inputId = $("#mem_id").val();
      obj.inputPw = $("#mem_pw").val();
         
      var jsonData = JSON.stringify(obj);
      
      $.ajax({
         url : '/koreigner/login.do',
         processData : true,
         dataType : 'json',
         contentType:"application/json; charset=UTF-8",
         method : 'post',
         data : jsonData,
         success : function(data) {
            console.log("data : " + data);   
            
            if(data == 1) {
               // 1 : 아이디 존재
               alert("Hello there! :)"+ "\n" + "Move to the MainPage");
               location.href="WEB-INF/views/index.jsp";
               
            } else {
                // 0 : 존재하지 않는 유저
                if(idValue == "" || passwordValue == ""){
                	alert('Please fill in the blank :(');
                	location.href="WEB-INF/views/member/login.jsp";
                	
               } else {
	            	alert("There is no such user :(" + "\n" + "Please check your Email or Password");
	            	location.href="WEB-INF/views/member/login.jsp";
            	   
               }
            }
         }, 
         error : function() {
            console.log("실패");
         }
      });
	   
*/	            	
	            	
	            	
    //로그인 처리 함수
      function loginBt() {
      	var inputId = $('#mem_id').val();
      	var inputPw = $('#mem_pw').val();
      	var jsonObj = {"inputId":inputId, "inputPw":inputPw};
      	
      	$.ajax({
      		url : '/koreigner/login.do',
              type : 'POST',
              contentType: "application/json; charset=UTF-8",
              data : JSON.stringify(jsonObj),
              dataType : 'text',
              success : function(resultMsg){
              	if(resultMsg !='fail'){
              	  	// 로그인 성공
                    alert("Hello there! :)"+ "\n" + "Move to the MainPage");
              		sessionStorage.setItem("tokenStr", resultMsg); //세션스토리지에 토큰 저장
                    location.href="index.jsp";
              	
              	} else if(resultMsg ==='fail'){
              		// 로그인 실패
                    if(inputId == "" || inputPw == ""){
                    	alert('Please fill in the blank :(');
                    	//location.href="WEB-INF/views/member/login.jsp";
                    	
                   } else {
    	            	alert("There is no such user :(" + "\n" + "Please check your Email or Password");
    	            	$("#mem_id").val("");
    	            	$("#mem_pw").val("");
                	   
                   }
              	}
              },
              error: function(xhr, status, error){
              	alert("로그인 에러");
              }
          });
      }
      
      function test(){
    	var token = sessionStorage.getItem("tokenStr");
    	
    	$.ajax({
      		url : '/koreigner/resetPassword_go.do',
              type : 'POST',
              contentType: "application/json; charset=UTF-8",
              data : JSON.stringify(token),
              dataType : 'text',
              success : function(data){
              	if(data !='fail'){
              		alert(data);
              	}
              },
              error: function(xhr, status, error){
              	alert("로그인 에러");
              }
          });
      
      }
      

</script>
</head>
<body>

	<div id="container">
	   <h1>Login</h1>
	   <hr><hr>
	   
	   <form method="post">
	      <div>
	         <label for="mem_id">Email</label>
	            <input type="text" id="mem_id" name="mem_id">
	      </div>
	      <hr>
	      <div>
	         <label for="mem_pw">Password</label>
	            <input type="password" id="mem_pw" name="mem_pw">
	      </div>
	      <hr>
	      <div>         
	         <input type="button" id="login" value="Login" onclick="loginBt()">
	      </div>
	      <div>         
	         <!-- <a href="resetPassword_go.do">Forgot password?</a> -->
	         <a onclick="test()">Forgot password?</a>
	      </div>
	   </form>
	   
	</div>

</body>
</html>