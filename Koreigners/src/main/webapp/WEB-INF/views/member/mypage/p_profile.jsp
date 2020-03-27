<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW24W9sP9njddFNugiBUaJ-AzVfpQb_MY&language=en&libraries=places&callback=initMap" async defer></script>
<script type="text/javascript" src="resources/js/member/p_profile.js"></script>
<link href="resources/css/member/mypageCompany.css" rel="stylesheet" type="text/css">
</head>
<body>


<div id="moveBox">
	<ul>
		<li class="tabs" style="background:#E2E2E2;">
			<img class="icon" src="resources/img/common/setting.png">&nbsp;
			<a href="myPage_go.do?type=profile">Profile Setting</a>
		</li>
		<li class="tabs">
			<img class="icon" src="resources/img/common/document.png">&nbsp;
			<a href="myPage_go.do?type=resume">Resume</a>
		</li>
		<li class="tabs">
			<img class="icon" src="resources/img/common/wishlist.png">&nbsp;
			<a href="myPage_go.do?type=wishlist">Wishlist</a>
		</li>
		<li class="tabs">
			<img class="icon" src="resources/img/common/advertisment.png">&nbsp;
			<a href="myPage_go.do?type=ads">My Ads</a>
		</li>
	</ul>
</div>
	<form action="updateMember.do" method="post">
		<table id="regCom">
		<tr>
			<td class="title"><label for="id">ID(Email)</label></td>
			<td class="contents">
				<input class="input_box" name="mem_id" value="${mvo.mem_id }" contenteditable="false" disabled="disabled">
				<input type="hidden" id="mem_id" class="input_box" name="mem_id" value="${mvo.mem_id }">
			</td>
		</tr>
		<tr>
			<td class="title"><label for="nickName">Nickname</label></td>
			<td class="contents"><input type="text" class="input_box" name="mem_name" placeholder="${mvo.mem_name }" >
			<span id="getMemberNick"></span></td>
		</tr>
		<tr>
			<td class="title">
				<label for="password">Current Password</label>
			</td>
			<td class="contents">
				<input type="password" class="input_box" id="curPw">
				<span id="getMemberPw"></span>
			</td>
		</tr>
		<tr>
			<td class="title">
				<label for="password">New Password</label>
			</td>
			<td class="contents">
				<input type="password" id="newPw" class="input_box" name="mem_pw">
			</td>
		</tr>
		<tr>
			<td class="title">
				<label for="password">Re-enter New Password</label>
			</td>
			<td class="contents">
				<input type="password" id="rePw" class="input_box">
				<span id="checkPw"></span>
				</td>
		</tr>
		<tr>
			<td class="title">
				<label for="phone">Phone number</label>
			
			</td>
			<td class="contents">
				<input type="text" class="input_box" name="mem_phone" placeholder="${mvo.mem_phone }">
				</td>
		</tr>
		<tr>
			<td class="title">
				<label for="birth">Birthday</label>
			</td>
			<td class="contents">
				<script> 
					var today = new Date(); 
					var toyear = parseInt(today.getFullYear()); 
					var start = toyear - 5 
					var end = toyear - 70; 
	
					document.write("<select class='input_box' name=birth1 id='birth1'>"); 
					document.write("<option value='' selected>year"); 
					for (i=start;i>=end;i--) document.write("<option>"+i); 
					document.write("</select>"); 
					
					document.write("<select class='input_box' name=birth2 id='birth2'>"); 
					document.write("<option value='' selected>month"); 
					for (i=1;i<=12;i++) document.write("<option>"+i); 
					document.write("</select>"); 
	
					document.write("<select class='input_box' name=birth3 id='birth3'>"); 
					document.write("<option value='' selected>day"); 
					for (i=1;i<=31;i++) document.write("<option>"+i); 
					document.write("</select>"); 
				</script> 
				<c:if test="${not empty mvo.mem_birth }">
					<input placeholder="${mvo.mem_birth }" class="input_box" contenteditable="false" disabled="disabled">
				</c:if>	
			</td>
		</tr>
		<tr>
			<td class="title">
			<label for="gender">Gender</label>
			</td>
			<td class="contents">
			<input type="radio" name="mem_gender" value="M"> Male
			<input type="radio" name="mem_gender" value="F"> Female
			<input type="radio" name="mem_gender" value="O"> Other
			</td>
		</tr>
		<tr>
			<td class="title">
			<label for="address">Address</label>
			</td>
			<td class="contents">
			</td>
		</tr>
		<tr>
			<td class="title">
			 <label>RoadAddress:</label>
              
			</td>
			<td class="contents">
			 <input type="text" id="roadAddr" class="input_box" name="address"> 
               <input type="button"  value="Search" onclick="goPopup()">
			</td>
		</tr>
		<tr>
			<td class="title">
			 <label>DetailAddress:</label>
               
			</td>
			<td class="contents">
			<input type="text"   id="detailAddr" class="input_box" name="address_detail" placeholder="${mvo.mem_address }">
			</td>
		</tr>
		<tr>
			<td class="title">
			<label for="nationality">Nationality</label>
			</td>
			<td class="contents">
			<input type="text" id="nationality" class="input_box" name="mem_nationality" placeholder="${mvo.mem_nationality }">
			</td>
		</tr>
		<hr>
		<tr>
			<td class="title">
				<label for="name">Mail Service</label>
			</td>
			<td class="contents">
			  <input type="radio" name="mailling_fl" value="T">agree
	          <input type="radio" name="mailling_fl" value="F">do not agree
			</td>
		</tr>
		<tr>
			<td class="title">
			<label for="name">SMS Service</label>
	          
			</td>
			<td class="contents">
			  <input type="radio" name="sms_fl" value="T">agree
	          <input type="radio" name="sms_fl" value="F">do not agree
			</td>
		</tr>
		</table>
		
