<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>summer note</title>

<link href="resources/css/common/button.css" rel="stylesheet" type="text/css">
<link href="resources/css/inform/infoDetail.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/common/post_go.js"></script>
<script type="text/javascript" src="resources/js/common/togleWish.js" ></script>
<script type="text/javascript" src="resources/js/inform/infoDetail.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>

	<div id="informDetail">
		<c:if test="${user.mem_id!=null && user.mem_cate eq 'p'}">
		<div style="height:100px;">
			<c:if test="${user.mem_id eq inform.info_mem_id }">
				<input type="button" id="" class="rightButton btn59acff" value="Delete" onClick="clickInformDelete()">
				<input type="button" id="" class="rightButton btn59acff" value="Modify" onClick="clickInformModify()">
					
			</c:if>
			<c:choose>
				<c:when test="${isWish}">
					<input type="button" id="wishBtn" class="rightButton btn59acff" value="♥pick"  onclick="clickWishBtn('${user.mem_id }','${inform.info_idx}',4)">
				</c:when>
				<c:otherwise>
					<input type="button" id="wishBtn" class="rightButton btn59acff" value="♡pick"  onclick="clickWishBtn('${user.mem_id }','${inform.info_idx}',4)">
				</c:otherwise>
			</c:choose>
			
			<br> <br>
		</div>
		</c:if>
		<div id="informHeader">
			<div id="titleDiv" class="headerDiv">
				<span id="category" class="titleSpan" onclick="">${inform.info_category }</span>
				<span id="" class="titleSpan">&nbsp;|&nbsp;</span>
				<span id="title" class="titleSpan">${inform.info_title }</span>
				<span id="upd_dt" class="subSpan rightSpan">Last Modified: ${inform.info_upd_dt }</span>
				
			</div>
			
			<div id="subDiv" class="headerDiv">
				&nbsp;&nbsp;
				<span id="id" class="subSpan">Writer: ${inform.info_mem_id }</span>
				<span id="" class="subSpan">&nbsp;&nbsp;/&nbsp;&nbsp;</span>
				<span id="hit" class="subSpan">Hit: ${inform.info_hit }</span>
				
				<span id="ins_dt" class="subSpan rightSpan">Created Date : ${inform.info_ins_dt }</span>
			</div>
		</div>
		
		<hr>
		
		<div id="informContent">
			${inform.info_content }
		</div>

	</div>
</body>
</html>