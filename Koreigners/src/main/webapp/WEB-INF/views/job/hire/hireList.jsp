<%@page import="com.koreigner.biz.common.page.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/republic_korea.css">
<link rel="stylesheet" type="text/css" href="resources/css/job/hireList.css">
<script type="text/javascript" src="resources/js/hire/hireList.js"></script>
<!-- <script type="text/javascript" src="resources/js/hire/map_hire.js"></script> -->

</head>

<body onload="loadPage()">

<jsp:include page="../job_map2.jsp"/>



<%--
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
	<tbody id="filter_list_box">
		<tr>
			<td>Name</td>
			<td>Location</td>
			<td>Title</td>
			<td>Salary</td>
			<td>Post Date</td>
		<tr>
	</tbody>
	<tfoot id="filter_tfoot">
		
	</tfoot>
</table>
	<br><br><br><br><br><br><br><br><br><br><br><br> --%>

<hr>
<c:choose>
	<c:when test="${not empty mem_id}">
		<p><a href="hireWrite_go.do">Post an Ad</a></p>
	</c:when>
	<c:otherwise>
		<p></p>
	</c:otherwise>
</c:choose>


<table border>
	<thead>
		<tr>
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