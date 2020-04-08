
var mem_id;
var company_idx;
var hire_idx;
var resume_idx=0;
var category=0; //1:추가 //2:삭제

function clickApplyEmployment(id, company,hire){
	mem_id=id;
	company_idx=Number(company);
	hire_idx=Number(hire);
	
	var param={
			'company_idx':company_idx,
			'mem_id':mem_id,
			'hire_idx':hire_idx
	}
	var isResume;
		console.log(param);
		
	 jQuery.ajaxSettings.traditional = true;
		 $.ajax({
				type : "get",
				url : "checkResume.do",  
				dataType : "json",
				async: false,
				data: param,
				success : function(data) {
				
					isResume = data.isResume;
					console.log(">>>>>>>>>>>isResume :" + isResume); 
					 if(isResume){
						 resume_idx=data.resume_idx;
					 }
				
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패 : \n"+jqXHR+"\n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus+"\n"
						+ "errorThrown : " + errorThrown);
				}
				
			});	
		 if(isResume){
			checkApply();
		 }else{
			 var jbResult = confirm( 'You have to complete your resume.' );
			 if(jbResult){
				 post_goto('myPage_go.do?type=resume', {'':null},false); 
			 }
		 }
}

function checkApply(){
	
	var param={
			'company_idx':company_idx,
			'mem_id':mem_id,
			'hire_idx':hire_idx,
			'resume_idx':resume_idx
	}
	var isApply;
		console.log(param);
		
	 jQuery.ajaxSettings.traditional = true;
		 $.ajax({
				type : "get",
				url : "checkApply.do",  
				dataType : "json",
				async: false,
				data: param,
				success : function(data) {
				
					isApply = data.isApply;
					console.log(">>>>>>>>>>>isApply :" + isApply); 
				
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패 : \n"+jqXHR+"\n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus+"\n"
						+ "errorThrown : " + errorThrown);
				}
				
			});	
		 var jbResult;
		 if(isApply){
			 category=2;
			 jbResult = confirm( 'You have already registered your resume.\nAre you sure you want to cancel?' );
		 }else{
			 category=1;
			 jbResult = confirm( 'Would you like to register your resume?' );
		 }
		 if(jbResult){
			togleApply();
		 }
}

function togleApply(){
	
	var param={
			'company_idx':company_idx,
			'mem_id':mem_id,
			'hire_idx':hire_idx,
			'resume_idx':resume_idx,
			'category':category
	}
	var result;
		console.log(param);
		
	 jQuery.ajaxSettings.traditional = true;
		 $.ajax({
				type : "get",
				url : "togleApply.do",  
				dataType : "json",
				async: false,
				data: param,
				success : function(data) {
				
					result = data.result;
					console.log(">>>>>>>>>>>result :" + result); 
					alert(result);
				
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패 : \n"+jqXHR+"\n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus+"\n"
						+ "errorThrown : " + errorThrown);
				}
				
			});	
		
}