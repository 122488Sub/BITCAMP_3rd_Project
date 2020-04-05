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
<link href="resources/css/member/register.css" rel="stylesheet" type="text/css">
<style>
	.center {
		float: none;
		margin: 0 auto;
	}
</style>
</head>

<body>

<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Company Registration</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->

	<form action="join_conf.do" name="form" id="regForm" method="post" enctype="multipart/form-data" >
		<div class="cart-box-main">
		  <div class="container">
		      <div class="col-xs-12 col-sm-12 col-lg-6 mb-3 center">
		        <div class="shipping-method-box">
		        	<div class="mb-4">
			        	<div class="title-left">
			        		<h3>기본 정보</h3>
			        	</div>
			        	<div class="row">
				        	<div class="col-md-12 mb-3">
		                        <label>Email(ID)</label>
		                        <input type="text" class="form-control" id="mem_id" name="mem_id">
		                        <div id="id_check"></div>
		                    </div>
			        	</div>
			        	<div class="row">
			        		<div class="col-md-12 mb-3">
					        	<label>새 비밀번호</label>
					        	<input type="password" class="form-control" id="password" name="mem_pw">
					        	<div id="pw_check"></div>
			        		</div>
			        	</div>
		        	</div>
		        	<div class="mb-4">
	                    <div class="title-left">
			        		<h3>기본 회사 정보</h3>
			        	</div>
			        	<div class="row">
			        		<div class="col-md-6 mb-3">
					        	<label>회사명</label>
					        	<input type="text" name="company_name" id="company_name" class="form-control" value="${company.company_name}">
			        		</div>
			        		<div class="col-md-6 mb-3">
			        			<label>사업자번호</label>
			        			<input type="text" name="business_num" id="business_num" class="form-control" value="${company.business_num }">
			        		</div>
			        	</div>
			        	<div class="mb-3">
		        			<label>사업자등록증</label>
		        			<input type="file" name="business_file" id="business_file" class="form-control" value="${company.business_file }">
			        	</div>
			        	<div class="mb-4">
		        			<label>대표전화</label>
		        			<input type="text" name="company_telephone" id="company_telephone" class="form-control" value="${company.company_telephone }">
			        	</div>
		        	</div>
		        	<div class="mb-3">
			        	<div class="title-left">
			        		<h3>주소</h3>
			        	</div>
			        	<div class='mb-3'>
				        	<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기">
			        	</div>
			        	<div class='mb-3'>
				        	<input type="text" id="address" name="address" class="form-control" value="${company.address}" placeholder="한글 주소">
			        	</div>
			        	<div class='mb-3'>
				        	<input type="text" id="addr_dt_kor" name="addr_dt_kor" class="form-control" value="${company.addr_dt_kor }" placeholder="한글 상세 주소">
				        </div>
				        <div class='mb-3'>
				        	<input type="text" id="address_en" name="address_en" class="form-control" value="${company.address_en }" placeholder="영문 주소">
				        </div>
				        <div class='mb-4'>
				        	<input type="text" id="addr_dt_en" name="addr_dt_en" class="form-control" value="${company.addr_dt_en }" placeholder="영문 상세 주소">
			        	</div>
		        	</div>
		        </div>
		      </div>
		      <div class="col-sm-12 col-md-12 col-lg-6 mb-3 center">
			      <div class="shipping-method-box">
			      	<div class="mb-4">
			      	<div class="title-left">
		        		<h3>세부 사항</h3>
		        	</div>
		        		<label for="professional-field">직무 영역</label><br>
	                <div class="row">
	                    <div class="col-md-6 mb-2">
                            <select class="custom-select-box form-control" name="cate_prnt_ko" id="selectBox1" title="직종선택">
							    <c:forEach items="${jobCateMap}" var="option">
								  <option class="${option.key}">${option.value}</option>
								</c:forEach>
							</select>
                     	</div>						
	                    <div class="col-md-6 mb-3">
							<select class="custom-select-box form-control" name="cate_child_ko" title="직종선택"  id="cate_child_ko"></select>
                     	</div>
                    </div>
                    <div class="row">
		        		<div class="col-md-4 mb-3">
				        	<label>인사담당자</label>
				        	<input type="text" name="hr_manager" class="form-control" value="${company.hr_manager}">
		        		</div>
		        		<div class="col-md-8 mb-3">
		        			<label>담당자 이메일</label>
		        			<input type="text" name="manager_email" class="form-control" value="${company.manager_email }">
		        		</div>
		        	</div>
		        	<div class="row">
		        		<div class="col-md-10 mb-3">
				        	<label>사업내용</label>
				        	<input type="text" name="business_info" class="form-control" value="${company.business_info}">
		        		</div>
		        		<div class="col-md-2 mb-3">
		        			<label>직원수</label>
		        			<input type="text" name="employee_num" class="form-control" value="${company.employee_num }">
		        		</div>
		        	</div>
			      	</div>
		        	<div class="mb-5">
			            <div class="title-left">
			        		<h3>기숙사 제공 여부</h3>
			        	</div>
                       	<label for="dormitory" style="font-weight: 700">Dormitory</label>
                           	<div class="custom-control custom-radio">
                           		<input name='domitory' type='radio' id='domitory0' class='custom-control-input' value='기숙사 제공 함' <c:if test='${company.domitory eq "기숙사 제공 함"}'>checked</c:if>>
                           		<label class="custom-control-label" for="domitory0">기숙사 제공 함</label>
                            </div>
                            <div class="custom-control custom-radio">
			                    <input name="domitory" type="radio" id="domitory1" class="custom-control-input" value="기숙사 제공 하지 않음" <c:if test="${company.domitory eq '기숙사 제공 하지 않음'}">checked</c:if>>
			                    <label class="custom-control-label" for="domitory1">기숙사 제공 하지 않음</label>
	                    	</div>
	                    	<div class="custom-control custom-radio">
			                    <input name="domitory" type="radio" id="domitory2" class="custom-control-input" value="회사 내규에 따름(협의)" <c:if test="${company.domitory eq '회사 내규에 따름(협의)'}">checked</c:if>>
			                    <label class="custom-control-label" for="domitory2">회사 내규에 따름(협의)</label>
	                    	</div>
		        	</div>
		        	<div class="mb-5">
			            <div class="title-left">
			        		<h3>식사 제공 여부</h3>
			        	</div>
                       	<label for="salary" style="font-weight: 700">Meals</label>
                          	<div class="custom-control custom-radio">
                          		<input name="meals" type="radio" id="meals0" class="custom-control-input" value="제공안함" 
                          		<c:if test='${company.meals eq "제공안함"}'>checked</c:if>>
                          		<label class="custom-control-label" for="meals0">제공 안함</label>
                           </div>
                           <div class="custom-control custom-radio">
		                    <input name="meals" type="radio" id="meals1" class="custom-control-input" value="중식제공"
		                     <c:if test='${company.meals eq "중식제공"}'>checked</c:if>>
		                    <label class="custom-control-label" for="meals1">중식 제공</label>
                    	</div>
                    	<div class="custom-control custom-radio">
		                    <input name="meals" type="radio" id="meals2" class="custom-control-input" value="2식제공"
		                     <c:if test='${company.meals eq "2식제공"}'>checked</c:if>>
		                    <label class="custom-control-label" for="meals2">2식 제공</label>
                    	</div>
                    	<div class="custom-control custom-radio">
		                    <input name="meals" type="radio" id="meals3" class="custom-control-input" value="3식제공"
		                     <c:if test='${company.meals eq "3식제공"}'>checked</c:if>>
		                    <label class="custom-control-label" for="meals3">3식 제공</label>
                    	</div>
                    	<div class="custom-control custom-radio">
		                    <input name="meals" type="radio" id="meals4" class="custom-control-input" value="회사 내규에 따름(협의)" 
		                    <c:if test='${company.meals eq "회사 내규에 따름(협의)"}'>checked</c:if>>
		                    <label class="custom-control-label" for="meals4">회사 내규에 따름(협의)</label>
                    	</div>
			        </div>
			      </div>
		      </div>
		  </div>
		  <p align="center">
			<button type="submit" class="btn hvr-hover">회원가입</button>
		  </p>
		
		
	
		<input type="hidden" id="do_kor" name="do_kor" style="width: 10%;" value="" placeholder="상세주소">
	    <input type="hidden" id="gu_gun_eup_kor" name="gu_gun_eup_kor" style="width: 10%;" value="" placeholder="상세주소">
	    <input type="hidden" id="do_en" name="do_en" style="width: 10%;" value="" placeholder="상세주소">
	    <input type="hidden" id="gu_gun_eup_en" name="gu_gun_eup_eng" style="width: 10%;" value="" placeholder="상세주소">
	    
	    </div>
	</form>

</body>
</html>