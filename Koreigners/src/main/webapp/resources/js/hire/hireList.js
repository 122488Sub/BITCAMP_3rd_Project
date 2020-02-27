


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
}







var jobCategory = new Array;
var cate="";
var isValue="";

var now_click = "";

$(function(){
	
	$(".catePrnt").click(function(){
		cate = $(this).attr('id');
		if(now_click == "") {
			console.log("처음 입력하는 값입니다.");
			console.log("cate : " + cate);
			now_click = cate;
			
			$(this).toggleClass("catePrnt_clicked");
		} 
		if(now_click != cate){
			console.log("다른값이 입력되었습니다.");
			console.log("cate :" + cate);
			
			
			$(".catePrnt_clicked").attr('class', 'catePrnt');
			now_click = cate;
			$(this).toggleClass("catePrnt_clicked");
		}
		
		console.log("cate : " + cate);
		console.log("now_click :" + now_click);
		jobCategory = new Array
		prnt_cate(cate);
	});
	
	
	
	$(".job_base").click(function(){
		//alert("클릭");
		$(this).toggleClass("job_clicked");
		
		//div 공백제거 텍스트
		//cate = $(this).text().trim();
		cate = $(this).attr('id');
		
		
		//선택된 카테고리의 배열안 인덱스 번호
		//없을 시 -1
		isValue = jobCategory.indexOf(cate);
		
		//선택된 카테고리가 0보다 작으면 리스트에 추가
		if(isValue < 0) {
			jobCategory.push(cate);	
		//아니면 해당 카테고리 검색 후 삭제
		} else{
			jobCategory.splice(isValue,1);
		}
		
		console.log("jobCategory : " + jobCategory);
	});
});

function prnt_cate(cate) {
	
		$.ajax({
		url : 'hireCateFilter.do',
		type : 'post',
		dataType : "json",
		data : {
			cate_prnt_en : cate
		},
		success : function(data) {
			
			var strData = JSON.stringify(data);
			console.log("strData : " + strData);
			var jsData = JSON.parse(strData); //자바 스크립트 데이터로 형 변환
			console.log("jsData : " + jsData);
			
			//해당 카테고리 배열 전달
			var list = data;
			
			console.log(">>>>>>>>>>>list  :" + list); 
			
			var dataTag = "";
			var i = 0;
			$.each(list, function(index, obj){
				console.log("this : " + this);
				dataTag += '<div class="job_base" id="' + this +'">';
				dataTag += '<div class="pDiv">';
				dataTag += '<p>' + this +'</p>';
				dataTag += '</div></div>';
			});	
			
			$("#childCate").html(dataTag);
	
		}, 
		error : function() {
			console.log("실패");
		}
	});
}
$(document).ready(function(){
    $(document).on("click",".job_base",function(){
      // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
     // alert($(this).text());
      
      $(this).toggleClass("job_clicked");
		
		  //div 공백제거 텍스트
	      //cate = $(this).text().trim();
		  cate = $(this).attr('id');
		
		
		  //선택된 카테고리의 배열안 인덱스 번호
		  //없을 시 -1
		  isValue = jobCategory.indexOf(cate);
		
		  //선택된 카테고리가 0보다 작으면 리스트에 추가
		  if(isValue < 0) {
			  jobCategory.push(cate);	
		  //아니면 해당 카테고리 검색 후 삭제
		  } else{
			  jobCategory.splice(isValue,1);
		  }
		console.log("cate : " + cate);
		console.log("jobCategory : " + jobCategory);
		
    });
});