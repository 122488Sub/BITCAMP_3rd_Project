<%@page import="com.koreigner.biz.common.page.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/hire/hireList.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/republic_korea.css">
<style>
	ul {
		margin:0;
		padding:0;
	}
	li {
		list-style: none;
		border : 1px solid black;
		margin:0;
		padding:0;
		float:left;
	}
</style>
</head>
<body onload="loadPage()">
<jsp:include page="../../common/republic_korea.jsp"/>

<div id="listDisp">



</div>

<div id="mapDisp">

</div>
<script type="text/javascript" src="resources/js/hire/map_hire.js"></script>

<br><br><br><br><br><br><br><br><br><br><br>

<hr>
<a href="hireWrite_go.do">Post an Ad</a>
<table border>
	<thead>
		<tr>
			<th>idx</th>
			<th>Company Name</th>
			<th>Location</th>
			<th>Title</th>
			<th>Salary</th>
			<th>Post Date</th>
		</tr>
	</thead>
	<tbody id="list_box">
		<tr>
			<td>Name</td>
			<td>Location</td>
			<td>Title</td>
			<td>Salary</td>
			<td>Post Date</td>
		<tr>
	</tbody>
	<tfoot id="tfoot">
		
	</tfoot>
</table>
</body>
</html>