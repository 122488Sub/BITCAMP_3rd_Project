<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="resources/js/house/houseMain.js"></script>
<link rel="stylesheet" href="resources/css/house/houseMain.css"> 

</head>

<body>
<div id="houseMain_content">
	<!-- 지도부분 -->
	<jsp:include page="../common/republic_korea.jsp">
		<jsp:param value="house" name="category"/>
	</jsp:include>
	<div id="listHeader">
		<div id="insertDiv">
			<h1 id="insertH1"><a href="house_insert.do">insert</a></h1>
		</div>
		<div id="sortDiv">
			<select id="sortSelect" class=""> 
				<option value="1" selected>Recently updated</option> 
				<option value="2">Lowest Deposit</option>
				<option value="3">Lowest Monthly rent</option> 
			</select>
		</div>
	</div>
	
	<table id="houseListTable" border>
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
			<tr>
		</tbody>
		<tfoot id="tfoot">
			
		</tfoot>
	</table>
</div>

</body>
</html>
