function updateForm(){
	
	if($('input[name=subject]').val()==''){
		 alert("Please Checked [Title]");
		 $('input[name=subject]').focus();
		 return false;
	}
	
	
	if( ! ( $('input:radio[name=build_type]').is(':checked') ) ){
		 alert("Please Checked [Buliding Type]");
		 $('input[name=build_type]').focus();
		 return false;
	}
	
	if( ! ( $('input:radio[name=room_type]').is(':checked') ) ){
		alert("Please Checked [Room Type]");
		 $('input[name=room_type]').focus();
		 return false;
			
	}
	
	
	if( $('input[name=address]').val()==''){
		alert("Please Checked [Loctation - Address]");
		 $('input[name=address]').focus();
		 return false;
			
	}
	
	
	if( $('input[name=room_area]').val()=='' || $('input[name=room_area]').val()=='0'){
		alert("Please Checked [Area]");
		 $('input[name=room_area]').focus();
		 return false;
			
	}
	
	if( $('input[name=bulid_layers]').val()=='' || $('input[name=bulid_layers]').val()=='0'){
		alert("Please Checked [Buliding Layers]");
		 $('input[name=bulid_layers]').focus();
		 return false;
			
	}
	if( $('input[name=floor_layers]').val()=='' || $('input[name=floor_layers]').val()=='0'){
		alert("Please Checked [Floor Layers]");
		 $('input[name=floor_layers]').focus();
		 return false;
			
	}
	if( $('input[name=bulid_layers]').val() < $('input[name=floor_layers]').val()){
		alert("Please Checked [Floor]\n [Floor Layers] cannot be higher than [Buliding Layers]");
		$('input[name=floor_layers]').focus();
		return false;
		
	}
	

	//입주날짜 선택
	if($('input[name=radio_available_date]:checked').val() == '0'){
		$('input[name=available_date]').val( $('#current_date').val());
	}
	else if($('input[name=radio_available_date]:checked').val() == '1'){
		$('input[name=available_date]').val( $('#datepicker').val());
	}
	else{
		alert("Plese Checked [Available Date]");
		$('input[name=radio_available_date]').focus();
		return false;
	}
	

	
	
	//보증금 월세 관리비 , 제거
	$("#deposit").val( inputNumberRemoveComma($("#deposit").val()));
	$("#monthly_rent").val( inputNumberRemoveComma($("#monthly_rent").val()));

	if($('input[name=chk_management_expense]').is(':checked') ){
		$("#management_expense").val('0');
	}else {
		$("#management_expense").val( inputNumberRemoveComma($("#text_management_expense").val()) );
	}
	
	
	if( $('input[name=deposit]').val()=='' || $('input[name=deposit]').val()=='0'){
		alert("Please Checked [Deposit]");
		 $('input[name=deposit]').focus();
		 return false;
			
	}
	if( $('input[name=monthly_rent]').val()=='' || $('input[name=monthly_rent]').val()=='0'){
		alert("Please Checked [Monthly Rent]");
		 $('input[name=monthly_rent]').focus();
		 return false;
			
	}
	if( $('input[name=management_expense]').val()==''){
		alert("Please Checked [Management Expense]");
		 $('input[name=management_expense]').focus();
		 return false;
			
	}
	
	

	$("#form").attr('action',"house_Update.do").submit();	
	
	
	
	
}
		
