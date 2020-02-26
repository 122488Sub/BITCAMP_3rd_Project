<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW24W9sP9njddFNugiBUaJ-AzVfpQb_MY&language=en&libraries=places&callback=initMap"
        async defer></script>
<script type="text/javascript">
function initMap() {
    
    var input = document.getElementById('nationality');
    var autocomplete = new google.maps.places.Autocomplete(input);
    var infowindow = new google.maps.InfoWindow();
}

function goPopup(){
    // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
     var pop = window.open("resources/common/jusoPopup_eng.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
 }
 function jusoCallBack(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn
                   , bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
    // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
    $('#roadAddr').val(roadAddr);
    $('#addrDetail').val(addrDetail);
    $('#sggNm').val(sggNm);
    $('#siNm').val(siNm);
    
 }
</script>
</head>
<body>
<div>
	<ul>
		<li class="tabs"><a href="myPage_go.do?type=profile">Profile Setting</a></li>
		<li class="tabs"><a href="myPage_go.do?type=resume">Resume</a></li>
		<li class="tabs"><a href="myPage_go.do?type=wishlist">Wishlist</a></li>
		<li class="tabs"><a href="myPage_go.do?type=ads">My Ads</a></li>
	</ul>
</div>
	<form action="/updateMember.do" method="post">
		<div>
			<label for="nickName">Nickname</label>
			<input type="text" name="mem_name" value="${mvo.mem_name }">
		</div><br>
		<div>
			<label for="id">ID(Email)</label>
			<input type="text" value="current Email">
			<input type="text" name="mem_id" value="current Email">
			<input type="text" name="mem_id" value="current Email">
		</div><br>
		<div>
			<label for="phone">Phone number</label>
			<input type="text" name="mem_phone">
		</div><br>
		<div>
			<label for="birth">Birthday</label>
				<script> 
					var today = new Date(); 
					var toyear = parseInt(today.getFullYear()); 
					var start = toyear - 5 
					var end = toyear - 70; 

					document.write("<select name=birth1 id='birth1'>"); 
					document.write("<option value='' selected>year"); 
					for (i=start;i>=end;i--) document.write("<option>"+i); 
					document.write("</select>"); 
					
					document.write("<select name=birth2 id='birth2'>"); 
					document.write("<option value='' selected>month"); 
					for (i=1;i<=12;i++) document.write("<option>"+i); 
					document.write("</select>"); 

					document.write("<select name=birth3 id='birth3'>"); 
					document.write("<option value='' selected>day"); 
					for (i=1;i<=31;i++) document.write("<option>"+i); 
					document.write("</select>"); 
				</script> 
		</div><br>
		<div>
			<label for="gender">Gender</label>
			  <select>
			  	<option>gender
			  	<option>Male
			  	<option>Female
			  	<option>Other
			  </select>
		</div><br>
		<div>
			<div><label for="address">Address</label></div>
            <div>
            <label>RoadAddress:</label>
               <input type="text" id="roadAddr" name="address"> 
               <input type="button"  value="Search" onclick="goPopup()">
            </div>
            <div>
            <label>DetailAddress:</label>
               <input type="text"   id="addrDetail" name="address_detail"> 
	           <input type="hidden" id="siNm"       name="do_en"          title="주소" value="">
	           <input type="hidden" id="sggNm"      name="gu_gun_eup_eng" title="주소" value="">
	        </div>
		</div><br>
		<div>
			<label for="nationality">Nationality</label>
			<input type="text" id="nationality" name="mem_nationality">
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
		
		<input type="submit" value="save">
	</form>
</body>
</html>