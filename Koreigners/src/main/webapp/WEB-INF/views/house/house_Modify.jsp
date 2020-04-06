<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!--  <link rel="stylesheet" href="resources/css/house/houseFormData.css">-->    
<!-- jQuery 기본 js파일-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!--  jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
  
<script type="text/javascript" src="resources/js/house/houseFormData.js"></script>
<script type="text/javascript" src="resources/js/house/houseModify.js"></script>
<script type="text/javascript">
	$(function() {
		console.log("${house.room_idx}")
		$('input[name=subject]').val("${house.subject}");
		$('input[name=build_type]:radio[value="${house.build_type}"]').prop('checked',true);
		$('input[name=room_type]:radio[value="${house.room_type}"]').prop('checked',true);
		$('input[name=address_detail]').val("${house.address_detail}");
		$('input[name=address]').val("${house.address}");
		$('input[name=do_en]').val("${house.do_en}");
		$('input[name=gu_gun_eup_eng]').val("${house.gu_gun_eup_eng}");
		printMap("${house.address}");
		
		$('input[name=room_area]').val("${house.room_area}");
		$('input[name=bulid_layers]').val("${house.bulid_layers}");
		$('input[name=floor_layers]').val("${house.floor_layers}");
		
		$('input[name=floor_type]:radio[value="${house.floor_type}"]').prop('checked',true);
		$('#radio_available_date_After').prop('checked',true);
		$('#datepicker').val("${house.available_date}");
		$('#stay_num_min').val("${house.stay_num_min}").prop("selected", true);
		$('input[name=deposit]').val("${house.deposit}");
		inputNumberAutoComma(document.getElementById('deposit'));
		$('input[name=monthly_rent]').val("${house.monthly_rent}");
		inputNumberAutoComma(document.getElementById('monthly_rent'));
		
		//console.log("${house.management_expense}");
		if("${house.management_expense}"==0){
			$('input[name=chk_management_expense]').prop('checked',true);
			$("#text_management_expense").attr("disabled",true);
		}
		else{
			$("#text_management_expense").val("${house.management_expense}");
		}
		if("${house.air_conditioner}"==1){
			$('input[name=air_conditioner]').prop('checked',true);
		}
		if("${house.heating}"==1){
			$('input[name=heating]').prop('checked',true);
		}
		if("${house.closet}"==1){
			$('input[name=closet]').prop('checked',true);
		}
		if("${house.desk}"==1){
			$('input[name=desk]').prop('checked',true);
		}
		if("${house.chair}"==1){
			$('input[name=chair]').prop('checked',true);
		}
		if("${house.bad_type}"==1){
			$('input[name=bad_type]').prop('checked',true);
		}
		if("${house.refrigerator}"==1){
			$('input[name=refrigerator]').prop('checked',true);
		}
		if("${house.laundry}"==1){
			$('input[name=laundry]').prop('checked',true);
		}
		if("${house.kitchen_stove}"==1){
			$('input[name=kitchen_stove]').prop('checked',true);
		}
		if("${house.sink}"==1){
			$('input[name=sink]').prop('checked',true);
		}
		

		if ("${house.bathroom}" == 1) {
			$('input[name=bathroom]').prop('checked',true);
		}
		if ("${house.internet}" == 1) {
			$('input[name=internet]').prop('checked',true);
		}
		if ("${house.wifi}" == 1) {
			$('input[name=wifi]').prop('checked',true);
		}
		if ("${house.elevator}" == 1) {
			$('input[name=elevator]').prop('checked',true);
		}
		if ("${house.pet}" == 1) {
			$('input[name=pet]').prop('checked',true);
		}	
		if ("${house.parking}" == 1) {
			$('input[name=parking]').prop('checked',true);
		}	
	});
</script>
<style>
	.inputBox {
		padding: .375rem .75rem;
		line-height: 1.5;
		font-size: 1rem;
		color: #495057;
		background-color: white;
		border: 1px solid #ced4da;
		border-radius: .25rem;
	}
	
	#mapDisp {
		width: 100%;
		height: 250px;
		margin: 0 auto;
		margin-bottom: 5px;
		border: 1px solid #ced4da;
		border-radius: .25rem;
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
                    <h2>Modifying the post</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
	
	<div id="container">
	
	<form action="" id="form" name="form" method="post" enctype="multipart/form-data">
	<br><br>
	<input type='hidden' name="mem_email" value="${house.mem_email }">
	<input type='hidden' name="room_idx" value="${house.room_idx }">
	<jsp:include page="house_formData.jsp"></jsp:include>
	
	<div class="td_div" style="text-align: center;">
		<button class="btn hvr-hover" onclick="updateForm()">Complete post edit</button>
		<!--  <input type="button" value="글 수정 등록" onclick="updateForm();">-->
	</div>
	</form>
	<p><a href="house_main.do">글 목록 가기</a></p>
</div>

</body>
</html>











