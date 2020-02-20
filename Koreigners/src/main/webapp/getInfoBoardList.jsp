
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%--(실습) 자바코드를 없애고, 데이터출력은 EL, JSTL 사용 형태로 변경 --%>     
    

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
		
		<c:forEach var="board" items="${boardList }">
		<tr>
			<td class="center">${board.seq }</td>
			<td></td>
			<td>
				<a href="getInfoBoard.do?seq=${board.seq }">
					${board.title }
				</a>
			</td>
			<td>${board.writer }</td>
			<td>${board.regdate }</td>
			<td class="center">${board.cnt }</td>
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
					<option value="TITLE">제목
					<option value="CONTENT">내용
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













