function clickWishBtn(mem_id, b_idx,board_idx){
	var result=clickWishList(mem_id, b_idx,board_idx);
	console.log(result);
	if(result==1){
		/*$('#wishBtn').val('♥Add to pick');*/
		var x = document.getElementById('wishBtn');
		x.style.backgroundColor = 'firebrick';
		x.value = '♥Add to Wishlist';
		
	}else{
		/*$('#wishBtn').val('♡Add to pick');*/
		var x = document.getElementById('wishBtn');
		x.style.backgroundColor = '#0B3B39';
		x.value = '♡Add to Wishlist';
	}
}
function clickWishGrid(mem_id, b_idx,board_idx){

	if(mem_id==''){
		alert('Please log in first');
		return;
	}
		
	
	var result=clickWishList(mem_id, b_idx,board_idx);
	console.log(result);
	if(result==1){
		if(board_idx==4 || board_idx==1 ){
			$('#wish_'+b_idx).removeClass('far');
			$('#wish_'+b_idx).addClass('fas');
			$('#wishBtn').css('backgroundColor','firebrick');
		}
		else if(board_idx==3){
			$('#rsWish_'+b_idx).removeClass('far');
			$('#rsWish_'+b_idx).addClass('fas');
			$('#wishBtn').css('backgroundColor','firebrick');
		}
	}else{
		if(board_idx==4 || board_idx==1 ){
			$('#wish_'+b_idx).removeClass('fas');
			$('#wish_'+b_idx).addClass('far');
			$('#wishBtn').css('backgroundColor','#0B3B39');
		}
		else if(board_idx==3){
			$('#rsWish_'+b_idx).removeClass('fas');
			$('#rsWish_'+b_idx).addClass('far');
			$('#wishBtn').css('backgroundColor','#0B3B39');
		}
	
	}
	
}
function clickWishList(mem_id, b_idx,board_idx){
	//mem_id 로그인한 아이디
	//b_idx  로그인한 게시글번호
	//'board_idx': 카테고리번호
	var param={
			'b_idx':Number(b_idx),
			'mem_id':mem_id,
			'board_idx':Number(board_idx)
	}
	var returnValue;
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