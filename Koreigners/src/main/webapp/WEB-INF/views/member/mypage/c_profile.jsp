<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
<link href="resources/css/job/regCompany.css" rel="stylesheet" type="text/css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/daumAddr.js"></script>
<script type="text/javascript" src="resources/js/companySignup.js"></script>
<link href="resources/css/member/register.css" rel="stylesheet" type="text/css">
<style>
	#regCotent{
		height: auto;
		padding-top: 50px;
	}
	table#regCom{
		width: 100%;
		height: auto;
		border-top: 2px solid black;
	}
	table#regCom tr {border-bottom: 1px solid black;}
	#titleText{font-size: 30px; font-weight: 400;}
	#titleText2{font-size: 17px; font-weight: 500;}
	.title {width: 12%; height: 70px;}
	.contents {width: 88%; height: 70px;}
	#flag {width : 20px; height : 20px; border:0}
	div ul {list-style: none; margin:0; padding:0;}
	li.tabs { margin: 0 0 0 0;padding: 0 0 0 0;border:0;float: left; border: 1px soild black;}
</style>
</head>

<body>
<div>
	<ul>
		<li class="tabs"><a href="myPage_go.do?type=profile">My 개인정보 수정</a></li>
		<li class="tabs"><a href="myPage_go.do?type=hire">My 채용 공고</a></li>
		<li class="tabs"><a href="myPage_go.do?type=applier">My 입사지원자</a></li>
	</ul>
</div>
<br><br><br><br><br><br><br><br>
<div id="regCotent">
<form action="join_conf.do" name="form" id="regForm" method="post" enctype="multipart/form-data" >
	<p id="titleText">Registration of Search Firm membership</p>
	<br><br><br><br>
	
	<p id="titleText2">
		<img id="flag" src="resources/common/flag.png">
		Application for Search Firm membership(required field)
	</p>
	<br>
	<table id="regCom">
		<tr>
			<td class="title"><label>비밀번호 : </label></td>
			<td class="contents"><input type="password" name="mem_pw" id="password"  class="input_box" value=""></td>
		</tr>
		<tr>
			<td class="title"><label>비밀번호 확인 : </label></td>
			<td class="contents"><input type="password" name="conf_password"  class="input_box" id="conf_password" value=""><div id="pw_check"></div></td>
		</tr>
		<tr>
			<td class="title"><label>회사명 : </label></td>
			<td class="contents"><input type="text" name="company_name" id="company_name"  class="input_box" value="${company.company_name}"></td>
		</tr>
		<tr>
			<td class="title"><label>직종선택 : </label></td>
			<td class="contents">
				<select name="cate_prnt_ko" id="selectBox1" value="직종선택">
					<c:forEach items="${jobCateMap}" var="option">
						<option class="${option.key}">${option.value}</option>
					</c:forEach>
				</select>
				<select name="cate_child_ko" value="직종선택"  id="cate_child_ko">
				</select> 
			</td>
		</tr>
		<tr>
			<td class="title"><label>한글주소 : </label></td>
			<td class="contents"><input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><input type="text" id="address" name="address"  class="input_box" style="width: 50%;" value="" placeholder="주소"></td>
		</tr>
		<tr>
			<td class="title"><label>한글 상세주소 : </label></td>
			<td class="contents"><input type="text" id="addr_dt_kor" name="addr_dt_kor" class="input_box" class="input_box" style="width: 20%;" value="" placeholder="상세주소"></td>
		</tr>
		<tr>
			<td class="title"><label>영어주소 : </label></td>
			<td class="contents"><input type="text" id="address_en" name="address_en" style="width: 50%;" value="" class="input_box" placeholder="주소en"></td>
		</tr>
		<tr>
			<td class="title"><label>영어 상세주소 : </label></td>
			<td class="contents">
				<input type="text" id="addr_dt_en" name="addr_dt_en" style="width: 20%;" value="" class="input_box" placeholder="상세주소en">
			</td>
		</tr>
		<tr>
			<td class="title"><label>사업자번호 : </label></td>
			<td class="contents"><input type="text" name="business_num" id="business_num" class="input_box" value="사업자번호"></td>
		</tr>
		<tr>
			<td class="title"><label>사업자등록증 : </label></td>
			<td class="contents"><input type="file" name="business_file" id="business_file" class="input_box" value="사업자등록증" /></td>
		</tr>
		<tr>
			<td class="title"><label>인사담당자 : </label></td>
			<td class="contents"><input type="text" name="hr_manager" id="hr_manager" class="input_box" value="인사담당자"></td>
		</tr>
		<tr>
			<td class="title"><label>담당자 메일 : </label></td>
			<td class="contents"><input type="text" name="manager_email" id="manager_email" value="담당자 메일"></td>
		</tr>
		<tr>
			<td class="title"><label>대표전화 : </label></td>
			<td class="contents"><input type="text" name="company_telephone" id="company_telephone" class="input_box" value="대표전화"></td>
		</tr>
		<tr>
			<td class="title"><label>사업내용 : </label></td>
			<td class="contents"><input type="text" name="business_info" id="business_info" class="input_box" value="사업내용"></td>
		</tr>
		<tr>
			<td class="title"><label>직원 수 : </label></td>
			<td class="contents"><input type="text" name="employee_num" id="employee_num" class="input_box" name="직원 수" value="직원수"></td>
		</tr>
		<tr>
			<td class="title"><label>기숙사제공유무 : </label></td>
			<td class="contents"><input type="radio" name="domitory" id="domitory" value="기숙사 제공 함">기숙사 제공 함
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
			<td class="title"></td>
			<td class="contents"></td>
		</tr>
	</table>

	<input type="submit" value="회원가입">
	<input type="hidden" id="do_kor" name="do_kor" style="width: 10%;" value="" placeholder="상세주소">
    <input type="hidden" id="gu_gun_eup_kor" name="gu_gun_eup_kor" style="width: 10%;" value="" placeholder="상세주소">
    <input type="hidden" id="do_en" name="do_en" style="width: 10%;" value="" placeholder="상세주소">
    <input type="hidden" id="gu_gun_eup_en" name="gu_gun_eup_eng" style="width: 10%;" value="" placeholder="상세주소">
    
     
</form>

</div>
</body>
</html>