<!-- 		
		<div>
			<label for="id">ID(Email)</label>
			<input class="input_box" name="mem_id" value="${mvo.mem_id }" contenteditable="false" disabled="disabled">
			<input type="hidden" id="mem_id" class="input_box" name="mem_id" value="${mvo.mem_id }">
		</div><br>
		<div>
			<label for="nickName">Nickname</label>
			<input type="text" class="input_box" name="mem_name" placeholder="${mvo.mem_name }" >
			<span id="getMemberNick"></span>
		</div><br>
		<div>
			<label for="password">Current Password</label>
			<input type="password" class="input_box" id="curPw">
			<span id="getMemberPw"></span>
		</div>
		<div>
			<label for="password">New Password</label>
			<input type="password" id="newPw" class="input_box" name="mem_pw">
		</div>
		<div>
			<label for="password">Re-enter New Password</label>
			<input type="password" id="rePw" class="input_box">
			<span id="checkPw"></span>
		</div><br>
		<div>
			<label for="phone">Phone number</label>
			<input type="text" class="input_box" name="mem_phone" placeholder="${mvo.mem_phone }">
		</div><br>
		<div>
			<label for="birth">Birthday</label>
			<script> 
				var today = new Date(); 
				var toyear = parseInt(today.getFullYear()); 
				var start = toyear - 5 
				var end = toyear - 70; 

				document.write("<select class="input_box" name=birth1 id='birth1'>"); 
				document.write("<option value='' selected>year"); 
				for (i=start;i>=end;i--) document.write("<option>"+i); 
				document.write("</select>"); 
				
				document.write("<select class="input_box" name=birth2 id='birth2'>"); 
				document.write("<option value='' selected>month"); 
				for (i=1;i<=12;i++) document.write("<option>"+i); 
				document.write("</select>"); 

				document.write("<select class="input_box" name=birth3 id='birth3'>"); 
				document.write("<option value='' selected>day"); 
				for (i=1;i<=31;i++) document.write("<option>"+i); 
				document.write("</select>"); 
			</script> 
			<c:if test="${not empty mvo.mem_birth }">
				<input placeholder="${mvo.mem_birth }" class="input_box" contenteditable="false" disabled="disabled">
			</c:if>
		</div><br>
		<div>
			<label for="gender">Gender</label>
			<input type="radio" name="mem_gender" value="M"> Male
			<input type="radio" name="mem_gender" value="F"> Female
			<input type="radio" name="mem_gender" value="O"> Other
		</div><br>
		<div>
			<div><label for="address">Address</label></div>
            <div>
            <label>RoadAddress:</label>
               <input type="text" id="roadAddr" class="input_box" name="address"> 
               <input type="button"  value="Search" onclick="goPopup()">
            </div>
            <div>
            <label>DetailAddress:</label>
               <input type="text"   id="detailAddr" class="input_box" name="address_detail" placeholder="${mvo.mem_address }">
	        </div>
		</div><br>
		<div>
			<label for="nationality">Nationality</label>
			<input type="text" id="nationality" class="input_box" name="mem_nationality" placeholder="${mvo.mem_nationality }">
		</div><br>
		<hr>
		<br>
		<div>
			<label for="name">Mail Service</label>
	          <input type="radio" name="mailling_fl" value="T">agree
	          <input type="radio" name="mailling_fl" value="F">do not agree
		</div><br>
		<div>
			<label for="name">SMS Service</label>
	          <input type="radio" name="sms_fl" value="T">agree
	          <input type="radio" name="sms_fl" value="F">do not agree
		</div><br><br>
		 -->
		<input type="hidden" class="input_box" name=mem_cate value="${mvo.mem_cate }">
		<input type="submit" value="save">
	</form>
</body>
</html>