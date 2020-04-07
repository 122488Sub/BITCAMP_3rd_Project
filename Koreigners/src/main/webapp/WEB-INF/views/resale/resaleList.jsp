<%@page import="com.koreigner.biz.resale.ResaleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="resources/css/resale/resaleSearch.css" rel="stylesheet" type="text/css"></link>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="bootstrap/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="bootstrap/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="bootstrap/css/custom.css">

<link href="resources/css/common/page.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/common/togleWish.js" ></script>
<script type="text/javascript" src="resources/js/resale/resaleList.js" ></script>
<script>
	function search_go(frm) {
		frm.action = "resaleSearch.do";
		frm.submit();
}
</script>
<body>
	<input type="hidden" id="mem_id" value="${user.mem_id}">
	<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Resale Shop</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

	<!-- Start Search -->
	<%-- <div class="selectbox_div">
		<form method="post" id="searchForm">
			<select id="ex_select" name="idx" class="selectbox">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">제목+내용</option>
			</select>
			<input type="text" id="searchBar" name="keyword">
			<input class=select_search type="image" src="${pageContext.request.contextPath}/resources/img/resale/search.png" 
					width="40px" height="40px" onclick="search_go(this.form)">
		</form>
	</div> --%>
	<!-- End Search -->
	
	<div class="shop-box-inner">
        <div class="container">
            <div class="row">
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <form action="" class="search-product" onsubmit="return false">
                            <div id="searchDiv">
                                <input id="searchText" class="form-control" placeholder="Search here..." type="text">
                                <button id="searchButton" type="submit" onclick="javascript:getData('All',1)"> <i class="fa fa-search"></i> </button>
                            </div>
                        </form>
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3>Categories</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                <a href="javascript:getData('All',1)" class="list-group-item list-group-item-action"> All  <small id="smallCategoryAll" class="text-muted">() </small></a>
                                <a href="javascript:getData('Fashion Goods',1)" class="list-group-item list-group-item-action"> Fashion Goods <small id="smallCategoryFashion" class="text-muted">()</small></a>
                                <a href="javascript:getData('Women Clothes',1)" class="list-group-item list-group-item-action"> Women Clothes <small id="smallCategoryWomen" class="text-muted">()</small></a>
                                <a href="javascript:getData('Men Clothes',1)" class="list-group-item list-group-item-action"> Men Clothes <small id="smallCategoryMen" class="text-muted">()</small></a>
                                <a href="javascript:getData('Household Appliances',1)" class="list-group-item list-group-item-action"> Household Appliances <small id="smallCategoryHousehold" class="text-muted">()</small></a>
                                <a href="javascript:getData('Book/Ticket/Hobbies',1)" class="list-group-item list-group-item-action"> Book/Ticket/Hobbies <small id="smallCategoryBook" class="text-muted">()</small></a>
                                <a href="javascript:getData('Kids/Pregnant/Delivery',1)" class="list-group-item list-group-item-action"> Kids/Pregnant/Delivery  <small id="smallCategoryKid" class="text-muted">() </small></a>
                                <a href="javascript:getData('Star Goods',1)" class="list-group-item list-group-item-action"> Star Goods <small id="smallCategoryStar" class="text-muted">()</small></a>
                                <a href="javascript:getData('Sports/leisure',1)" class="list-group-item list-group-item-action"> Sports/leisure <small id="smallCategorySports" class="text-muted">()</small></a>
                                <a href="javascript:getData('Beauty/Cosmetic',1)" class="list-group-item list-group-item-action"> Beauty/Cosmetic <small id="smallCategoryBeauty" class="text-muted">()</small></a>
                                <a href="javascript:getData('Vehicles',1)" class="list-group-item list-group-item-action"> Vehicles <small id="smallCategoryVehicles" class="text-muted">()</small></a>
                            </div>
                        </div>
                        <div class="title-left"></div>
	                        <div style="text-align:center">
	                        	<button type="button" class="btn hvr-hover col-md-12" onclick="javascript:location.href='resale_go.do'">New Post</button>
	                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                    <div class="right-product-box">
                        <div class="product-item-filter row">
                            <div class="col-12 col-sm-8 text-center text-sm-left"></div>
                            <div class="col-12 col-sm-4 text-center text-sm-right">
                                <ul class="nav nav-tabs ml-auto">
                                    <li>
                                        <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
					            <div class="row">
									<c:if test="${not empty list }">
									<c:forEach var="vo" items="${list}">
						                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
						                    <div class="products-single fix">
						                        <!-- 이미지 -->
						                        <div class="box-img-hover">
						                           <c:choose>
												   <c:when test="${vo.file_ori_name == 'businessImg_'}">
												   <img style="height:300px" src="${pageContext.request.contextPath}/resources/img/resale/default-placeholder.jpg" class="img-fluid">
							                            <div class="mask-icon">
							                                <ul>
							                                    <li><a href="resaleDetail.do?rs_idx=${vo.rs_idx}&cPage=${pvo.getNowPage()}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
							                                    <li><a href="javascript:clickWishGrid('${user.mem_id}',${vo.rs_idx},3)" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i id="rsWish_${vo.rs_idx }" class="far fa-heart"></i></a></li>
							                                </ul>
							                            </div>
												    </c:when>
												    <c:otherwise>
														<img style="height:300px" src="${pageContext.request.contextPath}/resources/img/resale/${vo.getMem_id()}/${vo.getFile_ori_name()}" class="img-fluid">
												    	<div class="mask-icon">
							                                <ul>
							                                    <li><a href="resaleDetail.do?rs_idx=${vo.rs_idx}&cPage=${pvo.getNowPage()}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
							                                    <li><a href="javascript:clickWishGrid('${user.mem_id}',${vo.rs_idx},3)" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i id="rsWish_${vo.rs_idx }" class="far fa-heart"></i></a></li>
							                                    
							                                </ul>
							                            </div>
												    </c:otherwise>
												    </c:choose>
						                        </div>
						                        <!-- 설명 -->
						                        <div>${vo.subject}</div>
					                        	<div>${vo.price }원</div><span>${vo.regdate }</span>
					                        	<div id="addrBox">&nbsp;<img src ="img/pin.png" width="15px" height="15px">
												<c:choose>
													<c:when test="${not empty vo.address}">
														${vo.address }
													</c:when>
													<c:otherwise>
													  주소 없음
													</c:otherwise>
												 </c:choose>
												</div>
						                    </div>
						                </div>
									</c:forEach>
									</c:if>
					            </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<!-- Start Gallery  -->
    <div class="products-box">
        <div class="container">
				

	                
        </div>
    </div>
    <!-- End Gallery  -->
	
	
 
    
    <!-- ALL JS FILES -->
    <script src="bootstrap/js/jquery-3.2.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="bootstrap/js/jquery.superslides.min.js"></script>
    <script src="bootstrap/js/bootstrap-select.js"></script>
    <script src="bootstrap/js/inewsticker.js"></script>
    <script src="bootstrap/js/bootsnav.js."></script>
    <script src="bootstrap/js/images-loded.min.js"></script>
    <script src="bootstrap/js/isotope.min.js"></script>
    <script src="bootstrap/js/owl.carousel.min.js"></script>
    <script src="bootstrap/js/baguetteBox.min.js"></script>
    <script src="bootstrap/js/form-validator.min.js"></script>
    <script src="bootstrap/js/contact-form-script.js"></script>
    <script src="bootstrap/js/custom.js"></script>
</body>