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
<style>
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
                    <h2>Information</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
	
	<div class="cart-box-main">
		<div class="container">
			<div class="col-md-12 col-sm-12 col-xs-12 center">
				<div id="informDetail" class="mb-5">
					
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
				<div style="text-align:center">
					<c:if test="${user.mem_id!=null && user.mem_cate eq 'p'}">
					<div style="height:100px;">
						<c:if test="${user.mem_id eq inform.info_mem_id }">
							<button id="" style="width:80px; margin-bottom:5px; font-weight:700; padding:10px 20px;" class="btn hvr-hover" value="Modify" onClick="clickInformModify()">Modify</button>
							<button id="" style="width:80px; margin-bottom:5px; font-weight:700; padding:10px 20px;" class="btn hvr-hover" value="Delete" onClick="clickInformDelete()">Delete</button>
								
						</c:if>
						<c:choose>
							<c:when test="${isWish}">
								<button id="wishBtn" class="btn hvr-hover" style="margin-bottom:5px; background-color:firebrick; font-weight:700; padding:10px 20px;" onclick="javascript:clickWishGrid('${user.mem_id }','${inform.info_idx}',1)"><i id="wish_${inform.info_idx}" class="fas fa-heart"></i>Add to wishlist</button>
							</c:when>
							<c:otherwise>
								<button id="wishBtn" class="btn hvr-hover" style="margin-bottom:5px; background-color:#0B3B39; font-weight:700; padding:10px 20px;" onclick="javascript:clickWishGrid('${user.mem_id }','${inform.info_idx}',1)"><i id="wish_${inform.info_idx}" class="far fa-heart"></i>Add to wishlist</button>
							</c:otherwise>
						</c:choose>
						<br> <br>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>