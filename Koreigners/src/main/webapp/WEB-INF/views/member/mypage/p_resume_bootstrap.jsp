<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- Basic -->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="bootstrap/images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="bootstrap/images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="bootstrap/css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="bootstrap/css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="bootstrap/css/custom.css">
    
    <link href="resources/css/member/mypageCompany.css" rel="stylesheet" type="text/css">
    
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/member/resume.css" rel="stylesheet" type="text/css">
	<link href="resources/css/member/mypageCompany.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
	
	<script type="text/javascript" src="resources/js/member/sojaeji.js"></script>

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <!-- Start Main Top -->
    <div class="main-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="our-link">
                        <ul>
                            <li><a href="#"><i class="fa fa-user s_color"></i> My Account</a></li>
                            <li><a href="#"><i class="fas fa-location-arrow"></i> Our location</a></li>
                            <li><a href="#"><i class="fas fa-headset"></i> Contact Us</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="login-box">
						<select id="basic" class="selectpicker show-tick form-control" data-placeholder="Sign In">
							<option>Register Here</option>
							<option>Sign In</option>
						</select>
					</div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Top -->

    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item"><a class="nav-link" href="main.do">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="hireList_go.do">Job</a></li>
                        <li class="nav-item"><a class="nav-link" href="house_main.do">House</a></li>
                        <li class="nav-item"><a class="nav-link" href="resaleList.do">Resale</a></li>
                        <li class="nav-item"><a class="nav-link" href="getInfoBoardList.do">Information</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

 
    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" class="form-control" placeholder="Search">
                <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
            </div>
        </div>
    </div>
    <!-- End Top Search -->
    
    <!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Resume</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->


   <div id="moveBox">
		<ul>
			<li class="tabs">
				<img class="icon" src="resources/img/common/setting.png">&nbsp;
				<a href="myPage_go.do?type=profile">Profile Setting</a>
			</li>
			<li class="tabs" style="background:#E2E2E2;">
				<img class="icon" src="resources/img/common/document.png">&nbsp;
				<a href="myPage_go.do?type=resume">Resume</a>
			</li>
			<li class="tabs">
				<img class="icon" src="resources/img/common/wishlist.png">&nbsp;
				<a href="myPage_go.do?type=wishlist">Wishlist</a>
			</li>
			<li class="tabs">
				<img class="icon" src="resources/img/common/advertisment.png">&nbsp;
				<a href="myPage_go.do?type=ads">My Ads</a>
			</li>
		</ul>
	</div>

    <!-- Start Cart  -->
    <form action="updateMember.do" method="post">
    <div class="cart-box-main">
        <div class="container">
            <div class="row">
	            <div class="col-sm-6 col-lg-6 mb-3">
       	            <div class="col-md-12 col-lg-12">
                        <div class="title-left">
                            <h3>Personal Information</h3>
                        </div>
                        <div class="mb-3">
                            <label for="name">Name *</label>
                            <input type="text" class="form-control" id="name" name="MEM_NAME" value="${map.MEM_NAME }">
                            <input type="hidden" id="mem_id" name="mem_id" value="${mvo.mem_id }">
                        </div>
                        <div class="mb-3">
                            <label for="nationality">Nationality *</label>
                            <div class="input-group">
                            	<c:if test="${not empty mvo.mem_nationality }">
                            	<input type="text" class="form-control" value="${mvo.mem_nationality }" disabled>	
                            	</c:if>
				                <c:if test="${empty mvo.mem_nationality }">
				                	Please fill your profile first.
				                </c:if>
                            </div>
                        </div>
                        <div class="form-row">
	                        <div class="form-group col-md-6">
                             	<label for="gender" class="mb-0">Gender</label>
                            	<c:if test="${not empty mvo.mem_gender }">
	                            	<input type="text" class="form-control" value="${mvo.mem_gender }" disabled>	
                            	</c:if>
				                <c:if test="${empty mvo.mem_gender }">
				                	Please fill your profile first.
				                </c:if> 
	                        </div>
	                        <div class="form-group col-md-6">
                            	<label for="birthday" class="mb-0">Birthday</label>
	                         	<c:if test="${not empty mvo.mem_birth }">
	                            	<input type="text" class="form-control" value="${mvo.mem_birth }" disabled>	
	                            	</c:if>
				                <c:if test="${empty mvo.mem_birth }">
				                	Please fill your profile first.
				                </c:if>    
							</div>
                    	</div>
                        <div class="mb-3">
                            <label for="phone">Cell Phone *</label>
                            <div class="input-group">
                                <c:if test="${not empty mvo.mem_phone }">
                            		<input type="text" class="form-control" value="${mvo.mem_phone }" disabled>	
                            	</c:if>
				                <c:if test="${empty mvo.mem_phone }">
				                	Please fill your profile first.
				                </c:if>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="residence">Residence area *</label>
                            <div class="input-group">
                                <c:if test="${not empty mvo.mem_address }">
                            		<input type="text" class="form-control" value="${mvo.mem_address }" disabled>	
                            	</c:if>
				                <c:if test="${empty mvo.mem_address }">
				                	Please fill your profile first.
				                </c:if>
                            </div>
                        </div>
                   	</div>
                    <div class="col-md-12 col-lg-12">
                    	<div class="title-left">
                        	<h3>Required Fields</h3>
                       	</div>
                        <div class="mb-3">
	                        <label for="working-area">Desired working area *</label><br>
	                        <select name="WISH_DO" id="sido1"></select>
							<select name="WISH_SI" id="gugun1"></select>
						
							<script type="text/javascript">
								new sojaeji('sido1', 'gugun1');
							</script>
							<br>selected: <span class="red">${map.WISH_DO } / ${map.WISH_SI }</span>
                     	</div>
	                    <hr class="mb-1">
	                    <div class="mb-3">
                        	<label for="professional-field">Professional Field *</label><br>
                            <select name="JOB_CATE" id="selectBox1" title="직종선택">
							    <c:forEach items="${mpCateMap}" var="option">
								  <option class="${option.key}">${option.value}</option>
								</c:forEach>
							</select>
						
							<select name="JOB_CATE_CHILD" title="직종선택"  id="cate_child_en"></select>
							<br>selected:  <span class="red">${map.JOB_CATE } / ${map.JOB_CATE_CHILD }</span>
                     	</div>
                        <hr class="mb-1">
                        <div class="mb-3">
                        	<label for="salary">Requested salary *</label>
                            	<div class="custom-control custom-radio">
                              		<input name="SALARY_TYPE" type="radio" id="pay_type0" class="custom-control-input" value="시급"  <c:if test="${map.SALARY_TYPE eq '시급'}">checked</c:if>>
                              		<label class="custom-control-label" for="pay_type0">Hourly pay system</label>
                              	</div>
                              	<div class="custom-control custom-radio">
				                    <input name="SALARY_TYPE" type="radio" id="pay_type1" class="custom-control-input" value="일급" <c:if test="${map.SALARY_TYPE eq '일급'}">checked</c:if>>
				                    <label class="custom-control-label" for="pay_type1">Daily pay system</label>
		                    	</div>
		                    	<div class="custom-control custom-radio">
				                    <input name="SALARY_TYPE" type="radio" id="pay_type2" class="custom-control-input" value="월급" <c:if test="${map.SALARY_TYPE eq '월급'}">checked</c:if>>
				                    <label class="custom-control-label" for="pay_type2">Monthly salary system</label>
		                    	</div>
		                    	<div class="custom-control custom-radio">
				                    <input name="SALARY_TYPE" type="radio" id="pay_type3" class="custom-control-input" value="연봉" <c:if test="${map.SALARY_TYPE eq '연봉'}">checked</c:if>>
				                    <label class="custom-control-label" for="pay_type3">Annual wage system</label>
		                    	</div><br>
		                
				                <input type="text" size="11" maxlength="11" id="pay_amount1" name="REQ_SALARY_MIN" class="num_only2" value="${map.REQ_SALARY_MIN }"> 
				               	~ <input type="text" size="11" maxlength="11" id="pay_amount2" name="REQ_SALARY_MAX" class="num_only2" value="${map.REQ_SALARY_MAX }">won
				                <span class="msg"></span>
		                </div>
                        <hr class="mb-1">
                        <div class="mb-3">
                        	<label for="working-hours">Prefer working hours *</label>
                            	<div class="custom-control custom-radio">
	                               	<input type="radio" class="custom-control-input" name="WORK_TIME" id="work_time_type1" value="Day" <c:if test="${map.WORK_TIME eq 'Day'}">checked</c:if>>
	                              	<label class="custom-control-label" for="work_time_type1">Day</label>
                              	</div>
                                <div class="custom-control custom-radio">
                               		<input type="radio" class="custom-control-input" name="WORK_TIME" id="work_time_type2" value="Night" <c:if test="${map.WORK_TIME eq 'Night'}">checked</c:if>>
                              		<label class="custom-control-label" for="work_time_type2">Night</label>
                              	</div>
                                <div class="custom-control custom-radio">
                               		<input type="radio" class="custom-control-input" name="WORK_TIME" id="work_time_type3" value="ETC(Part-time job)" <c:if test="${map.WORK_TIME eq 'ETC(Part-time job)'}">checked</c:if>>
                              		<label class="custom-control-label" for="work_time_type3">ETC(Part-time job)</label>
                              	</div>
                              	<span id="view_span">
				                    ● Start work time
				                    <select name="WORK_TIME_START" id="work_time_start"><option  value="00:00">00:00</option><option  value="01:00">01:00</option><option  value="02:00">02:00</option><option  value="03:00">03:00</option><option  value="04:00">04:00</option><option  value="05:00">05:00</option><option  value="06:00">06:00</option><option  value="07:00">07:00</option><option  value="08:00">08:00</option><option  value="09:00">09:00</option><option  value="10:00">10:00</option><option  value="11:00">11:00</option><option  value="12:00">12:00</option><option  value="13:00">13:00</option><option  value="14:00">14:00</option><option  value="15:00">15:00</option><option  value="16:00">16:00</option><option  value="17:00">17:00</option><option  value="18:00">18:00</option><option  value="19:00">19:00</option><option  value="20:00">20:00</option><option  value="21:00">21:00</option><option  value="22:00">22:00</option><option  value="23:00">23:00</option><option  value="24:00">24:00</option>
				                    </select>
				                    &nbsp; &nbsp;
				                    ● Off work time
				                    <select name="WORK_TIME_END" id="work_time_end"><option  value="00:00">00:00</option><option  value="01:00">01:00</option><option  value="02:00">02:00</option><option  value="03:00">03:00</option><option  value="04:00">04:00</option><option  value="05:00">05:00</option><option  value="06:00">06:00</option><option  value="07:00">07:00</option><option  value="08:00">08:00</option><option  value="09:00">09:00</option><option  value="10:00">10:00</option><option  value="11:00">11:00</option><option  value="12:00">12:00</option><option  value="13:00">13:00</option><option  value="14:00">14:00</option><option  value="15:00">15:00</option><option  value="16:00">16:00</option><option  value="17:00">17:00</option><option  value="18:00">18:00</option><option  value="19:00">19:00</option><option  value="20:00">20:00</option><option  value="21:00">21:00</option><option  value="22:00">22:00</option><option  value="23:00">23:00</option><option  value="24:00">24:00</option>
				                    </select>
			                	</span>
			                    <br>
			                    <div class="custom-control custom-radio">
				                    <input type="radio" name="WORK_TIME_ISWEEK" class="custom-control-input" id="work_time_isweek0" value="0" checked="checked" <c:if test="${map.WORK_TIME_ISWEEK eq '0'}">checked</c:if>>
				                    <label class="custom-control-label" for="work_time_isweek0">Regardless day of the week</label>
			                    </div>
			                    <div class="custom-control custom-radio">
				                    <input type="radio" name="WORK_TIME_ISWEEK" class="custom-control-input" id="work_time_isweek1" value="1" <c:if test="${map.WORK_TIME_ISWEEK eq '1'}">checked</c:if>>
				                    <label class="custom-control-label" for="work_time_isweek1">Prefer working day of the week(Multiple selections available)</label>
									<div id="view_div">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="work_time_week1" class="custom-control-input" name="WORK_TIME_WEEK" value="매주 월요일(Mon)">
											<label class="custom-control-label" for="work_time_week1">Every Monday</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="work_time_week2" class="custom-control-input" name="WORK_TIME_WEEK" value="매주 화요일(Tue)">
											<label class="custom-control-label" for="work_time_week2">Every Tuesday</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="work_time_week3" class="custom-control-input" name="WORK_TIME_WEEK" value="매주 수요일(Wed)">
											<label class="custom-control-label" for="work_time_week3">Every Wednesday</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="work_time_week4" class="custom-control-input" name="WORK_TIME_WEEK" value="매주 목요일(Thu)">
											<label class="custom-control-label" for="work_time_week4">Every Thursday</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="work_time_week5" class="custom-control-input" name="WORK_TIME_WEEK" value="매주 금요일(Fri)">
											<label class="custom-control-label" for="work_time_week5">Every Friday</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="work_time_week6" class="custom-control-input" name="WORK_TIME_WEEK" value="매주 토요일(Sat)">
											<label class="custom-control-label" for="work_time_week6">Every Saturday</label>
										</div>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" id="work_time_week7" class="custom-control-input" name="WORK_TIME_WEEK" value="매주 일요일(Sun)">
											<label class="custom-control-label" for="work_time_week7">Every Sunday</label>
										</div>
									</div>
									<br>selected: <span class="red">${map.WORK_TIME_WEEK }</span>
								</div>
		                    </div>                        
		                </div>
          				<div class="col-md-12 col-lg-12">
                           <div class="title-left">
                               <h3>Detailed Job Hunting Information</h3>
                           </div>
                            <div class="mb-3">
                            <label for="dormitory">Dormitory/Commute *</label><br>
	                            <div class="custom-control custom-radio">
	                            	<input id="commute_way1" name="DORMITORY" class="custom-control-input" type="radio" value="기숙사"<c:if test="${map.DORMITORY eq '기숙사'}">checked</c:if>>
	                            	<label class="custom-control-label" for="commute_way1">Dormitory</label></div>
	                            <div class="custom-control custom-radio">
	                            	<input id="commute_way2" name="DORMITORY" class="custom-control-input" type="radio" value="출퇴근"<c:if test="${map.DORMITORY eq '출퇴근'}">checked</c:if>>
	                            	<label class="custom-control-label" for="commute_way2">Commute</label></div>
	                            <div class="custom-control custom-radio">
	                            	<input id="commute_way3" name="DORMITORY" class="custom-control-input" type="radio" value="상관없음"<c:if test="${map.DORMITORY eq '상관없음'}">checked</c:if>>
					                <label class="custom-control-label" for="commute_way3">N/A</label></div>
                            </div>
                            <div class="mb-4">
                            <label for=introduce>Introduce yourself</label><br>
	                           	<c:if test="${empty map.INTRODUCE }">
			                		<textarea name="INTRODUCE" id="introduce" cols="85" rows="5"></textarea>
			                	</c:if>
			                	<c:if test="${not empty map.INTRODUCE }">
			                		<textarea name="INTRODUCE" id="introduce" cols="85" rows="5" >${map.INTRODUCE }</textarea>
			                	</c:if>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                           <div class="title-left">
                               <h3>Academic Background</h3>
                           </div>
                            <div class="mb-3">
                            <label for="dormitory">Highest level of education *</label><br>
                            	<div class="custom-control custom-radio">
	                            	<input name="GRADUATE_SCH" type="radio" id="sch0" class="custom-control-input" value="N/A" checked="checked" <c:if test="${map.GRADUATE_SCH eq 'N/A'}">checked</c:if>>
		                            <label class="custom-control-label" for="sch0">N/A</label>
	                            </div>
	                            <div class="custom-control custom-radio">
		                            <input name="GRADUATE_SCH" type="radio" id="sch1" class="custom-control-input" value="중/고졸" <c:if test="${map.GRADUATE_SCH eq '중/고졸'}">checked</c:if>>
				                    <label class="custom-control-label" for="sch1">Middle school graduate/ High school graduate</label>
				                </div>
				                <div class="custom-control custom-radio">
				                    <input name="GRADUATE_SCH" type="radio" id="sch2" class="custom-control-input" value="전문대재학" <c:if test="${map.GRADUATE_SCH eq '전문대재학'}">checked</c:if>>
				                    <label class="custom-control-label" for="sch2">Technical College In School</label>
			                    </div>
			                    <div class="custom-control custom-radio">
				                    <input name="GRADUATE_SCH" type="radio" id="sch3" class="custom-control-input" value="전문대졸업" <c:if test="${map.GRADUATE_SCH eq '전문대졸업'}">checked</c:if>>
				                    <label class="custom-control-label" for="sch3">Technical College Graduation</label>
			                    </div>
			                    <div class="custom-control custom-radio">
				                    <input name="GRADUATE_SCH" type="radio" id="sch4" class="custom-control-input" value="4년제대학재학" <c:if test="${map.GRADUATE_SCH eq '4년제대학재학'}">checked</c:if>>
				                    <label class="custom-control-label" for="sch4">Fourth-Year College In School</label>
			                    </div>
			                    <div class="custom-control custom-radio">
				                    <input name="GRADUATE_SCH" type="radio" id="sch5" class="custom-control-input" value="4년제대학졸업" <c:if test="${map.GRADUATE_SCH eq '4년제대학졸업'}">checked</c:if>>
				                    <label class="custom-control-label" for="sch5">Fourth-Year College Graduation</label>
			                    </div>
			                    <div class="custom-control custom-radio">
				                    <input name="GRADUATE_SCH" type="radio" id="sch6" class="custom-control-input" value="대학원재학" <c:if test="${map.GRADUATE_SCH eq '대학원재학'}">checked</c:if>>
				                    <label class="custom-control-label" for="sch6">Graduate School In School</label>
			                    </div>
			                    <div class="custom-control custom-radio">
				                    <input name="GRADUATE_SCH" type="radio" id="sch7" class="custom-control-input" value="대학원졸업" <c:if test="${map.GRADUATE_SCH eq '대학원졸업'}">checked</c:if>>
				                    <label class="custom-control-label" for="sch7">Graduate School Graduation</label>
			                    </div>
                            </div>
                            <div class="mb-4">
                            <label for=diploma>Diploma</label><br>
                            	<div class="custom-control custom-radio">
	                           		<input name="DEP" type="radio" class="custom-control-input" id="dep0" value="N/A" checked="checked" <c:if test="${map.DEP eq 'N/A'}">checked</c:if>>
		                           	<label class="custom-control-label" for="dep0">N/A</label>
		                        </div>
		                        <div class="custom-control custom-radio">
		                           	<input name="DEP" type="radio" class="custom-control-input" id="dep1" value="학사" <c:if test="${map.DEP eq '학사'}">checked</c:if>>
				                    <label class="custom-control-label" for="dep1">Bachelor</label>
				                </div>
				                <div class="custom-control custom-radio">
				                    <input name="DEP" type="radio" class="custom-control-input" id="dep2" value="석사" <c:if test="${map.DEP eq '석사'}">checked</c:if>>
				                    <label class="custom-control-label" for="dep2">Master</label>
				                </div>
				                <div class="custom-control custom-radio">
				                    <input name="DEP" type="radio" class="custom-control-input" id="dep3" value="박사" <c:if test="${map.DEP eq '박사'}">checked</c:if>>
				                    <label class="custom-control-label" for="dep3">Doctorate</label>
				                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-12">
                           <div class="title-left">
                               <h3>Final Level of Education</h3>
                           </div>
                            <div class="mb-3">
                            <label for="add/grad">Admission / Graduation *</label><br>
                            	<input type="text" size="4" id="school_entr_year" name="FINAL_A_Y" class="only-num" value="${map.FINAL_A_Y }">Year 
			                	<input type="text" size="2" id="school_entr_month" name="FINAL_A_M" class="only-num" value="${map.FINAL_A_M }">Month ~
			                    <input type="text" size="4" id="school_grad_year" name="FINAL_G_Y" class="only-num" value="${map.FINAL_G_Y }">Year 
			                    <input type="text" size="2" id="school_grad_month" name="FINAL_G_M" class="only-num" value="${map.FINAL_G_M }">Month<br>
			                </div>    
		                    <div class="mb-3">
	                            <label for="region">Region *</label>
	                            <div class="input-group">
	                       			 <input type="text" size="20" id="school_area" class="form-control" name="FINAL_REGION" value="${map.FINAL_REGION }">         
	                            </div>
	                        </div>
		                   <div class="mb-3">
	                            <label for="sch_name">School Name *</label>
	                            <div class="input-group">
									<input type="text" size="20" id="school_name" class="form-control" name="FINAL_SCH" value="${map.FINAL_SCH }">          
	                            </div>
	                        </div>
	                        <div class="mb-3">
	                            <label for="major">Major *</label>
	                            <div class="input-group">
		                    		<input type="text" size="20" id="school_major" class="form-control" name="FINAL_MAJOR" value="${map.FINAL_MAJOR }">          
	                            </div>
	                        </div>
                           
                           
                        </div>
           
              
					    <input type="hidden" class="input_box" name=mem_cate value="${mvo.mem_cate }">
						<button type="submit" class="btn hvr-hover">Save</button>
					
      				</div>
			    </div>
	        </div>
	    </div>
	   	</form>
    <!-- End Cart -->

      <!-- Start Footer  -->
    <footer>
        <div class="footer-main">
            <div class="container">
				<div class="row">
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Business Time</h3>
							<ul class="list-time">
								<li>Monday - Friday: 08.00am to 05.00pm</li> <li>Saturday: 10.00am to 08.00pm</li> <li>Sunday: <span>Closed</span></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Newsletter</h3>
							<form class="newsletter-box">
								<div class="form-group">
									<input class="" type="email" name="Email" placeholder="Email Address*" />
									<i class="fa fa-envelope"></i>
								</div>
								<button class="btn hvr-hover" type="submit">Submit</button>
							</form>
						</div>
					</div>
					<div class="col-lg-4 col-md-12 col-sm-12">
						<div class="footer-top-box">
							<h3>Social Media</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							<ul>
                                <li><a href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-linkedin" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a></li>
                                <li><a href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a></li>
                            </ul>
						</div>
					</div>
				</div>
				<hr>
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-widget">
                            <h4>About Freshshop</h4>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p> 
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p> 							
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>Information</h4>
                            <ul>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Customer Service</a></li>
                                <li><a href="#">Our Sitemap</a></li>
                                <li><a href="#">Terms &amp; Conditions</a></li>
                                <li><a href="#">Privacy Policy</a></li>
                                <li><a href="#">Delivery Information</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link-contact">
                            <h4>Contact Us</h4>
                            <ul>
                                <li>
                                    <p><i class="fas fa-map-marker-alt"></i>Address: Michael I. Days 3756 <br>Preston Street Wichita,<br> KS 67213 </p>
                                </li>
                                <li>
                                    <p><i class="fas fa-phone-square"></i>Phone: <a href="tel:+1-888705770">+1-888 705 770</a></p>
                                </li>
                                <li>
                                    <p><i class="fas fa-envelope"></i>Email: <a href="mailto:contactinfo@gmail.com">contactinfo@gmail.com</a></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- End Footer  -->

    <!-- Start copyright  -->
    <div class="footer-copyright">
        <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
            <a href="https://html.design/">html design</a></p>
    </div>
    <!-- End copyright  -->

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

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
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW24W9sP9njddFNugiBUaJ-AzVfpQb_MY&language=en&libraries=places&callback=initMap" async defer></script>
	<script type="text/javascript" src="resources/js/member/p_profile.js"></script>
	
	<script type="text/javascript" src="resources/js/member/resume.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="<c:url value='resources/js/common/common.js'/>" charset="utf-8"></script>
</body>

</html>