<%@page import="com.koreigner.biz.resale.ResaleVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="resources/css/resale/resaleSearch.css" rel="stylesheet" type="text/css"></link>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="bootstrap/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="bootstrap/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="bootstrap/css/custom.css">

<link href="resources/css/common/page.css" rel="stylesheet" type="text/css">

<script>
	function search_go(frm) {
		frm.action = "resaleSearch.do";
		frm.submit();
}
</script>
<body>
	
	<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Resale Shop</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

	<!-- Start Search -->
	<div class="selectbox_div">
		<form method="post" id="searchForm">
			<select id="ex_select" name="idx" class="selectbox">
				<option value="0">제목</option>
				<option value="1">내용</option>
				<option value="2">제목+내용</option>
			</select>
			<input type="text" id="searchBar" name="keyword">
			<input class=select_search type="image" src="${pageContext.request.contextPath}/resources/img/resale/search.png" 
					width="40px" height="40px" onclick="search_go(this.form)">
		</form>
	</div>
	<!-- End Search -->
	
	<div id="listBox">
	<c:choose>
				<c:when test="${not empty mem_id}">
					<div id="write">
						<input type="button" id="writeBtn" value="글쓰기" onclick="javascript:location.href='resale_go.do'">
					</div>
				</c:when>
	</c:choose>
	</div>
	
	<!-- Start Gallery  -->
    <div class="products-box">
        <div class="container">
            <div class="row">
			
				<c:if test="${not empty list }">
				<c:forEach var="vo" items="${list}">
				
	                <div class="col-lg-3 col-md-6">
	                    <div class="products-single fix">
	                        <!-- 이미지 -->
	                        <div class="box-img-hover">
	                           <c:choose>
							   <c:when test="${vo.file_ori_name == null}">
							   <img src="${pageContext.request.contextPath}/resources/img/resale/default-placeholder.jpg" class="img-fluid">
		                            <div class="mask-icon">
		                                <ul>
		                                    <li><a href="resaleDetail.do?rs_idx=${vo.rs_idx}&cPage=${pvo.getNowPage()}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
		                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
		                                </ul>
		                            </div>
							    </c:when>
							    <c:otherwise>
									<img src="${pageContext.request.contextPath}/resources/img/resale/${vo.getFile_ori_name()}" class="img-fluid">
							    	<div class="mask-icon">
		                                <ul>
		                                    <li><a href="resaleDetail.do?rs_idx=${vo.rs_idx}&cPage=${pvo.getNowPage()}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
		                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
		                                </ul>
		                            </div>
							    </c:otherwise>
							    </c:choose>
		                        <!-- 설명 -->
		                        <div>${vo.subject}</div>
	                        	<div>${vo.price }원</div><span>${vo.regdate }</span>
	                        	<div id="addrBox">&nbsp;<img src ="img/pin.png" width="15px" height="15px">
								<c:choose>
									<c:when test="${not empty address}">
										<c:set var="addr" value="${fn:split(vo.address,' ')}" />
										  <c:forEach var="addrs" items="${addr}" varStatus="g">
									   	   <c:if test="${g.count == 1}">${addrs}</c:if>
									       <c:if test="${g.count == 2}">&nbsp;${addrs}</c:if>
										 </c:forEach> 
									</c:when>
									<c:otherwise>
									  주소 없음
									</c:otherwise>
								 </c:choose>
								</div>
	                        </div>
	                    </div>
	                </div>
	                
				</c:forEach>
				</c:if>
            
            </div>
        </div>
    </div>
    <!-- End Gallery  -->
	
	
    <div id="pagingBox">
		<div id="olPaging">
			<ol class="paging">
				<%--이전으로에 대한 사용여부 처리--%>
				<c:choose>
					<%--사용불가(disable) : 첫번째 블록인 경우--%>
					<c:when test="${pvo.beginPage == 1}">
						<li id="pointer" class="disable">&lt;</li>
					</c:when>
					<c:otherwise>
						<li id="pointer">
						<!-- 이전으로 클릭 할 시 현재 블록의 시작 페이지에서 1을 뺀 값 -->
						<a href="resaleList.do&cPage=${pvo.beginPage - 1}" id="pointer">&lt;</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:forEach var="k" begin="${pvo.beginPage}" end="${pvo.endPage}">
					<c:choose>
						<c:when test="${k == pvo.nowPage}">
							<li class="now">${k }</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="resaleList.do&cPage=${k}">${k}</a>
							</li>	
						</c:otherwise>
					
					</c:choose>
				</c:forEach>
					
				<%--다음으로에 대한 사용여부 처리--%>
				<c:choose>
					<%--사용불가(disable) : 첫번째 블록인 경우--%>
					<c:when test="${pvo.endPage >= pvo.totalPage}">
						<li id="pointer" class="disable">&gt;</li>
					</c:when>
					<c:otherwise>
						<li id="pointer">
												<!-- 다음으로 클릭 할 시 현재 블록의 시작 페이지에서 1을 더한 값 -->
						<a href="resaleList.do&cPage=${pvo.endPage + 1}" id="pointer">&gt;</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ol>
		</div>
	</div>
    
    <!-- ALL JS FILES -->
    <script src="bootstrap/js/jquery-3.2.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="bootstrap/js/jquery.superslides.min.js"></script>
    <script src="bootstrap/js/bootstrap-select.js"></script>
    <script src="bootstrap/js/inewsticker.js"></script>
    <script src="bootstrap/js/bootsnav.js."></script>
    <script src="bootstrap/js/images-loded.min.js"></script>
    <script src="bootstrap/js/isotope.min.js"></script>
    <script src="bootstrap/js/owl.carousel.min.js"></script>
    <script src="bootstrap/js/baguetteBox.min.js"></script>
    <script src="bootstrap/js/form-validator.min.js"></script>
    <script src="bootstrap/js/contact-form-script.js"></script>
    <script src="bootstrap/js/custom.js"></script>
</body>