<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/header.css" rel="stylesheet" type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/nav.js"></script>
</head>
<body>
	<div id="wrap" style="width:100%; height:100%;">
		<tiles:insertAttribute name="header" />
		
		<section id="section2">
          <section id="section2_content">
		     <tiles:insertAttribute name="body" /> <!-- 해당 jsp가 가지고 있는 태그들 리턴 -->
		  </section>
		</section>
		
	    <tiles:insertAttribute name="footer" />  
	</div>
</body>
</html>