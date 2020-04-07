$(function() {

	checkSize();
	$(window).resize(function() {
		// width값을 가져오기
		checkSize();
	});
});
var width_size;
function checkSize() {
	width_size = window.innerWidth;
	console.log(width_size);
	// 800 이하인지 if문으로 확인
	if (width_size < 1410) {
		changeMinSizeUtilities();
	} else {
		changeMaxSizeUtilities();
	}
}
function changeMinSizeUtilities() {

	$("#content").css('height', '1040px');
	$("#mapBg").css('height', '1040px');
	$("#map").css('width','50%');
	$("#map").css('float','none');
	$("#map").css('margin','0 auto');
	$("#option_panel").css('width','80%');
	$("#option_panel").css('float','none');
	$("#option_panel").css('margin','0 auto');

}
function changeMaxSizeUtilities() {
	$("#content").css('height', '520px');
	$("#mapBg").css('height', '520px');
	$("#map").css('width','35%');
	$("#map").css('float','left');
	$("#map").css('margin','0 auto');
	$("#option_panel").css('width','60%');
	$("#option_panel").css('float','left');
	$("#option_panel").css('margin','0 auto');
}
