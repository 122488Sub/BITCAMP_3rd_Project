<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#mapDisp{
		
		width: 500px;
		height: 250px;
		margin: 0 auto;
		margin-bottom: 5px;
	}

</style>
</head>

<body>
<table id="infoTable">
				<tr>
					<td rowspan="6" id="imgBox">
					    <div class="slider">
					     <ul class="panel">
					     <c:choose>
						     <c:when test="${empty imgList }">
						     	<li><img id="imgFile" src="./images/default-placeholder.jpg"></li>
						     </c:when>
						     <c:otherwise>
							     <c:forEach items="${imgList}" var="img" >
							        <li><img id="imgFile" src="./images/resale/${img.rs_file_name}"></li>
							     </c:forEach>
						     </c:otherwise>
					     </c:choose>
					      </ul>					      
					      <ul class="btn">
					        <li class="on"></li>
					         <c:choose>
						     <c:when test="${empty imgList }">
						     	<li></li>
						     </c:when>
						     <c:otherwise>
							     <c:forEach begin="1" end="${imgList.size()-1}" step="1" var="img">
							        <li></li>
							     </c:forEach>
						     </c:otherwise>
					     </c:choose>
					      </ul>
					      <button class="prev"><img src="./images/back.png" style="width:50px"></button>
					      <button class="next"><img src="./images/next.png" style="width:50px"></button>
					    </div>
					</td>
					<td id="subject" class="userInfo">&nbsp;&nbsp;&nbsp;&nbsp;${rsVO.subject}</td>
				</tr>
				<tr>
					<td id="price" class="userInfo">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 50px">${rsVO.price}</span>원</td>
				</tr>
				<tr>
					<td id="name" class="userInfo">&nbsp;&nbsp;&nbsp;&nbsp;<spand>&middot;&nbsp;판매자</spand>&nbsp;&nbsp;&nbsp;&nbsp;${rsVO.name}</td>
				</tr>
				<tr>
					<td id="address" class="userInfo">&nbsp;&nbsp;&nbsp;&nbsp;<spand>&middot;&nbsp;지역</spand>&nbsp;&nbsp;&nbsp;&nbsp;<img src ="../../images/pin.png" width="15px" height="15px">&nbsp;${rsVO.address}</td>
				</tr>
				<tr>
					<td id="reg_date" class="userInfo">&nbsp;&nbsp;&nbsp;&nbsp;<spand>&middot;&nbsp;날짜</spand>&nbsp;&nbsp;&nbsp;&nbsp;${rsVO.reg_date}</td>
				</tr>
				<tr>
					<td id="hit" class="userInfo">&nbsp;&nbsp;&nbsp;&nbsp;<span>&middot;&nbsp;조회</span>&nbsp;&nbsp;&nbsp;&nbsp;${rsVO.hit}</td>
				</tr>
			</table>

<div id="mapDisp">
</div>


<script>
	//페이징로딩후 자동시작 //
	$(window).on('load',function(){

		$("#mapDisp").load("/koreigner/resources/html/googleMap.jsp?location="
	   		+'${house.address}'.replace(/ /gi,"%20"));
		
	});
	//여기까지 페이징로딩후 자동시작//
</script>
</body>
</html>
