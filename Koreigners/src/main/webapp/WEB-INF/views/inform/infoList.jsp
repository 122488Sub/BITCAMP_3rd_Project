<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="bootstrap/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="bootstrap/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="bootstrap/css/custom.css">

<link href="resources/css/common/page.css" rel="stylesheet" type="text/css">
<link href="resources/css/common/button.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="resources/js/common/togleWish.js" ></script>
<script type="text/javascript" src="resources/js/common/buttonColorChange.js"></script>
<script type="text/javascript" src="resources/js/inform/infoList.js"></script>
</head>

<body>


	<!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                    <a class="navbar-brand" href="#">INFORMATION</a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item"><a class="nav-link" href="javascript:getData('All',1)">All</a></li>
                        <li class="nav-item"><a class="nav-link" href="javascript:getData('Information',1)">Information</a></li>
                        <li class="nav-item"><a class="nav-link" href="javascript:getData('Food',1)">Food</a></li>
                        <li class="nav-item"><a class="nav-link" href="javascript:getData('Travel',1)">Travel</a></li>
                        <li class="nav-item"><a class="nav-link" href="javascript:getData('Etc',1)">etc</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->
	
	
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Information</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    
	<!-- <div style="text-align: center">
		<input type="button" id="btn1" class="btn59acff" value="All" onclick="javascript:getData('All',1)">
		<input type="button" id="btn2" class="btn59acff" value="Information" onclick="javascript:getData('Information',1)">
		<input type="button" id="btn3" class="btn59acff" value="Food" onclick="javascript:getData('Food',1)">
		<input type="button" id="btn4" class="btn59acff" value="Travel" onclick="javascript:getData('Travel',1)">
		<input type="button" id="btn5" class="btn59acff" value="Etc" onclick="javascript:getData('Etc',1)">
	</div> -->
	
	<!-- <div class="wishlist-box-main">
	<a href="InfoInsert_go.do">New Post</a>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="table-main table-responsive">
						<table class="table" id="infoList">
							<thead id="tHead">

							</thead>
							<tbody id="list_box">

							</tbody>

						</table>
						<div id="tfoot"></div>
					</div>
				</div>
			</div>
		</div>
	</div> -->
	
	<input type="hidden" id="mem_id" value="${user.mem_id}">
	<!-- Start Shop Page  -->
    <div class="shop-box-inner">
        <div class="container">
            <div class="row">
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                    <div class="product-categori">
                        <div class="search-product">
                            <form action="#">
                                <input class="form-control" placeholder="Search here..." type="text">
                                <button type="submit"> <i class="fa fa-search"></i> </button>
                            </form>
                        </div>
                        <div class="filter-sidebar-left">
                            <div class="title-left">
                                <h3>Categories</h3>
                            </div>
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                <a href="javascript:getData('All',1)" class="list-group-item list-group-item-action"> All  <small id="smallCategoryAll" class="text-muted">() </small></a>
                                <a href="javascript:getData('Information',1)" class="list-group-item list-group-item-action"> Information <small id="smallCategoryInformation" class="text-muted">()</small></a>
                                <a href="javascript:getData('Food',1)" class="list-group-item list-group-item-action"> Food <small id="smallCategoryFood" class="text-muted">()</small></a>
                                <a href="javascript:getData('Travel',1)" class="list-group-item list-group-item-action"> Travel <small id="smallCategoryTravel" class="text-muted">()</small></a>
                                <a href="javascript:getData('Etc',1)" class="list-group-item list-group-item-action"> etc <small id="smallCategoryEtc" class="text-muted">()</small></a>
                            </div>
                        </div>
                        <div class="title-left"></div>
	                        <div style="text-align:center">
	                        	<button type="button" class="btn hvr-hover col-md-12" onclick="location.href='InfoInsert_go.do'">New Post</button>
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
                                    <li>
                                        <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="product-categorie-box">
                            <div class="tab-content">
                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view"></div>
                                <div role="tabpanel" class="tab-pane fade" id="list-view">
                                    <div class="list-view-box">
                                        <div class="wishlist-box-main">
											<div class="container">
												<div class="row">
													<div class="col-md-12 col-lg-12">
														<div class="table-main table-responsive">
															<table class="table" id="infoList">
																<thead id="tHead">
									
																</thead>
																<tbody id="list_box">
									
																</tbody>
															</table>
															<div class="tfoot"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Shop Page -->
	
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
</html>
