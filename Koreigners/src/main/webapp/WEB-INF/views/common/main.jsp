<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <style type="text/css">
    	#default {height: 775px;}
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
		var auth_check = ${auth_check};
		if(auth_check == 0) {
			alert("Please verify your e-mail for unlimited access to our website.");
		}
	});

</script>
<!-- <link href="main.css" rel="stylesheet" type="text/css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/main/main.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
<div class="nav">
                 <ul class="nav_ul">
                      <li><a href="#home">Home</a></li>
                      <li><a href="#about">About Us</a></li>
                      <li><a href="#jop">jop</a></li>  
                      <li><a href="#contact">성구</a></li>
                 </ul>
             </div>
             
             
              <div id="columns">
                <figure>
                <img src="resources/img/main/KakaoTalk_179.jpg">
                   <figcaption class="title">Cinderel1231231231la</figcaption>
                   <p class="price">2500$</p>
                   <p class="address">wowodo1@gmail.com</p>
                </figure>
                 
                <figure>
                   <img src="resources/img/main/tour.jpg">
                   <figcaption class="title">Cinderel1231231231la</figcaption>
                   <p class="price">2500\</p>
                   <p class="address">wowodo1@gmail.com</p>
                </figure>
                 
                <figure>
                   <img src="resources/img/main/mentor.jpg">
                    <figcaption class="title">Cinderel1231231231la</figcaption>
                   <p class="price">2500$</p>
                   <p class="address">wowodo1@gmail.com</p>
                </figure>
                
                <figure>
                   <!-- <img src="/"> -->
                   <figcaption class="title">Cinderel1231231231la</figcaption>
                   <p class="price">2500$</p>
                   <p class="address">wowodo1@gmail.com</p>
                </figure>
                
                <figure>
                   <img src="resources/img/main/Line.jpg">
                    <figcaption class="title">Cinderel1231231231la</figcaption>
                   <p class="price">2500$</p>
                   <p class="address">wowodo1@gmail.com</p>
                </figure>
                   
                    <figure>
                   <img src="resources/img/main/KakaoTalk_179.jpg">
                    <figcaption class="title">Cinderel1231231231la</figcaption>
                   <p class="price">2500$</p>
                   <p class="address">wowodo1@gmail.com</p>
                </figure>
                
                <figure>
                   <img src="/">
                    <figcaption class="title">Cinderel1231231231la</figcaption>
                   <p class="price">2500$</p>
                   <p class="address">wowodo1@gmail.com</p>
                </figure> 
                
                <figure>
                   <img src="resources/img/main/Best-.jpg">
                    <figcaption class="title">Cinderel1231231231la</figcaption>
                   <p class="price">2500$</p>
                   <p class="address">wowodo1@gmail.com</p>
                </figure> 
                
                <figure>
                   <img src="/">
                    <figcaption class="title">Cinderel1231231231la</figcaption>
                   <p class="price">2500$</p>
                   <p class="address">wowodo1@gmail.com</p>
                   <a><i class="fas fa-heart"></i></a>
                </figure> 
                   
                    <figure>
                   <img src="/">
                    <figcaption class="title">Cinderel1231231231la</figcaption>
                   <p class="price">2500$</p>
                   <p class="address">wowodo1@gmail.com</p>
                   <a><i class="fas fa-heart"></i></a>
                </figure> 
                
                  
                </div>
                
                <div id="jop_wrap">
               <ul>
                   <a href="#"><li id="jop_logo"> <p>JOB HOME</p></li></a>
               </ul>
		         </div> 
		         <!-- Comunity -->
		         <div>
		               <ul class="community_text">
		                  <li><a href="COMMUNITY" class="community">Community</a></li>
		              </ul>  
		         </div>
		         
		         <div class="jop_img">
		            <figure>
		                   <img src="resources/img/main/Beauty.jpg">
		                  <a href="#" class="sub"><input type="button" name="beauty" id="bty" class="beauty_btn" value="Beauty"></a> 
		                   
		            </figure> 
		                 
		            <figure>
		                   <img src="resources/img/main/Best-.jpg">
		                   <a href="#" class="sub"><input type="button" name="beauty" id="food" class="beauty_btn" value="Food"></a> 
		            </figure> 
		               
		             <figure>
		                   <img src="resources/img/main/KakaoTalk_179.jpg">
		                   <a href="#" class="sub"><input type="button" name="beauty" id="job" class="beauty_btn" value="Job"></a> 
		            </figure> 
		            
		            <figure>
		                   <img src="resources/img/main/SplitShire-.jpg">
		                   <a href="#" class="sub"><input type="button" name="beauty" id="bty" class="beauty_btn" value="Travel"></a> 
		            </figure> 
		         </div>
</body>
</html>