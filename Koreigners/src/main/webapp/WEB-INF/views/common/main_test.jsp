<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}/bootstrap" />
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <link rel="stylesheet" href="resources/css/main/mainCategory.css">
    <script type="text/javascript" src="resources/js/common/togleWish.js" ></script>
	<script type="text/javascript" src="resources/js/common/homeMain.js" ></script>
<script>
	$(function(){
		var auth_check = ${auth_check};
		console.log("?:"+auth_check);
		if(auth_check == 0) {
			alert("Please verify your e-mail for unlimited access to our website.");
		}
	});

</script>
</head>

<body>

	<br><br>
    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides" style="position: relative;overflow: hidden;width: 100%;height: 600px;">
        <ul class="slides-container">
            <li class="text-center">
                <img src="${contextPath}/images/Gwanghwamoon.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> KOREA</strong></h1>
                            <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="${contextPath}/images/Ntower.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> KOREA</strong></h1>
                            <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                        </div>
                    </div>
                </div>
            </li>
            <li class="text-center">
                <img src="${contextPath}/images/bukchon_namsan.jpg" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> KOREA</strong></h1>
                            <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->
	
    <!-- Start Products  -->
    <div class="products-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Resale & Information</h1>
                        <p>Check out new posts.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="special-menu text-center">
                        <div class="button-group filter-button-group">
                            <button class="active" data-filter="*">All</button>
                            <button data-filter=".top-featured">Resale</button>
                            <button data-filter=".best-seller">Information</button>
                        </div>
                    </div>
                </div>
            </div>

<!-- 최근글 리스트 부분 -->
			<input type="hidden" id="mem_id" value="${user.mem_id}">
            <div id="recentList" class="row special-list">
	

	
            </div>
        </div>
    </div>
    <!-- End Products  -->
	<!-- 메인화면 카테고리 시작 -->
	<div class="container--full-width featured-categories">
	    <div class="container">
	        <div class="clearfix title-all text-center">
	            <h1>Featured Categories</h1>
	            <p>Browse through some of our most popular categories</p>
	        </div>
	        <div class="featured-categories__scroller">
	            <div class="clearfix featured-categories__items">
	               <div class="featured-categories__item">
	                        <a href="hireList_go.do" class="featured-categories__item-link">
	                            <div class="featured-categories__item-description featured-categories__item-description--cars">
	                                <h4 style="color:white; font-weight: 600;" class="featured-categories__item-description-title">Job</h4>
	                                <p class="featured-categories__item-description-total-ads">${mainCount[0].CNT_HIRE }&nbsp;ads</p>
	                            </div>
	                            <img src="resources/img/main/job.jpg" alt="Job">
	                        </a>
	                    </div>
	                <div class="featured-categories__item">
	                        <a href="house_main.do" class="featured-categories__item-link">
	                            <div class="featured-categories__item-description ">
	                                <h4 style="color:white; font-weight: 600;" class="featured-categories__item-description-title">House</h4>
	                                <p class="featured-categories__item-description-total-ads">${mainCount[0].CNT_HOUSE }&nbsp;ads</p>
	                            </div>
	                            <img src="resources/img/main/house.jpg" alt="House">
	                        </a>
	                    </div>
	                <div class="featured-categories__item">
	                        <a href="resaleList.do" class="featured-categories__item-link">
	                            <div class="featured-categories__item-description featured-categories__item-description--jobs">
	                                <h4 style="color:white; font-weight: 600;" class="featured-categories__item-description-title">Resale</h4>
	                                <p class="featured-categories__item-description-total-ads">${mainCount[0].CNT_RESALE}&nbsp;ads</p>
	                            </div>
	                            <img src="resources/img/main/resale.jpg" alt="Resale">
	                        </a>
	                    </div>
	                <div class="featured-categories__item">
	                        <a href="InfoList_go.do" class="featured-categories__item-link">
	                            <div class="featured-categories__item-description ">
	                                <h4 style="color:white; font-weight: 600;" class="featured-categories__item-description-title">Information</h4>
	                                <p class="featured-categories__item-description-total-ads">${mainCount[0].CNT_INFORM}&nbsp;ads</p>
	                            </div>
	                            <img src="resources/img/main/information.jpg" alt="Information">
	                        </a>
	                    </div>
	                </div>
	        </div>
	
	    </div>
	</div>
	<!-- 메인화면 카테고리 끝 -->
   


    <!-- Start Instagram Feed  -->
    <div class="instagram-box">
        <div class="main-instagram owl-carousel owl-theme">
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/Korea-Travel-1.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/Korea-Travel-2.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/Korea-Travel-3.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/Korea-Travel-4.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/Korea-Travel-5.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/Korea-Travel-6.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/Korea-Travel-7.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/Korea-Travel-8.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/Korea-Travel-9.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/Korea-Travel-10.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Instagram Feed  -->

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