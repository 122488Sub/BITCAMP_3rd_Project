<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 버튼 */
.Button {font-weight:600;color:#333;line-height:1.2em;border:1px solid #BEBEBE;background-color:#EBEBEB;cursor:hand;}
.Button.x-small {height:21px;padding:1px 10px;font-size:12px;font-weight:400;}
.Button.small {height:25px;padding:3px 20px;font-size:13px;}
.Button.large {height:35px;padding:5px 30px;font-size:16px;}
.Button.white {color:#000;border:1px solid #999;background-color:#fff;}
.Button.orange {color:#fff;border:1px solid #C03312;background-color:#EA6242;}
.Button.black {color:#fff;border:1px solid #000;background-color:#333;}
/* 테이블 기본 속성 */
.data_t {clear:both;overflow:hidden;width:100%;margin-bottom:70px;border-left:1px solid #E3E3E3;border-top:2px solid #312F2F;
border-collapse:separate;empty-cells:show;border-spacing:0;}
.data_t caption {padding:0;margin-bottom:30px;font-size:20pt;font-weight:600;color:#000;line-height:1.3em;text-align:left;}
.data_t caption span {float:right;right:0;font-size:11px;font-weight:400;color:#333;}
.data_t caption a {float:right;right:0;padding:5px 20px 5px 5px;margin-top:10px;font-size:11px;font-weight:400;color:#333;line-height:1.0em;
border:1px solid #ddd;background:url(/coding/images/more.png) no-repeat 90% 50%;}
.data_t thead th {padding:12px 0;font-weight:600;color:#000;border-bottom:1px solid #989898;background-color:#FAFAFA;}
.data_t thead th.none {border-top:none;} /*text-transform:uppercase;*/
.data_t th,.data_t td {padding:4px 5px;text-align:center;line-height:2.2em;border-bottom:1px solid #c3c3c3;border-right:1px solid #c3c3c3;color:#333;text-align:center;}
.data_t tbody th {font-weight:600;}
.data_t tfoot th,.data_t tfoot td {background-color:#f6f6f6;}
.data_t tbody td.txLeft {text-align:left; background-color:rgba(81, 68, 56, 0.05);}
.data_t td,.data_t td a,.data_t td strong,.data_t td span {font-size:12px;font-family:dotum,gulim;}
.data_t td {color:#666; background: rgba(81, 68, 56, 0.05);}
.data_t td a {color:#000;}
.data_t td a:hover {text-decoration:underline;color:#710F0F;}
.data_t td input,.data_t td select,.data_t td select option {margin:0 3px;font-size:12px;font-family:dotum,gulim;color:#333;vertical-align:middle;}

.data_t.recruit tr:hover {background-color:#F2ECE6;}

.data_t.job {background-color:#FAFAFA;}
.data_t.jog thead td {background-color:#F3F3F3;}
.data_t.job tr:hover {background-color:#fff;}

.data_t.recruit_re caption {padding-left:18px;margin-bottom:10px;font-size:15px;color:#710F0F;background:url(/coding/images/bl_square.png) 
no-repeat 1px 50%;}
.data_t.recruit_re tbody th {background-color:#FAFAFA;}

/* 테이블 td 왼쪽 정렬 */
.tdLeft tbody td,table th.text_left,table td.text_left,table td.fleft {text-align:left;}
</style>
<script type="text/javascript" src="resources/js/member/sojaeji.js"></script>
<script type="text/javascript">
$(function() {

  // 전문분야 셀렉박스 선택 시.
  $("#field_seq1").bind("change", function () {
    if (this.value == '') {
      $('#field_seq2').find("option").remove();
    } else {
      $.post("/gears/indivisual/ajaxField2.asp", { action: "field1", seq: this.value }, function (result) {
        var $field1 = result.field1;
        var $field2 = $("#field_seq2");
        $field2.find("option").remove();

        $.each($field1, function (i) {
          $field2.append("<option value='" + this.field_seq + "'>" + this.field_name_eng + "</option>");
        });

      }, "json").error(function (xhr, error) {
        alert("Server error.");
      });
    } // end if
  });

  // 희망급여 추가
  $('#form1').on('keyup', 'input.num_only2', function(e){
    if( $(this).val() != null && $(this).val() != '' ) {
      var tmps = parseInt($(this).val().replace(/[^0-9]/g, '')) || 0;
      var tmps2 = tmps.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
      $(this).val(tmps2);
    }

    var msg = $(this).next('span.msg').removeClass('success fail');
    if ( parseInt($('#pay_amount1').val()) > parseInt($('#pay_amount2').val()) ) {
      msg.addClass('fail').html('Desired minimum salary is greater than maximum salary');
    } else {
      msg.removeClass('success fail').html('');
    } // end if--

  });

  // 최종학력 > 해당사항없음 선택 시 '학위', '최종학교' 비활성화
  var st = $(":input:radio[name=edu_level]:checked").val();
  if ($(":input:radio[name=edu_level]:checked").val() == '') {
    $(':input:radio[name=degree]').attr('disabled', true);
    $('#school_entr_year').val('').attr('disabled', true);
    $('#school_entr_month').val('').attr('disabled', true);
    $('#school_grad_year').val('').attr('disabled', true);
    $('#school_grad_month').val('').attr('disabled', true);
    $('#school_area').val('').attr('disabled', true);
    $('#school_name').val('').attr('disabled', true);
    $('#school_major').val('').attr('disabled', true);
  } else if ($(":input:radio[name=edu_level]:checked").val() == '중/고졸') {
    $(':input:radio[name=degree]').attr('disabled', true);
  } else {
    $(':input:radio[name=degree]').attr('disabled', false);
    $('#school_entr_year').attr('disabled', false);
    $('#school_entr_month').attr('disabled', false);
    $('#school_grad_year').attr('disabled', false);
    $('#school_grad_month').attr('disabled', false);
    $('#school_area').attr('disabled', false);
    $('#school_name').attr('disabled', false);
    $('#school_major').attr('disabled', false);
  }
  $('input[type=radio][name=edu_level]').change(function() {
    if ($(":input:radio[name=edu_level]:checked").val() == '') {
      $(':input:radio[name=degree]').attr('disabled', true);
      $('#school_entr_year').val('').attr('disabled', true);
      $('#school_entr_month').val('').attr('disabled', true);
      $('#school_grad_year').val('').attr('disabled', true);
      $('#school_grad_month').val('').attr('disabled', true);
      $('#school_area').val('').attr('disabled', true);
      $('#school_name').val('').attr('disabled', true);
      $('#school_major').val('').attr('disabled', true);
    } else if ($(":input:radio[name=edu_level]:checked").val() == '중/고졸') {
      $(':input:radio[name=degree]').attr('disabled', true);
      $('#school_entr_year').attr('disabled', false);
      $('#school_entr_month').attr('disabled', false);
      $('#school_grad_year').attr('disabled', false);
      $('#school_grad_month').attr('disabled', false);
      $('#school_area').attr('disabled', false);
      $('#school_name').attr('disabled', false);
      $('#school_major').attr('disabled', false);
    } else {
      $(':input:radio[name=degree]').attr('disabled', false);
      $('#school_entr_year').attr('disabled', false);
      $('#school_entr_month').attr('disabled', false);
      $('#school_grad_year').attr('disabled', false);
      $('#school_grad_month').attr('disabled', false);
      $('#school_area').attr('disabled', false);
      $('#school_name').attr('disabled', false);
      $('#school_major').attr('disabled', false);
    }
  });

  // 어학당 이름 비활성화.
  if ($(":input:radio[name=lang_school_type]:checked").val() == '해당사항없음') {
    $('#div_lang_school_name').hide();
  } else {
    $('#div_lang_school_name').show();
  }
  $('input[type=radio][name=lang_school_type]').change(function() {
    if ($(":input:radio[name=lang_school_type]:checked").val() == '해당사항없음') {
      $('#lang_school_name').val('');
      $('#div_lang_school_name').hide();
    } else {
      $('#div_lang_school_name').show();
    }
  });

  //--근무시간 관련 체크
  if( $('#work_time_type3').is(':checked') ) {
    $('#view_div1').show();
  } else {
    $('#view_div1').hide();
  }
  //--근무시간 관련 이벤트
  $("input[name=work_time_type]").change(function() {
    if( $('#work_time_type3').is(':checked') ) {
      $('#view_div1').show();
    } else {
      $('#view_div1').hide();
    }
  });
  //--선호요일 관련 체크
  if( $('#work_time_isweek1').is(':checked') ) {
    $('#view_div2').show();
  } else {
    $('#view_div2').hide();
  }
  //--선호요일 관련 이벤트
  $("input[name=work_time_isweek]").change(function() {
    if( $('#work_time_isweek1').is(':checked') ) {
      $('#view_div2').show();
    } else {
      $('#view_div2').hide();
    }
  });

  $('#form1').submit(function () {
    //var num_check = /^[0-9]*$/;
    var num_check = /^(\d|-)?(\d|,)*?\d*$/;

    if (this.req_area.value == '') { return alert('Select your preferred working area'), this.req_area.focus(), false; }
    if ($("select#field_seq1").val() == null || $("select#field_seq1").val() == "") {
      alert("Select your specialty"); return false;
    }
    if (this.req_job.value == '') { return alert('Enter your desired job'), this.req_job.focus(), false; }

    // 희망급여 추가
    if (this.pay_type[0].checked == false && this.pay_type[1].checked == false && this.pay_type[2].checked == false && this.pay_type[3].checked == false) return alert('please select salary type'), this.pay_type[0].focus(), false;
    if (this.pay_amount1.value == '') { return alert('Enter your desired salary'), this.pay_amount1.focus(), false; }
    if (!num_check.test(this.pay_amount1.value)) { return alert('Enter your desired salary in numbers'), this.pay_amount1.focus(), false; }
    if (this.pay_amount2.value == '') { return alert('Enter your desired salary'), this.pay_amount2.focus(), false; }
    if (!num_check.test(this.pay_amount2.value)) { return alert('Enter your desired salary in numbers'), this.pay_amount2.focus(), false; }

    //--선호요일 관련
    if( $('#work_time_isweek1').is(':checked') ) {
      if ($("input[name='work_time_week']:checked").length == 0) { return alert('You should select over than one'), this.work_time_week1.focus(), false; }
    } // 선호요일을 1개 이상 선택해야 합니다

    if ($(":input:radio[name=lang_school_type]:checked").val() == '재학중' || $(":input:radio[name=lang_school_type]:checked").val() == '졸업') {
      if ($.trim(this.lang_school_name.value) == '') { return alert('Please enter the school name'), this.lang_school_name.focus(), false; }
    }

    this.target = 'ifr_user_form';
    return true;
  });

  $('.only-num').keyup(function () {
      this.value = this.value.replace(/[^0-9]/g,'');
  });
  
  
	//카테고리 세션박스 변경 시 하위 카테고리 select ajax
	$("#selectBox1").change(function(){
		console.log("바뀜");
		var selectBox1 = document.getElementById("selectBox1");
		console.log(this.value);
		cate_prnt_en = this.value;
		
		$.ajax("getCateEnJson.do", {
			type: "get",
			dataType : "json",
			data: {"cate_prnt_en" : cate_prnt_en},
			success : function(data){
				
				var strData = JSON.stringify(data);
				
				var jsData = JSON.parse(strData); //자바 스크립트 데이터로 형 변환
				
				
				var dataTag = "";
				$.each(data, function(index, obj){
					dataTag += "<option value=" + this.cate_child_en +">"
					dataTag += this.cate_child_en;
					dataTag += "</option>";
				});
	
				$("#cate_child_en").html(dataTag);
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert("Ajax 처리 실패 : \n" +
					  "jqXHR.readyState : " + jqXHR.readyState + "\n" +
					  "textStatus : " + textStatus + "\n" +
					  "errorThrown : " + errorThrown);
			}
		});	
	});
});

</script>
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

          <form name="form1" id="form1" method="post" enctype="multipart/form-data" action="">
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

          <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
          	<caption>Required fields</caption>
            <tbody>
              <tr>
                <th width="15%">Desired working area<span class="red">*</span></th>
                <td width="85%" class="txLeft">
					<select name="sido1" id="sido1"></select>
					<select name="gugun1" id="gugun1"></select>
					
					<script type="text/javascript">
					new sojaeji('sido1', 'gugun1');
					</script>
                </td>
              </tr>				
              <tr>
                <th>Professional field<span class="red">*</span></th>
                <td class="txLeft">
				  <select name="cate_prnt_en" id="selectBox1" title="직종선택">
				    <c:forEach items="${mpCateMap}" var="option">
					  <option class="${option.key}">${option.value}</option>
					</c:forEach>
				  </select>
				
				  <select name="cate_child_en" title="직종선택"  id="cate_child_en">
				  </select><br><br>
                </td>
              </tr>
              <tr>
                <th>Desired job<span class="red">*</span></th>
                <td class="txLeft" style="line-height:130%;">
                <input type="text" size="70" maxlength="95" id="req_job" name="req_job" value="" placeholder="Here fill in the specific job position you want.(Use Kor. or Eng.)">
                <!--<br><span class="red">※ This corresponds to the title in the job search list accessible to the outside.</span>-->
                <br><span class="blue">※ You can fill in multiple positions you want.</span></td>
              </tr>

              <tr>
                <th>Requested salary<span class="red">*</span></th>
                <td class="txLeft">
                  
                    <input name="pay_type" id="pay_type0" type="radio" value="시급제"><label for="pay_type0">Hourly pay system</label> &nbsp;
                    <input name="pay_type" id="pay_type1" type="radio" value="일당제"><label for="pay_type1">Daily pay system</label> &nbsp;
                    <input name="pay_type" id="pay_type2" type="radio" value="월급제"><label for="pay_type2">Monthly salary system</label> &nbsp;
                    <input name="pay_type" id="pay_type3" type="radio" value="연봉제"><label for="pay_type3">Annual wage system</label> &nbsp;
                  <br>
                  <input type="text" size="11" maxlength="11" id="pay_amount1" name="pay_amount1" value="" class="num_only2"> ~ <input type="text" size="11" maxlength="11" id="pay_amount2" name="pay_amount2" value="" class="num_only2">￦
                  <span class="msg"></span>
                </td>
              </tr>

              <tr>
                <th>Prefer working hours<span class="red">*</span></th>
                <td class="txLeft"><label><input type="radio" name="work_time_type" id="work_time_type1" value="주간" checked="checked">Day</label> &nbsp;<label><input type="radio" name="work_time_type" id="work_time_type2" value="야간">Night</label> &nbsp;<label><input type="radio" name="work_time_type" id="work_time_type3" value="기타(파트타임)">ETC.(Part-time job)</label> &nbsp;
                  <div id="view_div1">
                    ●Star work time
                    <select name="work_time_start" id="work_time_start"><option  value="00:00">00:00</option><option  value="01:00">01:00</option><option  value="02:00">02:00</option><option  value="03:00">03:00</option><option  value="04:00">04:00</option><option  value="05:00">05:00</option><option  value="06:00">06:00</option><option  value="07:00">07:00</option><option  value="08:00">08:00</option><option  value="09:00">09:00</option><option  value="10:00">10:00</option><option  value="11:00">11:00</option><option  value="12:00">12:00</option><option  value="13:00">13:00</option><option  value="14:00">14:00</option><option  value="15:00">15:00</option><option  value="16:00">16:00</option><option  value="17:00">17:00</option><option  value="18:00">18:00</option><option  value="19:00">19:00</option><option  value="20:00">20:00</option><option  value="21:00">21:00</option><option  value="22:00">22:00</option><option  value="23:00">23:00</option><option  value="24:00">24:00</option>
                    </select>
                    &nbsp; &nbsp;
                    ●Off work time
                    <select name="work_time_end" id="work_time_end"><option  value="00:00">00:00</option><option  value="01:00">01:00</option><option  value="02:00">02:00</option><option  value="03:00">03:00</option><option  value="04:00">04:00</option><option  value="05:00">05:00</option><option  value="06:00">06:00</option><option  value="07:00">07:00</option><option  value="08:00">08:00</option><option  value="09:00">09:00</option><option  value="10:00">10:00</option><option  value="11:00">11:00</option><option  value="12:00">12:00</option><option  value="13:00">13:00</option><option  value="14:00">14:00</option><option  value="15:00">15:00</option><option  value="16:00">16:00</option><option  value="17:00">17:00</option><option  value="18:00">18:00</option><option  value="19:00">19:00</option><option  value="20:00">20:00</option><option  value="21:00">21:00</option><option  value="22:00">22:00</option><option  value="23:00">23:00</option><option  value="24:00">24:00</option>
                    </select>
                    <br>
                    <label><input type="radio" name="work_time_isweek" id="work_time_isweek0" value="0" checked="checked">Regardless day of the week</label>
                    &nbsp; &nbsp;
                    <label><input type="radio" name="work_time_isweek" id="work_time_isweek1" value="1">Prefer working day of the week(Multiple selections available)</label>

                    <div id="view_div2"><label><input type="checkbox" name="work_time_week" id="work_time_week1" value="매주 월요일">Every Monday</label> &nbsp;<label><input type="checkbox" name="work_time_week" id="work_time_week2" value="매주 화요일">Every Tuesday</label> &nbsp;<label><input type="checkbox" name="work_time_week" id="work_time_week3" value="매주 수요일">Every Wednesday</label> &nbsp;<label><input type="checkbox" name="work_time_week" id="work_time_week4" value="매주 목요일">Every Thursday</label> &nbsp;<label><input type="checkbox" name="work_time_week" id="work_time_week5" value="매주 금요일">Every Friday</label> &nbsp;<label><input type="checkbox" name="work_time_week" id="work_time_week6" value="매주 토요일">Every Saturday</label> &nbsp;<label><input type="checkbox" name="work_time_week" id="work_time_week7" value="매주 일요일">Every Sunday</label> &nbsp;
                    </div>

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
                	<label><input name="commute_way" id="commute_way1" type="radio" value="기숙사">Dormitory</label>
                  <label><input name="commute_way" id="commute_way2" type="radio" value="출퇴근">Commute</label>
                  <label><input name="commute_way" id="commute_way3" type="radio" value="상관없음" checked="checked">N/A</label>
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
                	<label><input name="edu_level" type="radio" value="" checked="checked">N/A</label>
                    <label><input name="edu_level" type="radio" value="중/고졸">Middle school graduate/ High school graduate</label>
                    <label><input name="edu_level" type="radio" value="전문대재학">Technical College In School</label>
                    <label><input name="edu_level" type="radio" value="전문대졸업">Technical College Graduation</label>
                    <label><input name="edu_level" type="radio" value="4년제대학재학">Fourth-Year College In School</label>
                    <label><input name="edu_level" type="radio" value="4년제대학졸업">Fourth-Year College Graduation</label>
                    <label><input name="edu_level" type="radio" value="대학원재학">Graduate School In School</label>
                    <label><input name="edu_level" type="radio" value="대학원졸업">Graduate School Graduation</label>
                </td>
              </tr>
              <tr>
                <th>Diploma</th>
                <td class="txLeft">
                	<label><input name="degree" type="radio" value="" checked="checked">N/A</label>
                    <label><input name="degree" type="radio" value="학사">Bachelor</label>
                    <label><input name="degree" type="radio" value="석사">Master</label>
                    <label><input name="degree" type="radio" value="박사">Doctorate</label>
                </td>
              </tr>
              <tr>
                <th>Final level of education</th>
                <td class="txLeft">
                	Admission / Graduation : <input type="text" size="4" id="school_entr_year" name="school_entr_year" value="" class="only-num">Year <input type="text" size="2" id="school_entr_month" name="school_entr_month" value="" class="only-num">Month ~
                  <input type="text" size="4" id="school_grad_year" name="school_grad_year" value="" class="only-num">Year <input type="text" size="2" id="school_grad_month" name="school_grad_month" value="" class="only-num">Month<br>
                  Region : <input type="text" size="20" id="school_area" name="school_area" value="">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  School name : <input type="text" size="20" id="school_name" name="school_name" value="">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  Major :<input type="text" size="20" id="school_major" name="school_major" value="">
                </td>
              </tr>

              <tr>
                <th width="15%">Language Learning Institute</th>
                <td width="85%" class="txLeft">
                    <label><input name="lang_school_type" type="radio" value="해당사항없음" checked="checked">N/A</label>
                    <label><input name="lang_school_type" type="radio" value="재학중">Studying</label>
                    <label><input name="lang_school_type" type="radio" value="졸업">Graduation</label>
                  <div name="div_lang_school_name" id="div_lang_school_name">
                    &nbsp; School Name&nbsp;:&nbsp;<input type="text" size="30" maxlength="25" id="lang_school_name" name="lang_school_name" value="">
                  </div>
                </td>
              </tr>

            </tbody>
          </table>

          <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
           <h4><strong>03</strong>Career</h4>
            <tbody>
              <tr>
                <th width="15%">Career 1</th>
                <td width="85%" class="txLeft">Joining/Leaving :
                  <input type="text" size="4" id="career1_join_year" name="career1_join_year" value="" class="only-num">
                  Year
                  <input type="text" size="2" id="career1_join_month" name="career1_join_month" value="" class="only-num">
                  Month ~
                  <input type="text" size="4" id="career1_resign_year" name="career1_resign_year" value="" class="only-num">
                  년
                  <input type="text" size="2" id="career1_resign_month" name="career1_resign_month" value="" class="only-num">
                  Month<br>
                  Region :
                  <input type="text" size="20" id="career1_area" name="career1_area" value="">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  Name of company :
                  <input type="text" size="40" id="career1_company" name="career1_company" value="">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <br>
                  Assigned task :
                  <input type="text" size="40" id="career1_job" name="career1_job" value="">
                </td>
              </tr>
              <tr>
                <th width="15%">Career 2</th>
                <td width="85%" class="txLeft">Joining/Leaving :
                  <input type="text" size="4" id="career2_join_year" name="career2_join_year" value="" class="only-num">
                  Year
                  <input type="text" size="2" id="career2_join_month" name="career2_join_month" value="" class="only-num">
                  Month ~
                  <input type="text" size="4" id="career2_resign_year" name="career2_resign_year" value="" class="only-num">
                  Year
                  <input type="text" size="2" id="career2_resign_month" name="career2_resign_month" value="" class="only-num">
                  Month<br>
                  Region :
                  <input type="text" size="20" id="career2_area" name="career2_area" value="">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  Name of company :
                  <input type="text" size="40" id="career2_company" name="career2_company" value="">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <br>
                  Assigned task :
                  <input type="text" size="40" id="career2_job" name="career2_job" value="">
                </td>
              </tr>

            </tbody>
          </table>

          <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
            <h4><strong>04</strong>Linguistic ability</h4>
            <tbody>
              <tr>
                <th>Korean</th>
                <td class="txLeft">Conversational ability : <label><input name="kor_conversation" type="radio" value="상">Advanced </label>
                	<label><input name="kor_conversation" type="radio" value="중">Intermediate</label>
                  <label><input name="kor_conversation" type="radio" value="하">Beginner</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <br>
                Ability to work with documents : <label><input name="kor_document" type="radio" value="상">Advanced</label>
                	<label><input name="kor_document" type="radio" value="중">Intermediate</label>
                  <label><input name="kor_document" type="radio" value="하">Beginner</label></td>
              </tr>
              <tr>
                <th>Chinese</th>
                <td class="txLeft">Conversational ability : <label><input name="chi1_conversation" type="radio" value="상">Advanced </label>
                	<label><input name="chi1_conversation" type="radio" value="중">Intermediate</label>
                  <label><input name="chi1_conversation" type="radio" value="하">Beginner</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <br>
                Ability to work with documents : <label><input name="chi1_document" type="radio" value="상">Advanced</label>
                	<label><input name="chi1_document" type="radio" value="중">Intermediate</label>
                  <label><input name="chi1_document" type="radio" value="하">Beginner</label></td>
              </tr>
              <tr>
                <th>English</th>
                <td class="txLeft">Conversational ability : <label><input name="eng_conversation" type="radio" value="상">Advanced </label>
                	<label><input name="eng_conversation" type="radio" value="중">Intermediate</label>
                  <label><input name="eng_conversation" type="radio" value="하">Beginner</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <br>
                Ability to work with documents : <label><input name="eng_document" type="radio" value="상">Advanced</label>
                	<label><input name="eng_document" type="radio" value="중">Intermediate</label>
                  <label><input name="eng_document" type="radio" value="하">Beginner</label></td>
              </tr>
              <tr>
                <th>Vietnamese</th>
                <td class="txLeft">Conversational ability : <label><input name="jap_conversation" type="radio" value="상">Advanced </label>
                	<label><input name="jap_conversation" type="radio" value="중">Intermediate</label>
                  <label><input name="jap_conversation" type="radio" value="하">Beginner</label>&nbsp;&nbsp;&nbsp;&nbsp;
                <br>
                Ability to work with documents : <label><input name="jap_document" type="radio" value="상">Advanced</label>
                	<label><input name="jap_document" type="radio" value="중">Intermediate</label>
                  <label><input name="jap_document" type="radio" value="하">Beginner</label></td>
              </tr>
              <tr>
                <th>Other language</th>
                <td class="txLeft"><input type="text" size="40" id="etc_language" name="etc_language" value=""> (E.g. French, Spanish, Russian, etc.)</td>
              </tr>
            </tbody>
          </table>

          <table class="data_t recruit_re" width="100%" border="0" cellspacing="0" cellpadding="0" summary="">
            <h4><strong>05</strong>Other Items</h4>
            <tbody>
              <tr>
                <th width="15%">The attached file</th>
                <td width="85%" class="txLeft">
                  <input type="file" name="file1" id="file1"> &nbsp; 
                </td>
              </tr>
            </tbody>
          </table>

          <p align="center">
            <a href="" target="_self" class="button white small">Cancel</a>
            &nbsp; &nbsp;
          	<button type="submit" id="" class="Button orange small">Registration</button>
          </p>

          </form>

          </div>
</body>
</html>