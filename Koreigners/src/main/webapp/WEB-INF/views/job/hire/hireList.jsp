<%@page import="com.koreigner.biz.common.page.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<fmt:parseDate var="date" value="${regdate}" pattern="yyyy-MM-dd"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- <script type="text/javascript" src="resources/js/hire/map_hire.js"></script> -->
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${contextPath}/bootstrap/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="${contextPath}/bootstrap/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="${contextPath}/bootstrap/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="${contextPath}/bootstrap/css/custom.css">
<link rel="stylesheet" type="text/css" href="resources/css/republic_korea.css">
<link rel="stylesheet" type="text/css" href="resources/css/job/hireList.css">
<script type="text/javascript" src="resources/js/hire/moment.js"></script>
<script type="text/javascript" src="resources/js/hire/hireList.js"></script>

<style>
.wishlist-box-main {
	height: auto;
}
.table {width:100%; height: auto;}

#location{
	width:10%;
}
#title{
	width:50%;
}
#salary{
	width:20%;
}
#post_date{
	width:10%;
}
#boxFont {color:black;}
td{height:80px;}
#conBox{float:left;}
#salryTd {text-align: left;}
#yearSalary{font-weight: bold; color:white; text-align: center; width:40px;height:20px;background-color: orange;border-radius: 5px; padding-bottom: 6px;}
#monthSalary{font-weight: bold; color:white; text-align: center; width:40px;height:20px;background-color: yellow;border-radius: 5px; padding-bottom: 6px;}
#daySalary{font-weight: bold; color:white; text-align: center; width:40px;height:20px;background-color: brown;border-radius: 5px; padding-bottom: 6px;}
#hourSalary{font-weight: bold; color:white; text-align: center; width:40px;height:20px;background-color: gray;border-radius: 5px; padding-bottom: 6px;}
#pay{font-weight: bold; color:white; text-align: center; width:40px;height:20px;background-color: aqua;border-radius: 5px; padding-bottom: 12px; margin-bottom: 6px; overflow:visible;}
.salaryCondtion {display:flex; text-align: center;}
.trTag td {border-bottom: 1px solid #808080;}
</style>
<script>
</script>
</head>

<body onload="loadPage()">

<jsp:include page="../job_map2.jsp"/>

<hr>
<c:choose>
	<c:when test="${loginUser.mem_cate eq 'c'}">
		<p><a href="hireWrite_go.do">Post an Ad</a></p>
	</c:when>
	<c:otherwise>
		<p></p>
	</c:otherwise>
</c:choose>

 <!-- 
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
Start Wishlist  -->
    <div class="wishlist-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table" id="hireList">
                            <thead>
                                <tr>
                                    <th id="compName">Company Name</th>
                                    <th id="location">Location</th>
                                    <th id="title">Title</th>
                                    <th id="salary">Salary</th>
                                    <th id="post_date">Post Date</th>
                                </tr>
                            </thead>
                            <tbody id="list_box">
                                <tr>
                                    <td class="thumbnail-img">
                                         <p>회사이름</p>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									location6
										</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>타이틀</p>
                                    </td>
                                    <td class="quantity-box" id="salryTd">
                                    <div class="salaryCondtion">
                                        <span id="pay">M</span>
                                        		시간
                                    </div>
                                    </td>
                                    <td class="add-pr">
                                        	포스팅날짜
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div id="tfoot">
		
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Wishlist -->
     <!-- ALL JS FILES -->
    <script src="${contextPath}/bootstrap/js/jquery-3.2.1.min.js"></script>
    <script src="${contextPath}/bootstrap/js/popper.min.js"></script>
    <script src="${contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="${contextPath}/bootstrap/js/jquery.superslides.min.js"></script>
    <script src="${contextPath}/bootstrap/js/bootstrap-select.js"></script>
    <script src="${contextPath}/bootstrap/js/inewsticker.js"></script>
    <script src="${contextPath}/bootstrap/js/bootsnav.js."></script>
    <script src="${contextPath}/bootstrap/js/images-loded.min.js"></script>
    <script src="${contextPath}/bootstrap/js/isotope.min.js"></script>
    <script src="${contextPath}/bootstrap/js/owl.carousel.min.js"></script>
    <script src="${contextPath}/bootstrap/js/baguetteBox.min.js"></script>
    <script src="${contextPath}/bootstrap/js/form-validator.min.js"></script>
    <script src="${contextPath}/bootstrap/js/contact-form-script.js"></script>
    <script src="${contextPath}/bootstrap/js/custom.js"></script>
</body>
</html>