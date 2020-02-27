

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
		document.form.roadAddr.value = roadAddr;
		document.form.addrDetail.value = addrDetail;
		
		document.form.siNm.value = siNm;
		document.form.sggNm.value = sggNm;
		
		$("#mapDisp").load("/koreigner/resources/html/googleMap.jsp?location="
		   		+roadAddr.replace(/ /gi,"%20"));
		
	}
	//영문주소 팝업창 end =============================================================================================
		
		

/*datepicker 캘린더*/
$(function() {
    $( "#datepicker" ).datepicker({
    	showOn: "both", 
        buttonImage: "resources/img/house/calendar-button.png", 
        buttonImageOnly: true ,
    	changeMonth: true, 
        changeYear: true,
        nextText: 'Next',
        prevText: 'Prev', 
    	 minDate:+1,
    	 showButtonPanel: true, 
         currentText: 'Current', 
         closeText: 'Close', 
         dateFormat: "yy-mm-dd"
    });
    $('#current_date').datepicker({dateFormat: "yy-mm-dd"});
	$('#current_date').datepicker('setDate', 'today') ;
    
    
    
    $(".ui-datepicker-trigger").css('margin-left',"5px");
    $(".ui-datepicker-trigger").attr('width',15);
    $(".ui-datepicker-trigger").attr('height',15);
    
    $(".ui-datepicker-trigger, #datepicker").on('click', function() { 
		$("#radio_available_date_After").prop('checked', true);
	}); 

	$("input[name=chk_management_expense]").on('click', function() { 
		if ( $(this).prop('checked') ) { 
			
			$("#text_management_expense").attr("disabled",true);
		} 
		else { 
			$("#text_management_expense").removeAttr("disabled");
		} 
	}); 

    
    
});
/**/

/*천단위 콤마 처리 스크립트*/
function inputNumberAutoComma(obj) {
    
    // 콤마( , )의 경우도 문자로 인식되기때문에 콤마를 따로 제거한다.
    var deleteComma = obj.value.replace(/\,/g, "");

    // 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
    if(isFinite(deleteComma) == false) {
        alert("문자는 입력하실 수 없습니다.");
        obj.value = "";
        return false;
    }
    obj.value = inputNumberRemoveZero(obj.value);
    // 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
    obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
}
//천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
function inputNumberRemoveZero(str) {

    str = String(str);
    while(str.indexOf('0')=='0'){
    	str=str.substr(1);
    }
    
    return str;
}


// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
function inputNumberWithComma(str) {

    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
}

// 콤마( , )가 들어간 값에 콤마를 제거하는 함수
function inputNumberRemoveComma(str) {

    str = String(str);
    return str.replace(/[^\d]+/g, "");
}

	
	function insertForm(){
		
		if($('input[name=subject]').val()==''){
			 alert("Plese Checked [Title]");
			 $('input[name=subject]').focus();
			 return false;
		}
		
		
		if( ! ( $('input:radio[name=build_type]').is(':checked') ) ){
			 alert("Plese Checked [Buliding Type]");
			 $('input[name=build_type]').focus();
			 return false;
		}
		
		if( ! ( $('input:radio[name=room_type]').is(':checked') ) ){
			alert("Plese Checked [Room Type]");
			 $('input[name=room_type]').focus();
			 return false;
				
		}
		
		
		if( $('input[name=address]').val()==''){
			alert("Plese Checked [Loctation - Address]");
			 $('input[name=address]').focus();
			 return false;
				
		}
		
		
		if( $('input[name=room_area]').val()=='' || $('input[name=room_area]').val()=='0'){
			alert("Plese Checked [Area]");
			 $('input[name=room_area]').focus();
			 return false;
				
		}
		
		if( $('input[name=bulid_layers]').val()=='' || $('input[name=bulid_layers]').val()=='0'){
			alert("Plese Checked [Buliding Layers]");
			 $('input[name=bulid_layers]').focus();
			 return false;
				
		}
		if( $('input[name=floor_layers]').val()=='' || $('input[name=floor_layers]').val()=='0'){
			alert("Plese Checked [Floor Layers]");
			 $('input[name=floor_layers]').focus();
			 return false;
				
		}
		if( $('input[name=bulid_layers]').val() < $('input[name=floor_layers]').val()){
			alert("Plese Checked [Floor]\n [Floor Layers] cannot be higher than [Buliding Layers]");
			$('input[name=floor_layers]').focus();
			return false;
			
		}
		
	
		//입주날짜 선택
		if($('input[name=radio_available_date]:checked').val() == '0'){
			$('input[name=available_date]').val( $('#current_date').val());
		}
		else if($('input[name=radio_available_date]:checked').val() == '1'){
			$('input[name=available_date]').val( $('#datepicker').val());
		}
		else{
			alert("Plese Checked [Available Date]");
			$('input[name=radio_available_date]').focus();
			return false;
		}
		
	
		
		
		//보증금 월세 관리비 , 제거
		$("#deposit").val( inputNumberRemoveComma($("#deposit").val()));
		$("#monthly_rent").val( inputNumberRemoveComma($("#monthly_rent").val()));
	
		if($('input[name=chk_management_expense]').is(':checked') ){
			$("#management_expense").val('0');
		}else {
			$("#management_expense").val( inputNumberRemoveComma($("#text_management_expense").val()) );
		}
		
		
		if( $('input[name=deposit]').val()=='' || $('input[name=deposit]').val()=='0'){
			alert("Plese Checked [Deposit]");
			 $('input[name=deposit]').focus();
			 return false;
				
		}
		if( $('input[name=monthly_rent]').val()=='' || $('input[name=monthly_rent]').val()=='0'){
			alert("Plese Checked [Monthly Rent]");
			 $('input[name=monthly_rent]').focus();
			 return false;
				
		}
		if( $('input[name=management_expense]').val()==''){
			alert("Plese Checked [Management Expense]");
			 $('input[name=management_expense]').focus();
			 return false;
				
		}
		
		

		$("#form").attr('action',"house_insert_process.do").submit();	
		
		
		
		
	}
		
