<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Basic -->

<head>

    <link href="resources/css/member/mypageCompany.css" rel="stylesheet" type="text/css">

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
                    <h2>Profile Setting</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Cart  -->
    <form action="updateMember.do" method="post">
    <div class="cart-box-main">
        <div class="container">
        	<div class="row">
		            <div class="col-sm-6 col-lg-6 mb-3">
                            <div class="shipping-method-box">
                                <div class="title-left">
                                    <h3>Basic Profile</h3>
                                </div>
                                <div class="mb-3">
	                                <label for="email">ID(Email) </label>
	                                <input type="email" class="form-control" id="email" value="${mvo.mem_id }" disabled>
	                                <input type="hidden" id="mem_id" name="mem_id" value="${mvo.mem_id }">
	                            </div>
	                            <div class="mb-3">
	                                <label for="username">Nickname </label>
	                                <div class="input-group">
	                                    <input type="text" class="form-control" id="mem_name" name="mem_name" value="${mvo.mem_name }">
	                                    <span id="getMemberNick"></span>
	                                </div>
	                            </div>
	                            <div class="mb-3">
	                                <label for="phone">Phone Number </label>
	                                <div class="input-group">
	                                    <input type="text" class="form-control" name="mem_phone" value="${mvo.mem_phone }">
	                                </div>
	                            </div>
                            <div class="title-left">
                                <h3>Changing Password</h3>
                            </div>
                            <div class="mb-3">
                                <label for="current-password">Current Password </label>
                                <input type="password" class="form-control" id="curPw">
                                <span id="getMemberPw"></span>
                            </div>
                            <div class="mb-3">
                                <label for="new-password">New Password </label>
                                <input type="password" class="form-control" id="newPw" name="mem_pw">
                            </div>
                            <div class="mb-3">
                                <label for="re-enter-password">Re-enter New Password </label>
                                <input type="password" class="form-control" id="rePw">
                                <span id="checkPw"></span>
                            </div>   
                    </div>
                </div>
                <div class="col-sm-6 col-lg-6 mb-3">
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
                            <div class="title-left">
                                <h3>Address</h3>
                            </div>
                            <div class="mb-3">
                                <label for="road-address">Road Address </label>
                                <input type="text" class="form-control" id="roadAddr" name="address" placeholder="${mvo.mem_address }">
                                <input type="button" value="Search" onclick="goPopup()">
                            </div>
                            <div class="mb-3">
                                <label for="detail-address">Detail Address </label>
                                <input type="text" class="form-control" id="detailAddr" name="address_detail" placeholder="">
                            </div>
                            <div class="title-left">
                                <h3>Nationality</h3>
                            </div>
                            <input type="text" id="nationality" class="form-control" name="mem_nationality" placeholder="${mvo.mem_nationality }">
	                </div>
	                </div>
	                </div>
	        </div><br><br>
						    <input type="hidden" name="mem_cate" value="${mvo.mem_cate }">
							<p align="center"><button type="submit" class="btn hvr-hover">Save</button></p>
	    </div>
   	</form>
    <!-- End Cart -->
    
    
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