

$( function() {
	getResaleWish();
});


function getResaleWish() {
	
	var url = 'getResaleWish.do';
	

	jQuery.ajaxSettings.traditional = true;
	$.ajax({
		type : "get",
		url : url,
		dataType : "json",
		async : false,
		success : function(data) {

			var resaleWish = data.resaleWish;
			$.each(resaleWish, function(index, obj) {
				console.log(this);
				$('#rsWish_'+this.RS_IDX).removeClass('far');
				$('#rsWish_'+this.RS_IDX).addClass('fas');
			});
			
		
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("실패 : \n" + "jqXHR.readyState : " + jqXHR.readyState + "\n"
					+ "textStatus : " + textStatus + "\n" + "errorThrown : "
					+ errorThrown);
		}

	});
	

}


