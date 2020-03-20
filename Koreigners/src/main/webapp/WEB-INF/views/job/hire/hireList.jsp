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
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="${contextPath}/bootstrap/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="${contextPath}/bootstrap/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="${contextPath}/bootstrap/css/custom.css">

<style>
.wishlist-box-main {
	height: auto;
}
.table {width:80%; height: auto;}
#company{
	width:10%
}
#location{
	width:10%
}
#title{
	width:50%
}
#salary{
	width:20%
}
#post_date{
	width:10%
}
#boxFont {color:black;}
td{height:80px;}
#conBox{float:left;}
#salryTd {text-align: left;}
#pay{font-weight: bold; text-align: center; width:40px;height:20px;background-color: aqua;border-radius: 5px; padding-bottom: 6px;}
.salaryCondtion {display:flex;}
</style>
<script>
</script>
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
	<c:when test="${loginUser.mem_cate eq 'c'}">
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
 <!-- Start Wishlist  -->
    <div class="wishlist-box-main">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-main table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th id="compName">Company Name</th>
                                    <th id="location">Location</th>
                                    <th id="title">Title</th>
                                    <th id="salary">Salary</th>
                                    <th id="post_date">Post Date</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="thumbnail-img">
                                         <p>회사1</p>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									location6
								</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>$ 80.0</p>
                                    </td>
                                    <td class="quantity-box" id="salryTd">
                                    <div class="salaryCondtion">
                                        <span id="pay">M</span>
                                        In Stock
                                    </div>
                                    </td>
                                    <td class="add-pr">
                                        Add to Cart
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td class="thumbnail-img">
                                         <p>회사1</p>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									location1
								</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>$ 80.0</p>
                                    </td>
                                    <td class="quantity-box">In Stock</td>
                                    <td class="add-pr">
                                        <a class="btn hvr-hover" href="#">Add to Cart</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="thumbnail-img">
                                         <p>회사1</p>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									location2
								</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>$ 80.0</p>
                                    </td>
                                    <td class="quantity-box">In Stock</td>
                                    <td class="add-pr">
                                        <a class="btn hvr-hover" href="#">Add to Cart</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="thumbnail-img">
                                         <p>회사1</p>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									location3
								</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>$ 80.0</p>
                                    </td>
                                    <td class="quantity-box">In Stock</td>
                                    <td class="add-pr">
                                        <a class="btn hvr-hover" href="#">Add to Cart</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="thumbnail-img">
                                        <p>회사2</p>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									location4
								</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>$ 60.0</p>
                                    </td>
                                    <td class="quantity-box">In Stock</td>
                                    <td class="add-pr">
                                        <a class="btn hvr-hover" href="#">Add to Cart</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="thumbnail-img">
                                       <p>회사3</p>
                                    </td>
                                    <td class="name-pr">
                                        <a href="#">
									location5
								</a>
                                    </td>
                                    <td class="price-pr">
                                        <p>$ 30.0</p>
                                    </td>
                                    <td class="quantity-box">In Stock</td>
                                    <td class="add-pr">
                                        <a class="btn hvr-hover" href="#">Add to Cart</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Wishlist -->
     <!-- ALL JS FILES -->
    <script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
    <script src="${contextPath}/js/popper.min.js"></script>
    <script src="${contextPath}/js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="${contextPath}/js/jquery.superslides.min.js"></script>
    <script src="${contextPath}/js/bootstrap-select.js"></script>
    <script src="${contextPath}/js/inewsticker.js"></script>
    <script src="${contextPath}/js/bootsnav.js."></script>
    <script src="${contextPath}/js/images-loded.min.js"></script>
    <script src="${contextPath}/js/isotope.min.js"></script>
    <script src="${contextPath}/js/owl.carousel.min.js"></script>
    <script src="${contextPath}/js/baguetteBox.min.js"></script>
    <script src="${contextPath}/js/form-validator.min.js"></script>
    <script src="${contextPath}/js/contact-form-script.js"></script>
    <script src="${contextPath}/js/custom.js"></script>
</body>
</html>