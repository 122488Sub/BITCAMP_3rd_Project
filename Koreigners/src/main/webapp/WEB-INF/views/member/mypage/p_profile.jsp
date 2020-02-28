<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/header.css" rel="stylesheet" type="text/css">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW24W9sP9njddFNugiBUaJ-AzVfpQb_MY&language=en&libraries=places&callback=initMap" async defer></script>
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
 
 
 $(function(){
	// 닉네임 중복 검사
	$("#mem_name").blur(function() {
		$.ajax({
			url : 'nickCheck.do',
			type : 'post',
			success : function(data) {
				console.log("data : " + data);	
				
				if(data == 1) {
					// 1 : 닉네임 중복되는 문구
					$("#getMemberNick").text("Nickname has already been taken :p");
					$("#getMemberNick").css("color", "red");
					$("#submit").attr("disabled", true);
					
				} else {
					// 0 : 사용가능
					$("#getMemberNick").text("It's available!!");
					$("#getMemberNick").css("color", "blue");
					$("#submit").attr("disabled", false);
				}
			}, 
			error : function() {
				console.log("실패");
			}
		});
	});
	
	//비밀번호 확인
	$("#curPw").blur(function(){
		var memId = $('#mem_id').val();
		var curPw = $('#curPw').val();
		var jsonObj = {"mem_id":memId, "mem_pw":curPw};
		
		$.ajax({
			url : 'pwCheck.do',
			type : 'POST',
			contentType: "application/json; charset=UTF-8",
			data : JSON.stringify(jsonObj),
			dataType : 'text',
			success : function(data) {
				if(data != 1) {
					$('#getMemberPw').text("Wrong password!");
					$('#getMemberPw').css("color", "red");
					$('#resetPwGo').attr('disabled', true);
				} else {
					$('#getMemberPw').text("Correct!");
					$('#getMemberPw').css("color", "blue");
					$('#resetPwGo').attr('disabled', false);
				}
			},
	        error: function(){
	        	alert("비밀번호 확인 오류");
	        }
			
		});
	});
	
	$("#rePw").blur(function(){
		var pw1 = $("#newPw").val();
		var pw2 = $("#rePw").val();
		if(pw1 == pw2) {
			$("#checkPw").text("");
			$("#submit").attr("disabled", false);
		} else {
			$("#checkPw").text("Passwords are not same.");
			$("#checkPw").css("color", "red");
			$("#submit").attr("disabled", true);
		}
	});
	
 });
 
 	
	
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
	<form action="updateMember.do" method="post">
		<div>
			<label for="id">ID(Email)</label>
			<input name="mem_id" value="${mvo.mem_id }" contenteditable="false" disabled="disabled">
			<input type="hidden" id="mem_id" name="mem_id" value="${mvo.mem_id }">
		</div><br>
		<div>
			<label for="nickName">Nickname</label>
			<input type="text" name="mem_name" value="${mvo.mem_name }" >
			<span id="getMemberNick"></span>
		</div><br>
		<div>
			<label for="password">Current Password</label>
			<input type="password" id="curPw">
			<span id="getMemberPw"></span>
		</div>
		<div>
			<label for="password">New Password</label>
			<input type="password" id="newPw" name="mem_pw">
		</div>
		<div>
			<label for="password">Re-enter New Password</label>
			<input type="password" id="rePw">
			<span id="checkPw"></span>
		</div><br>
		<div>
			<label for="phone">Phone number</label>
			<input type="text" name="mem_phone" value="${mvo.mem_phone }">
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
			<c:if test="${not empty mvo.mem_birth }">
				<input value="${mvo.mem_birth }" contenteditable="false" disabled="disabled">
			</c:if>
		</div><br>
		<div>
			<label for="gender">Gender</label>
			  <select>
			  	<option value='' selected>gender
			  	<option>Male
			  	<option>Female
			  	<option>Other
			  </select>
			<c:if test="${not empty mvo.mem_gender }">
				<input value="${mvo.mem_gender }" contenteditable="false" disabled="disabled">
			</c:if>
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
               <input type="text"   id="detailAddr" name="address_detail">
	        </div>
		</div><br>
		<div>
			<label for="nationality">Nationality</label>
			<input type="text" id="nationality" name="mem_nationality" value="${mvo.mem_nationality }">
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
		
		<input type="hidden" name=mem_cate value="${mvo.mem_cate }">
		<input type="submit" value="save">
	</form>
</body>
</html>