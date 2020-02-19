<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

//로그인
function getLoginData() {
	
      var idValue = $("#mem_id").val();
      var passwordValue = $("#mem_pw").val();
         
      $.ajax({
         url : '/biz/login.do',
         type : 'post',
         data : {id:idValue, password:passwordValue },
         success : function(data) {
            console.log("data : " + data);   
            
            if(data == 1) {
               // 1 : 아이디 존재
               alert("Hello there! :)"+ "\n" + "Move to the MyPage");
               location.href="WEB-INF/views/member/mypage.jsp";
               
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
}
</script>
</head>
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
				   <h1>Login</h1>
				   <hr><hr>
				   
				   <form action="login.do" method="post" onsubmit="return getLoginData()">
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
				         <input type="submit" id="login" value="Login">
				      </div>
				      <div>         
				         <a href="resetPassword_go.do">Forgot password?</a>
				      </div>
				   </form>
				   
				</div>
			</section>
        </section>
        <div id="footer">footer</div>
    </div>

</body>
</html>