function clickWishList(mem_id, b_idx,board_idx){
	//mem_id 로그인한 아이디
	//b_idx  로그인한 게시글번호
	//'board_idx': 카테고리번호
	var param={
			'b_idx':Number(b_idx),
			'mem_id':mem_id,
			'board_idx':Number(board_idx)
	}
		console.log(param);
	 jQuery.ajaxSettings.traditional = true;
		 $.ajax({
				type : "get",
			 	url : "togleWish.do",  
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
					
					
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패 : \n"+jqXHR+"\n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus+"\n"
						+ "errorThrown : " + errorThrown);
				}
				
			});			
	
}