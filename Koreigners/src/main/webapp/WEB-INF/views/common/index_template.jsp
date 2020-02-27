<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="resources/js/nav.js"></script>
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
	
	frm.tokenStr.value = setCookie("tokenStr", sessionStorage.getItem("tokenStr")); /*헤더에 쿠키로 토큰 담아 보냄*/
	frm.action = "myPage_go.do?type=profile";
	frm.method = "post";
	frm.submit();
 }
 
 function logOut(){
	 sessionStorage.clear();
	 
	 var frm = document.logout;
	 frm.action = "login_go.do";
	 frm.method = "post";
	 frm.submit();
 }
 
 function setCookie(c_name,value,exdays) {

 	var exdate = new Date();
 	exdate.setDate(exdate.getDate() + exdays);
 	var c_value = escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
 	document.cookie = c_name + "=" + c_value;

 }
 
 </script>
</head>
<body>

    <div id="wrap">
        <section id="section1">
        <div id="wrap">    
            <ul id="header">
                <a href="main.do"><li id="logo"> <p>Koreigner</p></li></a>
                <ul id="menu_wrap">  
                    <li class="menu"><a href="main.do">Home</a></li>
                    <li class="menu"><a href="hireList_go.do">Job</a></li>
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
    	<input type="hidden" name="tokenStr">
    </form>
    <form name="logout">
    	<input type="hidden" name="logout" value="1">
    </form>
</body>
</html>