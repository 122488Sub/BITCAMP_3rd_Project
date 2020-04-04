function clickInformModify() {
	post_goto('InfoModify_go.do', {'info_idx':getParam("info_idx")},false);
}


function clickInformDelete() {
	var jbResult = prompt( 'If you want to delete this post, please enter "Delete".', '' );
	if(jbResult=='Delete'){
		post_goto('InfoDelete.do', {'info_idx':getParam("info_idx")},false);
	}
	else if(jbResult!=null){
		alert("You entered it incorrectly");
	}
}