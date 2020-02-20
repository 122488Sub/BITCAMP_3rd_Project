<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<label>근무 형태 : </label>
	<input type="radio" name="domitory" id="domitory" name="기숙사제공유무" value="기숙사 제공 함">기숙사 제공 함
	<input type="radio" name="domitory" value="기숙사 제공 하지 않음">기숙사 제공 하지 않음
	<input type="radio" name="domitory" value="회사 내규에 따름(협의)">회사 내규에 따름(협의)
	
	
	
	<h2>Company Infomation</h2>
	<label>회사명 : </label><input type="text" name="company_name" id="company_name" title="회사명"><br><br>
	<label>대표자명 : </label><input type="text" name="ceo_name" id="ceo_name" title="대표자명"><br><br>
	<label>직종선택 : </label>
	<select name="cate_prnt_ko" id="selectBox1" title="직종선택">
		<c:forEach items="${jobCateMap}" var="option">
			<option class="${option.key}">${option.value}</option>
		</c:forEach>
	</select>
	<label>직원 수 : </label><input type="text" name="employee_num" id="employee_num" name="직원 수"><br><br>
	
	<h2>Contact information</h2>
	<label>인사담당자 : </label><input type="text" name="hr_manager" id="hr_manager" title="인사담당자"><br><br>
	
	<label>담당자 메일 : </label><input type="text" name="manager_email" id="manager_email" title="담당자 메일"><br><br>
	<label>대표전화 : </label><input type="text" name="company_telephone" id="company_telephone" title="대표전화"><br><br>
	
	
</body>
</html>