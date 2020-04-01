


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


