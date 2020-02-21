<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<style>
	
	#container {
		width: 90%;
		margin: 0 auto;
		color: black;
	}
	
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse;
			margin: 0 auto;
			width:100%;
	 }
	table, th, td {
		border: 1px solid black;
		margin: 10px auto;
	}
	td {
		text-align: left;
		padding-left: 15px;
		padding-right: 15px;
	}
	#mapDisp{
		
		width: 100%;
		height: 250px;
		margin: 0 auto;
		margin-bottom: 5px;
	}
	.td_div {
		margin-top: 5px;
		margin-bottom: 5px;
	}
	th { background-color: orange; width:10%; }
	.center { text-align: center; }
	.border-none, .border-none td { border: none; }
	
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 영어 주소  변수
            var addr_en = ''; // 영어 주소  변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            	addr= data.roadAddress;
            	addr_en = data.roadAddressEnglish;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
            	addr = data.jibunAddress;
            	addr_en = data.jibunAddressEnglish;
            }
			
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
             	addr+= " "+ extraAddr;
            
                
            } 

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            //document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            document.getElementById("sample6_address_en").value = addr_en;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").value="";
            document.getElementById("sample6_detailAddress").focus();
            
        }
    }).open();
}
</script>
<script>
	//영문주소 팝업창=============================================================================================
	//form에 name 값 설정
	function goPopup(){
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
	    var pop = window.open("resources/common/jusoPopup_eng.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	function jusoCallBack(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn
							, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadAddr.value = roadAddr;
		document.form.addrDetail.value = addrDetail;
		
		document.form.siNm.value = siNm;
		document.form.sggNm.value = sggNm;
		
		$("#mapDisp").load("/koreigner/resources/html/googleMap.jsp?location="
		   		+roadAddr.replace(/ /gi,"%20"));
		
	}
	//영문주소 팝업창 end =============================================================================================
		
		
</script>
<script>
	
	function fileUpload(){
		/*
		var formData = new FormData();
		
		$.each($("input[type='file']")[0].files, function(i, file) {
			formData.append('file', file);
		});
		//formData.append('file', document.getElementById('file').files[0]);
		alert(document.getElementById('file').files.length);
		$.ajax({ 
			type: "POST", 
			enctype: 'multipart/form-data', // 필수 
			url: 'house_MultiImgUpload.do', 
			data: formData,// 필수 
			processData: false, // 필수
			contentType: false, // 필수 
			cache: false, 
			success: function (result) { 
				alert(result);
			}, error: function (e) { 
				
			} 
		});
*/			/*
			var formData = new FormData( $("#form")[0]);
			var bool= false;
			$.ajax({ 
				type: "POST", 
				enctype: 'multipart/form-data', // 필수 
				url: 'house_MultiImgUpload.do', 
				data: formData,// 필수 
				processData: false, // 필수
				contentType: false, // 필수 
				cache: false, 
				async:false,
				success: function (result) { 
					alert("안가"+result);
					bool=true;
					//location.replace("house_main.do");
					//location.replace("house_main.do");
				}, error: function (e) { 
					alert(e);
				} 
			});
			if(bool){
				alert(bool);
				window.location.replace("house_main.do");
			}*/
	}
		
</script>
<style>

</style>
</head>
<body>
	
	<div id="container">
	<h1>House Info</h1>
	<hr>
	<form action="house_MultiImgUpload.do" id="form" name="form" method="post" enctype="multipart/form-data">
		
	
	<table>
		<tr>
			<th> TITLE</th>
			<td colspan="3">
				<div class="td_div">
					<input type="text" name="subject" size="30">
				</div>
			</td>
		</tr>
		<tr>
			<th>Buliding Type</th>
			<td style="width:40%">
				<div class="td_div">
					<input type="radio"  value="0" name="build_type"> villa
					<input type="radio"  value="1" name="build_type" style="margin-left: 15px"> Goshiwon
					<input type="radio"  value="2" name="build_type" style="margin-left: 15px"> Semi-Officetel
				</div>
			</td>
			<th>Room Type</th>
			<td style="width:40%">
				<div class="td_div">
					<input type="radio"  value="0" name="room_type"> Studio
					<input type="radio"  value="1" name="room_type" style="margin-left: 15px"> Two BedRoom
					<input type="radio"  value="2" name="room_type" style="margin-left: 15px"> Three+ BedRoom
				</div>
			</td>
		</tr>	
		<tr>
			<th>Loctation</th>
			<td colspan="3">
				<div class="td_div">
					<label style="width:30%">RoadAddress:</label>
					<input type="text" id="roadAddr" name="address" style="width:60%;  margin-left: 5px;"> 
					<input type="button"  value="Search" onclick="goPopup();" style="width:10%">
				</div>
				<div class="td_div">
					<label style="width:30%">DetailAddress:</label>
					<input type="text" 	 id="addrDetail" name="address_detail" style="width:71%;"> 
				</div>
				<input type="hidden" id="siNm" 		 name="do_en" 		   title="주소" value="">
				<input type="hidden" id="sggNm" 	 name="gu_gun_eup_eng" title="주소" value="">
				<div id="mapDisp" style="border: 1px solid black;"></div>
			</td>
		</tr>
		<tr>
			<th>Rooms</th>
			<td style="width:40%">
				<div class="td_div">
					<label style="width:70%">A room for sleeping: </label>
					<input type="number" id="" name="room_of_num" style="width:30%; " step="1" min="1" max="9">
				</div>
			</td>
			<th>Bath<br>rooms</th>
			<td style="width:40%">
				<div class="td_div">
					<label style="width:30%">Bathroom: </label>
					<input type="number" id="" name="bathroom" style="width:30%; " step="1" min="1" max="9" >
				</div>
			</td>
		</tr>
		
		<tr>
			<th>Area</th>
			<td style="width:40%">
				<div class="td_div">
					<label style="width:70%">Square Meter: </label>
					<input type="number" id="" name="room_area" style="width:30%; " step="1" min="1">
				</div>
			</td>
			<th>Floor</th>
			<td style="width:40%">
				<div class="td_div">
					<label style="width:20%">Buliding: </label>
					<input type="number" id="" name="bulid_layers" style="width:30%; " step="1" min="1">
					<label style="width:20%; margin-left: 10px;">Floor: </label>
					<input type="number" id="" name="floor_layers" style="width:30%; " step="1" min="1">
				</div>
				<div class="td_div">
					
				</div>
				<div class="td_div">
					<input type="radio"  value="0" name="floor_type"> Nomal
					<input type="radio"  value="1" name="floor_type" style="margin-left: 15px"> RoofTops
					<input type="radio"  value="2" name="floor_type" style="margin-left: 15px"> Semi-basement
				</div>
			</td>
		</tr>
		
		
		
		
		<tr>
			<th>업로드</th>
			<td>
				<div class="td_div">
					<input type="file" id="file" name="file" multiple>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<div class="td_div">
					<input type="submit" value="새글 등록" onclick="fileUpload();">
				</div>
			</td>
		</tr>
		
	</table>
	
	</form>
	<p><a href="house_main.do ">글 목록 가기</a></p>
</div>

</body>
</html>











