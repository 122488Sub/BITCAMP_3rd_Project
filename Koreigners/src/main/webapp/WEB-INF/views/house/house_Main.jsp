<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


  <script type="text/javascript" src="resources/js/house/houseMain.js"></script>

</head>

<body>
<!-- 지도부분 -->
<jsp:include page="../common/republic_korea.jsp">
	<jsp:param value="house" name="category"/>
</jsp:include>
<br><br><br><br><br><br><br><br><br><br><br><br>

<h1><a href="house_insert.do">insert</a></h1>

<div id="listDisp">



</div>


<table border>
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


</body>
</html>
