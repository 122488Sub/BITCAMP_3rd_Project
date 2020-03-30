<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="resources/js/member/wishList.js"></script>
    <link href="resources/css/member/mypageCompany.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
	<link href="resources/css/common/page.css" rel="stylesheet" type="text/css">
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<!-- Site CSS -->
	<link rel="stylesheet" href="bootstrap/css/style.css">
	<!-- Responsive CSS -->
	<link rel="stylesheet" href="bootstrap/css/responsive.css">
	<!-- Custom CSS -->
	<link rel="stylesheet" href="bootstrap/css/custom.css">
	
	<link href="resources/css/common/button.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="moveBox">
	<ul>
		<li class="tabs">
			<img class="icon" src="resources/img/common/setting.png">&nbsp;
			<a href="myPage_go.do?type=profile">Profile Setting</a>
		</li>
		<li class="tabs">
			<img class="icon" src="resources/img/common/document.png">&nbsp;
			<a href="myPage_go.do?type=resume">Resume</a>
		</li>
		<li class="tabs" style="background:#E2E2E2;">
			<img class="icon" src="resources/img/common/wishlist.png">&nbsp;
			<a href="myPage_go.do?type=wishlist">Wishlist</a>
		</li>
		<li class="tabs">
			<img class="icon" src="resources/img/common/advertisment.png">&nbsp;
			<a href="myPage_go.do?type=ads">My Ads</a>
		</li>
	</ul>
</div>

<input type="button" class="btn59acff" value="house" onclick="javascript:changeCategory(1,1,'${mem_id}',1)">
<input type="button" class="btn59acff" value="job" onclick="javascript:changeCategory(1,2,'${mem_id}',1)">
<input type="button" class="btn59acff" value="resale" onclick="javascript:changeCategory(1,3,'${mem_id}',1)">
<input type="button" class="btn59acff" value="free" onclick="javascript:changeCategory(1,4,'${mem_id}',1)">

	<div class="wishlist-box-main">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="table-main table-responsive">
						<table id="listTable" class="table">
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

