$(function() {
	checkSize();
	$(window).resize(function() {
		// width값을 가져오기
		checkSize();
	});
});
// 여기까지 페이징로딩후 자동시작//
var width_size;
function checkSize() {
	width_size = window.innerWidth;
	console.log(width_size);
	// 800 이하인지 if문으로 확인
	if (width_size <= 1300) {
		changeMinSizeUtilities();
	} else if(width_size<1960 && width_size>1300){
		changeMaxSizeUtilities();
	}
}
function changeMinSizeUtilities() {
	
	$("#map").css('float', 'none');
	$("#map").css('margin','0 auto');
	$("#map").css('width','350px');
	$("#map").css('height','450px');
	
	$("#responDiv").css('height', '900px');
	$("#content").css('height', '900px');
	
	$("#option_panel").css('float', 'none');
	$("#option_panel").css('margin','0 auto');
	$("#option_panel").css('width','560px');
	
	$(".table_dosi").css('margin','0 auto');
	$("#filterBox").css('margin','0 auto');
	
}
function changeMaxSizeUtilities() {
	$("#map").css('float', 'left');
	$("#map").css('margin','0 auto');
	$("#map").css('width','350px');
	$("#map").css('height','450px');
	
	$("#content").css('height', '450px');
	$("#responDiv").css('height', '450px');
	
	$("#option_panel").css('float', 'left');
	$("#option_panel").css('margin','0 auto');
	$("#option_panel").css('width','560px');
	
	
}
