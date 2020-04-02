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
<link href="resources/css/member/mypageCompany.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">

	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="bootstrap/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="bootstrap/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="bootstrap/css/custom.css">

</head>

<body>


 <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>
                	<a class="navbar-brand" href="#">MYPAGE</a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item">
                        <img class="icon" src="resources/img/common/setting.png">
                        <a class="nav-link" href="myPage_go.do?type=profile">Profile Setting</a></li>
                        <li class="nav-item">
                        <img class="icon2" src="resources/img/common/people.png">
                        <a class="nav-link" href="myPage_go.do?type=hire">My Recruitment</a></li>
                        <li class="nav-item">
                        <img class="icon" src="resources/img/common/document.png">
                        <a class="nav-link" href="myPage_go.do?type=applier">My Applicants</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Profile Setting</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    
	<form action="updateComp.do" name="form" id="regForm" method="post" enctype="multipart/form-data" >
		<div class="cart-box-main">
		  <div class="container">
		    <div class="row">
		      <div class="col-sm-6 col-lg-6 mb-3">
		        <div class="shipping-method-box">
		        	<div class="mb-4">
			        	<div class="title-left">
			        		<h3>비밀번호 변경</h3>
			        	</div>
			        	<div class="row">
				        	<div class="col-md-12 mb-3">
		                        <label for="current-password">현재 비밀번호 </label>
		                        <input type="password" class="form-control" id="curPw">
		                        <span id="getMemberPw"></span>
		                    </div>
			        	</div>
			        	<div class="row">
			        		<div class="col-md-12 mb-3">
					        	<label>새 비밀번호</label>
					        	<input type="password" class="form-control" id="newPw" name="mem_pw">
			        		</div>
			        	</div>
			        	<div class="row">
			        		<div class="col-md-12 mb-3">
			        			<label>새 비밀번호 확인</label>
			        			<input type="password" class="form-control" id="rePw">
	                        	<span id="checkPw"></span>
			        		</div>
			        	</div>
		        	</div>
		        	<div class="mb-4">
	                    <div class="title-left">
			        		<h3>기본정보</h3>
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
		      <div class="col-sm-6 col-lg-6 mb-3">
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
		        	<div class="mb-1">
			            <div class="title-left">
			        		<h3>기숙사 제공 여부</h3>
			        	</div>
			        	<div class="mb-0">
			        	<br><br><br>
	                       	<label for="dormitory">Dormitory</label>
	                           	<div class="custom-control custom-radio">
	                           		<input name="domitory" type="radio" id="domitory0" class="custom-control-input" value="기숙사 제공 함" <c:if test="${company.domitory eq '기숙사 제공 함'}">checked</c:if>>
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
		                 <br><br><br>
			             </div>
		        	</div>
		        	<div class="mb-1">
			            <div class="title-left">
			        		<h3>식사 제공 여부</h3>
			        	</div>
			        	<div class="mb-0">
			        	<br><br>
	                       	<label for="salary">Meals</label>
                           	<div class="custom-control custom-radio">
                           		<input name="meals" type="radio" id="meals0" class="custom-control-input" value="제공안함"  <c:if test="${company.meals eq '제공안함'}">checked</c:if>>
                           		<label class="custom-control-label" for="meals0">제공 안함</label>
                            </div>
                            <div class="custom-control custom-radio">
			                    <input name="meals" type="radio" id="meals1" class="custom-control-input" value="중식제공" <c:if test="${company.meals eq '중식제공'}">checked</c:if>>
			                    <label class="custom-control-label" for="meals1">중식 제공</label>
	                    	</div>
	                    	<div class="custom-control custom-radio">
			                    <input name="meals" type="radio" id="meals2" class="custom-control-input" value="2식제공" <c:if test="${company.meals eq '2식제공'}">checked</c:if>>
			                    <label class="custom-control-label" for="meals2">2식 제공</label>
	                    	</div>
	                    	<div class="custom-control custom-radio">
			                    <input name="meals" type="radio" id="meals3" class="custom-control-input" value="3식제공" <c:if test="${company.meals eq '3식제공'}">checked</c:if>>
			                    <label class="custom-control-label" for="meals3">3식 제공</label>
	                    	</div>
	                    	<div class="custom-control custom-radio">
			                    <input name="meals" type="radio" id="meals4" class="custom-control-input" value="회사 내규에 따름(협의)" <c:if test="${company.meals eq '회사 내규에 따름(협의)'}">checked</c:if>>
			                    <label class="custom-control-label" for="meals4">회사 내규에 따름(협의)</label>
	                    	</div>
		                 <br><br>
			             </div>
		        	</div>
			      </div>
		      </div>
		    </div>
		  </div>
		  <p align="center">
			<button type="submit" class="btn hvr-hover">수정</button>
		  </p>
		
		
	
		<input type="hidden" id="do_kor" name="do_kor" style="width: 10%;" value="" placeholder="상세주소">
	    <input type="hidden" id="gu_gun_eup_kor" name="gu_gun_eup_kor" style="width: 10%;" value="" placeholder="상세주소">
	    <input type="hidden" id="do_en" name="do_en" style="width: 10%;" value="" placeholder="상세주소">
	    <input type="hidden" id="gu_gun_eup_en" name="gu_gun_eup_eng" style="width: 10%;" value="" placeholder="상세주소">
	    
	    </div>
	</form>


	<!-- ALL JS FILES -->
    <script src="bootstrap/js/jquery-3.2.1.min.js"></script>
    <script src="bootstrap/js/popper.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="bootstrap/js/jquery.superslides.min.js"></script>
    <script src="bootstrap/js/bootstrap-select.js"></script>
    <script src="bootstrap/js/inewsticker.js"></script>
    <script src="bootstrap/js/bootsnav.js."></script>
    <script src="bootstrap/js/images-loded.min.js"></script>
    <script src="bootstrap/js/isotope.min.js"></script>
    <script src="bootstrap/js/owl.carousel.min.js"></script>
    <script src="bootstrap/js/baguetteBox.min.js"></script>
    <script src="bootstrap/js/form-validator.min.js"></script>
    <script src="bootstrap/js/contact-form-script.js"></script>
    <script src="bootstrap/js/custom.js"></script>
</body>
</html>