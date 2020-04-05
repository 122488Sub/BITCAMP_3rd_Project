<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- Basic -->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
       
    <link href="resources/css/member/mypageCompany.css" rel="stylesheet" type="text/css">
    
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
                        <img class="icon" src="resources/img/common/document.png">
                        <a class="nav-link" href="myPage_go.do?type=resume">Resume</a></li>
                        <li class="nav-item">
                        <img class="icon" src="resources/img/common/wishlist.png">
                        <a class="nav-link" href="myPage_go.do?type=wishlist">Wishlist</a></li>
                        <li class="nav-item">
                        <img class="icon" src="resources/img/common/advertisment.png">
                        <a class="nav-link" href="myPage_go.do?type=ads">My Ads</a></li>
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
                    <h2>Resume</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
   

    <!-- Start Cart  -->
    <form id="form1" name="form1" method="post" encType="multipart/form-data">
    <input type="hidden" name="MEM_ID" value="${mvo.mem_id }">
    <div class="cart-box-main">
        <div class="container">
       	    	<div class="col-xs-12 col-sm-12 col-md-8" style="float:none; margin:0 auto;">
       	            <div class="checkout-address">
                        <div class="title-left">
                            <h3>Personal Information</h3>
                        </div>
                        <div class="row">
	                        <div class="col-md-6 mb-3">
	                            <label for="name">Name</label>
	                            <input type="text" class="form-control" id="name" name="MEM_NAME" value="${map.MEM_NAME }">
	                            <input type="hidden" id="mem_id" name="mem_id" value="${mvo.mem_id }">
	                        </div>
	                        <div class="col-md-6 mb-3">
	                            <label for="nationality">Nationality</label>
                            	<c:if test="${not empty mvo.mem_nationality }">
                            	<input type="text" class="form-control" value="${mvo.mem_nationality }" disabled>	
                            	</c:if>
				                <c:if test="${empty mvo.mem_nationality }">
				                	Please fill your profile first.
				                </c:if>
	                        </div>
                        </div>
                        <div class="row">
	                        <div class="col-md-3 mb-3">
                             	<label for="gender">Gender</label>
                            	<c:if test="${not empty mvo.mem_gender }">
	                            	<input type="text" class="form-control" value="${mvo.mem_gender }" disabled>	
                            	</c:if>
				                <c:if test="${empty mvo.mem_gender }">
				                	<input type="text" class="form-control" value="Please fill your profile first." disabled>
				                </c:if> 
	                        </div>
	                        <div class="col-md-4 mb-3">
                            	<label for="birthday">Birthday</label>
	                         	<c:if test="${not empty mvo.mem_birth}">
	                            	<input type="text" class="form-control" value="${mvo.mem_birth }" disabled>	
	                            	</c:if>
				                <c:if test="${empty mvo.mem_birth}">
				                	<input type="text" class="form-control" value="Please fill your profile first." disabled>
				                </c:if>    
							</div>
	                        <div class="col-md-5 mb-3">
	                            <label for="phone">Cell Phone</label>
                                <c:if test="${not empty mvo.mem_phone}">
                            		<input type="text" class="form-control" value="${mvo.mem_phone }" disabled>	
                            	</c:if>
				                <c:if test="${empty mvo.mem_phone}">
				                	<input type="text" class="form-control" value="Please fill your profile first." disabled>
				                </c:if>
	                        </div>
                    	</div>
                        <div class="mb-3">
                            <label for="residence">Residence area</label>
                            <div class="input-group">
                                <c:if test="${not empty mvo.mem_address && !mvo.mem_address eq ' '}">
                            		<input type="text" class="form-control" value="${mvo.mem_address }" disabled>	
                            	</c:if>
				                <c:if test="${empty mvo.mem_address || mvo.mem_address eq ' '}">
				                	<input type="text" class="form-control" value="Please fill your profile first." disabled>
				                </c:if>
                            </div>
                        </div>
                   	</div>
                    <div class="checkout-address">
                    	<div class="title-left">
                        	<h3>Required Fields</h3>
                       	</div>
	                        <label for="working-area">Desired working area</label><br>
                       	<div class="row">
                        <div class="col-md-6 mb-2">
	                        <select class="custom-select-box form-control" name="WISH_DO" id="sido1"></select>
						</div>
						<div class="col-md-6 mb-2">
							<select class="custom-select-box form-control" name="WISH_SI" id="gugun1"></select>
						
							<script type="text/javascript">
								new sojaeji('sido1', 'gugun1');
							</script>
                     	</div>
                     	</div>
							<br>selected:&nbsp;&nbsp; <span class="red">${map.WISH_DO } / ${map.WISH_SI }</span>
	                    <hr class="mb-1">
                        	<label for="professional-field">Professional Field</label><br>
	                    <div class="row">
	                    <div class="col-md-6 mb-2">
                            <select class="custom-select-box form-control" name="JOB_CATE" id="selectBox1" title="직종선택">
							    <c:forEach items="${mpCateMap}" var="option">
								  <option class="${option.key}">${option.value}</option>
								</c:forEach>
							</select>
                     	</div>						
	                    <div class="col-md-6 mb-2">
							<select class="custom-select-box form-control" name="JOB_CATE_CHILD" title="직종선택"  id="cate_child_en"></select>
                     	</div>
                     	</div>
							<br>selected:&nbsp;&nbsp; <span class="red">${map.JOB_CATE } / ${map.JOB_CATE_CHILD }</span>
                        <hr class="mb-1">
                        <div class="mb-3">
                        	<label for="salary">Requested salary</label>
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
		                
				                <input type="text" size="11" maxlength="11" id="pay_amount1" name="REQ_SALARY_MIN" class="num_only2" style="border-radius:.25em; border:1px solid #ced4da; padding:.20rem .75rem" value="${map.REQ_SALARY_MIN }"> 
				               	&nbsp; &nbsp;~ &nbsp; &nbsp;<input type="text" size="11" maxlength="11" id="pay_amount2" name="REQ_SALARY_MAX" class="num_only2" style="border-radius:.25em; border:1px solid #ced4da; padding:.20rem .75rem" value="${map.REQ_SALARY_MAX }">&nbsp; &nbsp;won
				                <span class="msg"></span>
		                </div>
                        <hr class="mb-1">
                        <div class="mb-3">
                        	<label for="working-hours">Prefer working hours</label>
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
                              	&nbsp; &nbsp;
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
          				<div class="checkout-address">
                           <div class="title-left">
                               <h3>Detailed Job Hunting Information</h3>
                           </div>
                            <div class="mb-3">
                            <label for="dormitory">Dormitory/Commute</label><br>
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
			                		<textarea name="INTRODUCE" class="form-control col-md-12" id="introduce"></textarea>
			                	</c:if>
			                	<c:if test="${not empty map.INTRODUCE }">
			                		<textarea name="INTRODUCE" class="form-control col-md-12" id="introduce" >${map.INTRODUCE }</textarea>
			                	</c:if>
                            </div>
                        </div>
                        <div class="checkout-address">
                           <div class="title-left">
                               <h3>Academic Background</h3>
                           </div>
                            <div class="mb-3">
                            <label for="dormitory">Highest level of education</label><br>
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
                        <div class="checkout-address">
                           <div class="title-left">
                               <h3>Final Level of Education</h3>
                           </div>
                            <div class="mb-3">
                            <label for="add/grad">Admission / Graduation</label>&nbsp; &nbsp;&nbsp; &nbsp;
                            	<input type="text" size="6" id="school_entr_year" name="FINAL_A_Y" class="only-num" style="border-radius:.25em; border:1px solid #ced4da; padding:.20rem .75rem" value="${map.FINAL_A_Y }">&nbsp; &nbsp;Year&nbsp; &nbsp; 
			                	<input type="text" size="4" id="school_entr_month" name="FINAL_A_M" class="only-num" style="border-radius:.25em; border:1px solid #ced4da; padding:.20rem .75rem" value="${map.FINAL_A_M }">&nbsp; &nbsp;Month&nbsp; &nbsp;&nbsp; &nbsp; ~ &nbsp; &nbsp;&nbsp; &nbsp;
			                    <input type="text" size="6" id="school_grad_year" name="FINAL_G_Y" class="only-num" style="border-radius:.25em; border:1px solid #ced4da;  padding:.20rem .75rem" value="${map.FINAL_G_Y }">&nbsp; &nbsp;Year&nbsp; &nbsp; 
			                    <input type="text" size="4" id="school_grad_month" name="FINAL_G_M" class="only-num" style="border-radius:.25em; border:1px solid #ced4da; padding:.20rem .75rem" value="${map.FINAL_G_M }">&nbsp; &nbsp;Month<br>
			                </div>
			                <div class="row">
		                        <div class="col-md-3 mb-3">
	                             	<label for="region">Region</label>
		                            <div class="input-group">
		                       			 <input type="text" size="20" id="school_area" class="form-control" name="FINAL_REGION" value="${map.FINAL_REGION }">         
		                            </div>
		                        </div>
		                        <div class="col-md-5 mb-3">
		                            <label for="sch_name">School Name</label>
		                            <div class="input-group">
										<input type="text" size="20" id="school_name" class="form-control" name="FINAL_SCH" value="${map.FINAL_SCH }">          
		                            </div>
		                        </div>
		                        <div class="col-md-4 mb-3">
	                            	<label for="major">Major</label>
		                            <div class="input-group">
			                    		<input type="text" size="20" id="school_major" class="form-control" name="FINAL_MAJOR" value="${map.FINAL_MAJOR }">          
		                            </div>  
								</div>
	                    	</div>
	                    	<div class="mb-3">
	                    	<label for="lang_learn">Language Learning Institute</label>
	                    		<div class="custom-control custom-radio">
			                    	<input name="LANG_LEARN" type="radio" class="custom-control-input" id="lang_learn0" value="해당사항없음" checked="checked" <c:if test="${map.LANG_LEARN eq '해당사항없음'}">checked</c:if>>
			                    	<label class="custom-control-label" for="lang_learn0">N/A</label>
		                    	</div>
	                    		<div class="custom-control custom-radio">
			                    	<input name="LANG_LEARN" type="radio" class="custom-control-input" id="lang_learn1" value="재학중" checked="checked" <c:if test="${map.LANG_LEARN eq '재학중'}">checked</c:if>>
			                    	<label class="custom-control-label" for="lang_learn1">Studying</label>
		                    	</div>
	                    		<div class="custom-control custom-radio">
			                    	<input name="LANG_LEARN" type="radio" class="custom-control-input" id="lang_learn2" value="졸업" checked="checked" <c:if test="${map.LANG_LEARN eq '졸업'}">checked</c:if>>
			                    	<label class="custom-control-label" for="lang_learn2">Graduation</label>
		                    	</div>
				                <div id="div_lang_school_name">
				                	&nbsp; School Name&nbsp;:&nbsp;<input type="text" size="50" id="lang_school_name" name="LANG_SCH" style="border-radius:.25em; border:1px solid #ced4da; padding:.20rem .75rem" value="${map.LANG_SCH }">
				                </div>
	                    	</div>
                        </div>
                        <div class="checkout-address">
                           <div class="title-left">
                               <h3>Career</h3>
                           </div>
                           <table class="table">
                           <a href="#this" id="addCareer">Add Career</a>
                           <tbody id="career">
				               <c:forEach var="list" items="${careerList }">
				           	  	<input type="hidden" id="IDX" value="${list.IDX }">
					              <tr>
					                <th width="15%" class="number">Career</th>
					                <td width="85%" class="txLeft">
					                  <div class="mb-3">
			                          <label for="join/leave">Joining / Leaving</label>&nbsp; &nbsp;&nbsp; &nbsp;
				                          <input type="text" size="6" name="JOIN_YEAR" class="only-num" style="border-radius:.25em; border:1px solid #ced4da; padding:.20rem .75rem" value="${list.JOIN_YEAR }">&nbsp; &nbsp;Year&nbsp; &nbsp; 
							              <input type="text" size="4" name="JOIN_MONTH" class="only-num" style="border-radius:.25em; border:1px solid #ced4da; padding:.20rem .75rem" value="${list.JOIN_MONTH }">&nbsp; &nbsp;Month&nbsp; &nbsp;&nbsp; &nbsp; ~ &nbsp; &nbsp;&nbsp; &nbsp;
							              <input type="text" size="6" name="RESIGN_YEAR" class="only-num" style="border-radius:.25em; border:1px solid #ced4da;  padding:.20rem .75rem" value="${list.RESIGN_YEAR }">&nbsp; &nbsp;Year&nbsp; &nbsp; 
							              <input type="text" size="4" name="RESIGN_MONTH" class="only-num" style="border-radius:.25em; border:1px solid #ced4da; padding:.20rem .75rem" value="${list.RESIGN_MONTH }">&nbsp; &nbsp;Month<br>
						              </div>
					                  <div class="row">
				                        <div class="col-md-3 mb-3">
			                             	<label for="region">Region</label>
				                            <div class="input-group">
				                       			 <input type="text" class="form-control" name="REGION" value="${list.REGION }">         
				                            </div>
				                        </div>
				                        <div class="col-md-5 mb-3">
				                            <label for="company">Name of company</label>
				                            <div class="input-group">
												<input type="text" class="form-control" name="COMPANY" value="${list.COMPANY }">          
				                            </div>
				                        </div>
				                        <div class="col-md-4 mb-3">
			                            	<label for="task">Assigned task</label>
				                            <div class="input-group">
					                    		<input type="text" class="form-control" name="TASK" value="${list.TASK }">          
				                            </div>  
										</div>
			                    	</div>
					                </td>
					                <td><a href="#this" class="btn" id="delete" name="deleteCareer">Delete</a></td>                
					             </tr>
					            </c:forEach>
				            </tbody>
                           </table>
                        </div>
                        <div class="checkout-address">
	                        <div class="title-left">
	                               <h3>Linguistic ability</h3>
	                        </div>
	                        <table class="table">
	                        <tbody>
					              <tr>
					                <th>Korean</th>
					                <td class="txLeft">
					                  Conversational ability : 
					                  <label><input name="KO_SPK_ABIL" type="radio" value="상" <c:if test="${map.KO_SPK_ABIL eq '상'}">checked</c:if>>Advanced </label>
					                  <label><input name="KO_SPK_ABIL" type="radio" value="중" <c:if test="${map.KO_SPK_ABIL eq '중'}">checked</c:if>>Intermediate</label>
					                  <label><input name="KO_SPK_ABIL" type="radio" value="하" <c:if test="${map.KO_SPK_ABIL eq '하'}">checked</c:if>>Beginner</label>
					                  <label><input name="KO_SPK_ABIL" type="radio" value="해당사항없음" <c:if test="${map.KO_SPK_ABIL eq '해당사항없음'}">checked</c:if>>N/A</label>&nbsp;&nbsp;&nbsp;&nbsp;
					                <br>
					                  Ability to work with documents :
					                  <label><input name="KO_DOC_ABIL" type="radio" value="상" <c:if test="${map.KO_DOC_ABIL eq '상'}">checked</c:if>>Advanced</label>
					                  <label><input name="KO_DOC_ABIL" type="radio" value="중" <c:if test="${map.KO_DOC_ABIL eq '중'}">checked</c:if>>Intermediate</label>
					                  <label><input name="KO_DOC_ABIL" type="radio" value="하" <c:if test="${map.KO_DOC_ABIL eq '하'}">checked</c:if>>Beginner</label>
					                  <label><input name="KO_DOC_ABIL" type="radio" value="해당사항없음" <c:if test="${map.KO_DOC_ABIL eq '해당사항없음'}">checked</c:if>>N/A</label></td>
					              </tr>
					              <tr>
					                <th>Chinese</th>
					                <td class="txLeft">
					                  Conversational ability :
					                  <label><input name="CH_SPK_ABIL" type="radio" value="상" <c:if test="${map.CH_SPK_ABIL eq '상'}">checked</c:if>>Advanced </label>
					                  <label><input name="CH_SPK_ABIL" type="radio" value="중" <c:if test="${map.CH_SPK_ABIL eq '중'}">checked</c:if>>Intermediate</label>
					                  <label><input name="CH_SPK_ABIL" type="radio" value="하" <c:if test="${map.CH_SPK_ABIL eq '하'}">checked</c:if>>Beginner</label>
					                  <label><input name="CH_SPK_ABIL" type="radio" value="해당사항없음" <c:if test="${map.CH_SPK_ABIL eq '해당사항없음'}">checked</c:if>>N/A</label>&nbsp;&nbsp;&nbsp;&nbsp;
					                <br>
					                  Ability to work with documents :
					                  <label><input name="CH_DOC_ABIL" type="radio" value="상" <c:if test="${map.CH_DOC_ABIL eq '상'}">checked</c:if>>Advanced</label>
					                  <label><input name="CH_DOC_ABIL" type="radio" value="중" <c:if test="${map.CH_DOC_ABIL eq '중'}">checked</c:if>>Intermediate</label>
					                  <label><input name="CH_DOC_ABIL" type="radio" value="하" <c:if test="${map.CH_DOC_ABIL eq '하'}">checked</c:if>>Beginner</label>
					                  <label><input name="CH_DOC_ABIL" type="radio" value="해당사항없음" <c:if test="${map.CH_DOC_ABIL eq '해당사항없음'}">checked</c:if>>N/A</label></td>
					              </tr>
					              <tr>
					                <th>English</th>
					                <td class="txLeft">
					                  Conversational ability :
					                  <label><input name="EN_SPK_ABIL" type="radio" value="상" <c:if test="${map.EN_SPK_ABIL eq '상'}">checked</c:if>>Advanced </label>
					                  <label><input name="EN_SPK_ABIL" type="radio" value="중" <c:if test="${map.EN_SPK_ABIL eq '중'}">checked</c:if>>Intermediate</label>
					                  <label><input name="EN_SPK_ABIL" type="radio" value="하" <c:if test="${map.EN_SPK_ABIL eq '하'}">checked</c:if>>Beginner</label>
					                  <label><input name="EN_SPK_ABIL" type="radio" value="해당사항없음" <c:if test="${map.EN_SPK_ABIL eq '해당사항없음'}">checked</c:if>>N/A</label>&nbsp;&nbsp;&nbsp;&nbsp;
					                <br>
					                  Ability to work with documents :
					                  <label><input name="EN_DOC_ABIL" type="radio" value="상" <c:if test="${map.EN_DOC_ABIL eq '상'}">checked</c:if>>Advanced</label>
					                  <label><input name="EN_DOC_ABIL" type="radio" value="중" <c:if test="${map.EN_DOC_ABIL eq '중'}">checked</c:if>>Intermediate</label>
					                  <label><input name="EN_DOC_ABIL" type="radio" value="하" <c:if test="${map.EN_DOC_ABIL eq '하'}">checked</c:if>>Beginner</label>
					                  <label><input name="EN_DOC_ABIL" type="radio" value="해당사항없음" <c:if test="${map.EN_DOC_ABIL eq '해당사항없음'}">checked</c:if>>N/A</label></td>
					              </tr>
					              <tr>
					                <th>Vietnamese</th>
					                <td class="txLeft">
					                  Conversational ability :
					                  <label><input name="VT_SPK_ABIL" type="radio" value="상" <c:if test="${map.VT_SPK_ABIL eq '상'}">checked</c:if>>Advanced </label>
					                  <label><input name="VT_SPK_ABIL" type="radio" value="중" <c:if test="${map.VT_SPK_ABIL eq '중'}">checked</c:if>>Intermediate</label>
					                  <label><input name="VT_SPK_ABIL" type="radio" value="하" <c:if test="${map.VT_SPK_ABIL eq '하'}">checked</c:if>>Beginner</label>
					                  <label><input name="VT_SPK_ABIL" type="radio" value="해당사항없음" <c:if test="${map.VT_SPK_ABIL eq '해당사항없음'}">checked</c:if>>N/A</label>&nbsp;&nbsp;&nbsp;&nbsp;
					                <br>
					                  Ability to work with documents :
					                  <label><input name="VT_DOC_ABIL" type="radio" value="상" <c:if test="${map.VT_DOC_ABIL eq '상'}">checked</c:if>>Advanced</label>
					                  <label><input name="VT_DOC_ABIL" type="radio" value="중" <c:if test="${map.VT_DOC_ABIL eq '중'}">checked</c:if>>Intermediate</label>
					                  <label><input name="VT_DOC_ABIL" type="radio" value="하" <c:if test="${map.VT_DOC_ABIL eq '하'}">checked</c:if>>Beginner</label>
					                  <label><input name="VT_DOC_ABIL" type="radio" value="해당사항없음" <c:if test="${map.VT_DOC_ABIL eq '해당사항없음'}">checked</c:if>>N/A</label></td>
					              </tr>
					              <tr>
					                <th>Other language</th>
					                <td class="txLeft"><input type="text" class="form-control" name="OTHER_LANG" value="${map.OTHER_LANG }"> (E.g. French, Spanish, Russian, etc.)</td>
					              </tr>
					            </tbody>
	                        </table>
                        </div>
                        <div class="checkout-address">
                        	<div class="title-left">
	                               <h3>Other Items</h3>
	                        </div>
	                        <table class="table">
		                        <tbody>
								    <tr> 
										<th width="15%">The attached file</th> 
										<td width="85%" class="txLeft"> 
											<div id="file"> 
												<c:forEach var="row" items="${fileList }" varStatus="var"> 
													<p> 
														<input type="hidden" id="IDX" name="IDX_${var.index }" value="${row.IDX }">
														<a href="#this" name="file">${row.ORI_FILE } (${row.FILE_SIZE }kb)</a>
														<input type="file" id="file_${var.index }" name="file_${var.index }"> 
														<a href="#this" id="delete_${var.index }" name="delete_${var.index }">Delete</a> 
													</p> 
												</c:forEach> 
											</div> 
										</td> 
									</tr>
					            </tbody>
				            	<a href="#this" id="addFile">Add File</a>
	                        </table>
                        </div>
					</div><br><br><br>
					<c:if test="${mvo.mem_cate eq 'p'}">
				          <p align="center">
				          	<input type="hidden" name="RESUME_IDX" value="${map.RESUME_IDX }">
				            <a href="" target="_self" class="btn">Cancel</a>
				            &nbsp; &nbsp;
				            <c:choose>
					            <c:when test="${not empty map }">
					            	<button class="btn hvr-hover" onclick="javascript:updateResume(this.form)">Update</button>
					            </c:when>
					            <c:when test="${empty map }">
					            	<button class="btn hvr-hover" onclick="javascript:insertResume(this.form)">Registration</button>
					            </c:when>
				            </c:choose>
				          </p>
					</c:if>
			    </div>
	    </div>
	   	</form>
    <!-- End Cart -->

     
    <!-- Start copyright  -->
    <div class="footer-copyright">
        <p class="footer-company">All Rights Reserved. &copy; 2018 <a href="#">ThewayShop</a> Design By :
            <a href="https://html.design/">html design</a></p>
    </div>
    <!-- End copyright  -->

    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

	<form id="commonForm" name="commonForm"></form>

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
	<script>
		
		var gfv_count = '${fn:length(list)+1}';
		
		function fn_addFile(){ //파일 추가
			
			var str = "<p>"+ 
					  "<input type='file' id='file_" +(gfv_count)+"' name='file_"+(gfv_count)+"'>"+ 
					  "<a href='#this' id='delete_" +(gfv_count)+"' name='delete_"+(gfv_count)+"'>Delete</a></p>";	
			$("#file").append(str); 
			
			$('#delete_' + (gfv_count++)).on("click", function(e){ //삭제 버튼 
				e.preventDefault(); 
				fn_deleteFile($(this)); 
			}); 
			
		}
		
	</script>
</body>

</html>