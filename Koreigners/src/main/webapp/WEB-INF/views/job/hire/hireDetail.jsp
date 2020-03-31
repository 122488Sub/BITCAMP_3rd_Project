<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#detailContents { float: left; text-align: center; width:100%;}
	table {
		 display: table;
		text-align: center;
		width: 80%;
		margin: auto;
	}
	tr,td,th {
		height: 50px;
	}
	#explain{width: 80%;margin: auto;display: table;text-align: left;border: 1px solid black; font-weight: 600; padding-top:20px; padding-bottom: 20px;}
	#titleGuide{font-size:20px; font-weight:800;}
	p {margin-bottom: 10px;}
</style>
<link href="resources/css/member/resume.css" rel="stylesheet" type="text/css">
<link href="resources/css/common/button.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/hire/hireDetail.js"></script>
<script type="text/javascript" src="resources/js/hire/applyEmployment.js"></script>
<script type="text/javascript" src="resources/js/common/togleWish.js"></script>
<script type="text/javascript" src="resources/js/common/post_go.js"></script>
</head>
<body>
<div id="detailContents">
<table>
	<tr>
		<th>Post Date</th>
		<td>${hireVO.regdate}</td>
	</tr>
</table>
<hr>


<table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0">
<caption>
Company Information
</caption>
	<tr>
		<th>Company Name</th>
		<td width="30%" class="txLeft">${companyVO.company_name}</td>
		<th width="10%">CEO</th>
		<td width="30%" class="txLeft">${companyVO.ceo_name}</td>
	</tr>
	<tr>
		<th>Business Type</th>
		<td width="30%" class="txLeft">${companyVO.cate_prnt_en} > ${companyVO.cate_child_en}</td>
		<th width="15%">Company Size<br>(No. of employees)</th>
		<td width="30%" class="txLeft">${companyVO.employee_num}</td>
	</tr>
	<tr>
		<th>Address</th>
		<td colspan="3" width="30%" class="txLeft">${companyVO.address_en}</td>
	</tr>
</table>

<table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0">
<caption>
Recruitment Information
</caption>
	<tr>
		<th>Job Title</th>
		<td colspan="3" width="30%">${hireVO.title}</td>
	</tr>
	
	<tr>
		<th>Job type</th>
		<td colspan="3" width="30%">${hireVO.cate_prnt_en}  ${hireVO.cate_child_en}</td>
	</tr>
	<tr>
		<th>Location</th>
		<c:choose>
		<c:when test="${empty hireVO.gu_gun_eup_eng}">
			<td colspan="3" width="30%">N/A</td>
		</c:when>
		<c:otherwise>
		<td colspan="3" width="30%">${hireVO.do_en}, ${hireVO.gu_gun_eup_eng}</td>
		</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		<th>Working Hours</th>
		<td colspan="3" width="30%">${hireVO.work_time}</td>
	</tr>
	<tr>
		<th>Salary</th>
		<td colspan="3" width="30%">${hireVO.payment_codition}
			${hireVO.salary_min} - ${hireVO.salary_max}
			[${hireVO.payment_detail}]
		</td>
	</tr>
	<tr>
		<th>No. of open position</th>
		<td width="30%" class="txLeft">${hireVO.hire_number}</td>
	
		<th>preferred age</th>
		<td width="30%" class="txLeft">${hireVO.hire_age_min} - ${hireVO.hire_age_max}</td>
	</tr>
	<tr>
		<th>Education</th>
		<td width="30%" class="txLeft">${hireVO.education}</td>
		
		<th>Major</th>
		<td width="30%" class="txLeft">${hireVO.major}</td>
	</tr>
	<tr>
		<th>Work Experience</th>
		<td colspan="3" width="30%" class="txLeft">${hireVO.experience}</td>
	</tr>
	<tr>
		<th>Foreign language</th>
		<td width="30%" class="txLeft">${hireVO.foreign_language}</td>
		
		<th>Other preferential skills</th>
		<td width="30%" class="txLeft">${hireVO.prefer_skills}</td>
	</tr>
	<tr>
		<th>Dormitory</th>
		<td width="30%" class="txLeft">${hireVO.domitory}</td>
		
		<th>Meals</th>
		<td width="30%" class="txLeft">${hireVO.meals}</td>
	</tr>
	<tr>
		<th>4 major insurance</th>
		<td colspan="3" width="30%" class="txLeft">${hireVO.insurance}</td>
	</tr>
	<tr>
		<th>Other information</th>
		<td colspan="3" width="30%" class="txLeft">${hireVO.work_detail}</td>
	</tr>
	<tr>
		<th>How to apply</th>
		<td width="30%" class="txLeft">${hireVO.apply_way}</td>
		
		<th>Required documents/
			preparation materials</th>
		<td width="30%" class="txLeft">${hireVO.prepare_doc}</td>
	</tr>
	<%--  --%>
</table>
<br><br>
	<p id="titleGuide">Koreigners User Guide</p><br>
	<div id="explain">
	<p>▪ If you wish to apply for the above job posting, please click the [Apply for employment] button below,</p> 
	<p>&nbsp;&nbsp;&nbsp;or send your resume to the e-mail address listed above.</p>
	<p>▪ If you want to save this post, please click the [Save as My Wish List] button below. You can see the post in my page.</p>
</div>
<hr>
<br><br><br><br>
<input type="button" class="btn59acff" onclick="clickApplyEmployment('${user.mem_id}',${hireVO.company_idx},${hireVO.hire_idx})" value="Apply for employment">
<!--  
<input type="button" onclick="wishList(${hireVO.hire_idx},'${user.mem_id}')" value="Save My WishList">
-->
<input type="button" class="btn59acff"  onclick="clickWishList('${user.mem_id}',${hireVO.hire_idx},2)" value="Save My WishList">
</div>
</body>
</html>