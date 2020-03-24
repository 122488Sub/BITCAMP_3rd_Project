<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="resources/css/house/houseFormData.css">    
<!-- jQuery 기본 js파일-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!--  jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="resources/js/house/houseFormData.js"></script>  
<script type="text/javascript" src="resources/js/house/houseInsert.js"></script>

</head>
<body>
	
	<div id="container">
	
	<form action="" id="form" name="form" method="post" enctype="multipart/form-data">
	<jsp:include page="house_formData.jsp"></jsp:include>
	<div class="td_div">
		<input type="button" value="새글 등록" onclick="insertForm();">
	</div>
	</form>
	<p><a href="house_main.do ">글 목록 가기</a></p>
</div>

</body>
</html>











