<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="resources/css/job/hireWrite.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/hire/hireWrite.js"></script>
<script type="text/javascript" src="resources/js/daumAddr.js"></script>
<link href="resources/css/member/register.css" rel="stylesheet" type="text/css">

</head>
<style>
	select.input_box {height: 40px; color: black;}
	input.input_box {width:50%}
	table#regCom{
		width: 100%;
		height: auto;
		border-top: 2px solid black;
	}
	table#regCom tr {border-bottom: 1px solid black;}
	#titleText{font-size: 30px; font-weight: 400;}
	#titleText2{font-size: 17px; font-weight: 500;}
	.title {width: 14%; height: 70px;}
	.contents {width: 86%; height: 70px;}
	#flag {width : 20px; height : 20px; border:0}
</style>
<body>
<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Hire Posting</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
<br><br><br><br>

<form action="hirePost.do" method="post">
<p id="titleText">채용 공고 등록</p>
<p id="titleText">Post of Search Firm membership</p>
	<br><br><br><br>
	
	<p id="titleText2">
		<img id="flag" src="resources/common/flag.png">
		채용 공고 정보 입력
	</p>
	<br>
<table id="regCom">
		<tr>
			<td class="title">	<label>근무 형태 : </label></td>
			<td class="contents"><input type="radio" name="work_type" id="work_type" value="정규직">정규직
				<input type="radio" name="work_type" value="계약직">계약직
				<input type="radio" name="work_type" value="아르바이트">아르바이트
			</td>
		</tr>
		<tr>
		<td class="title"><label>제목 : </label></td>
		<td class="contents">
			<input type="text" class="input_box" name="title" id="title" title="title"></td>
		</tr>
		<tr>
		<td class="title"><label>채용직종 : </label></td>
		<td class="contents">
			<select class="input_box" name="cate_prnt_ko" id="selectBox1" title="직종선택">
				<c:forEach items="${jobWriteCate}" var="option">
					<option class="${option.key}">${option.value}</option>
				</c:forEach>
			</select>
			<select class="input_box" name="cate_child_ko" title="직종선택"  id="cate_child_ko">
			</select>
		</td>
		</tr>
		<tr>
			<td class="title"><label>근무지역</label></td>
			<td class="contents">
			</td>
		</tr>
		<tr>
			<td class="title"><label>한글주소 : </label></td>
			<td class="contents">
				<input type="text" id="address" class="input_box" name="address" style="width: 30%;" value="" placeholder="주소">
				<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기">
	   		</td>
		</tr>
		<tr>
			<td class="title"> <label>한글 상세주소 : </label></td>
			<td class="contents"><input type="text" id="addr_dt_kor" class="input_box" name="addr_dt_kor" style="width: 15%;" value="" placeholder="상세주소">
	    	</td>
		</tr>
		<tr>
			<td class="title"><label>영어주소 : </label></td>
			<td class="contents"><input type="text" id="address_en" class="input_box" name="address_en" style="width: 30%;" value="" placeholder="주소en">
	    	</td>
		</tr>
		<tr>
			<td class="title"><label>영어 상세주소 : </label></td>
			<td class="contents"><input type="text" id="addr_dt_en" class="input_box" name="addr_dt_en" style="width: 15%;" value="" placeholder="상세주소en">
			</td>
		</tr>
		<tr>
			<td class="title"> <label>근무시간 : </label></td>
			<td class="contents"><input type="text" id="work_time" class="input_box" name="work_time" style="width: 15%;" placeholder="근무시간">
			</td>
		</tr>
		<tr>
			<td class="title"><label>임금조건 : </label></td>
			<td class="contents">
				<input type="radio" name="payment_codition" id="hour" value="hour">시급
				<input type="radio" name="payment_codition" id="day" value="day">일당
				<input type="radio" name="payment_codition" id="month" value="month">월급
				<input type="radio" name="payment_codition" id="year" value="year">연봉
				<input type="radio" name="payment_codition" id="companyLaw" value="companyLaw">회사내규
			</td>
		</tr>
		<tr>
		<td class="title"></td>
			<td class="contents">
				<input type="text" class="input_box" name="salary_min" id="salary_min" placeholder="임금 최저" style="width: 15%;"> -
				<input type="text" class="input_box" name="salary_max" id="salary_max" placeholder="임금 최고" style="width: 15%;">
			</td>
		</tr>
		<tr>
			<td class="title"><label>임금상세조건 : </label></td>
			<td class="contents"><input type="text" class="input_box" name="payment_detail" id="payment_detail" style="width: 30%;"  placeholder="자세한 사항 입력( 예)면접 후 재조정 가능 )">
			</td>
		</tr>
		<tr>
		<td class="title"><label>채용인원 : </label></td>
		<td class="contents"><input type="text" id="hire_number" class="input_box" name="hire_number" style="width: 15%;" placeholder="채용인원"></td>
		</tr>
		<tr>
			<td class="title"><label>채용연령 : </label>
		</td>
		<td class="contents">
			<input type="text" id="hire_age_min" class="input_box" name="hire_age_min" style="width: 15%;" placeholder="채용 최소 연령"> - 
	    	<input type="text" id="hire_age_max" class="input_box" name="hire_age_max" style="width: 15%;" placeholder="채용 최고 연령">
   	 	</td>
		</tr>
		<tr>
			<td class="title"><label>학력 : </label></td>
			<td class="contents"><input type="text" id="education" class="input_box" name="education" style="width: 30%;" placeholder="학력"></td>
		</tr>
		<tr>
			<td class="title"><label>전공 : </label></td>
			<td class="contents"><input type="text" id="major" class="input_box" name="major" style="width: 30%;" placeholder="전공"><br><br></td>
		</tr>
		<tr>
			<td class="title"><label>경력 : </label></td>
			<td class="contents"><input type="text" id="experience" class="input_box" name="experience" style="width: 30%;" placeholder="경력"></td>
		</tr>
		<tr>
			<td class="title"><label>외국어 : </label></td>
			<td class="contents"><input type="text" id="foreign_language" class="input_box" name="foreign_language" style="width: 30%;" placeholder="외국어"></td>
		</tr>
		<tr>
			<td class="title"><label>기타우대능력 : </label></td>
			<td class="contents"><input type="text" id="prefer_skills" class="input_box" name="prefer_skills" style="width: 30%;" placeholder="기타우대능력"></td>
		</tr>
		<tr>
			<td class="title"><label>기숙사제공유무 : </label></td>
			<td class="contents">
				<input type="radio" name="domitory" id="domitory" value="기숙사 제공 함">기숙사 제공 함
				<input type="radio" name="domitory" value="기숙사 제공 하지 않음">기숙사 제공 하지 않음
				<input type="radio" name="domitory" value="회사 내규에 따름(협의)">회사 내규에 따름(협의)
			</td>
		</tr>
		<tr>
		<td class="title"><label>식사 : </label></td>
		<td class="contents">
			<input type="radio" name="meals" id="meals" name="식사"  value="제공안함">제공안함
			<input type="radio" name="meals" value="중식제공">중식제공
			<input type="radio" name="meals" value="2식제공">2식제공
			<input type="radio" name="meals" value="3식제공">3식제공
			<input type="radio" name="meals" value="회사 내규에 따름(협의)">회사 내규에 따름(협의)
		</td>
		</tr>
		<tr>
		<td class="title"><label>4대보험 : </label></td>
		<td class="contents">
			<input type="checkbox" name="insuranceInfo" value="의료보험">의료보험
			<input type="checkbox" name="insuranceInfo" value="산재보험">산재보험
			<input type="checkbox" name="insuranceInfo" value="고용보험">고용보험
			<input type="checkbox" name="insuranceInfo" value="국민연금보험">국민연금보험
		</td>
		</tr>
		<tr>
		<td class="title"><label>직무내용 : </label></td>
		<td class="contents">
			<textarea id="work_detail"class="input_box" name="work_detail" placeholder="직무내용" cols="50" rows="50" ></textarea>
			<!-- <input type="text" id="work_detail" class="input_box" name="work_detail" style="width: 10%;" placeholder="직무내용"> -->
		</td>
		</tr>
		<tr>
		<td class="title"><label>지원방법(전형방법) : </label></td>
		<td class="contents"><input type="text" id="apply_way" class="input_box" name="apply_way" style="width: 60%;" placeholder="지원방법(전형방법)"></td>
		</tr>
		<tr>
		<td class="title"><label>제출서류/준비물 : </label></td>
		<td class="contents"><input type="text" id="prepare_doc" class="input_box" name="prepare_doc" style="width: 60%;" placeholder="제출서류/준비물 "></td>
		</tr>
		<tr>
		<td class="title"></td>
		<td class="contents"></td>
		</tr>
