<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}/bootstrap" />

<script type="text/javascript" src="resources/js/resale/slide.js" ></script>
<script type="text/javascript" src="resources/js/common/togleWish.js" ></script>

<body>

    <br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Resale</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

    <!-- Start Shop Detail  -->
    <div class="shop-detail-box-main">
        <div class="container">
        	<div style="text-align:center">
       			<div class="title-left">
    				<h3>Get RENEW Items!</h3>
    			</div>
    			<p class="text-right">${rsVO.regdate}</p>
	    		<hr>
        	</div>
            <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-6">
                    <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active"> <img class="d-block w-100" src="${contextPath}/images/big-img-01.jpg" alt="First slide"> </div>
                            <div class="carousel-item"> <img class="d-block w-100" src="${contextPath}/images/big-img-02.jpg" alt="Second slide"> </div>
                            <div class="carousel-item"> <img class="d-block w-100" src="${contextPath}/images/big-img-03.jpg" alt="Third slide"> </div>
                        </div>
                        <a class="carousel-control-prev" href="#carousel-example-1" role="button" data-slide="prev"> 
						<i class="fa fa-angle-left" aria-hidden="true"></i>
						<span class="sr-only">Previous</span> 
					</a>
                        <a class="carousel-control-next" href="#carousel-example-1" role="button" data-slide="next"> 
						<i class="fa fa-angle-right" aria-hidden="true"></i> 
						<span class="sr-only">Next</span> 
					</a>
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-1" data-slide-to="0" class="active">
                                <img class="d-block w-100 img-fluid" src="${contextPath}/images/smp-img-01.jpg" alt="" />
                            </li>
                            <li data-target="#carousel-example-1" data-slide-to="1">
                                <img class="d-block w-100 img-fluid" src="${contextPath}/images/smp-img-02.jpg" alt="" />
                            </li>
                            <li data-target="#carousel-example-1" data-slide-to="2">
                                <img class="d-block w-100 img-fluid" src="${contextPath}/images/smp-img-03.jpg" alt="" />
                            </li>
                        </ol>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7 col-md-6">
                    <div class="single-product-details">
                    	<div class="my-5">
	                        <h2>${rsVO.subject}</h2>
                    	</div>
                    	<div class="mb-2">
	                        <h5>${rsVO.price}</h5>
                    	</div>
                        <p class="mb-1">seller : ${rsVO.mem_name}</p>
                        <p class="mb-1">category : ${rsVO.rs_cate_prnt}&nbsp;&gt;&nbsp;${rsVO.category_child}</p>
                        <p class="mb-1">hit : ${rsVO.hit}</p>
						<h4>Hash tag</h4>
						<p>${rsVO.hash_tag}</p>

						<div class="add-to-btn">
							<div class="add-comp col-md-12">
								<div class="row">
									<div class="col-md-4">
										<button class="btn hvr-hover" style="font-weight:700; padding:10px 20px;" onclick="javascript:clickWishList('${user.mem_id }','${rsVO.rs_idx}',3)"><i class="fas fa-heart"></i>Add to wishlist</button>
									</div>
									<div class="col-md-8">
										<c:if test="${not empty mem_id && mem_id == rsVO.mem_id}">
										<div class="row">
											<form action="editResale.do" method="post">
												<input type="hidden" name="cPage" value="${cPage}">
												<input type="hidden" name="rs_idx" value="${rsVO.rs_idx}">
												<button type="submit" id="editBtn" class="btn hvr-hover" style="font-weight:700; margin-right:10px; padding:10px 20px">update</button>
											</form>
											<form action="deleteResale.do" method="post">
												<input type="hidden" name="cPage" value="${cPage}">
												<input type="hidden" name="rs_idx" value="${rsVO.rs_idx}">
												<button type="submit" id="deleteBtn" class="btn hvr-hover" style="font-weight:700; padding:10px 20px">delete</button>
											</form>
										</div>
										</c:if>
									</div>
								</div>
									 
							</div>
						</div>
                    </div>
                </div>
            </div>
            <div class="cart-box-main">
            	<div class="container">
	            	<div class="col-md-12">
						<div class="title-left">
			   				<h3>Description</h3>
			   			</div>
			   			<p>${rsVO.content}</p>
	            	</div>
            	</div>
            </div>
   			
			
			<div class="row my-5">
				<div class="card card-outline-secondary my-4">
					<div class="card-header">
						<h2>Product Reviews</h2>
					</div>
					<div class="card-body">
						<div class="media mb-3">
							<div class="mr-2"> 
								<img class="rounded-circle border p-1" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Generic placeholder image">
							</div>
							<div class="media-body">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
								<small class="text-muted">Posted by Anonymous on 3/1/18</small>
							</div>
						</div>
						<hr>
						<div class="media mb-3">
							<div class="mr-2"> 
								<img class="rounded-circle border p-1" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Generic placeholder image">
							</div>
							<div class="media-body">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
								<small class="text-muted">Posted by Anonymous on 3/1/18</small>
							</div>
						</div>
						<hr>
						<div class="media mb-3">
							<div class="mr-2"> 
								<img class="rounded-circle border p-1" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2264%22%20height%3D%2264%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2064%2064%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_160c142c97c%20text%20%7B%20fill%3Argba(255%2C255%2C255%2C.75)%3Bfont-weight%3Anormal%3Bfont-family%3AHelvetica%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_160c142c97c%22%3E%3Crect%20width%3D%2264%22%20height%3D%2264%22%20fill%3D%22%23777%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2213.5546875%22%20y%3D%2236.5%22%3E64x64%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" alt="Generic placeholder image">
							</div>
							<div class="media-body">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis et enim aperiam inventore, similique necessitatibus neque non! Doloribus, modi sapiente laboriosam aperiam fugiat laborum. Sequi mollitia, necessitatibus quae sint natus.</p>
								<small class="text-muted">Posted by Anonymous on 3/1/18</small>
							</div>
						</div>
						<hr>
						<a href="#" class="btn hvr-hover">Leave a Review</a>
					</div>
				  </div>
			</div>
        </div>
    </div>
    <!-- End Cart -->

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