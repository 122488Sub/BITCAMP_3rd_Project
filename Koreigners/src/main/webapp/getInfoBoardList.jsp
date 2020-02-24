
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: orange; }
	.center { text-align: center; }
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>

<div id="container">
	<h1>글목록</h1>
		
	<!-- 데이터 표시 -->
	<form>
	<table>
		<tr>
			<th width="100">번호</th>
			<th width="100">분류</th>
			<th width="150">글쓴이</th>
			<th width="200">제목</th>
			<th width="150">등록일</th>
			<!--  <th width="100">추천</th> -->
			<th width="100">조회수</th>
		</tr>
		
		<c:forEach var="infoBoard" items="${infoBoardList }">
		<tr>
			<td class="center">${infoBoard.info_idx }</td>
			<td></td>
			<td>${infoBoard.info_ins_user }</td>
			<td>
				<a href="getInfoBoard.do?info_idx=${infoBoard.info_idx }">
					${infoBoard.info_title }
				</a>
			</td>
			
			<td>${infoBoard.info_ins_dt }</td>
			<td class="center">${infoBoard.info_hit }</td>
		</tr>
		</c:forEach>
	</table>
	</form>
	<!-- 검색을 위한 폼 -->
	<form action="getInfoBoardList.do" method="post">
	<table class="border-none">
		<tr>
			<td>
				<!--  
				<select name="searchCondition">
					<option value="INFO_TITLE">제목
					<option value="INFO_CONTENT">내용
				</select>
				-->
				<select name="searchCondition">
				<c:forEach var="option" items="${conditionMap }">
					<option value="${option.value }">${option.key }</option>
				</c:forEach>
				</select>
				
				<input type="text" name="searchKeyword">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	</form>
	<p><a href="insertInfoBoard.jsp">글쓰기</a></p>
</div>

</body>
</html>













