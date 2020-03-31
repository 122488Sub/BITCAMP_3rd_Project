function clickApplyEmployment(mem_id, company_idx,hire_idx){
	//mem_id 로그인한 아이디
	//b_idx  로그인한 게시글번호
	//'board_idx': 카테고리번호
	var param={
			'company_idx':Number(company_idx),
			'mem_id':mem_id,
			'hire_idx':Number(hire_idx)
	}
	var returnValue;
		console.log(param);
		
	 jQuery.ajaxSettings.traditional = true;
		 $.ajax({
				type : "get",
				url : "togleApply.do",  
				dataType : "json",
				async: false,
				data: param,
				success : function(data) {
					var dataTag = "";
					var i = 1;
					console.log(data); 
					var result = data.result;
					console.log(">>>>>>>>>>>result :" + result); 
					alert(result);
					
					
					if(result=="You have been removed from your Wish List."){
						returnValue=2;
					}else{
						returnValue=1;
					}
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패 : \n"+jqXHR+"\n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus+"\n"
						+ "errorThrown : " + errorThrown);
				}
				
			});		
		 return returnValue;
	
}