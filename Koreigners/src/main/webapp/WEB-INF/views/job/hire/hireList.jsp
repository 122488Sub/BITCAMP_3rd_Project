<%@page import="com.koreigner.biz.common.page.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/hireList.js"></script>
</head>
<body onload="loadPage()">

<a href="hireWrite_go.do">Post an Ad</a>
<table>
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