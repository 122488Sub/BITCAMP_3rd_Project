<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}/bootstrap" />
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Freshshop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="${contextPath}/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="${contextPath}/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="${contextPath}/css/custom.css">
    <link rel="stylesheet" href="resources/css/main/mainCategory.css">
    <script type="text/javascript" src="resources/js/common/togleWish.js" ></script>
	<script type="text/javascript" src="resources/js/common/homeMain.js" ></script>
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.${contextPath}/js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<br><br>
    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides" style="position: relative;overflow: hidden;width: 100%;height: 400px;">
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
	                            <img src="https://ssl-gumtree.classistatic.com/cached/img/au/homepage/pic-featured-category-18320.jpg" alt="Job">
	                        </a>
	                    </div>
	                <div class="featured-categories__item">
	                        <a href="house_main.do" class="featured-categories__item-link">
	                            <div class="featured-categories__item-description ">
	                                <h4 style="color:white; font-weight: 600;" class="featured-categories__item-description-title">House</h4>
	                                <p class="featured-categories__item-description-total-ads">${mainCount[0].CNT_HOUSE }&nbsp;ads</p>
	                            </div>
	                            <img src="https://ssl-gumtree.classistatic.com/cached/img/au/homepage/pic-featured-category-18397.jpg" alt="House">
	                        </a>
	                    </div>
	                <div class="featured-categories__item">
	                        <a href="resaleList.do" class="featured-categories__item-link">
	                            <div class="featured-categories__item-description featured-categories__item-description--jobs">
	                                <h4 style="color:white; font-weight: 600;" class="featured-categories__item-description-title">Resale</h4>
	                                <p class="featured-categories__item-description-total-ads">${mainCount[0].CNT_RESALE}&nbsp;ads</p>
	                            </div>
	                            <img src="https://ssl-gumtree.classistatic.com/cached/img/au/homepage/pic-featured-category-9302.jpg" alt="Resale">
	                        </a>
	                    </div>
	                <div class="featured-categories__item">
	                        <a href="InfoList_go.do" class="featured-categories__item-link">
	                            <div class="featured-categories__item-description ">
	                                <h4 style="color:white; font-weight: 600;" class="featured-categories__item-description-title">Information</h4>
	                                <p class="featured-categories__item-description-total-ads">${mainCount[0].CNT_INFORM}&nbsp;ads</p>
	                            </div>
	                            <img src="https://ssl-gumtree.classistatic.com/cached/img/au/homepage/pic-featured-category-1000000.jpg" alt="Information">
	                        </a>
	                    </div>
	                </div>
	        </div>
	
	    </div>
	</div>
	<!-- 메인화면 카테고리 끝 -->
    <!-- Start Blog  -->
    <div class="latest-blog">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>latest blog</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet lacus enim.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-4 col-xl-4">
                    <div class="blog-box">
                        <div class="blog-img">
                            <img class="img-fluid" src="${contextPath}/images/blog-img.jpg" alt="" />
                        </div>
                        <div class="blog-content">
                            <div class="title-blog">
                                <h3>Fusce in augue non nisi fringilla</h3>
                                <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                            </div>
                            <ul class="option-blog">
                                <li><a href="#"><i class="far fa-heart"></i></a></li>
                                <li><a href="#"><i class="fas fa-eye"></i></a></li>
                                <li><a href="#"><i class="far fa-comments"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-4">
                    <div class="blog-box">
                        <div class="blog-img">
                            <img class="img-fluid" src="${contextPath}/images/blog-img-01.jpg" alt="" />
                        </div>
                        <div class="blog-content">
                            <div class="title-blog">
                                <h3>Fusce in augue non nisi fringilla</h3>
                                <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                            </div>
                            <ul class="option-blog">
                                <li><a href="#"><i class="far fa-heart"></i></a></li>
                                <li><a href="#"><i class="fas fa-eye"></i></a></li>
                                <li><a href="#"><i class="far fa-comments"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 col-xl-4">
                    <div class="blog-box">
                        <div class="blog-img">
                            <img class="img-fluid" src="${contextPath}/images/blog-img-02.jpg" alt="" />
                        </div>
                        <div class="blog-content">
                            <div class="title-blog">
                                <h3>Fusce in augue non nisi fringilla</h3>
                                <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                            </div>
                            <ul class="option-blog">
                                <li><a href="#"><i class="far fa-heart"></i></a></li>
                                <li><a href="#"><i class="fas fa-eye"></i></a></li>
                                <li><a href="#"><i class="far fa-comments"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Blog  -->


    <!-- Start Instagram Feed  -->
    <div class="instagram-box">
        <div class="main-instagram owl-carousel owl-theme">
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/instagram-img-01.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/instagram-img-02.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/instagram-img-03.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/instagram-img-04.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/instagram-img-05.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/instagram-img-06.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/instagram-img-07.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/instagram-img-08.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/instagram-img-09.jpg" alt="" />
                    <div class="hov-in">
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="ins-inner-box">
                    <img src="${contextPath}/images/instagram-img-05.jpg" alt="" />
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