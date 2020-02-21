


function loadPage(){
		$.ajax({
				url : 'hireListData.do',
				type : 'post',
				success : function(data) {
					
					var strData = JSON.stringify(data);
					console.log("strData : " + strData);
					var jsData = JSON.parse(strData); //자바 스크립트 데이터로 형 변환
					console.log("jsData : " + jsData);
					
					var dataTag = "";
					var i = 1;
					$.each(data, function(index, obj){
						console.log("data[0].address_en : " + data[0].address_en);
						
						dataTag += "<tr>";
						dataTag += "<td>" + data[index].address_en + "</td>";
						dataTag += "<td>" + data[index].do_en + "</td>";
						dataTag += "<td>" + data[index].title + "</td>";
						dataTag += "<td>" + data[index].salary_max + "</td>";
						dataTag += "<td>" + data[index].regdate + "</td>";
						i++;
					});	
					$("#list_box").html(dataTag);
				}, 
				error : function() {
					console.log("실패");
				}
			});
		
}