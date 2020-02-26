<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<style>
	
	
	#mapDisp{
		
		width: 100%;
		height: 250px;
		margin: 0 auto;
		margin-bottom: 5px;
	}
	
	
}
	
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!--  jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  

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

	//영문주소 팝업창=============================================================================================
	//form에 name 값 설정
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
		
		$("#mapDisp").load("/koreigner/resources/html/googleMap.jsp?location="
		   		+roadAddr.replace(/ /gi,"%20"));
		
	}
	//영문주소 팝업창 end =============================================================================================
</script>
</head>
<body>
	
<div id="container">
	
	<form action="" id="form" name="form" method="post" enctype="multipart/form-data">
	
				<div class="td_div">
					<label style="width:30%">RoadAddress:</label>
					<input type="text" id="roadAddr" name="address"  style="width:60%;  margin-left: 5px;"> 
					<input type="button"  value="Search" onclick="goPopup();" style="width:10%">
				</div>
				<div class="td_div">
					<label style="width:30%">DetailAddress:</label>
					<input type="text" 	 id="addrDetail" name="address_detail" style="width:71%;"> 
				</div>
				<input type="hidden" id="siNm" 		 name="do_en" 		   title="주소" value="">
				<input type="hidden" id="sggNm" 	 name="gu_gun_eup_eng" title="주소" value="">
				<div id="mapDisp" style="border: 1px solid black;"></div>
			
	</form>

</div>

</body>
</html>











