<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
		width: 100%;
	}
	tr,td,th {
		height: 50px;
	}
</style>
<script type="text/javascript" src="resources/js/hire/hireDetail.js"></script>

</head>
<body>

<table>
	<tr>
		<th>Post Date</th>
		<td>${hireVO.regdate}</td>
	</tr>
</table>

<h1>Company Information</h1>
<hr>
<table border>
	<tr>
		<th>Company Name</th>
		<td>${companyVO.company_name}</td>
		<th>CEO</th>
		<td>${companyVO.ceo_name}</td>
	</tr>
	<tr>
		<th>Business Type</th>
		<td>${companyVO.cate_prnt_en} > ${companyVO.cate_child_en}</td>
		<th>Company Size(No. of employees)</th>
		<td>${companyVO.employee_num}</td>
	</tr>
	<tr>
		<th>Address</th>
		<td colspan="3">${companyVO.address_en}</td>
	</tr>
</table>
<hr>
<br><br><br>

<h1>Recruitment Information</h1>
<hr>
<table border>
	<tr>
		<th>Job Title</th>
		<td colspan="3">${hireVO.title}</td>
	</tr>
	
	<tr>
		<th>Job type</th>
		<td colspan="3">${hireVO.cate_prnt_en}  ${hireVO.cate_child_en}</td>
	</tr>
	<tr>
		<th>Location</th>
		<c:choose>
		<c:when test="${empty hireVO.gu_gun_eup_eng}">
			<td colspan="3">N/A</td>
		</c:when>
		<c:otherwise>
		<td colspan="3">${hireVO.do_en}, ${hireVO.gu_gun_eup_eng}</td>
		</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<th>Working Hours</th>
		<td colspan="3">${hireVO.work_time}</td>
	</tr>
	<tr>
		<th>Salary</th>
		<td colspan="3">${hireVO.payment_codition}
			${hireVO.salary_min} - ${hireVO.salary_max}
			[${hireVO.payment_detail}]
		</td>
	</tr>
	<tr>
		<th>No. of open position</th>
		<td>${hireVO.hire_number}</td>
	
		<th>preferred age</th>
		<td>${hireVO.hire_age_min} - ${hireVO.hire_age_max}</td>
	</tr>
	<tr>
		<th>Education</th>
		<td>${hireVO.education}</td>
		
		<th>Major</th>
		<td>${hireVO.major}</td>
	</tr>
	<tr>
		<th>Work Experience</th>
		<td colspan="3">${hireVO.experience}</td>
	</tr>
	<tr>
		<th>Foreign language</th>
		<td>${hireVO.foreign_language}</td>
		
		<th>Other preferential skills</th>
		<td>${hireVO.prefer_skills}</td>
	</tr>
	<tr>
		<th>Dormitory</th>
		<td>${hireVO.domitory}</td>
		
		<th>Meals</th>
		<td>${hireVO.meals}</td>
	</tr>
	<tr>
		<th>4 major insurance</th>
		<td colspan="3">${hireVO.insurance}</td>
	</tr>
	<tr>
		<th>Other information</th>
		<td colspan="3">${hireVO.work_detail}</td>
	</tr>
	<tr>
		<th>How to apply</th>
		<td>${hireVO.apply_way}</td>
		
		<th>Required documents/
			preparation materials</th>
		<td>${hireVO.prepare_doc}</td>
	</tr>
	<%--  --%>
</table>

<p>
	Koreigners User Guide
	▪ If you wish to apply for the above job posting, please click the [Apply for employment] button below, or send your resume to the e-mail address listed above.
	▪ If you want to save this post, please click the [Save as My Wish List] button below. You can see the post in my page.
</p>

<hr>
<br><br><br><br>
<input type="button" value="Apply for employment">

<input type="button" onclick="wishList(${hireVO.hire_idx},'${hireVO.mem_id}')" value="Save My WishList">

</body>
</html>