<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section id="section1">
	<div id="wrap">    
	   <ul id="header">
	       <a href="main.do"><li id="logo"> <p>Koreigner</p></li></a>
	       <ul id="menu_wrap">  
	           <li class="menu"><a href="#">Home</a></li>
                    <li class="menu"><a href="hireList_go.do">Job</a></li>
                    <li class="menu"><a href="house_main.do">House</a></li>
                    <li class="menu"><a href="#">Resale</a></li>
                    <li class="menu"><a href="getInfoBoardList.do">Infomation</a></li>
                    <li class="menu"><a href="#"></a></li>
                    <c:if test="${loginUser == null }">
                   		<li class="menu"><a href="login.do">Sign in</a></li>
                    	<li class="menu"><a href="register.do">Register</a></li>
                    </c:if>
                    <c:if test="${loginUser != null }">
                   		<li class="menu"><h3>${loginUser.mem_name }</h3></li>
                   		<li class="menu"><a href="javascript:logout()">Logout</a></li>
                    </c:if>
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