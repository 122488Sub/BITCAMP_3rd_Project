<%@page import="com.koreigner.biz.house.HouseAll_VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<!-- <link rel="stylesheet" href="resources/css/house/houseDetail_slide.css">
<link rel="stylesheet" href="resources/css/house/houseDetail.css"> -->

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
            <div class="row">
                <div class="col-xl-5 col-lg-5 col-md-6">
		        <c:choose>
				     <c:when test="${rsVO.file_ori_name == 'businessImg_' }">
				     		<li><img id="imgFile" src=""></li>
				     		<div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
		                        <div class="carousel-inner" role="listbox">
		                            <div class="carousel-item active"> <img class="d-block w-100" style="height: 500px;" src="${pageContext.request.contextPath}/resources/img/resale/default-placeholder.jpg" alt="First slide"> </div>
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
		                                <img class="d-block w-100 img-fluid" style="height: 150px;" src="${pageContext.request.contextPath}/resources/img/resale/default-placeholder.jpg" alt="" />
		                            </li>
		                        </ol>
		                    </div>
				     </c:when>
				     <c:otherwise>
				     		<div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
		                        <div class="carousel-inner" role="listbox">
		                    	<c:forEach items="${imgList}" varStatus="status" var="img" >
		                    		<c:if test="${status.index ==0}">
		                    			<div class="carousel-item active"> <img class="d-block w-100" style="height: 500px;" src="${pageContext.request.contextPath}/resources/img/resale/${rsVO.mem_id}/${img.rs_file_name}" alt="slide${status.index+1}"> </div>
					        		</c:if>
					        		<c:if test="${status.index !=0}">
					        			<div class="carousel-item"> <img class="d-block w-100" style="height: 500px;" src="${pageContext.request.contextPath}/resources/img/resale/${rsVO.mem_id}/${img.rs_file_name}" alt="slide${status.index+1}"> </div>
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
		                        <c:forEach items="${imgList}" varStatus="status" var="img" >
		                        <c:if test="${status.index ==0}">
		                            <li data-target="#carousel-example-1" data-slide-to="${status.index}" class="active">
		                                <img class="d-block w-100 img-fluid" style="height: 150px;" src="${pageContext.request.contextPath}/resources/img/resale/${rsVO.mem_id}/${img.rs_file_name}" alt="" />
		                            </li>
		                        </c:if>
		                        <c:if test="${status.index !=0}">
		                            <li data-target="#carousel-example-1" data-slide-to="${status.index}">
		                                <img class="d-block w-100 img-fluid" style="height: 150px;" src="${pageContext.request.contextPath}/resources/img/resale/${rsVO.mem_id}/${img.rs_file_name}" alt="" />
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
								<div class="row">
									<div class="col-md-4" style="margin-left: 0">
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
			   				<h3>Utilities</h3>
			   			</div>
			   			<table id="utilTable">
							<colgroup>
								<col width="10%" span="8">
							</colgroup>
							<tr>
								<td>
									<div style="opacity: ${house.closet eq 1 ? 1.0 :0.3}" >
										<div><img id="icon_closet" src="resources/img/house/icon/closet.png"></div>
										<div>Closet</div>
									</div>
								</td>
								<td>
									<div style="opacity: ${house.desk eq 1 ? 1.0 :0.3}" >
										<div><img id="icon_desk" src="resources/img/house/icon/desk.png"></div>
										<div>Desk</div>
									</div>
								</td>
								<td> 
									<div style="opacity: ${house.chair eq 1 ? 1.0 :0.3}" >
										<div><img id="icon_chair"src="resources/img/house/icon/chair.png"></div>
										<div>Chair</div>
									</div>
								</td>
								<td> 
									<div style="opacity: ${house.bad_type eq 1 ? 1.0 :0.3}" >
										<div><img id="icon_bed"src="resources/img/house/icon/bed.png"></div>
										<div>Bed</div>
									</div>
								</td>
								<td> 
									<div style="opacity: ${house.air_conditioner eq 1 ? 1.0 :0.3}" >
										<div><img id="icon_aircondition" src="resources/img/house/icon/aircondition.png"></div>
										<div>Air conditioner</div>
									</div>
								</td>
								<td> 
									<div style="opacity: ${house.heating eq 1 ? 1.0 :0.3}" >
										<div><img id="icon_heating" src="resources/img/house/icon/heating.png"></div>
										<div>Heating</div>
									</div>
								</td>
								<td> 
									<div style="opacity: ${house.bathroom eq 1 ? 1.0 :0.3}" >
										<div><img id="icon_bathroom" src="resources/img/house/icon/bathroom.png"></div>
										<div>Bathroom</div>
									</div>
								</td>
								<td> 
									<div style="opacity: ${house.sink eq 1 ? 1.0 :0.3}" >
										<div><img id="icon_sink" src="resources/img/house/icon/sink.png"></div>
										<div>Sink</div>
									</div>
								</td>
							</tr>
				
							<tr>
								<td>
									<div style="opacity: ${house.kitchen_stove eq 1 ? 1.0 :0.3}">
										<div><img id="icon_stove" src="resources/img/house/icon/stove.png"  ></div>
										<div>Kitchen Stove</div>
									</div>
								</td>
								<td>
									<div style="opacity: ${house.refrigerator eq 1 ? 1.0 :0.3}">
										<div><img id="icon_refrigerator" src="resources/img/house/icon/refrigerator.png"  ></div>
										<div style="opacity: ">Refrigerator</div>
									</div>
								</td>
								<td> 
									<div style="opacity: ${house.laundry eq 1 ? 1.0 :0.3}">
										<div><img id="icon_laundry" src="resources/img/house/icon/laundry.png"  ></div>
										<div>Laundry</div>
									</div>
								</td>
								<td> 
									<div style="opacity: ${house.pet eq 1 ? 1.0 :0.3}">
										<div><img id="icon_pet" src="resources/img/house/icon/pet.png"  ></div>
										<div>Pet</div>
									</div>
								</td>
								<td> 
									<div style="opacity: ${house.internet eq 1 ? 1.0 :0.3}">
										<div><img id="icon_internet" src="resources/img/house/icon/internet.png"  ></div>
										<div>Internet</div>
									</div>
								</td>
								<td> 
									<div style="opacity: ${house.wifi eq 1 ? 1.0 :0.3}">
										<div><img id="icon_wifi" src="resources/img/house/icon/wifi.png"  ></div>
										<div>Wifi</div>
									</div>
								</td>
								<td> 
									<div style="opacity: ${house.elevator eq 1 ? 1.0 :0.3}">
										<div><img id="icon_elevator" src="resources/img/house/icon/elevator.png" ></div>
										<div>Elevator</div>
									</div>
								</td>
								<td> 
									<div style="opacity: ${house.parking eq 1 ? 1.0 :0.3}" >
										<div><img id="icon_parking" src="resources/img/house/icon/parking.png" ></div>
										<div>Parking</div>
									</div>
								</td>
							</tr>
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
			   			<div class="font-1_3em">Location</div>
						<hr>
						<p style="text-align: left;">
						  <c:if test="${not empty house.address_detail}">
							${house.address_detail},
						  </c:if>
							${house.address}
						</p>
						<hr>
						<div id="mapDisp"></div>
				
						<script>
							//페이징로딩후 자동시작 //
							$(window)
									.on(
											'load',
											function() {
					
												$("#mapDisp").load(
														"resources/html/googleMap.jsp?location="
																+ '${house.address}'.replace(/ /gi,
																		"%20"));
					
											});
							//여기까지 페이징로딩후 자동시작//
						</script>
	            	</div>
            	</div>
            </div>
        </div>
    </div>
    <!-- End Cart -->
    
    
 	<input type="hidden" id="mem_id" value="${mem_id}">
	<div id="detailContent">
		<div id="detailHeader">
			<div id="imgBox">
				<div class="slider">
					<ul class="panel">
						<c:choose>
							<c:when test="${empty house.img_nameList }">
								<li><img id="imgFile"
									src="resources/img/common/default-placeholder.jpg"></li>
							</c:when>
							<c:otherwise>
								<c:forEach items="${house.img_nameList}" var="img">
									<li><img id="" src="resources/img/house/upload/${house.mem_email}/${img}"
										width="350px" height="350px"></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
					<ul class="btn">
						<li class="on"></li>
						<c:choose>
							<c:when test="${empty house.img_nameList }">
								<li></li>
							</c:when>
							<c:otherwise>
								<c:forEach begin="1" end="${house.img_nameList.size()-1}"
									step="1" var="img">
									<li></li>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
					<button class="prev">
						<img src="resources/img/common/back.png" style="width: 50px">
					</button>
					<button class="next">
						<img src="resources/img/common/next.png" style="width: 50px">
					</button>
				</div>
			</div>

			
		</div>

	</div>
</body>
</html>
