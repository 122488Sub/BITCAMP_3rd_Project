


function loadPage(){
		$.ajax({
				url : 'hireListData.do',
				type : 'post',
				dataType : "json",
				
				success : function(data) {
					
					console.log("data : " +data);
					var strData = JSON.stringify(data);
					console.log("strData : " + strData);
					var jsData = JSON.parse(strData); //자바 스크립트 데이터로 형 변환
					console.log("jsData : " + jsData);
					console.log(jsData);
					
					
					var dataTag = "";
					var i = 1;
					
					var list = data.list;
					console.log(">>>>>>>>>>>list :" + list); 
					
					var pvo = data.pvo;
					console.log(">>>>>>>>>>>pvo  :" + pvo); 
					
					$.each(list, function(index, obj){
						console.log("this['hire_idx'] : " + this["hire_idx"]);
						dataTag += "<tr>";
						dataTag += "<td>" + i+1 + "</td>";
						dataTag += "<td>" + this["company_name"] + "</td>";
						dataTag += "<td>" + this["do_en"] + "</td>";
						dataTag += "<td><a href='javascript:getDetail(" + this["hire_idx"] + ' ,' + pvo.nowPage +")'>" + this["title"] + "</a></td>";
						dataTag += "<td>" + this["salary_max"] + "</td>";
						dataTag += "<td>" + this["regdate"] + "</td>";
						dataTag += "</tr>";
						i++;
					});	
					
					
					$("#list_box").html(dataTag);
					
					var tfoot = "";
					tfoot += '<tr><td><ol class="paging">'
						
					if(pvo.beginPage < pvo.pagePerBlock){
						tfoot += '<li class="disable">이전으로</li>';
					} else{
						tfoot += '<li><a href="javascript:getListCPage(' + pvo.beginPage - pvo.pagePerBlock + '}")>이전으로</a></li>';
					}
					for(var k=pvo.beginPage; k<=pvo.endPage; k++) {
						if(k == pvo.nowPage) {
							tfoot += '<li class="now">'+ k +'</li>';
						}
						else if (k != pvo.nowPage) {
							tfoot += '<li><a href="javascript:getListCPage('+ k +')">'+ k +'</a></li>';
						}
					}
					if(pvo.endPage >= pvo.totalPage) {
						tfoot+= '<li class="disable">다음으로</li>';
					} else {
						tfoot += '<li><a href="javascript:getListCPage(${pvo.beginPage + pvo.pagePerBlock})">다음으로</a></li>';
					}
					
					tfoot += '</ol></td></tr>'
						$("#tfoot").html(tfoot);
				}, 
				error : function() {
					console.log("실패");
				}
			});
}

function getListCPage(cPage){
	$.ajax({
		url : 'hireListData.do?cPage=' + cPage,
		type : 'post',
		dataType : "json",
		success : function(data) {
			
			var strData = JSON.stringify(data);
			console.log("strData : " + strData);
			var jsData = JSON.parse(strData); //자바 스크립트 데이터로 형 변환
			console.log("jsData : " + jsData);
			var list = data.list;
			
			var pvo = data.pvo;
			console.log(">>>>>>>>>>>pvo  :" + pvo); 
			
			var dataTag = "";
			var i = 1;
			$.each(list, function(index, obj){
				console.log("this['hire_idx'] : " + this["hire_idx"]);
				dataTag += "<tr>";
				dataTag += "<td>" + i+1 + "</td>";
				dataTag += "<td>" + this["company_name"] + "</td>";
				dataTag += "<td>" + this["do_en"] + "</td>";
				dataTag += "<td><a href='javascript:getDetail(" + this["hire_idx"] +  ' ,'  + pvo.nowPage +")'>" + this["title"] + "</a></td>";
				dataTag += "<td>" + this["salary_max"] + "</td>";
				dataTag += "<td>" + this["regdate"] + "</td>";
				dataTag += "</tr>";
				i++;
			});	
			$("#list_box").html(dataTag);
			
			var tfoot = "";
			tfoot += '<tr><td colspan="5"><ol class="paging">'
				
			if(pvo.beginPage < pvo.pagePerBlock){
				tfoot += '<li class="disable">이전으로</li>';
			} else{
				tfoot += '<li><a href="javascript:getListCPage(' + pvo.beginPage - pvo.pagePerBlock + '}")>이전으로</a></li>';
			}
			for(var k=pvo.beginPage; k<=pvo.endPage; k++) {
				if(k == pvo.nowPage) {
					tfoot += '<li class="now">' + k + '</li>';
				}
				else if (k != pvo.nowPage) {
					tfoot += '<li><a href="javascript:getListCPage('+ k +')">'+ k +'</a></li>';
				}
			}
			if(pvo.endPage >= pvo.totalPage) {
				tfoot+= '<li class="disable">다음으로</li>';
			} else {
				tfoot += '<li><a href="javascript:getListCPage(${pvo.beginPage + pvo.pagePerBlock})">다음으로</a></li>';
			}
			
			tfoot += '</ol></td></tr>'
				$("#tfoot").html(tfoot);
			
		}, 
		error : function() {
			console.log("실패");
		}
	});
}

function getDetail(hire_idx, cPage) {
	console.log("cPage : " + cPage);
	console.log("hire_idx : " + hire_idx);
	
	location.href="hireDetail.do?cPage=" + cPage + "&hire_idx=" + hire_idx
	
//	$.ajax({
//		url : 'hireDetail.do',
//		type : 'post',
//		dataType : "json",
//		data : {
//			"cPage" : cPage,
//			"hire_idx" : hire_idx
//		},
//		success : function(data) {
//			console.log("data : " +data);
//			var strData = JSON.stringify(data);
//			console.log("strData : " + strData);
//			var jsData = JSON.parse(strData); //자바 스크립트 데이터로 형 변환
//			console.log("jsData : " + jsData);
//			console.log(jsData);
//			
//			var dataTag = "";
//			var i = 1;
//			
//			var list = data.list;
//			console.log(">>>>>>>>>>>list :" + list); 
//			
//			var pvo = data.pvo;
//			console.log(">>>>>>>>>>>pvo  :" + pvo); 
//			
//			$.each(list, function(index, obj){
//				console.log("this['hire_idx'] : " + this["hire_idx"]);
//				dataTag += "<tr>";
//				dataTag += "<td>" + i+1 + "</td>";
//				dataTag += "<td>" + this["do_en"] + "</td>";
//				dataTag += "<td><a href='javascript:getDetail(" + this["hire_idx"] + ' ,' + pvo.nowPage +")'>" + this["title"] + "</a></td>";
//				dataTag += "<td>" + this["salary_max"] + "</td>";
//				dataTag += "<td>" + this["regdate"] + "</td>";
//				dataTag += "</tr>";
//				i++;
//			});	
//			
//			$("#list_box").html(dataTag);
//			
//		}, 
//		error : function() {
//			console.log("실패");
//		}
//	});
	
}


