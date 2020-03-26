<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="resources/js/member/wishList.js"></script>
</head>
<body>
<div>
	<ul>
		<li class="tabs"><a href="myPage_go.do?type=profile">Profile Setting</a></li>
		<li class="tabs"><a href="myPage_go.do?type=resume">Resume</a></li>
		<li class="tabs"><a href="myPage_go.do?type=wishlist">Wishlist</a></li>
		<li class="tabs"><a href="myPage_go.do?type=ads">My Ads</a></li>
	</ul>
</div>
<input type="hidden" id="ID" value="${mem_id }">
<input type="button" value="house" onclick="javascript:changeCategory(1)">
<input type="button" value="job" onclick="javascript:changeCategory(2)">
<input type="button" value="resale" onclick="javascript:changeCategory(3)">
<input type="button" value="free" onclick="javascript:changeCategory(4)">

<table id="wishListTable"  border>
		<thead id="tHead">			
			
		</thead>
		<tbody id="list_box">
			
		</tbody>
		<tfoot id="tfoot">
			
		</tfoot>
	</table>
</body>
</html>

