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
<link href="resources/css/resale/resaleList.css" rel="stylesheet" type="text/css"></link>
<script>
	function search_go(frm) {
		frm.action = "resaleSearch.do";
		frm.submit();
}
</script>
<link href="resources/css/resale/resaleSearch.css" rel="stylesheet" type="text/css"></link>
	<h3 style="text-align: center">Resale Shop</h3>
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
	<div id="img_content">
		<div id="listBox">
		    <c:choose>
				<c:when test="${not empty mem_id}">
					<div id="write">
						<input type="button" id="writeBtn" value="글쓰기" onclick="javascript:location.href='resale_go.do'">
					</div>
				</c:when>
				<c:otherwise>
					<p></p>
				</c:otherwise>
			</c:choose>
			<c:if test="${not empty list }">
			<c:forEach var="vo" items="${list}">
<%--			  <a href="ResaleController?type=detail&"> --%>
			  <a href="resaleDetail.do?rs_idx=${vo.rs_idx}&cPage=${pvo.getNowPage()}">
				<div id="onePostBox">
					<div id="imgBox">
						<c:choose>
					    <c:when test="${vo.file_ori_name == null}">
					    	<img id="imgFileList" src="${pageContext.request.contextPath}/resources/img/resale/default-placeholder.jpg">
					    </c:when>
					    <c:otherwise>
							<img id="imgFileList" src="${pageContext.request.contextPath}/resources/img/resale/${vo.getFile_ori_name()}">
					    	<%-- <img id="imgFileList" src="images/resale/${imgList.get(voCnt.index).rs_file_name}">--%>
					    </c:otherwise>
					    </c:choose>
					</div>
					<br>
					<div id="infoBox">
						<div id="listSubject">${vo.subject}</div>
						<div id="infoChildBox">
						<table id="infoTable">
							<tr>
								<td id="priceBox"><span id="listPrice">${vo.price }</span>&nbsp;<span id="won">원</span></td>
								<td id="listDate">${vo.regdate }</td>
							</tr>
						</table>
						</div>
					</div>
			  		  
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
		      </a>
			</c:forEach>
		   </c:if>
		</div>
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
	</div>
