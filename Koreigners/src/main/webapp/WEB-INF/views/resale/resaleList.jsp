<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	body {
		margin: 0 auto;
		text-align: center;
		
	}
	
	#img_content {
		
		display: inline-block;
		width: 1130px;
		height: 1500px;
		margin-right: auto;
		margin-left: 370px;

	}
	#listBox {
		width: 1130px;
		height: 1200px;

	}
	#pagingBox {
	
		margin-left: auto;
		margin-right: auto;
		width: 1130px;
		height: 200px;

		float: left;
	}
	#olPaging {
		margin-left: auto;
		margin-right: auto;
		width: 400px;
		height: 100px;
		text-align:center;
	}
	ol {
		margin-left: auto;
		margin-right: auto;
		
		padding:0;
		width: 240px;
		height: 80px;
	}
	
	#onePostBox {
		width: 230px;
		height: 370px;
		float: left;
		margin-right: 25px;
		margin-left: 25px;
		margin-bottom: 25px;
		color: black;
	}
	
	#imgBox {
		margin: 0;
		padding: 0;
		width: 230px;
		height: 230px;
		
	}
	#infoBox {
		margin: 0;
		padding: 0;
		width: 230px;
		height: 80px;
		
	}
	#infoChildBox {
		margin-top: 20px;
		padding: 0;
		width: 230px;
		height: 40px;
		display: inline;
	}
	#infoTable {
		width: 230px;
		height: 50px;
	}
	#addrBox{
		margin-top: 4px;
		padding: 0;
		width: 230px;
		height: 30px;
		
		text-align: left;
			
	}
	#listSubject{
		width: 230px;
		height: 30px;
		font-size: 15px;
		font-weight: bold;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: left;
		padding:0 5px; 
		overflow:hidden; 
		text-overflow:ellipsis; white-space:nowrap;

	}
	#priceBox {
		text-align: left;
	}
	#listPrice{
		display: inline;
		font-size: 25px;
		font-weight: bold;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: left;
	}
	#listDate{
		font-size: 13px;
		font-weight: bold;
		font-family: 'Noto Sans KR', sans-serif;
		text-align: right;
	}
	#won{
		font-size: 15px;
		font-weight: bold;
		text-align: left;
	}
	#write { 
		padding-right: 10px;
		

	}
	#write > input {
				width: 100px;
			height:50px;
	}
	#imgFileList {
		margin: 0;
		padding: 0;
		width: 230px;
		height: 230px;
	}
	
	
	.paging li {
		list-style: none;
		float: left;
		margin-right: 8px;

	}
	.paging li a {

		text-decoration: none;
		display: inline-block;
		padding: 3px 7px;
		border: 1px solid lightgray;
		font-weight: bold;
		color: black;
		border-radius: 5px;
	}
	.paging .disable {
		border: 1px solid Gray;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid lightgray;
		border-radius: 5px;
		padding: 3px 7px;
		background-color: Gray;
		color: white;
	}
	.paging li a:hover {
		background-color: Gray;
		color: white;
	}
	#pointer {
		border: 0px;
	}
	#writeBtn {
		
		margin-left: 995px;
		margin-bottom: 20px;
	}
	#searchForm {
		margin-left: 750px;
	}
</style>
<script>
	function search_go(frm) {
		frm.action = "ResaleController?type=search";
		frm.submit();
}
</script>
<link href="${pageContext.request.contextPath}/css/resaleSearch.css" rel="stylesheet" type="text/css"></link>
</head>
<body>
	<h3 style="text-align: center">인테리어 중고 장터</h3>
	<div class="selectbox_div">
			<form method="post" id="searchForm">
				<select id="ex_select" name="idx" class="selectbox">
					<option value="0">제목</option>
					<option value="1">내용</option>
					<option value="2">제목+내용</option>
				</select>
				<input type="text" id="searchBar" name="keyword">
				<input class=select_search type="image" src="images/search.png" 
						width="40px" height="40px" onclick="search_go(this.form)">
			</form>
		</div>
	<div id="img_content">
		<div id="listBox">
			<div id="write">
				<input type="button" id="writeBtn" value="글쓰기" onclick="javascript:location.href='resale_go.do">
			</div>
			<c:if test="${not empty list }">
			<c:forEach var="vo" items="${list}">
<!-- 			  <a href="ResaleController?type=detail&rs_seq=${vo.rs_seq}&cPage=${pvo.getNowPage()}"> -->
			  <a href="#">
				<div id="onePostBox">
					<div id="imgBox">
						<c:choose>
					    <c:when test="${vo.file_name == null}">
					    	<img id="imgFileList" src="./images/default-placeholder.jpg">
					    </c:when>
					    <c:otherwise>
							<img id="imgFileList" src="./images/resale/${vo.file_name}">
					    	<!-- <img id="imgFileList" src="images/resale/${imgList.get(voCnt.index).rs_file_name}">-->	
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
						<c:set var="addr" value="${fn:split(vo.address,' ')}" />
						  <c:forEach var="addrs" items="${addr}" varStatus="g">
					
					   	   <c:if test="${g.count == 1}">${addrs}</c:if>
					       <c:if test="${g.count == 2}">&nbsp;${addrs}</c:if>
						 </c:forEach> 
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
						<a href="ResaleController?type=list&cPage=${pvo.beginPage - 1}" id="pointer">&lt;</a>
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
									<a href="ResaleController?type=list&cPage=${k}">${k}</a>
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
						<a href="ResaleController?type=list&cPage=${pvo.endPage + 1}" id="pointer">&gt;</a>
						</li>
					</c:otherwise>
				</c:choose>
				</ol>
			</div>
		</div>
	</div>
</body>
</html>