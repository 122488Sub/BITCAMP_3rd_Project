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
<!-- <link rel="stylesheet" href="resources/css/house/houseFormData.css"> -->    
<!-- jQuery 기본 js파일-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!--  jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript" src="resources/js/house/houseFormData.js"></script>  
<script type="text/javascript" src="resources/js/house/houseInsert.js"></script>
<style>
	.inputBox {
		padding: .375rem .75rem;
		line-height: 1.5;
		font-size: 1rem;
		color: #495057;
		background-color: white;
		border: 1px solid #ced4da;
		border-radius: .25rem;
	}
	
	#mapDisp {
		width: 100%;
		height: 250px;
		margin: 0 auto;
		margin-bottom: 5px;
		border: 1px solid #ced4da;
		border-radius: .25rem;
	}
</style>
</head>
<body>
	<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>House Posting</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
	<div id="container">
	
	<form action="" id="form" name="form" method="post" enctype="multipart/form-data">
	<br><br>
	<jsp:include page="house_formData.jsp"></jsp:include>
	<div class="td_div" style="text-align: center;">
		<input type="button" class="btn hvr-hover" value="Register a New Post" onclick="insertForm()">
		<!-- <input type="button" id="insertButton" value="Register a New Post" onclick="insertForm();"> -->
	</div>
	</form>
	<br>
	<p style="text-align:center"><a href="house_main.do " style="font-weight: 700;">back to list</a></p>
	<br><br><br>
</div>

</body>
</html>











