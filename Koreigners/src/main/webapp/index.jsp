<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    <style type="text/css">
    	#content {height: 775px;}
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(function() {
	if(sessionStorage.getItem("tokenStr") != null){
	    $("#menu_wrap").append("<li class='menu'><a href='javascript:logOut();'>Log out</a></li>");
	    $("#menu_wrap").append("<li class='menu'><a href='javascript:myPage();'>MyPage</a></li>");  
	} else {
		$("#menu_wrap").append("<li class='menu'><a href='login_go.do'>Sign in</a></li>");
	    $("#menu_wrap").append("<li class='menu'><a href='join_go.do'>Register</a></li>"); 
	}
	
});

 function myPage(){
	var frm = document.token;
	
	frm.tokenStr.value = sessionStorage.getItem("tokenStr");
	frm.action = "myPage_go.do";
	frm.method = "post";
	frm.submit();
 }
 
 function logOut(){
	 alert("로그아웃되었습니다.\n" + "메인페이지로 이동합니다.")
	 sessionStorage.clear();
	 location.href = "/koreigner/index.jsp";
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
                    <li class="menu"><a href="getInfoBoardList.do">Infomation</a></li>
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
            <section id="section2_content">
				<div id="content">
				
				</div>
            </section>
        </section>
        <div id="footer">footer</div>
    </div>
    
    
    <form name="token">
    	<input type="hidden" name="tokenStr"/>
    </form>
</body>
</html>