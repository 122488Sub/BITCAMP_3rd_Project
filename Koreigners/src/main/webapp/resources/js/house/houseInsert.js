function insertForm(){
	
	if(checkForm()){
		$("#form").attr('action',"house_insert_process.do").submit();	
	}else{
		return false;
	}
}
	
