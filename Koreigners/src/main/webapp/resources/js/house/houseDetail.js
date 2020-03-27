
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

function clickWishList(){
	
	var param={
			'b_idx':getParam("room_idx"),
			'mem_id':$("#mem_id").val(),
			'board_idx':1
	}
		
		 $.ajax({
				type : "post",
			 	url : "house_Wish.do",  
				dataType : "json",
				async: false,
				data: param,
				success : function(data) {
					var dataTag = "";
					var i = 1;
					
					var list = data.list;
					console.log(">>>>>>>>>>>list :" + list); 
					
					var pvo = data.pvo;
					console.log(">>>>>>>>>>>pvo  :" + pvo); 
					
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus+"\n"
						+ "errorThrown : " + errorThrown);
				}
				
			});			
	
}