</table>

<input type="submit" value="채용공고등록">
<!-- 근무지역 hidden -->	
	<input type="hidden" id="do_kor" class="input_box" name="do_kor" style="width: 10%;" value="" placeholder="상세주소">
    <input type="hidden" id="gu_gun_eup_kor" class="input_box" name="gu_gun_eup_kor" style="width: 10%;" value="" placeholder="상세주소">
    <input type="hidden" id="do_en" class="input_box" name="do_en" style="width: 10%;" value="" placeholder="상세주소">
    <input type="hidden" id="gu_gun_eup_en" class="input_box" name="gu_gun_eup_eng" style="width: 10%;" value="" placeholder="상세주소">


<br><br><br><br><br><br><br>




<!-- ------------------------------------------------------------------------------------------------------------------- -->

<%--  
<!-- 근무형태 work_type -->
	<label>근무 형태 : </label>
	<input type="radio" name="work_type" id="work_type" value="정규직">정규직
	<input type="radio" name="work_type" value="계약직">계약직
	<input type="radio" name="work_type" value="아르바이트">아르바이트
	<br><br>

<!-- 제목 title -->	
	<label>제목 : </label>
	<input type="text" class="input_box" name="title" id="title" title="title">
	<br><br>
		
<!-- 채용직종 cate_prnt_ko -->	
	<label>채용직종 : </label>
	<select class="input_box" name="cate_prnt_ko" id="selectBox1" title="직종선택">
		<c:forEach items="${jobWriteCate}" var="option">
			<option class="${option.key}">${option.value}</option>
		</c:forEach>
	</select>
	
	<select class="input_box" name="cate_child_ko" title="직종선택"  id="cate_child_ko">
	</select><br><br>
	
	<!-- 근무지역 address -->		
	<label>근무지역 : </label>
	<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br><br>
    <label>한글주소 : </label><input type="text" id="address" class="input_box" name="address" style="width: 10%;" value="" placeholder="주소"><br><br>
    <label>한글 상세주소 : </label><input type="text" id="addr_dt_kor" class="input_box" name="addr_dt_kor" style="width: 10%;" value="" placeholder="상세주소"><br><br>
    
    <label>영어주소 : </label><input type="text" id="address_en" class="input_box" name="address_en" style="width: 10%;" value="" placeholder="주소en"><br><br>
    <label>영어 상세주소 : </label><input type="text" id="addr_dt_en" class="input_box" name="addr_dt_en" style="width: 10%;" value="" placeholder="상세주소en"><br><br>
