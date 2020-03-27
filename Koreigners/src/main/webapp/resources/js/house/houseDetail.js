
// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
function clickModify() {
	post_goto('house_Modify.do', {'room_idx':getParam("room_idx")},false);
}


function clickDelete() {
	var jbResult = prompt( 'If you want to delete this post, please enter "Delete".', '' );
	if(jbResult=='Delete')
		post_goto('house_Delete.do', {'room_idx':getParam("room_idx")},false);
	else 
		return;
}

function clickWishList( ){
	//mem_id 로그인한 아이디
	//b_idx  로그인한 게시글번호
	//'board_idx': 카테고리번호
	var param={
			'b_idx':Number(getParam("room_idx")),
			'mem_id':$("#mem_id").val(),
			'board_idx':1
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