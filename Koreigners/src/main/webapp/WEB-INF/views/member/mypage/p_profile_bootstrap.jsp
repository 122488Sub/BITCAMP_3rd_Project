<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="bootstrap/images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="bootstrap/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="bootstrap/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="bootstrap/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="bootstrap/css/custom.css">
    
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/member/mypageCompany.css" rel="stylesheet" type="text/css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <!-- Start Main Top -->
    <div class="main-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="our-link">
                        <ul>
                            <li><a href="#"><i class="fa fa-user s_color"></i> My Account</a></li>
                            <li><a href="#"><i class="fas fa-location-arrow"></i> Our location</a></li>
                            <li><a href="#"><i class="fas fa-headset"></i> Contact Us</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="login-box">
						<select id="basic" class="selectpicker show-tick form-control" data-placeholder="Sign In">
							<option>Register Here</option>
							<option>Sign In</option>
						</select>
					</div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Top -->

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
                    <a class="navbar-brand" href="index.html"><img src="images/logo.png" class="logo" alt=""></a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item"><a class="nav-link" href="main.do">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="hireList_go.do">Job</a></li>
                        <li class="nav-item"><a class="nav-link" href="house_main.do">House</a></li>
                        <li class="nav-item"><a class="nav-link" href="resaleList.do">Resale</a></li>
                        <li class="nav-item"><a class="nav-link" href="getInfoBoardList.do">Information</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

 
    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" class="form-control" placeholder="Search">
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
    <!-- End Top Search -->
    
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Profile Setting</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->


   <div id="moveBox">
		<ul>
			<li class="tabs" style="background:#E2E2E2;">
				<img class="icon" src="resources/img/common/setting.png">&nbsp;
				<a href="myPage_go.do?type=profile">Profile Setting</a>
			</li>
			<li class="tabs">
				<img class="icon" src="resources/img/common/document.png">&nbsp;
				<a href="myPage_go.do?type=resume">Resume</a>
			</li>
			<li class="tabs">
				<img class="icon" src="resources/img/common/wishlist.png">&nbsp;
				<a href="myPage_go.do?type=wishlist">Wishlist</a>
			</li>
			<li class="tabs">
				<img class="icon" src="resources/img/common/advertisment.png">&nbsp;
				<a href="myPage_go.do?type=ads">My Ads</a>
			</li>
		</ul>
	</div>

    <!-- Start Cart  -->
    <form action="updateMember.do" method="post">
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
		            <div class="col-sm-6 col-lg-6 mb-3">
        	            <div class="row">
            	            <div class="col-md-12 col-lg-12">
                            <div class="shipping-method-box">
                                <div class="title-left">
                                    <h3>Basic Profile</h3>
                                </div>
                                <div class="mb-3">
	                                <label for="email">ID(Email) *</label>
	                                <input type="email" class="form-control" id="email" value="${mvo.mem_id }" disabled>
	                                <input type="hidden" id="mem_id" name="mem_id" value="${mvo.mem_id }">
	                            </div>
	                            <div class="mb-3">
	                                <label for="username">Nickname *</label>
	                                <div class="input-group">
	                                    <input type="text" class="form-control" name="mem_name" placeholder="${mvo.mem_name }">
	                                    <span id="getMemberNick"></span>
	                                </div>
	                            </div>
	                            <div class="mb-3">
	                                <label for="phone">Phone Number *</label>
	                                <div class="input-group">
	                                    <input type="text" class="form-control" name="mem_phone" placeholder="${mvo.mem_phone }">
	                                </div>
	                            </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="title-left">
                                <h3>Changing Password</h3>
                            </div>
                            <div class="mb-3">
                                <label for="current-password">Current Password *</label>
                                <input type="password" class="form-control" id="curPw">
                                <span id="getMemberPw"></span>
                            </div>
                            <div class="mb-3">
                                <label for="new-password">New Password *</label>
                                <input type="password" class="form-control" id="newPw" name="mem_pw">
                            </div>
                            <div class="mb-3">
                                <label for="re-enter-password">Re-enter New Password *</label>
                                <input type="password" class="form-control" id="rePw">
                                <span id="checkPw"></span>
                            </div>
                        </div>                        
                    </div>
                </div>
                <div class="col-sm-6 col-lg-6 mb-3">
                    <div class="row">
                        <div class="col-md-12 col-lg-12">
                            <div class="shipping-method-box">
                                <div class="title-left">
                                    <h3>Gender</h3>
                                </div>
                                <div class="d-block my-3">
	                                <div class="custom-control custom-radio">
	                                    <input name="mem_gender" type="radio" id="male" class="custom-control-input" value="M"
	                                    <c:if test="${mvo.mem_gender eq 'M'}">checked</c:if>>
	                                    <label class="custom-control-label" for="male">Male</label>
	                                </div>
	                                <div class="custom-control custom-radio">
	                                    <input name="mem_gender" type="radio" id="female" class="custom-control-input" value="F"
	                                     <c:if test="${mvo.mem_gender eq 'F'}">checked</c:if>>
	                                    <label class="custom-control-label" for="female">Female</label>
	                                </div>
                            	</div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="title-left">
                                <h3>Birthday</h3>
                            </div>
                            <script> 
								var today = new Date(); 
								var toyear = parseInt(today.getFullYear()); 
								var start = toyear - 5 
								var end = toyear - 70; 
				
								document.write("<select class='input_box' name=birth1 id='birth1'>"); 
								document.write("<option value='' selected>year"); 
								for (i=start;i>=end;i--) document.write("<option>"+i); 
								document.write("</select>"); 
								
								document.write("<select class='input_box' name=birth2 id='birth2'>"); 
								document.write("<option value='' selected>month"); 
								for (i=1;i<=12;i++) document.write("<option>"+i); 
								document.write("</select>"); 
				
								document.write("<select class='input_box' name=birth3 id='birth3'>"); 
								document.write("<option value='' selected>day"); 
								for (i=1;i<=31;i++) document.write("<option>"+i); 
								document.write("</select>"); 
							</script> 
							<c:if test="${not empty mvo.mem_birth }">
								<input placeholder="${mvo.mem_birth }" class="form-control" contenteditable="false" disabled="disabled">
							</c:if><br><br>							
                        </div>                             
                        <div class="col-md-12 col-lg-12">
                            <div class="title-left">
                                <h3>Address</h3>
                            </div>
                            <div class="mb-3">
                                <label for="road-address">Road Address *</label>
                                <input type="text" class="form-control" id="roadAddr" name="address" placeholder="">
                                <input type="button" value="Search" onclick="goPopup()">
                            </div>
                            <div class="mb-3">
                                <label for="detail-address">Detail Address *</label>
                                <input type="text" class="form-control" id="detailAddr" name="address_detail" placeholder="">
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                            <div class="title-left">
                                <h3>Nationality</h3>
                            </div>
                            <input type="text" id="nationality" class="form-control" name="mem_nationality" placeholder="${mvo.mem_nationality }">
                        </div>
	                    </div>
	                </div>
						    <input type="hidden" class="input_box" name=mem_cate value="${mvo.mem_cate }">
							<button type="submit" class="btn hvr-hover">Save</button>
	            </div>
	        </div>
	    </div>
	   	</form>
    <!-- End Cart -->

      <!-- Start Footer  -->
    <footer>
        <div class="footer-main">
            <div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Business Time</h3>
							<ul class="list-time">
								<li>Monday - Friday: 08.00am to 05.00pm</li> <li>Saturday: 10.00am to 08.00pm</li> <li>Sunday: <span>Closed</span></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Newsletter</h3>
							<form class="newsletter-box">
								<div class="form-group">
									<input class="" type="email" name="Email" placeholder="Email Address*" />
									<i class="fa fa-envelope"></i>
								</div>
								<button class="btn hvr-hover" type="submit">Submit</button>
							</form>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Social Media</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<ul>
                                <li><a href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a></li>
                            </ul>
						</div>
					</div>
				</div>
				<hr>
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-widget">
                            <h4>About Freshshop</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p> 
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p> 							
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>Information</h4>
                            <ul>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Customer Service</a></li>
                                <li><a href="#">Our Sitemap</a></li>
                                <li><a href="#">Terms &amp; Conditions</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Delivery Information</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link-contact">
                            <h4>Contact Us</h4>
                            <ul>
                                <li>
                                    <p><i class="fas fa-map-marker-alt"></i>Address: Michael I. Days 3756 <br>Preston Street Wichita,<br> KS 67213 </p>
                                </li>
                                <li>
                                    <p><i class="fas fa-phone-square"></i>Phone: <a href="tel:+1-888705770">+1-888 705 770</a></p>
                                </li>
                                <li>
                                    <p><i class="fas fa-envelope"></i>Email: <a href="mailto:contactinfo@gmail.com">contactinfo@gmail.com</a></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer  -->

    <!-- Start copyright  -->
    <div class="footer-copyright">
        <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
            <a href="https://html.design/">html design</a></p>
    </div>
    <!-- End copyright  -->

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

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
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW24W9sP9njddFNugiBUaJ-AzVfpQb_MY&language=en&libraries=places&callback=initMap" async defer></script>
	<script type="text/javascript" src="resources/js/member/p_profile.js"></script>
</body>

</html>