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
		        	<div class="title-left">
		        		<h3>비밀번호 변경</h3>
		        	</div>
		        	<div class="mb-3">
                        <label for="current-password">현재 비밀번호 </label>
                        <input type="password" class="form-control" id="curPw">
                        <span id="getMemberPw"></span>
                    </div>
                    <div class="mb-3">
                        <label for="new-password">새 비밀번호 </label>
                        <input type="password" class="form-control" id="newPw" name="mem_pw">
                    </div>
                    <div class="mb-3">
                        <label for="re-enter-password">새 비밀번호 확인 </label>
                        <input type="password" class="form-control" id="rePw">
                        <span id="checkPw"></span>
                    </div>
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
		        	<div class="mb-3">
	        			<label>대표전화</label>
	        			<input type="text" name="company_telephone" id="company_telephone" class="form-control" value="${company.company_telephone }">
		        	</div>
		        </div>
		      </div>
		      <div class="col-sm-6 col-lg-6 mb-3">
			      <div class="shipping-method-box">
			      </div>
		      </div>
		    </div>
		  </div>
		
		<table id="regCom">
			
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
				<td class="contents"><input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><input type="text" id="address" name="address"  class="input_box" style="width: 50%;" value="${company.address}" placeholder="주소"></td>
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