<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>


	var cate_kor = "";
	var si_kor = "";
	$(function(){
		
		//카테고리 세션박스 변경 시 하위 카테고리 select ajax
		$("#selectBox1").change(function(){
			console.log("바뀜");
			var selectBox1 = document.getElementById("selectBox1");
			console.log(this.value);
			cate_kor = this.value;
			
			$.ajax("getCateJson.do", {
				type: "get",
				dataType : "json",
				data: {"cate_kor" : cate_kor},
				success : function(data){
					alert("성공 ~~ data : " + data);
					
					var strData = JSON.stringify(data);
					console.log("strData : " + strData);
					
					var jsData = JSON.parse(strData); //자바 스크립트 데이터로 형 변환
					console.log("jsData : " + jsData);
					
					
					var dataTag = "";
					$.each(data, function(index, obj){
						dataTag += "<option value=" + this.cate_child_ko +">"
						dataTag += this.cate_child_ko;
						dataTag += "</option>";
					});
					
		
					$("#cate_child").html(dataTag);
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
	
	//영문주소 팝업창=============================================================================================
	//form에 name 값 설정
	function goPopup(){
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
	    var pop = window.open("resources/common/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	function jusoCallBack(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn
							, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadAddr.value = roadAddr;
		document.form.addrDetail.value = addrDetail;
		
		document.form.allAddr.value = addrDetail + ", " + roadAddr;
	}
	//영문주소 팝업창 end =============================================================================================
		
	function signInClick() {
		
		var form = document.forms[0];
		// 값을 입력했는지 전체 확인
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
		
		/*
		private int company_idx, employee_num; 
		private String mem_id, ceo_name, company_name, company_cate, hr_manager, 
		               do_en, gu_gun_eup_eng, address, business_num, business_img, 
		               business_info, domitory, meals, company_telephone, ip, manager_email;  
		private Date regdate;
		*/
		
		
		form.submit();
		
	}
		
		
</script>
</head>


<body>

	<form action="join_conf.do" name="form" id="regForm" method="post">
	
		<label>아이디 : </label><input type="text" name="mem_id" id="mem_id" title="아이디"><br>
		<label>비밀번호 : </label><input type="password" name="password" id="password" title="비밀번호"><br>
		<label>비밀번호 확인 : </label><input type="password" name="conf_password" id="conf_password" title="비밀번호 확인"><br>
		<label>회사명 : </label><input type="text" name="company_name" id="company_name" title="회사명"><br>
		<label>대표자명 : </label><input type="text" name="ceo_name" id="ceo_name" title="대표자명"><br>
		
		<label>직종선택 : </label>
		<select name="company_cate" id="selectBox1" title="직종선택">
			<c:forEach items="${jobCateMap}" var="option">
				<option class="${option.key}">${option.value}</option>
			</c:forEach>
		</select>
		<select name="cate_child" title="직종선택"  id="cate_child">
		</select><br>
		
		<label>주소 : </label><input type="text" id="roadAddr" style="width:10%"> <input type="button"  value="주소검색" onclick="goPopup();">
		<br>
		<label>상세주소 : </label><input type="text" id="addrDetail" style="width:10%"><br>
		<input type="hidden" name="address" id="allAddr" title="주소" value="">
		
		<label>사업자번호 : </label><input type="text" name="business_num" id="business_num" title="사업자번호"><br>
		
		<label>인사담당자 : </label><input type="text" name="hr_manager" id="hr_manager" title="인사담당자"><br>
		
		<label>담당자 메일 : </label><input type="text" name="manager_email" id="manager_email" title="담당자 메일"><br>
		
		<label>대표전화 : </label><input type="text" name="company_telephone" id="company_telephone" title="대표전화"><br>
		
		<label>사업내용 : </label><input type="text" name="business_info" id="business_info" title="사업내용"><br>
		
		<label>직원 수 : </label><input type="text" name="employee_num" id="employee_num" name="직원 수"><br>
		
		<label>기숙사제공유무 : </label><input type="radio" name="domitory" id="domitory" name="기숙사제공유무" value="기숙사 제공 함">기숙사 제공 함
		<input type="radio" name="domitory" value="기숙사 제공 하지 않음">기숙사 제공 하지 않음
		<input type="radio" name="domitory" value="회사 내규에 따름(협의)">회사 내규에 따름(협의)
		<br>
		
		<label>식사 : </label><input type="radio" name="meals" id="meals" name="식사"  value="제공안함">제공안함
		<input type="radio" name="meals" value="중식제공">중식제공
		<input type="radio" name="meals" value="2식제공">2식제공
		<input type="radio" name="meals" value="3식제공">3식제공
		<input type="radio" name="meals" value="회사 내규에 따름(협의)">회사 내규에 따름(협의)
		<br>
		
		<input type="button" onclick="signInClick()" value="회원가입">
	</form>
	<!-- 
	<label>지역 : </label>
		<select name="do_kor" id="do_kor">
			<c:forEach items="${addrDoMap}" var="do_kor">
				<option class="${do_kor.key}">${do_kor.value}</option>
			</c:forEach>
		</select>
		<select name="gu_gun_eup_kor" id="gu_gun_eup_kor">
		</select><br>
	 -->
</body>
</html>