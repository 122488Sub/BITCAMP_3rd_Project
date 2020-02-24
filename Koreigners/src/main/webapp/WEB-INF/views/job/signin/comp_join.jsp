<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="resources/css/job/regCompany.css" rel="stylesheet" type="text/css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/daumAddr.js"></script>
<script type="text/javascript" src="resources/js/companySignup.js"></script>


<style>
	#regCotent{
		height: 1000px;
		padding-top: 50px;
	}
	
</style>
</head>

<body>

<div id="regCotent">
<form action="join_conf.do" name="form" id="regForm" method="post" enctype="multipart/form-data" >

	<label>아이디 : </label><input type="text" name="mem_id" id="mem_id" title="아이디"><div id="id_check"></div><br><br>
	<label>비밀번호 : </label><input type="password" name="mem_pw" id="password" title="비밀번호"><br><br>
	<label>비밀번호 확인 : </label><input type="password" name="conf_password" id="conf_password" title="비밀번호 확인"><div id="pw_check"></div><br><br>
	<label>회사명 : </label><input type="text" name="company_name" id="company_name" title="회사명"><br><br>
	<label>대표자명 : </label><input type="text" name="ceo_name" id="ceo_name" title="대표자명"><br><br>
	
	<label>직종선택 : </label>
	<select name="cate_prnt_ko" id="selectBox1" title="직종선택">
		<c:forEach items="${jobCateMap}" var="option">
			<option class="${option.key}">${option.value}</option>
		</c:forEach>
	</select>
	
	<select name="cate_child_ko" title="직종선택"  id="cate_child_ko">
	</select><br><br>
	
     <input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br><br>
     <label>한글주소 : </label><input type="text" id="address" name="address" style="width: 10%;" value="" placeholder="주소"><br><br>
     <label>한글 상세주소 : </label><input type="text" id="addr_dt_kor" name="addr_dt_kor" style="width: 10%;" value="" placeholder="상세주소"><br><br>
    
     <label>영어주소 : </label><input type="text" id="address_en" name="address_en" style="width: 10%;" value="" placeholder="주소en"><br><br>
     <label>영어 상세주소 : </label><input type="text" id="addr_dt_en" name="addr_dt_en" style="width: 10%;" value="" placeholder="상세주소en"><br><br>
	
	<label>사업자번호 : </label><input type="text" name="business_num" id="business_num" title="사업자번호"><br><br>
	
	<label>사업자등록증 : </label><input type="file" name="business_file" id="business_file" title="사업자등록증" /><br><br>
	
	<label>인사담당자 : </label><input type="text" name="hr_manager" id="hr_manager" title="인사담당자"><br><br>
	
	<label>담당자 메일 : </label><input type="text" name="manager_email" id="manager_email" title="담당자 메일"><br><br>
	
	<label>대표전화 : </label><input type="text" name="company_telephone" id="company_telephone" title="대표전화"><br><br>
	
	<label>사업내용 : </label><input type="text" name="business_info" id="business_info" title="사업내용"><br><br>
	
	<label>직원 수 : </label><input type="text" name="employee_num" id="employee_num" name="직원 수"><br><br>
	
	<label>기숙사제공유무 : </label><input type="radio" name="domitory" id="domitory" value="기숙사 제공 함">기숙사 제공 함
	<input type="radio" name="domitory" value="기숙사 제공 하지 않음">기숙사 제공 하지 않음
	<input type="radio" name="domitory" value="회사 내규에 따름(협의)">회사 내규에 따름(협의)
	<br><br>
	
	<label>식사 : </label><input type="radio" name="meals" id="meals" name="식사"  value="제공안함">제공안함
	<input type="radio" name="meals" value="중식제공">중식제공
	<input type="radio" name="meals" value="2식제공">2식제공
	<input type="radio" name="meals" value="3식제공">3식제공
	<input type="radio" name="meals" value="회사 내규에 따름(협의)">회사 내규에 따름(협의)
	<br><br>
	
	<!--  <input type="button" onclick="signInClick()" value="회원가입">-->
	 <input type="submit" value="회원가입">
	<input type="hidden" id="do_kor" name="do_kor" style="width: 10%;" value="" placeholder="상세주소">
    <input type="hidden" id="gu_gun_eup_kor" name="gu_gun_eup_kor" style="width: 10%;" value="" placeholder="상세주소">
    <input type="hidden" id="do_en" name="do_en" style="width: 10%;" value="" placeholder="상세주소">
    <input type="hidden" id="gu_gun_eup_en" name="gu_gun_eup_eng" style="width: 10%;" value="" placeholder="상세주소">
    
</form>

</div>
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