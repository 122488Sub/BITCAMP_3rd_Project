<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#mapDisp{
		
		width: 500px;
		height: 250px;
		margin: 0 auto;
		margin-bottom: 5px;
	}

</style>
</head>

<body>


<div id="mapDisp">
</div>


<script>
	//페이징로딩후 자동시작 //
	$(window).on('load',function(){

		$("#mapDisp").load("/koreigner/resources/html/googleMap.jsp?location="
	   		+'${house.address}'.replace(/ /gi,"%20"));
		
	});
	//여기까지 페이징로딩후 자동시작//
</script>
</body>
</html>
