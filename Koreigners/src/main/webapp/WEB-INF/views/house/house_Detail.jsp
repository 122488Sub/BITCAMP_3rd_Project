<%@page import="com.koreigner.biz.house.HouseAll_VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	if( (boolean)request.getAttribute("authentication")){
		System.out.println("qq");
	}else{
		System.out.println("aa");
	}


%>
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
<link rel="stylesheet" href="resources/css/house/houseDetail_slide.css">
<link rel="stylesheet" href="resources/css/house/houseDetail.css">

</head>

<body>
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

			<div id="baseBox">
				<div>
					<label class="subject"> ${house.subject} </label>
				</div>
				<br>
				<div>
					<p class="address">
					  <c:if test="${not empty house.address_detail}">
						${house.address_detail},
					  </c:if>
						${house.address}
					</p>
				</div>
				<br>
				<br>
				<div>
					<label class="priceData" style="margin-right: 30px;">Deposit
					</label> <label class="priceData">$${deposit} </label>
				</div>
				<br>
				<div>
					<label class="priceData" style="margin-right: 30px;">Monthly
					</label> <label class="priceData">$${monthly}</label>
				</div>
				<br>
				<br>
				<div>
					<c:if test="${user.mem_id!=null }">
						<input type="button" id="" value="♡pick" onclick="clickWishList('${user.mem_id }','${house.room_idx}',1)">
					</c:if>
					<c:if test="${authentication }">
						<input type="button" id="" value="Modify" onClick="clickModify()">
						<input type="button" id="" value="Delete" onClick="clickDelete()">
					</c:if>
				
				
				</div>
			</div>
		</div>

	</div>
	<div id="detailInfo">
		<div class="font-1_3em">Info</div>
		<hr>
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

	</div>
	
	<div id="detailUtil">
		<div class="font-1_3em">Utilities</div>
		<hr>
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
	
	
	<div id="detailMap">
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
	</div>

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
</body>
</html>
