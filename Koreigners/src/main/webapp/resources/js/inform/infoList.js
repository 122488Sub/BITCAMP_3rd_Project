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
			console.log(">>>>>>>>>>>data.inform :" + informList);
			
			//좌측 카테고리탭에서 작성글 수 표시
			setSmallCategory(data.categoryCount[0]);
			
			$("#tHead").html(
					"<tr>" + "<th>Idx</th>" + "<th>Category</th>" + "<th>Title</th>"
					+ "<th>PostDate</th>" + "<th>Hit</th>"+ "</tr>"

			);
			
			
			
			var dataTag = "";
			var gridHtml='<div class="row">';
			$.each(informList, function(index, obj) {
				console.log(this);	
				dataTag += "<tr class='trTag' onclick='javascript:goInformDetailPage(" 
							+ this.INFO_IDX
							+ ")' style='cursor: pointer;'>" + "<td>" + this.INFO_IDX
							+ "</td>" + "<td>" + this["INFO_CATEGORY"] + "</td>" + "<td>"
							+ this["INFO_TITLE"] + "</td>" + "<td>" + this["INFO_INS_DT"]
							+ "</td>" + "<td>" + this["INFO_HIT"] +"</td>" + "</tr>";
				
				gridHtml += setGridList(this,index);
			});
			 
			$("#list_box").html(dataTag);
			
			gridHtml+='</div>';
			$("#grid-view").html(gridHtml);
			
			
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



function setGridList(inform,index){
	var gridHtml="";
	gridHtml+='<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">'
			    +'<div class="products-single fix">'
			    +    '<div class="box-img-hover">'
			    +        '<div class="type-lb">';
if(inform.INFO_CATEGORY=="Information")
	gridHtml+=		    	 '<p class="sale">Information</p>';
else if(inform.INFO_CATEGORY=="Food")
	gridHtml+=		    	 '<p class="sale">Food</p>';
else if(inform.INFO_CATEGORY=="Travel")
	gridHtml+=		    	 '<p class="new">Travel</p>';
else if(inform.INFO_CATEGORY=="Etc")
	gridHtml+=		    	 '<p class="new">Etc</p>';

	gridHtml+=          '</div>';
//---------------------------------------------------------------------------------------------------------------
if(inform.INFO_FILE_NAME!=null && inform.INFO_FILE_NAME!='' && typeof inform.INFO_FILE_NAME!='undefined'){
	gridHtml+=			'<img src="'+inform.INFO_FILE_NAME+'" style="height:350px" class="img-fluid" alt="Image">';

	
}
else if(inform.INFO_FILE_NAME==null || inform.INFO_FILE_NAME=='' || typeof inform.INFO_FILE_NAME == "undefined" ){
	gridHtml+=	   		'<img src="resources/img/common/document.png" style="height:350px" class="img-fluid" alt="Image">';

}
//---------------------------------------------------------------------------------------------------------------
	gridHtml+=       	'<div class="mask-icon">'
                +			'<ul>'
                +    			'<li><a href="javascript:goInformDetailPage('+ inform.INFO_IDX+')" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>'
                +    			'<li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>'
                +			'</ul>'
                +			'<a class="cart" href="javascript:goInformDetailPage('+ inform.INFO_IDX+')">'+inform.INFO_MEM_ID+'</a>'
                +		'</div>'
                +	'</div>'
                +	'<div class="why-text">'
                +		'<h4>'+inform.INFO_TITLE+'</h4>'
                +		'<h5>' +inform.INFO_INS_DT+'</h5>'
                +	'</div>'
            +	'</div>'
            +'</div>';
	return gridHtml;
	
}

function setSmallCategory(count){
	
	$("#smallCategoryAll").text('( '+count.INFORM_ALL+' )');
	$("#smallCategoryInformation").text('( '+count.INFORMATION+' )');
	$("#smallCategoryFood").text('( '+count.FOOD+')');
	$("#smallCategoryTravel").text('( '+count.TRAVEL+' )');
	$("#smallCategoryEtc").text('( '+count.ETC+' )');
	
	

}