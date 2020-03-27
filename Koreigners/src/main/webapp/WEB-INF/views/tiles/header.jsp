<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="section1">
	<div id="wrap">    
	   <ul id="header">
	       <a href="main.do"><li id="logo"> <p>Koreigner</p></li></a>
	       <ul id="menu_wrap">  
	           <li class="menu"><a href="#">Home</a></li>
                    <li class="menu"><a href="hireList_go.do">Job</a></li>
                    <li class="menu"><a href="house_main.do">House</a></li>
                    <li class="menu"><a href="resaleList.do">Resale</a></li>
                    <li class="menu"><a href="getInfoBoardList.do">Information</a></li>
                    <li class="menu"><a href="#"></a></li>
                    <c:if test="${empty user}">
                   		<li class="menu"><a href="login_go.do">Sign in</a></li>
                    	<li class="menu"><a href="register_go.do">Register</a></li>
                    </c:if>
                    <c:if test="${!empty user}">
                   		<li class="menu"><a href="myPage_go.do?type=profile">${user.mem_name }</a></li>
                   		<li class="menu"><a href="javascript:logout()">Logout</a></li>
                    </c:if>
	       </ul>
	   </ul>
	   <div id="header_bottom">
	      <a href="javascript:postAd('${postType}')">
	       <div id="post_btn">
	           <div id="btn_txt">
	               Post an ad
	           </div>
	       </div>
	       </a>            
	   </div>
	</div>
</section>