
function wishList(idx,id){
		console.log(idx);
	
	
		$.ajax({
				url : 'hireWishList.do',
				type : 'post',
				dataType : "json",
				data : {
					hire_idx : idx,
					mem_id : id
					},
				success : function(data) {
					if(data == "1") {
						console.log("위시리스트에 저장 되었습니다.");
					} else{
						console.log("위시리스트에 저장 되지 않았습니다");
					}
				}, 
				error : function() {
					console.log("실패");
				}
			});
}
