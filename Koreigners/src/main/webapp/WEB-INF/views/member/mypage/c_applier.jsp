<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    <link href="resources/css/member/mypageCompany.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
	<script type="text/javascript" src="resources/js/member/c_mypage/c_applier.js"></script>
	<script type="text/javascript" src="resources/js/member/c_mypage/c_MyPage.js"></script>
	<script>
	
		
	
	</script>
</head>


<body>
<input type="hidden" id="mem_id" value="${mem_id}">
<div id="moveBox">
	<ul>
		<li class="tabs">
			<img class="icon" src="resources/img/common/setting.png">&nbsp;
			<a href="myPage_go.do?type=profile">My Profile</a>
		</li>
		<li class="tabs">
			<img class="icon2" src="resources/img/common/people.png">&nbsp;
			<a href="myPage_go.do?type=hire">My Recruitment</a>
		</li>
		<li class="tabs" style="background:#E2E2E2;">
			<img class="icon" src="resources/img/common/document.png">&nbsp;
			<a href="myPage_go.do?type=applier">My Applicants</a>
		</li>
		
	</ul>
</div>
지원자리스트 페이지!!!
<table id="listTable"  border>
		<thead id="tHead">			
			
		</thead>
		<tbody id="list_box">
			
		</tbody>
		<tfoot id="tfoot">
			
		</tfoot>
	</table>
</body>
</html>