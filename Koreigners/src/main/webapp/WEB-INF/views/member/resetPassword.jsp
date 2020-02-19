<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			</section>
        </section>
        <div id="footer">footer</div>
    </div>

</body>
</html>