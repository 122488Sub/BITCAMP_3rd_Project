<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/member/resume.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/member/sojaeji.js"></script>
<script type="text/javascript" src="resources/js/member/resume.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="<c:url value='resources/js/common/common.js'/>" charset="utf-8"></script>
<link href="resources/css/member/mypageCompany.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
</head>
<body>

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

          <form id="form1" name="form1" method="post" encType="multipart/form-data">
          <input type="hidden" name="MEM_ID" value="${mvo.mem_id }">

           <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
          	<caption>
          	Personal information
          	</caption>
            <tbody>
              <tr>
                <th width="15%">Name</th>
                <td width="30%" class="txLeft">
                <input type="text" name="MEM_NAME" value="${map.MEM_NAME }">
                </td>
                <th width="15%">Nationality</th>
                <td width="40%" class="txLeft">&nbsp;
	                <c:if test="${not empty mvo.mem_nationality }">
	                	${mvo.mem_nationality }
	                </c:if>
	                <c:if test="${empty mvo.mem_nationality }">
	                	Please fill your profile first.
	                </c:if>
                </td>
              </tr>
              <tr>
                <th>Sex</th>
                <td class="txLeft">&nbsp;
                <c:if test="${not empty mvo.mem_gender }">
                	 ${mvo.mem_gender }
                </c:if>
                <c:if test="${empty mvo.mem_gender }">
                	Please fill your profile first.
                </c:if>
                </td>
                <th>Birthday</th>
                <td class="txLeft">&nbsp;
                <c:if test="${not empty mvo.mem_birth }">
                	 ${mvo.mem_birth }
                </c:if>
                <c:if test="${empty mvo.mem_birth }">
                	Please fill your profile first.
                </c:if>
                </td>
              </tr>
              <tr>
                <th>Cell phone</th>
                <td class="txLeft">&nbsp;
                <c:if test="${not empty mvo.mem_phone }">
                	${mvo.mem_phone }
                </c:if>
                <c:if test="${empty mvo.mem_phone }">
                	Please fill your profile first.
                </c:if>
                </td>
                <th>Residence area</th>
                <td colspan="3" class="txLeft">&nbsp;
                 <c:if test="${not empty mvo.mem_address }">
                	${mvo.mem_address }
                </c:if>
                <c:if test="${empty mvo.mem_address }">
                	Please fill your profile first.
                </c:if>
                </td>
              </tr>
            </tbody>
          </table> 

        <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
          	<caption>Required fields</caption>
            <tbody>
              <tr>
                <th width="15%">Desired working area<span class="red">*</span></th>
                <td width="85%" class="txLeft">
					<select name="WISH_DO" id="sido1"></select>
					<select name="WISH_SI" id="gugun1"></select>
					
					<script type="text/javascript">
					new sojaeji('sido1', 'gugun1');
					</script>
                </td>
              </tr>				
              <tr>
                <th>Professional field<span class="red">*</span></th>
                <td class="txLeft">
				  <select name="JOB_CATE" id="selectBox1" title="직종선택">
				    <c:forEach items="${mpCateMap}" var="option">
					  <option class="${option.key}">${option.value}</option>
					</c:forEach>
				  </select>
				
				  <select name="JOB_CATE_CHILD" title="직종선택"  id="cate_child_en">
				  </select><br><br>
                </td>
              </tr>
              
              <tr>
                <th>Requested salary<span class="red">*</span></th>
                <td class="txLeft">
                  
                    <input name="SALARY_TYPE" id="pay_type0" type="radio" value="시급" <c:if test="${map.SALARY_TYPE eq '시급'}">checked</c:if>><label for="pay_type0">Hourly pay system</label> &nbsp;
                    <input name="SALARY_TYPE" id="pay_type1" type="radio" value="일급" <c:if test="${map.SALARY_TYPE eq '일급'}">checked</c:if>><label for="pay_type1">Daily pay system</label> &nbsp;
                    <input name="SALARY_TYPE" id="pay_type2" type="radio" value="월급" <c:if test="${map.SALARY_TYPE eq '월급'}">checked</c:if>><label for="pay_type2">Monthly salary system</label> &nbsp;
                    <input name="SALARY_TYPE" id="pay_type3" type="radio" value="연봉" <c:if test="${map.SALARY_TYPE eq '연봉'}">checked</c:if>><label for="pay_type3">Annual wage system</label> &nbsp;
                  <br>
                  <input type="text" size="11" maxlength="11" id="pay_amount1" name="REQ_SALARY_MIN" class="num_only2" value="${map.REQ_SALARY_MIN }"> ~ <input type="text" size="11" maxlength="11" id="pay_amount2" name="REQ_SALARY_MAX" class="num_only2" value="${map.REQ_SALARY_MAX }">￦
                  <span class="msg"></span>
                </td>
              </tr>

              <tr>
                <th>Prefer working hours<span class="red">*</span></th>
                <td class="txLeft"><label><input type="radio" name="WORK_TIME" id="work_time_type1" value="Day" checked="checked">Day</label> &nbsp;<label><input type="radio" name="WORK_TIME" id="work_time_type2" value="Night">Night</label> &nbsp;<label><input type="radio" name="WORK_TIME" id="work_time_type3" value="ETC(Part-time job)">ETC.(Part-time job)</label> &nbsp;
                  <span id="view_span">
                    ●Start work time
                    <select name="WORK_TIME_START" id="work_time_start"><option  value="00:00">00:00</option><option  value="01:00">01:00</option><option  value="02:00">02:00</option><option  value="03:00">03:00</option><option  value="04:00">04:00</option><option  value="05:00">05:00</option><option  value="06:00">06:00</option><option  value="07:00">07:00</option><option  value="08:00">08:00</option><option  value="09:00">09:00</option><option  value="10:00">10:00</option><option  value="11:00">11:00</option><option  value="12:00">12:00</option><option  value="13:00">13:00</option><option  value="14:00">14:00</option><option  value="15:00">15:00</option><option  value="16:00">16:00</option><option  value="17:00">17:00</option><option  value="18:00">18:00</option><option  value="19:00">19:00</option><option  value="20:00">20:00</option><option  value="21:00">21:00</option><option  value="22:00">22:00</option><option  value="23:00">23:00</option><option  value="24:00">24:00</option>
                    </select>
                    &nbsp; &nbsp;
                    ●Off work time
                    <select name="WORK_TIME_END" id="work_time_end"><option  value="00:00">00:00</option><option  value="01:00">01:00</option><option  value="02:00">02:00</option><option  value="03:00">03:00</option><option  value="04:00">04:00</option><option  value="05:00">05:00</option><option  value="06:00">06:00</option><option  value="07:00">07:00</option><option  value="08:00">08:00</option><option  value="09:00">09:00</option><option  value="10:00">10:00</option><option  value="11:00">11:00</option><option  value="12:00">12:00</option><option  value="13:00">13:00</option><option  value="14:00">14:00</option><option  value="15:00">15:00</option><option  value="16:00">16:00</option><option  value="17:00">17:00</option><option  value="18:00">18:00</option><option  value="19:00">19:00</option><option  value="20:00">20:00</option><option  value="21:00">21:00</option><option  value="22:00">22:00</option><option  value="23:00">23:00</option><option  value="24:00">24:00</option>
                    </select>
                  </span>
                    <br>
                    <label><input type="radio" name="WORK_TIME_ISWEEK" id="work_time_isweek0" value="0" checked="checked" <c:if test="${map.WORK_TIME_ISWEEK eq '0'}">checked</c:if>>Regardless day of the week</label>
                    &nbsp; &nbsp;
                    <label><input type="radio" name="WORK_TIME_ISWEEK" id="work_time_isweek1" value="1" <c:if test="${map.WORK_TIME_ISWEEK eq '1'}">checked</c:if>>Prefer working day of the week(Multiple selections available)</label>

                  <div id="view_div">
                    <label><input type="checkbox" name="WORK_TIME_WEEK" id="work_time_week1" value="매주 월요일(Mon)">Every Monday</label> &nbsp;
                    <label><input type="checkbox" name="WORK_TIME_WEEK" id="work_time_week2" value="매주 화요일(Tue)">Every Tuesday</label> &nbsp;
                    <label><input type="checkbox" name="WORK_TIME_WEEK" id="work_time_week3" value="매주 수요일(Wed)">Every Wednesday</label> &nbsp;
                    <label><input type="checkbox" name="WORK_TIME_WEEK" id="work_time_week4" value="매주 목요일(Thu)">Every Thursday</label> &nbsp;
                    <label><input type="checkbox" name="WORK_TIME_WEEK" id="work_time_week5" value="매주 금요일(Fri)">Every Friday</label> &nbsp;
                    <label><input type="checkbox" name="WORK_TIME_WEEK" id="work_time_week6" value="매주 토요일(Sat)">Every Saturday</label> &nbsp;
                    <label><input type="checkbox" name="WORK_TIME_WEEK" id="work_time_week7" value="매주 일요일(Sun)">Every Sunday</label> &nbsp;
                    <br><p>selected: ${map.WORK_TIME_WEEK }</p>
                  </div>

                </td>
              </tr>
             </tbody>
          </table>    
          
          
          <div class="old" style="color: #514438 !important;    padding: 10px 0;background: none;margin-bottom: 10px; font-size: 15px;font-weight: 600; color: #000; line-height: 1.3em; text-align: left;">Optional fields</div>                                      
          <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
                       <h4><strong>01</strong>Detailed job-hunting information</h4>
                                       
             <tbody>
              <tr>
                <th>Dormitory/Commute</th>
                <td class="txLeft">
                	<label><input name="DORMITORY" id="commute_way1" type="radio" value="기숙사" <c:if test="${map.DORMITORY eq '기숙사'}">checked</c:if>>Dormitory</label>
                  <label><input name="DORMITORY" id="commute_way2" type="radio" value="출퇴근" <c:if test="${map.DORMITORY eq '출퇴근'}">checked</c:if>>Commute</label>
                  <label><input name="DORMITORY" id="commute_way3" type="radio" value="상관없음" checked="checked" <c:if test="${map.DORMITORY eq '상관없음'}">checked</c:if>>N/A</label>
                </td>
              </tr>
              <tr>
                <th>Introduce yourself.</th>
                <td class="txLeft">
                	<c:if test="${not empty map }">
                		${map.INTRODUCE }
                	</c:if>
                	<c:if test="${empty map }">
                		<textarea name="INTRODUCE" id="introduce" cols="100" rows="5"></textarea>
                	</c:if>
                </td>
              </tr>
            </tbody>
          </table>

        <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
           <h4><strong>02</strong>Academic background</h4>
            <tbody>
              <tr>
                <th width="15%">Highest level of education</th>
                <td width="85%" class="txLeft">
                	<label><input name="GRADUATE_SCH" type="radio" value="N/A" checked="checked" <c:if test="${map.GRADUATE_SCH eq 'N/A'}">checked</c:if>>N/A</label>
                    <label><input name="GRADUATE_SCH" type="radio" value="중/고졸" <c:if test="${map.GRADUATE_SCH eq '중/고졸'}">checked</c:if>>Middle school graduate/ High school graduate</label>
                    <label><input name="GRADUATE_SCH" type="radio" value="전문대재학" <c:if test="${map.GRADUATE_SCH eq '전문대재학'}">checked</c:if>>Technical College In School</label>
                    <label><input name="GRADUATE_SCH" type="radio" value="전문대졸업" <c:if test="${map.GRADUATE_SCH eq '전문대졸업'}">checked</c:if>>Technical College Graduation</label>
                    <label><input name="GRADUATE_SCH" type="radio" value="4년제대학재학" <c:if test="${map.GRADUATE_SCH eq '4년제대학재학'}">checked</c:if>>Fourth-Year College In School</label>
                    <label><input name="GRADUATE_SCH" type="radio" value="4년제대학졸업" <c:if test="${map.GRADUATE_SCH eq '4년제대학졸업'}">checked</c:if>>Fourth-Year College Graduation</label>
                    <label><input name="GRADUATE_SCH" type="radio" value="대학원재학" <c:if test="${map.GRADUATE_SCH eq '대학원재학'}">checked</c:if>>Graduate School In School</label>
                    <label><input name="GRADUATE_SCH" type="radio" value="대학원졸업" <c:if test="${map.GRADUATE_SCH eq '대학원졸업'}">checked</c:if>>Graduate School Graduation</label>
                </td>
              </tr>
              <tr>
                <th>Diploma</th>
                <td class="txLeft">
                	<label><input name="DEP" type="radio" value="N/A" checked="checked" <c:if test="${map.DEP eq 'N/A'}">checked</c:if>>N/A</label>
                    <label><input name="DEP" type="radio" value="학사" <c:if test="${map.DEP eq '학사'}">checked</c:if>>Bachelor</label>
                    <label><input name="DEP" type="radio" value="석사" <c:if test="${map.DEP eq '석사'}">checked</c:if>>Master</label>
                    <label><input name="DEP" type="radio" value="박사" <c:if test="${map.DEP eq '박사'}">checked</c:if>>Doctorate</label>
                </td>
              </tr>
              <tr>
                <th>Final level of education</th>
                <td class="txLeft">
                	Admission / Graduation : 
                	<input type="text" size="4" id="school_entr_year" name="FINAL_A_Y" class="only-num" value="${map.FINAL_A_Y }">Year 
                	<input type="text" size="2" id="school_entr_month" name="FINAL_A_M" class="only-num" value="${map.FINAL_A_M }">Month ~
                    <input type="text" size="4" id="school_grad_year" name="FINAL_G_Y" class="only-num" value="${map.FINAL_G_Y }">Year 
                    <input type="text" size="2" id="school_grad_month" name="FINAL_G_M" class="only-num" value="${map.FINAL_G_M }">Month<br>
                    Region : <input type="text" size="20" id="school_area" name="FINAL_REGION" value="${map.FINAL_REGION }">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    School name : <input type="text" size="20" id="school_name" name="FINAL_SCH" value="${map.FINAL_SCH }">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    Major :<input type="text" size="20" id="school_major" name="FINAL_MAJOR" value="${map.FINAL_MAJOR }">
                </td>
              </tr>

              <tr>
                <th width="15%">Language Learning Institute</th>
                <td width="85%" class="txLeft">
                    <label><input name="LANG_LEARN" type="radio" value="해당사항없음" checked="checked" <c:if test="${map.LANG_LEARN eq '해당사항없음'}">checked</c:if>>N/A</label>
                    <label><input name="LANG_LEARN" type="radio" value="재학중" <c:if test="${map.LANG_LEARN eq '재학중'}">checked</c:if>>Studying</label>
                    <label><input name="LANG_LEARN" type="radio" value="졸업" <c:if test="${map.LANG_LEARN eq '졸업'}">checked</c:if>>Graduation</label>
                  <div id="div_lang_school_name">
                    &nbsp; School Name&nbsp;:&nbsp;<input type="text" size="30" maxlength="25" id="lang_school_name" name="LANG_SCH" value="${map.LANG_SCH }">
                  </div>
                </td>
              </tr>

            </tbody>
          </table>
 
 	
      <table class="data_t recruit_re" id="career" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
         
           <h4><strong>03</strong>Career</h4>
			    <a href="#this" class="Button white small" id="addCareer">Add Career</a>			    
            <tbody id="career">
               <c:forEach var="list" items="${careerList }">
           	  	<input type="hidden" id="IDX" value="${list.IDX }">
	              <tr>
	                <th width="15%" class="number"><span class="id_row_num" id="id_row_num">Career</span></th>
	                <td width="85%" class="txLeft">Joining/Leaving :
	                  <input type="text" size="4" name="JOIN_YEAR" value="${list.JOIN_YEAR }" class="only-num">
	                  Year
	                  <input type="text" size="2" name="JOIN_MONTH" value="${list.JOIN_MONTH }" class="only-num">
	                  Month ~
	                  <input type="text" size="4" name="RESIGN_YEAR" value="${list.RESIGN_YEAR }" class="only-num">
	                  Year
	                  <input type="text" size="2" name="RESIGN_MONTH" value="${list.RESIGN_MONTH }" class="only-num">
	                  Month<br>
	                  Region :
	                  <input type="text" size="20" name="REGION" value="${list.REGION }">
	                  &nbsp;&nbsp;&nbsp;&nbsp;
	                  Name of company :
	                  <input type="text" size="40" name="COMPANY" value="${list.COMPANY }">
	                  &nbsp;&nbsp;&nbsp;&nbsp;
	                  <br>
	                  Assigned task :
	                  <input type="text" size="40" name="TASK" value="${list.TASK }">
	                </td>
	                <td><a href="#this" class="btn" id="delete" name="delete">Delete</a></td>                
	             </tr>
	            </c:forEach>
            </tbody>
          </table>

     	<table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
            <h4><strong>04</strong>Linguistic ability</h4>
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
                <td class="txLeft"><input type="text" size="40" id="etc_language" name="OTHER_LANG" value="${map.OTHER_LANG }"> (E.g. French, Spanish, Russian, etc.)</td>
              </tr>
            </tbody>
          </table>
         
	   <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
	            <h4><strong>05</strong>Other Items</h4>
	            <tbody>
	                <c:forEach var="row" items="${fileList }">
	            	  <tr>
		            	 <th width="15%">file</th>
		            	 <td width="85%" class="txLeft">
		            	  	<input type="hidden" id="IDX" value="${row.IDX }">
		            	  	<a href="#this" name="file">${row.ORI_FILE }</a>(${row.FILE_SIZE }kb)
		            	 </td>
	            	  </tr>
	                </c:forEach>
	              <tr>
	                <th width="15%">The attached file</th>
	                <td width="85%" class="txLeft">
	                	
	                  <input type="file" name="ori_file" id="file"> &nbsp; 
	                </td>
	              </tr>
	            </tbody>
	      </table>    
           
          <p align="center">
            <a href="" target="_self" class="button white small">Cancel</a>
            &nbsp; &nbsp;
            <c:choose>
	            <c:when test="${not empty map }">
	            	<input type="button" class="Button orange small" onclick="javascript:updateResume(this.form)" value="Update">
	            </c:when>
	            <c:when test="${empty map }">
	            	<input type="button" class="Button orange small" onclick="javascript:insertResume(this.form)" value="Registration">
	            </c:when>
            </c:choose>
          </p>

          </form>
          
          <form id="commonForm" name="commonForm"></form>

</body>
</html>