<!-- 근무지역 hidden -->	
	<input type="hidden" id="do_kor" class="input_box" name="do_kor" style="width: 10%;" value="" placeholder="상세주소">
    <input type="hidden" id="gu_gun_eup_kor" class="input_box" name="gu_gun_eup_kor" style="width: 10%;" value="" placeholder="상세주소">
    <input type="hidden" id="do_en" class="input_box" name="do_en" style="width: 10%;" value="" placeholder="상세주소">
    <input type="hidden" id="gu_gun_eup_en" class="input_box" name="gu_gun_eup_eng" style="width: 10%;" value="" placeholder="상세주소">
   
<!-- 근무시간 work_time -->    
    <label>근무시간 : </label><input type="text" id="work_time" class="input_box" name="work_time" style="width: 10%;" placeholder="근무시간"><br><br>

<!-- 임금조건 payment_codition --> 
	<label>임금조건 : </label>
	<input type="radio" name="payment_codition" id="hour" value="hour">시급
	<input type="radio" name="payment_codition" id="day" value="day">일당
	<input type="radio" name="payment_codition" id="month" value="month">월급
	<input type="radio" name="payment_codition" id="year" value="year">연봉
	<input type="radio" name="payment_codition" id="companyLaw" value="companyLaw">회사내규
	<br><br>
<!-- 임금조건 salary_min salary_max --> 
	<input type="text" class="input_box" name="salary_min" id="salary_min" placeholder="임금 최저"> -
	<input type="text" class="input_box" name="salary_max" id="salary_max" placeholder="임금 최고">
	<br><br>
	<label>임금상세조건 : </label>
	<input type="text" class="input_box" name="payment_detail" id="payment_detail" placeholder="자세한 사항 입력( 예)면접 후 재조정 가능 )">
	<br><br><br>

<!-- 채용인원 hire_number -->	
	<label>채용인원 : </label><input type="text" id="hire_number" class="input_box" name="hire_number" style="width: 10%;" placeholder="채용인원"><br><br>
    <br><br>
 
<!-- 채용연령 hire_age_min, hire_age_max -->	    
    <label>채용연령 : </label>
    <input type="text" id="hire_age_min" class="input_box" name="hire_age_min" style="width: 10%;" placeholder="채용 최소 연령"> - 
    <input type="text" id="hire_age_max" class="input_box" name="hire_age_max" style="width: 10%;" placeholder="채용 최고 연령"><br><br>
	<br><br>
	
