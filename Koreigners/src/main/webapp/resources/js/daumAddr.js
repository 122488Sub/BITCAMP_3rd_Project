function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
         
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 영어 주소  변수
            var addr_en = ''; // 영어 주소  변수
            var extraAddr = ''; // 참고항목 변수
            var sido_ko = '' //행정구역 한글
        	var sigugun_ko = '' //시구군구 한글
    		var sido_en = '' //행정구역 영문
        	var sigugun_en = '' //시구군구 영문
            
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
               addr= data.roadAddress;
               addr_en = data.roadAddressEnglish;
               sido_ko = data.sido;
               sigugun_ko = data.sigungu;
               
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
            
            switch(sido_ko) {
            case "강원" : 
            	sido_ko = '강원도'
            	break;
            case "경기" : 
            	sido_ko = '경기도'
            	break;
            case "경남" : 
            	sido_ko = '경상남도'
            	break;
            case "경북" : 
            	sido_ko = '경상북도'
            	break;
            case "광주" : 
            	sido_ko = '광주광역시'
            	break;
            case "대구" : 
            	sido_ko = '대구광역시'
            	break;
            case "대전" : 
            	sido_ko = '대전광역시'
            	break;
            case "부산" : 
            	sido_ko = '부산광역시'
            	break;
            case "서울" : 
            	sido_ko = '서울특별시'
            	break;
            case "세종" : 
            	sido_ko = '세종특별자치시'
            	break;
            case "울산" : 
            	sido_ko = '울산광역시'
            	break;
            case "인천" : 
            	sido_ko = '인천광역시'
            	break;
            case "전남" : 
            	sido_ko = '전라남도'
            	break;
            case "전북" : 
            	sido_ko = '전라북도'
            	break;
            case "충남" : 
            	sido_ko = '충청남도'
            	break;
            case "충북" : 
            	sido_ko = '충청북도'
            	break;
            }
            
            var addr_enSplit = addr_en.split(",");
            
            sido_en = addr_enSplit[3];
            sigugun_en = addr_enSplit[2];
            console.log("sido_en : " + sido_en);
            console.log("sido_ko : " + sido_ko);
            console.log("sigugun_en : " + sigugun_en);
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            //document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            document.getElementById("address_en").value = addr_en;
            document.getElementById("do_kor").value = sido_ko;
            document.getElementById("gu_gun_eup_kor").value = sigugun_ko;
            document.getElementById("do_en").value = sido_en;
            document.getElementById("gu_gun_eup_en").value = sigugun_en;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr_dt_kor").value="";
            document.getElementById("addr_dt_kor").focus();
            document
        }
    }).open();
}
