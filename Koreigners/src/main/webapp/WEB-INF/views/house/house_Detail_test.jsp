<%@page import="com.koreigner.biz.house.HouseAll_VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}/bootstrap" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/common/slide.js"></script>
<script type="text/javascript" src="resources/js/common/post_go.js"></script>
<script type="text/javascript" src="resources/js/house/houseDetail.js"></script>
<script type="text/javascript" src="resources/js/common/togleWish.js" ></script>
<link rel="stylesheet" href="resources/css/house/houseDetailResponsive.css"> 
<style type="text/css">
	.center {
		float: none;
		margin: 0 auto;
	}
</style>
</head>

<body>
<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>HOUSE</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    
    <!-- Start Shop Detail  -->
    <div class="shop-detail-box-main">
        <div class="container">
        	<div class="col-md-12 mb-5">
       			<div class="title-left"></div>
	    		<hr>
        	</div>
        	<div class="col-md-10 center">
	            <div class="row">
	                <div class="col-xl-5 col-lg-5 col-md-6">
			        <c:choose>
					     <c:when test="${empty house.img_nameList  }">
					     		<li><img id="imgFile" src=""></li>
					     		<div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
			                        <div class="carousel-inner" role="listbox">
			                            <div class="carousel-item active"> <img class="d-block w-100" style="height: 400px;" src="resources/img/common/default-placeholder.jpg" alt="First slide"> </div>
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
			                                <img class="d-block w-100 img-fluid" style="height: 100px;" src="resources/img/common/default-placeholder.jpg" alt="" />
			                            </li>
			                        </ol>
			                    </div>
					     </c:when>
					     <c:otherwise>
					     		<div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
			                        <div class="carousel-inner" role="listbox">
			                    	<c:forEach items="${house.img_nameList}" varStatus="status" var="img" >
			                    		<c:if test="${status.index ==0}">
			                    			<div class="carousel-item active"> <img class="d-block w-100" style="height: 400px;" src="resources/img/house/upload/${house.mem_email}/${img}" alt="slide${status.index+1}"> </div>
						        		</c:if>
						        		<c:if test="${status.index !=0}">
						        			<div class="carousel-item"> <img class="d-block w-100" style="height: 400px;" src="resources/img/house/upload/${house.mem_email}/${img}" alt="slide${status.index+1}"> </div>
						        		</c:if>
						     		</c:forEach>
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
			                        <c:forEach items="${house.img_nameList}" varStatus="status" var="img" >
			                        <c:if test="${status.index ==0}">
			                            <li data-target="#carousel-example-1" data-slide-to="${status.index}" class="active">
			                                <img class="d-block w-100 img-fluid" style="height: 100px;" src="resources/img/house/upload/${house.mem_email}/${img}" alt="" />
			                            </li>
			                        </c:if>
			                        <c:if test="${status.index !=0}">
			                            <li data-target="#carousel-example-1" data-slide-to="${status.index}">
			                                <img class="d-block w-100 img-fluid" style="height: 100px;" src="resources/img/house/upload/${house.mem_email}/${img}" alt="" />
			                            </li>
			                        </c:if>
			                        </c:forEach>
			                        </ol>
			                    </div>
					     	
						    
					     </c:otherwise>
				     </c:choose>     
	                </div>
	                <div class="col-xl-7 col-lg-7 col-md-6">
	                    <div class="single-product-details">
	                    	<div class="mb-3">
		                        <h2>${house.subject}</h2>
	                    	</div>
	                    	<div class="mb-2">
		                        <h5>Deposit : $${deposit}</h5>
		                        <h5>Monthly : $${monthly}</h5>
	                    	</div>
	                        <p class="mb-3">
							  <c:if test="${not empty house.address_detail}">
								${house.address_detail},
							  </c:if>
								${house.address}
							</p>
							<div class="mt-3">
								<div class="font-weight-bold" style="font-size:1.2em">Info</div>
								<hr style="margin-top: 0;" class="col-md-10">
								<table id="infoTable">
									<colgroup>
										<col width="20%" span="1">
										<col width="25%" span="1">
										<col width="20%" span="1">
										<col width="25%" span="1">
									</colgroup>
									<tr>
										<th>Build Type</th>
										<td>
											<c:choose>
											  <c:when test="${house.build_type eq 0 }">
												Villa
											  </c:when>
											  <c:when test="${house.build_type eq 1 }">
												Goshiwon
											  </c:when>
											  <c:otherwise>
											    Semi-Officetel
											  </c:otherwise>	
											</c:choose>
										</td>
										<th>Minimum Stay</th>
										<td>
											<c:choose>
											  <c:when test="${house.stay_num_min lt 12 }">
												${house.stay_num_min} Month
											  </c:when>
											  <c:otherwise>
											    ${house.stay_num_min-11} Year
											  </c:otherwise>	
											</c:choose>
										</td>
									</tr>
									<tr>
										<th>Room Type</th>
										<td>
											<c:choose>
											  <c:when test="${house.room_type eq 0  }">
												Studio
											  </c:when>
											  <c:when test="${house.room_type eq 1 }">
												Two
											  </c:when>
											  <c:otherwise>
											    Three+
											  </c:otherwise>	
											</c:choose>
										</td>
										<th>Available Date</th>
										<td>${house.available_date} Later</td>
									</tr>
									<tr>
										<th>Area</th>
										<td>${house.room_area}m<sup>2</sup></td>
									</tr>
								</table>
								<hr class="col-md-10">
								
							</div>
	
							<div class="add-to-btn">
								<div class="add-comp col-md-12">
									<c:if test="${user.mem_id!=null && user.mem_cate eq 'p'}">
									<div class="row">
										<div class="col-md-4" style="margin-left: 0">
											<c:choose>
												<c:when test="${isWish}">
											<button id="wishBtn" class="btn hvr-hover" style="margin-bottom:5px; background-color:firebrick; font-weight:700; padding:10px 20px;" onclick="javascript:clickWishGrid('${user.mem_id }','${house.room_idx}',1)"><i id="wish_${house.room_idx}" class="fas fa-heart"></i>Add to wishlist</button>
												</c:when>
												<c:otherwise>
											<button id="wishBtn" class="btn hvr-hover" style="margin-bottom:5px; background-color:#0B3B39; font-weight:700; padding:10px 20px;" onclick="javascript:clickWishGrid('${user.mem_id }','${house.room_idx}',1)"><i id="wish_${house.room_idx}" class="far fa-heart"></i>Add to wishlist</button>
										
												</c:otherwise>
											</c:choose>
											<c:if test="${authentication }">
											<input type="button" id="" style="width:80px; margin-bottom:5px; font-weight:700; padding:10px 20px;" value="Modify"  class="btn hvr-hover" onClick="clickModify()">
											<input type="button" id="" style="width:80px; margin-bottom:5px; font-weight:700; padding:10px 20px;" value="Delete"  class="btn hvr-hover" onClick="clickDelete()">
											</c:if>
										</div>
										
									</div>
										 
									</c:if>
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
			   				<h3>Utilities</h3>
			   			</div>
			   			<input type="hidden" name="opacity" value="${house.closet}">
			   			<input type="hidden" name="opacity" value="${house.desk}">
			   			<input type="hidden" name="opacity" value="${house.chair}">
			   			<input type="hidden" name="opacity" value="${house.bad_type}">
			   			<input type="hidden" name="opacity" value="${house.air_conditioner}">
			   			<input type="hidden" name="opacity" value="${house.heating}">
			   			<input type="hidden" name="opacity" value="${house.bathroom}">
			   			<input type="hidden" name="opacity" value="${house.sink}">
			   			<input type="hidden" name="opacity" value="${house.kitchen_stove}">
			   			<input type="hidden" name="opacity" value="${house.refrigerator}">
			   			<input type="hidden" name="opacity" value="${house.laundry}">
			   			<input type="hidden" name="opacity" value="${house.pet}">
			   			<input type="hidden" name="opacity" value="${house.internet}">
			   			<input type="hidden" name="opacity" value="${house.wifi}">
			   			<input type="hidden" name="opacity" value="${house.elevator}">
			   			<input type="hidden" name="opacity" value="${house.parking}">
			   			
			   			<table id="utilTable">
							
						</table>
	            	</div>
            	</div>
            </div>
            <div class="cart-box-main">
            	<div class="container">
	            	<div class="col-md-12">
						<div class="title-left">
			   				<h3>Location</h3>
			   			</div>
						<hr>
						<p style="text-align: left;">
						  <c:if test="${not empty house.address_detail}">
							${house.address_detail},
						  </c:if>
							${house.address}
						</p>
						<hr>
					
						<div id="mapDisp"></div>
				
						
	            	</div>
            	</div>
            </div>
        </div>
    </div>
    <!-- End Cart -->
    
    
 	<input type="hidden" id="mem_id" value="${mem_id}">
	
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
    <script>
							//페이징로딩후 자동시작 //
							$(window).on('load',function() {
								
								$("#mapDisp").load("resources/html/googleMap.jsp?location="+ '${house.address}'.replace(/ /gi,"%20"));
					
							});
							//여기까지 페이징로딩후 자동시작//
						</script>
</body>
</html>
