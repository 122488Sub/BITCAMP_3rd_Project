<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Site CSS -->
<link rel="stylesheet" href="bootstrap/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="bootstrap/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="bootstrap/css/custom.css">

<script type="text/javascript" src="resources/js/house/houseMain.js"></script>
<link rel="stylesheet" href="resources/css/house/houseMain.css"> 
<link href="resources/css/common/page.css" rel="stylesheet" type="text/css">
</head>

<body>
<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>House</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
<div id="houseMain_content" >
	<div style="width:1200px; margin: 0 auto;">
	<!-- 지도부분 -->
	<jsp:include page="../common/republic_korea.jsp">
		<jsp:param value="house" name="category"/>
	</jsp:include>
	</div>
	<div id="listHeader">
		
		<div id="sortDiv">
			<select id="sortSelect" class=""> 
				<option value="1" selected>Recently updated</option> 
				<option value="2">Lowest Deposit</option>
				<option value="3">Lowest Monthly rent</option> 
			</select>
		</div>
	  <c:if test="${user.mem_id!=null && user.mem_cate eq 'p'}">
		<div id="insertDiv">
			<a href="house_insert.do">New Post</a>
		</div>
	  </c:if>
	</div>
	
	 <div class="wishlist-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
	<table id="houseListTable" class="table">
		<thead>			
			<tr>
				<th>idx</th>
				<th>Title</th>
				<th>RoomType</th>
				<th>Location</th>
				<th>Deposit/Monthly</th>
				<th>Post Date</th>
			</tr>
		</thead>
		<tbody id="list_box">
			<tr>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
				<td>--</td>
			</tr>
		</tbody>

	</table>
	<div id="tfoot"></div>
	</div></div></div></div></div>
	
</div>

</body>
</html>
