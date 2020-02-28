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
<script type="text/javascript" src="resources/js/hire/hireList.js"></script>

<link rel="stylesheet" type="text/css" href="resources/css/republic_korea.css">
<link rel="stylesheet" type="text/css" href="resources/css/job/hireList.css">
<script type="text/javascript" src="resources/js/hire/map_hire.js"></script>
</head>
<body onload="loadPage()">
<jsp:include page="../../common/republic_korea.jsp"/>

<div id="listDisp">


</div>

<div id="mapDisp">

</div>


<br><br><br><br><br><br><br><br>

<div id="filterBox">
	<div id="jobCate_box">
	  <div id="filter_1">
		<ul id="jUl">
			<li class="menuName">
			<p>Job</p>
			<p>Category</p>
			</li>
			<li class="btnBox">
				<div class="catePrnt" id="all">
				<div class="pDiv">
				<p>ALL</p>
				</div>
				</div>
				<div class="catePrnt" id="Office Job">
				<div class="pDiv">
				<p>Office Job</p>
				</div>
				</div>
				<div class="catePrnt" id="RESEARCH">
					<div class="pDiv">
					<p>RESEARCH</p>
					</div>
				</div>
				<div class="catePrnt" id="EDUCATION/WELFARE">
					<div class="pDiv">
					<p>EDUCATION</p>
					<p>WELFARE</p>
					</div>		</div>
				<div class="catePrnt" id="HEALTH/MEDICAL TREATMENT">
					<div class="pDiv">
					<p class="short2">HEALTH</p>
					<p class="short2">&</p>
					<p class="short">MEDICAL</p>
					<p>TREATMENT</p>
					</div>
				</div>
				<div class="catePrnt" id="FOREIGN LANGUAGE/DESIGN">
					<div class="pDiv">
						<p class="short">FOREIGN</p>
						<p class="short2">LANGUAGE</p>
						<p class="short2">&</p>
						<p>DESIGN</p>
					</div>
				</div>
				<div class="catePrnt" id="SERVICE INDUSTRY EMPLOYMENT">
					<div class="pDiv">
						<p class="short">SERVICE</p>
						<p class="short">INDUSTRY</p>
						<p class="short">EMPLOYMENT</p>
					</div>
				</div>
				<div class="catePrnt" id="SALES/TRANSPORTATION">
					<div class="pDiv">
						<p>SALES</p>
						<p>TRANSPORTATION</p>
					</div>
				</div>
				<div class="catePrnt" id="CONSTRUCTION">
					<div class="pDiv">
					<p>CONSTRUCTION</p>
					</div>
				</div>
				<div class="catePrnt" id="MANUFACTURING INDUSTRY">
					<div class="pDiv">
					<p class="short">MANUFACTURING</p>
					<p>INDUSTR</p>
					</div>
				</div>
				<div class="catePrnt" id="AGRICULTURE AND FORESTRY/FISHERY">
					<div class="pDiv">
					<p class="short2">AGRICULTURE</p>
					<p class="short2">&</p>
					<p class="short">FORESTRY</p>
					<p>FISHERY</p>
					</div>
				</div>	
			</li>
		</ul>
		</div>
		<br>
		<div id="filter_2">
		<ul id="jUl">
			<li class="menuName">
			<p>Detail</p>
			<p>Category</p>
			</li>
			<li class="btnBox" id="childCate">
			</li>
		</ul>
		</div>
		<br>
		<div id="filter_3">
		<ul id="jUl">
			<li class="menuName">
			<p>Pay</p>
			<p>Condition</p>
			</li>
			<li class="btnBox" id="payment">
				<div class="payCondition" id="hour">
				<div class="pDiv">
				<p>Hour</p>
				</div>
				</div>
				<div class="payCondition" id="day">
				<div class="pDiv">
				<p>Day</p>
				</div>
				</div>
				<div class="payCondition" id="month">
				<div class="pDiv">
				<p>Month</p>
				</div>
				</div>
				<div class="payCondition" id="year">
				<div class="pDiv">
				<p>Year</p>
				</div>
				</div>
				<div class="payCondition" id="negotiable">
				<div class="pDiv">
				<p>Negotiable</p>
				</div>
				</div>
			</li>
		</ul>
		</div>
		</div>
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
<br><br><br><br><br>

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