<!-- 학력  education -->		
	<label>학력 : </label>
	<input type="text" id="education" class="input_box" name="education" style="width: 10%;" placeholder="학력"><br><br>
	
<!-- 전공  major -->		
	<label>전공 : </label>
	<input type="text" id="major" class="input_box" name="major" style="width: 10%;" placeholder="전공"><br><br>

<!-- 경력  experience -->			
	<label>경력 : </label>
	<input type="text" id="experience" class="input_box" name="experience" style="width: 10%;" placeholder="경력"><br><br>

<!-- 외국어  foreign_language -->		
	<label>외국어 : </label>
	<input type="text" id="foreign_language" class="input_box" name="foreign_language" style="width: 10%;" placeholder="외국어"><br><br>

<!-- 기타우대능력  prefer_skills -->		
	<label>기타우대능력 : </label>
	<input type="text" id="prefer_skills" class="input_box" name="prefer_skills" style="width: 10%;" placeholder="기타우대능력"><br><br>
	
	<br><br>
	
<!-- 기숙사제공유무  domitory -->		
	<label>기숙사제공유무 : </label><input type="radio" name="domitory" id="domitory" value="기숙사 제공 함">기숙사 제공 함
	<input type="radio" name="domitory" value="기숙사 제공 하지 않음">기숙사 제공 하지 않음
	<input type="radio" name="domitory" value="회사 내규에 따름(협의)">회사 내규에 따름(협의)
	<br><br>
	
<!-- 식사  meals -->	
	<label>식사 : </label><input type="radio" name="meals" id="meals" class="input_box" name="식사"  value="제공안함">제공안함
	<input type="radio" name="meals" value="중식제공">중식제공
	<input type="radio" name="meals" value="2식제공">2식제공
	<input type="radio" name="meals" value="3식제공">3식제공
	<input type="radio" name="meals" value="회사 내규에 따름(협의)">회사 내규에 따름(협의)
	<br><br>
 

<!-- 4대보험  insurance -->		
	<label>4대보험 : </label>
	<input type="checkbox" class="input_box" name="insuranceInfo" value="의료보험">의료보험
	<input type="checkbox" class="input_box" name="insuranceInfo" value="산재보험">산재보험
	<input type="checkbox" class="input_box" name="insuranceInfo" value="고용보험">고용보험
	<input type="checkbox" class="input_box" name="insuranceInfo" value="국민연금보험">국민연금보험
	<br><br>

<!-- 직무내용  work_detail -->		
	<label>직무내용 : </label>
	<input type="text" id="work_detail" class="input_box" name="work_detail" style="width: 10%;" placeholder="직무내용"><br><br>
	
<!-- 지원방법(전형방법)  apply_way -->		
	<label>지원방법(전형방법) : </label>
	<input type="text" id="apply_way" class="input_box" name="apply_way" style="width: 10%;" placeholder="지원방법(전형방법)"><br><br>

<!-- 제출서류/준비물  prepare_doc -->		
	<label>제출서류/준비물 : </label>
	<input type="text" id="prepare_doc" class="input_box" name="prepare_doc" style="width: 10%;" placeholder="제출서류/준비물 "><br><br>
     	
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	 --%>
	
	
	<!-- 
	<h2>Company Information</h2>
	<label>회사명 : </label><input type="text" class="input_box" name="company_name" id="company_name" title="회사명"><br><br>
	<label>대표자명 : </label><input type="text" class="input_box" name="ceo_name" id="ceo_name" title="대표자명"><br><br>
	<label>직종선택 : </label>
	<select class="input_box" name="cate_prnt_ko" id="selectBox1" title="직종선택">
		<c:forEach items="${jobCateMap}" var="option">
			<option class="${option.key}">${option.value}</option>
		</c:forEach>
	</select>
	<label>직원 수 : </label><input type="text" class="input_box" name="employee_num" id="employee_num" class="input_box" name="직원 수"><br><br>
	
	<h2>Contact information</h2>
	<label>인사담당자 : </label><input type="text" class="input_box" name="hr_manager" id="hr_manager" title="인사담당자"><br><br>
	
	<label>담당자 메일 : </label><input type="text" class="input_box" name="manager_email" id="manager_email" title="담당자 메일"><br><br>
	<label>대표전화 : </label><input type="text" class="input_box" name="company_telephone" id="company_telephone" title="대표전화"><br><br>
	 -->
	
</form>
	
</body>
</html>