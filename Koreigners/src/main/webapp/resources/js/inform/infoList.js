$( function() {
	getData("All",1);
});
function getbtnValue(cate){
	var returnValue=0;
	if(cate=='All')
		returnValue=1;
	else if(cate=='Information')
		returnValue=2;
	else if(cate=='Food')
		returnValue=3;
	else if(cate=='Travel')
		returnValue=4;
	else if(cate=='Etc')
		returnValue=5;
	return returnValue;
}


function getData(cate,cPage) {
	//buttonColorChange(버튼번호, 버튼수량) 
	//common/buttonColorChange.js
	buttonColorChange(getbtnValue(cate),5);
	
	var url = 'getInformListData.do?cPage=' + cPage;
	var category=cate;
	console.log(url);
	var param = {
		'info_category':category
	}

	jQuery.ajaxSettings.traditional = true;
	$.ajax({
		type : "get",
		url : url,
		dataType : "json",
		async : false,
		data : param,
		success : function(data) {

			var data = data;
			console.log(">>>>>>>>>>>data :" + data);
			
			var pvo = data.pvo;
			console.log(">>>>>>>>>>>data.pvo  :" + pvo);
			
			var informList = data.inform;
			console.log(">>>>>>>>>>>data :" + informList);
			
			
			$("#tHead").html(
					"<tr>" + "<th>Idx</th>" + "<th>Category</th>" + "<th>Title</th>"
					+ "<th>PostDate</th>" + "<th>Hit</th>"+ "</tr>"

			);
			
			
			var dataTag = "";
			$.each(informList, function(index, obj) {
				console.log(this);	
				dataTag += "<tr class='trTag' onclick='javascript:goInformDetailPage(" 
							+ this.INFO_IDX
							+ ")' style='cursor: pointer;'>" + "<td>" + this.INFO_IDX
							+ "</td>" + "<td>" + this["INFO_CATEGORY"] + "</td>" + "<td>"
							+ this["INFO_TITLE"] + "</td>" + "<td>" + this["INFO_INS_DT"]
							+ "</td>" + "<td>" + this["INFO_HIT"] +"</td>" + "</tr>";
			});
			
			$("#list_box").html(dataTag);
			
			var tfoot = "";
			tfoot += '<div id="pagingBox"><div id="olPaging"><ol class="paging">';
				
			if(pvo.beginPage < pvo.pagePerBlock){
				tfoot += '<li class="disable" id="pointer">이전으로</li>';
			} else{ 
				tfoot += '<li id="pointer"><a href="javascript:getData('+category+"," + (pvo.beginPage - pvo.pagePerBlock) + '")>이전으로</a></li>';
			}
			for(var k=pvo.beginPage; k<=pvo.endPage; k++) {
				if(k == pvo.nowPage) {
					tfoot += '<li class="now">'+ k +'</li>';
				}
				else if (k != pvo.nowPage) {
					tfoot += '<li><a href="javascript:getData('+category+","+ k +')">'+ k +'</a></li>';
				}
				console.log("k: "+k);
			}
			if(pvo.endPage >= pvo.totalPage) {
				tfoot+= '<li class="disable" id="pointer">다음으로</li>';
			} else {
				tfoot += '<li id="pointer"><a href="javascript:getData('+category+","+(pvo.beginPage + pvo.pagePerBlock)+')">다음으로</a></li>';
			}
			
			tfoot += '</ol></td></tr>'
			$("#tfoot").html(tfoot);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("실패 : \n" + "jqXHR.readyState : " + jqXHR.readyState + "\n"
					+ "textStatus : " + textStatus + "\n" + "errorThrown : "
					+ errorThrown);
		}

	});
	

}
function goInformDetailPage(info_idx) {
	window.open("about:blank").location.href="InformDetail_go.do?info_idx=" + info_idx;
} 