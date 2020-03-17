<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="resources/css/resale/resaleDetail.css" rel="stylesheet" type="text/css"></link>
<link href="resources/css/resale/slide.css" rel="stylesheet" type="text/css"></link>
<script type="text/javascript" src="resources/js/resale/slide.js" ></script>
<script type="text/javascript">
	//function reComm(group, step, lev) {
		
	//}
</script>
<body>
	<div id="detailBox">
		<div id="cate">
		<p style="font-weight: bold">카테고리 &nbsp;: &nbsp;${rsVO.rs_cate_prnt}&nbsp;&gt;&nbsp;${rsVO.category_child}</p>
		<div id="detailBtn">
				<c:if test="${not empty mem_id}">
<!-- 				<input type="button" id="editBtn" value="수정" onclick="javascript:location.href='edit.do&rs_seq=${rsVO.rs_idx}&postId=${rsVO.id}'">
					<input type="button" id="deleteBtn" value="삭제" onclick="javascript:location.href='edit.do&rs_seq=${rsVO.rs_idx}&postId=${rsVO.id}'"> -->
					<input type="button" id="editBtn" value="수정" onclick="#">
					<input type="button" id="deleteBtn" value="삭제" onclick="#">
				</c:if>
		</div>
		<br>
		<hr>
		<br>
		</div>
			<table id="infoTable">
				<tr>
					<td rowspan="6" id="imgBox">
					    <div class="slider">
					     <ul class="panel">
					     <c:choose>
						     <c:when test="${empty imgList }">
						     	<li><img id="imgFile" src="${pageContext.request.contextPath}/resources/img/resale/default-placeholder.jpg"></li>
						     </c:when>
						     <c:otherwise>
							     <c:forEach items="${imgList}" var="img" >
							        <li><img id="imgFile" src="${pageContext.request.contextPath}/WEB-INF/views/job/upload/${img.rs_file_name}"></li>
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
					      <button class="prev"><img src="${pageContext.request.contextPath}/resources/img/resale/back.png" style="width:50px"></button>
					      <button class="next"><img src="${pageContext.request.contextPath}/resources/img/resale/next.png" style="width:50px"></button>
					    </div>
					</td>
					<td id="subject" class="userInfo">&nbsp;&nbsp;&nbsp;&nbsp;${rsVO.subject}</td>
				</tr>
				<tr>
					<td id="price" class="userInfo">&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 50px">${rsVO.price}</span>원</td>
				</tr>
				<tr>
					<td id="name" class="userInfo">&nbsp;&nbsp;&nbsp;&nbsp;<spand>&middot;&nbsp;판매자</spand>&nbsp;&nbsp;&nbsp;&nbsp;${rsVO.mem_name}</td>
				</tr>
				<tr>
					<td id="address" class="userInfo">&nbsp;&nbsp;&nbsp;&nbsp;<spand>&middot;&nbsp;지역</spand>&nbsp;&nbsp;&nbsp;&nbsp;<img src ="${pageContext.request.contextPath}/resources/img/resale/images/pin.png" width="15px" height="15px">&nbsp;${rsVO.address}</td>
				</tr>
				<tr>
					<td id="reg_date" class="userInfo">&nbsp;&nbsp;&nbsp;&nbsp;<spand>&middot;&nbsp;날짜</spand>&nbsp;&nbsp;&nbsp;&nbsp;${rsVO.regdate}</td>
				</tr>
				<tr>
					<td id="hit" class="userInfo">&nbsp;&nbsp;&nbsp;&nbsp;<span>&middot;&nbsp;조회</span>&nbsp;&nbsp;&nbsp;&nbsp;${rsVO.hit}</td>
				</tr>
			</table>
		<br><br><br>
		<div id="contentBox">
			<div>
			<div id="contentText">
			<div>
			<label style="font-weight: bold; font-size: 25px">상품정보</label>
			</div>
			<br><hr><br>
			<p>${rsVO.content}</p>
			</div><!-- contentText End -->
			</div>
			<%--
			<div id="commentBox">
			<div>
			<label style="font-weight: bold; font-size: 25px">댓글</label>
			</div>
			<br><hr><br>
			<!-- <form action="putComm.do&rs_idx=${rsVO.rs_idx}&cPage=${cPage}" method="post">-->
			<form action="#" method="post">
				<input type="text" name="inComm" id="commText">
				<input type="submit" value="댓글입력" style="float: right">
			</form>
			<br>
			<br>
			
			<div id="commentList"></div>
			<table id="commTable">
			<c:if test="${not empty c_list }">
				<c:forEach items="${c_list}" var="comm">
					<tr>
						<td class="commUp" style="padding-bottom: 10px">${comm.name}</td>
						<td class="commUp" style="text-align: right;">${comm.write_date}</td>
					</tr>
					<tr>
						<td colspan="2" style="padding-top: 10px">
							<c:forEach var="k2" begin="1" end="${comm.step}" step="1">
											&nbsp;&nbsp;
							</c:forEach>
						<!--<a href="reComm.do&groups=${comm.groups}&step=${comm.step}&lev=${comm.lev}">ㄴ${comm.content}</a> -->
						<a href="#">ㄴ${comm.content}</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			</table class="commDown">
			
			</div>
		</div><!-- contentBox End -->
		 --%>
	</div><!-- detailBox End -->
</body>

</html>