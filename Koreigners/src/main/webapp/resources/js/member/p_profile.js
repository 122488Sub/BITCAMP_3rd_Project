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
 
 	
	