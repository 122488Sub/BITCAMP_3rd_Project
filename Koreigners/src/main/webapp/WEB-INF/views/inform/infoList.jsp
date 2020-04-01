<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="bootstrap/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="bootstrap/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="bootstrap/css/custom.css">

<link href="resources/css/common/page.css" rel="stylesheet" type="text/css">
<link href="resources/css/common/button.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="resources/js/common/buttonColorChange.js"></script>
<script type="text/javascript" src="resources/js/inform/infoList.js"></script>
</head>

<body>
	<div style="text-align: center">
		<input type="button" id="btn1" class="btn59acff" value="All" onclick="javascript:getData('All',1)">
		<input type="button" id="btn2" class="btn59acff" value="Information" onclick="javascript:getData('Information',1)">
		<input type="button" id="btn3" class="btn59acff" value="Food" onclick="javascript:getData('Food',1)">
		<input type="button" id="btn4" class="btn59acff" value="Travel" onclick="javascript:getData('Travel',1)">
		<input type="button" id="btn5" class="btn59acff" value="Etc" onclick="javascript:getData('Etc',1)">
	</div>
	
	<div class="wishlist-box-main">
	<a href="InfoInsert_go.do">New Post</a>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="table-main table-responsive">
						<table class="table" id="infoList">
							<thead id="tHead">

							</thead>
							<tbody id="list_box">

							</tbody>

						</table>
						<div id="tfoot"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

</body>
</html>
