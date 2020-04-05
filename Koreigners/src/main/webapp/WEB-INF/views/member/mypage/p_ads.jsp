<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="resources/js/common/buttonColorChange.js"></script>
    <script type="text/javascript" src="resources/js/member/wishList.js"></script>
    <script type="text/javascript" src="resources/js/member/p_mypage/p_ads.js"></script>
    <link href="resources/css/member/mypageCompany.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
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
                	<a class="navbar-brand" href="#">MYPAGE</a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item">
                        <img class="icon" src="resources/img/common/setting.png">
                        <a class="nav-link" href="myPage_go.do?type=profile">Profile Setting</a></li>
                        <li class="nav-item">
                        <img class="icon" src="resources/img/common/document.png">
                        <a class="nav-link" href="myPage_go.do?type=resume">Resume</a></li>
                        <li class="nav-item">
                        <img class="icon" src="resources/img/common/wishlist.png">
                        <a class="nav-link" href="myPage_go.do?type=wishlist">Wishlist</a></li>
                        <li class="nav-item">
                        <img class="icon" src="resources/img/common/advertisment.png">
                        <a class="nav-link" href="myPage_go.do?type=ads">My Ads</a></li>
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
                    <h2>My Ads</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
	<input type="hidden" id="mem_id" value="${mem_id}">

	<div class="cart-box-main">
		<div class="mb-3" style="text-align: center">
			<input type="button" id="btn1" class="btn59acff" value="house" onclick="javascript:changeCategory(2,1,'${mem_id}',1)">
			<input type="button" id="btn2" class="btn59acff" value="job" onclick="javascript:changeCategory(2,2,'${mem_id}',1)">
			<input type="button" id="btn3" class="btn59acff" value="resale" onclick="javascript:changeCategory(2,3,'${mem_id}',1)">
			<input type="button" id="btn4" class="btn59acff" value="information" onclick="javascript:changeCategory(2,4,'${mem_id}',1)">
		</div>
		<div class="wishlist-box-main">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="table-main table-responsive">
							<table id="listTable" class="table">
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
		</div>
	</div>
	
	
	<br><br><br><br><br><br><br><br><br>
	
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
</body>
</html>