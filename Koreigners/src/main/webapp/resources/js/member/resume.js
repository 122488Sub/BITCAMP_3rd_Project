$(function() {

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
    $('#view_span').show();
  } else {
    $('#view_span').hide();
  }
  //--근무시간 관련 이벤트
  $("input[name=work_time]").change(function() {
    if( $('#work_time_type3').is(':checked') ) {
      $('#view_span').show();
    } else {
      $('#view_span').hide();
    }
  });
  //--선호요일 관련 체크
  if( $('#work_time_isweek1').is(':checked') ) {
    $('#view_div').show();
  } else {
    $('#view_div').hide();
  }
  //--선호요일 관련 이벤트
  $("input[name=work_time_isweek]").change(function() {
    if( $('#work_time_isweek1').is(':checked') ) {
      $('#view_div').show();
    } else {
      $('#view_div').hide();
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
							
				var dataTag = "";
				$.each(data, function(index, obj){
					dataTag += "<option value=" + this.cate_child +">"
					dataTag += this.cate_child;
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
