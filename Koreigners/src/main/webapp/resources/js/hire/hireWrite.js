var cate_prnt_ko = "";
	var si_kor = "";
	$(function(){
		//비밀번호 중복 검사
		$("#conf_password").blur(function() {
			var password = $('#regForm [name="password"]').val();
			var password_conform= $('#regForm [name="conf_password"]').val();
			var regExp = /(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,20}).{10,20}$/
				if(password == "" || password_conform == ""){
					$('#pw_check').text('비밀번호를 입력하세요 :)');
					$('#pw_check').css('color', 'red');
					$("#reg_submit").attr("disabled", true);				
				}else if(password!=password_conform){
					$("#pw_check").text("비밀번호가 일치하지 않습니다.");
					$("#pw_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
					
					
				} else{
					$("#pw_check").text("비밀번호가 일치합니다.");
					$("#pw_check").css("color", "blue");
				}
			
			
		});
		
		
		
		
		//아이디(이메일) 중복 검사
		$("#mem_id").blur(function() {
			var id = $('#mem_id').val();
			console.log("id : " + id);	
			$.ajax({
				url : 'idCheck.do?mem_id='+ id,
				type : 'get',
				success : function(data) {
					console.log("data : " + data);	
					
					if(data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("이메일 형식으로 입력 해 주세요.");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
						
					} else {
						
						var idRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
						
						if(idRegExp.test(id)){
							// 0 : 사용가능
							$("#id_check").text("사용 가능한 아이디입니다!");
							$("#id_check").css("color", "blue");
							$("#reg_submit").attr("disabled", false);
				
						} else if(id == ""){
							
							$('#id_check').text('아이디를 입력하세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
						} else {
							$('#id_check').text('이메일 형식으로 입력 해 주세요 :(');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
						}
					}
				}, 
				error : function() {
					console.log("실패");
				}
			});
		});
		
		
							
		
		//카테고리 세션박스 변경 시 하위 카테고리 select ajax
		$("#selectBox1").change(function(){
			console.log("바뀜");
			var selectBox1 = document.getElementById("selectBox1");
			console.log(this.value);
			cate_prnt_ko = this.value;
			var item = document.getElementById("selectBox1").value;
			console.log(this.item)
			
			$.ajax("getCateJson.do", {
				type: "get",
				dataType : "json",
				data: {"cate_prnt_ko" : cate_prnt_ko},
				success : function(data){
					
					var strData = JSON.stringify(data);
					
					var jsData = JSON.parse(strData); //자바 스크립트 데이터로 형 변환
					
					
					var dataTag = "";
					$.each(data, function(index, obj){
						dataTag += "<option value=" + this.cate_child_ko +">"
						dataTag += this.cate_child_ko;
						dataTag += "</option>";
					});
		
					$("#cate_child_ko").html(dataTag);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("Ajax 처리 실패 : \n" +
						  "jqXHR.readyState : " + jqXHR.readyState + "\n" +
						  "textStatus : " + textStatus + "\n" +
						  "errorThrown : " + errorThrown);
				}
			});	
		});
		
		//지역 도 세션박스 변경 시 하위 카테고리 select ajax
		$("#do_kor").change(function(){
			console.log("바뀜");
			var selectBox1 = document.getElementById("gu_gun_eup_kor");
			console.log(this.value);
			si_kor = this.value;
			
			$.ajax("getSiJson.do", {
				type: "get",
				dataType : "json",
				data: {"si_kor" : si_kor},
				success : function(data){
					alert("성공 ~~ data : " + data);
					
					var strData = JSON.stringify(data);
					console.log("strData : " + strData);
					
					var jsData = JSON.parse(strData); //자바 스크립트 데이터로 형 변환
					console.log("jsData : " + jsData);
					
					var dataTag = "";
					$.each(data, function(index, obj){
						dataTag += "<option value=" + this.gu_gun_eup_kor +">"
						dataTag += this.gu_gun_eup_kor;
						dataTag += "</option>";
					});
		
					$("#gu_gun_eup_kor").html(dataTag);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("Ajax 처리 실패 : \n" +
						  "jqXHR.readyState : " + jqXHR.readyState + "\n" +
						  "textStatus : " + textStatus + "\n" +
						  "errorThrown : " + errorThrown);
				}
			});	
		});
		
	});
	
	/*영문주소 팝업창=============================================================================================
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
		document.form.address.value = addrDetail + ", " + roadAddr;
		document.form.addKor.value = korAddr;
		console.log("korAddr : " + korAddr);
		
	}
	//영문주소 팝업창 end =============================================================================================
	*/
	
	
	//한글주소 팝업창=============================================================================================
	//form에 name 값 설정
	function goPopup(){
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
	    var pop = window.open("resources/common/jusoPopup_kor.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
			, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		
		document.form.do_kor.value = siNm;
		document.form.gu_gun_eup_kor.value = sggNm;
		
	}
	//한글주소 팝업창 end =============================================================================================
	
		
	//회원가입 버튼 클릭	
	function signInClick() {
		
		var form = document.forms[0];
		var id = $('#regForm [name="mem_id"]').val();
		var name = $('#regForm [name="hr_manager"]').val();
		/* 값을 입력했는지 전체 확인
		for (var i=0; i < form.elements.length; i++) {
				if(form.elements[i].value.trim() == "") {
					console.log("form.elements[i].outerText : " + form.elements[i].outerText);
					console.log("form.elements[i] : " + i);
					alert(form.elements[i].title + "을 입력하세요");
					form.elements[i].focus();
					return;
			}
		}
		
		var id = $('#regForm [name="mem_id"]').val();
		var name = $('#regForm [name="hr_manager"]').val();
		var password = $('#regForm [name="password"]').val();
		var password_conform= $('#regForm [name="conf_password"]').val();
		var regExp = /(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,20}).{10,20}$/
			if(password!=password_conform){
				alert("비밀번호가 서로 다릅니다. 다시한번 확인해주세요.");
					return;
			}	
		*/
		/*
		private int company_idx, employee_num; 
		private String mem_id, ceo_name, company_name, company_cate, hr_manager, 
		               do_en, gu_gun_eup_eng, address, business_num, business_img, 
		               business_info, domitory, meals, company_telephone, ip, manager_email;  
		private Date regdate;
		*/
		form.submit();
		
	}