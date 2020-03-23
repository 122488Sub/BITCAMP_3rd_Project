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

</head>
<body>
<div>
	<ul>
		<li class="tabs"><a href="myPage_go.do?type=profile">Profile Setting</a></li>
		<li class="tabs"><a href="myPage_go.do?type=resume">Resume</a></li>
		<li class="tabs"><a href="myPage_go.do?type=wishlist">Wishlist</a></li>
		<li class="tabs"><a href="myPage_go.do?type=ads">My Ads</a></li>
	</ul>
</div>

          <form name="form1" id="form1" action="insertResume.do" method="post" encType="multipart/form-data">
          <input type="hidden" name="mem_id" value="${mvo.mem_id }">

           <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
          	<caption>
          	Personal information
          	</caption>
            <tbody>
              <tr>
                <th width="15%">Name</th>
                <td width="30%" class="txLeft">
                <input type="text" name="mem_name">
                </td>
                <th width="15%">Nationality</th>
                <td width="40%" class="txLeft">&nbsp;${mvo.mem_nationality }</td>
              </tr>
              <tr>
                <th>Sex</th>
                <td class="txLeft">&nbsp;${mvo.mem_gender }</td>
                <th>Birthday</th>
                <td class="txLeft">&nbsp;${mvo.mem_birth }</td>
              </tr>
              <tr>
                <th>Cell phone</th>
                <td class="txLeft">&nbsp;${mvo.mem_phone }</td>
                <th>Residence area</th>
                <td colspan="3" class="txLeft">&nbsp;${mvo.mem_address }</td>
              </tr>
            </tbody>
          </table> 

         <!-- <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
          	<caption>Required fields</caption>
            <tbody>
              <tr>
                <th width="15%">Desired working area<span class="red">*</span></th>
                <td width="85%" class="txLeft">
					<select name="wish_do" id="sido1"></select>
					<select name="wish_si" id="gugun1"></select>
					
					<script type="text/javascript">
					new sojaeji('sido1', 'gugun1');
					</script>
                </td>
              </tr>				
              <tr>
                <th>Professional field<span class="red">*</span></th>
                <td class="txLeft">
				  <select name="job_cate" id="selectBox1" title="직종선택">
				    <c:forEach items="${mpCateMap}" var="option">
					  <option class="${option.key}">${option.value}</option>
					</c:forEach>
				  </select>
				
				  <select name="job_cate_child" title="직종선택"  id="cate_child_en">
				  </select><br><br>
                </td>
              </tr>
              
              <tr>
                <th>Requested salary<span class="red">*</span></th>
                <td class="txLeft">
                  
                    <input name="salary_type" id="pay_type0" type="radio" value="시급"><label for="pay_type0">Hourly pay system</label> &nbsp;
                    <input name="salary_type" id="pay_type1" type="radio" value="일급"><label for="pay_type1">Daily pay system</label> &nbsp;
                    <input name="salary_type" id="pay_type2" type="radio" value="월급"><label for="pay_type2">Monthly salary system</label> &nbsp;
                    <input name="salary_type" id="pay_type3" type="radio" value="연봉"><label for="pay_type3">Annual wage system</label> &nbsp;
                  <br>
                  <input type="text" size="11" maxlength="11" id="pay_amount1" name="req_salary_min" value="" class="num_only2"> ~ <input type="text" size="11" maxlength="11" id="pay_amount2" name="req_salary_max" value="" class="num_only2">￦
                  <span class="msg"></span>
                </td>
              </tr>

              <tr>
                <th>Prefer working hours<span class="red">*</span></th>
                <td class="txLeft"><label><input type="radio" name="work_time" id="work_time_type1" value="Day" checked="checked">Day</label> &nbsp;<label><input type="radio" name="work_time" id="work_time_type2" value="Night">Night</label> &nbsp;<label><input type="radio" name="work_time" id="work_time_type3" value="ETC(Part-time job)">ETC.(Part-time job)</label> &nbsp;
                  <span id="view_span">
                    ●Start work time
                    <select name="work_time_start" id="work_time_start"><option  value="00:00">00:00</option><option  value="01:00">01:00</option><option  value="02:00">02:00</option><option  value="03:00">03:00</option><option  value="04:00">04:00</option><option  value="05:00">05:00</option><option  value="06:00">06:00</option><option  value="07:00">07:00</option><option  value="08:00">08:00</option><option  value="09:00">09:00</option><option  value="10:00">10:00</option><option  value="11:00">11:00</option><option  value="12:00">12:00</option><option  value="13:00">13:00</option><option  value="14:00">14:00</option><option  value="15:00">15:00</option><option  value="16:00">16:00</option><option  value="17:00">17:00</option><option  value="18:00">18:00</option><option  value="19:00">19:00</option><option  value="20:00">20:00</option><option  value="21:00">21:00</option><option  value="22:00">22:00</option><option  value="23:00">23:00</option><option  value="24:00">24:00</option>
                    </select>
                    &nbsp; &nbsp;
                    ●Off work time
                    <select name="work_time_end" id="work_time_end"><option  value="00:00">00:00</option><option  value="01:00">01:00</option><option  value="02:00">02:00</option><option  value="03:00">03:00</option><option  value="04:00">04:00</option><option  value="05:00">05:00</option><option  value="06:00">06:00</option><option  value="07:00">07:00</option><option  value="08:00">08:00</option><option  value="09:00">09:00</option><option  value="10:00">10:00</option><option  value="11:00">11:00</option><option  value="12:00">12:00</option><option  value="13:00">13:00</option><option  value="14:00">14:00</option><option  value="15:00">15:00</option><option  value="16:00">16:00</option><option  value="17:00">17:00</option><option  value="18:00">18:00</option><option  value="19:00">19:00</option><option  value="20:00">20:00</option><option  value="21:00">21:00</option><option  value="22:00">22:00</option><option  value="23:00">23:00</option><option  value="24:00">24:00</option>
                    </select>
                  </span>
                    <br>
                    <label><input type="radio" name="work_time_isweek" id="work_time_isweek0" value="0" checked="checked">Regardless day of the week</label>
                    &nbsp; &nbsp;
                    <label><input type="radio" name="work_time_isweek" id="work_time_isweek1" value="1">Prefer working day of the week(Multiple selections available)</label>

                  <div id="view_div">
                    <label><input type="checkbox" name="work_time_week" id="work_time_week1" value="매주 월요일">Every Monday</label> &nbsp;<label><input type="checkbox" name="work_time_week" id="work_time_week2" value="매주 화요일">Every Tuesday</label> &nbsp;<label><input type="checkbox" name="work_time_week" id="work_time_week3" value="매주 수요일">Every Wednesday</label> &nbsp;<label><input type="checkbox" name="work_time_week" id="work_time_week4" value="매주 목요일">Every Thursday</label> &nbsp;<label><input type="checkbox" name="work_time_week" id="work_time_week5" value="매주 금요일">Every Friday</label> &nbsp;<label><input type="checkbox" name="work_time_week" id="work_time_week6" value="매주 토요일">Every Saturday</label> &nbsp;<label><input type="checkbox" name="work_time_week" id="work_time_week7" value="매주 일요일">Every Sunday</label> &nbsp;
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
                	<label><input name="dormitory" id="commute_way1" type="radio" value="기숙사">Dormitory</label>
                  <label><input name="dormitory" id="commute_way2" type="radio" value="출퇴근">Commute</label>
                  <label><input name="dormitory" id="commute_way3" type="radio" value="상관없음" checked="checked">N/A</label>
                </td>
              </tr>
              <tr>
                <th>Introduce yourself.</th>
                <td class="txLeft">
                	<textarea name="introduce" id="introduce" cols="100" rows="5"></textarea>
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
                	<label><input name="graduate_sch" type="radio" value="" checked="checked">N/A</label>
                    <label><input name="graduate_sch" type="radio" value="중/고졸">Middle school graduate/ High school graduate</label>
                    <label><input name="graduate_sch" type="radio" value="전문대재학">Technical College In School</label>
                    <label><input name="graduate_sch" type="radio" value="전문대졸업">Technical College Graduation</label>
                    <label><input name="graduate_sch" type="radio" value="4년제대학재학">Fourth-Year College In School</label>
                    <label><input name="graduate_sch" type="radio" value="4년제대학졸업">Fourth-Year College Graduation</label>
                    <label><input name="graduate_sch" type="radio" value="대학원재학">Graduate School In School</label>
                    <label><input name="graduate_sch" type="radio" value="대학원졸업">Graduate School Graduation</label>
                </td>
              </tr>
              <tr>
                <th>Diploma</th>
                <td class="txLeft">
                	<label><input name="dep" type="radio" value="" checked="checked">N/A</label>
                    <label><input name="dep" type="radio" value="학사">Bachelor</label>
                    <label><input name="dep" type="radio" value="석사">Master</label>
                    <label><input name="dep" type="radio" value="박사">Doctorate</label>
                </td>
              </tr>
              <tr>
                <th>Final level of education</th>
                <td class="txLeft">
                	Admission / Graduation : 
                	<input type="text" size="4" id="school_entr_year" name="final_a_y" value="" class="only-num">Year 
                	<input type="text" size="2" id="school_entr_month" name="final_a_m" value="" class="only-num">Month ~
                    <input type="text" size="4" id="school_grad_year" name="final_g_y" value="" class="only-num">Year 
                    <input type="text" size="2" id="school_grad_month" name="final_g_m" value="" class="only-num">Month<br>
                    Region : <input type="text" size="20" id="school_area" name="final_region" value="">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    School name : <input type="text" size="20" id="school_name" name="final_sch" value="">
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    Major :<input type="text" size="20" id="school_major" name="final_major" value="">
                </td>
              </tr>

              <tr>
                <th width="15%">Language Learning Institute</th>
                <td width="85%" class="txLeft">
                    <label><input name="lang_learn" type="radio" value="해당사항없음" checked="checked">N/A</label>
                    <label><input name="lang_learn" type="radio" value="재학중">Studying</label>
                    <label><input name="lang_learn" type="radio" value="졸업">Graduation</label>
                  <div id="div_lang_school_name">
                    &nbsp; School Name&nbsp;:&nbsp;<input type="text" size="30" maxlength="25" id="lang_school_name" name="lang_sch" value="">
                  </div>
                </td>
              </tr>

            </tbody>
          </table>-->
 
 	
      <table class="data_t recruit_re" id="career" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
         
           <h4><strong>03</strong>Career</h4>
			    <a href="#this" class="btn" id="addCareer">Add Career</a>			    
            <tbody id="career">
              <tr class="item1">
                <th width="15%" class="number"><span class="id_row_num" id="id_row_num">1</span></th>
                <td width="85%" class="txLeft">Joining/Leaving :
                  <input type="text" size="4" name="join_year1" value="" class="only-num">
                  Year
                  <input type="text" size="2" name="join_month1" value="" class="only-num">
                  Month ~
                  <input type="text" size="4" name="resign_year1" value="" class="only-num">
                  Year
                  <input type="text" size="2" name="resign_month1" value="" class="only-num">
                  Month<br>
                  Region :
                  <input type="text" size="20" name="region1" value="">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  Name of company :
                  <input type="text" size="40" name="company1" value="">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <br>
                  Assigned task :
                  <input type="text" size="40" name="task1" value="">
                </td>
                <td><a href="#this" class="btn" id="delete" name="delete">Delete</a></td>                
             </tr>
             <tr id="addCareer"></tr>
            </tbody>
          </table>

          <!-- <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
            <h4><strong>04</strong>Linguistic ability</h4>
            <tbody>
              <tr>
                <th>Korean</th>
                <td class="txLeft">
                  Conversational ability : 
                  <label><input name="ko_spk_abil" type="radio" value="상">Advanced </label>
                  <label><input name="ko_spk_abil" type="radio" value="중">Intermediate</label>
                  <label><input name="ko_spk_abil" type="radio" value="하">Beginner</label>
                  <label><input name="ko_spk_abil" type="radio" value="해당사항없음">N/A</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <br>
                  Ability to work with documents :
                  <label><input name="ko_doc_abil" type="radio" value="상">Advanced</label>
                  <label><input name="ko_doc_abil" type="radio" value="중">Intermediate</label>
                  <label><input name="ko_doc_abil" type="radio" value="하">Beginner</label>
                  <label><input name="ko_doc_abil" type="radio" value="해당사항없음">N/A</label></td>
              </tr>
              <tr>
                <th>Chinese</th>
                <td class="txLeft">
                  Conversational ability :
                  <label><input name="ch_spk_abil" type="radio" value="상">Advanced </label>
                  <label><input name="ch_spk_abil" type="radio" value="중">Intermediate</label>
                  <label><input name="ch_spk_abil" type="radio" value="하">Beginner</label>
                  <label><input name="ch_spk_abil" type="radio" value="해당사항없음">N/A</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <br>
                  Ability to work with documents :
                  <label><input name="ch_doc_abil" type="radio" value="상">Advanced</label>
                  <label><input name="ch_doc_abil" type="radio" value="중">Intermediate</label>
                  <label><input name="ch_doc_abil" type="radio" value="하">Beginner</label>
                  <label><input name="ch_doc_abil" type="radio" value="해당사항없음">N/A</label></td>
              </tr>
              <tr>
                <th>English</th>
                <td class="txLeft">
                  Conversational ability :
                  <label><input name="en_spk_abil" type="radio" value="상">Advanced </label>
                  <label><input name="en_spk_abil" type="radio" value="중">Intermediate</label>
                  <label><input name="en_spk_abil" type="radio" value="하">Beginner</label>
                  <label><input name="en_spk_abil" type="radio" value="해당사항없음">N/A</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <br>
                  Ability to work with documents :
                  <label><input name="en_doc_abil" type="radio" value="상">Advanced</label>
                  <label><input name="en_doc_abil" type="radio" value="중">Intermediate</label>
                  <label><input name="en_doc_abil" type="radio" value="하">Beginner</label>
                  <label><input name="en_doc_abil" type="radio" value="해당사항없음">N/A</label></td>
              </tr>
              <tr>
                <th>Vietnamese</th>
                <td class="txLeft">
                  Conversational ability :
                  <label><input name="vt_spk_abil" type="radio" value="상">Advanced </label>
                  <label><input name="vt_spk_abil" type="radio" value="중">Intermediate</label>
                  <label><input name="vt_spk_abil" type="radio" value="하">Beginner</label>
                  <label><input name="vt_spk_abil" type="radio" value="해당사항없음">N/A</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <br>
                  Ability to work with documents :
                  <label><input name="vt_doc_abil" type="radio" value="상">Advanced</label>
                  <label><input name="vt_doc_abil" type="radio" value="중">Intermediate</label>
                  <label><input name="vt_doc_abil" type="radio" value="하">Beginner</label>
                  <label><input name="vt_doc_abil" type="radio" value="해당사항없음">N/A</label></td>
              </tr>
              <tr>
                <th>Other language</th>
                <td class="txLeft"><input type="text" size="40" id="etc_language" name="other_lang" value=""> (E.g. French, Spanish, Russian, etc.)</td>
              </tr>
            </tbody>
          </table>
  -->        
	      <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
	            <h4><strong>05</strong>Other Items</h4>
	            <tbody>
	              <tr>
	                <th width="15%">The attached file</th>
	                <td width="85%" class="txLeft">
	                  <input type="file" name="ori_file" id="file1"> &nbsp; 
	                </td>
	              </tr>
	            </tbody>
	      </table>      
           
          <p align="center">
            <a href="" target="_self" class="button white small">Cancel</a>
            &nbsp; &nbsp;
          	<input type="submit" class="Button orange small" value="Registration">
          </p>

          </form>
          

          
       
</body>
</html>