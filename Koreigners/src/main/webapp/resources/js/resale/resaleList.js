

$( function() {
	//getResaleWish();
	getData("All",1);
});





function getData(cate,cPage) {
	
	var url = 'getResaleListData.do?cPage=' + cPage;
	var category=cate;
	var searchKeyword=$('#searchText').val();
	console.log(url);
	console.log('category: '+category);
	console.log('search: '+searchKeyword);
	var param = {
		'rs_cate_prnt':category,
		'searchKeyword':searchKeyword
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
			
			var resaleList = data.resale;
			console.log(">>>>>>>>>>>data.resale :" + resaleList);
			
			//좌측 카테고리탭에서 작성글 수 표시
			setSmallCategory(data.categoryCount[0]);
			
			
			var gridHtml='<div class="row">';
			var wishBool=0;
			$.each(resaleList, function(index, obj) {
				
			
				gridHtml += setGridList(this,pvo);
			});
		
			gridHtml+='</div><div class="tfoot" ></div>';
			$("#grid-view").html(gridHtml);
			
			$("#searchButton").removeAttr("onclick");
			$("#searchButton").attr("onclick","getData('"+category+"',1)");
			
			
			var tfoot = "";
			tfoot += '<div id="pagingBox"><div id="olPaging"><ol class="paging">';
				
			if(pvo.beginPage < pvo.pagePerBlock){
				tfoot += '<li class="disable" id="pointer">Prev</li>';
			} else{ 
				tfoot += '<li id="pointer"><a href="javascript:getData('+"'"+category+"',"+ (pvo.beginPage - pvo.pagePerBlock) + '")>이전으로</a></li>';
			}
			for(var k=pvo.beginPage; k<=pvo.endPage; k++) {
				if(k == pvo.nowPage) {
					tfoot += '<li class="now">'+ k +'</li>';
				}
				else if (k != pvo.nowPage) {
					tfoot += '<li><a href="javascript:getData('+"'"+category+"',"+ k +')">'+ k +'</a></li>';
				}
				console.log("k: "+k);
			}
			if(pvo.endPage >= pvo.totalPage) {
				tfoot+= '<li class="disable" id="pointer">Next</li>';
			} else {
				tfoot += '<li id="pointer"><a href="javascript:getData('+"'"+category+"',"+(pvo.beginPage + pvo.pagePerBlock)+')">다음으로</a></li>';
			}
			
			tfoot += '</ol></td></tr>'
			$(".tfoot").html(tfoot);
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("실패 : \n" + "jqXHR.readyState : " + jqXHR.readyState + "\n"
					+ "textStatus : " + textStatus + "\n" + "errorThrown : "
					+ errorThrown);
		}

	});
	
	getResaleWish();
}

function setGridList(resale,pvo){
	var gridHtml="";
	gridHtml+='<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">'
			    +'<div class="products-single fix">'
			    +    '<div class="box-img-hover">'
			    +        '<div class="type-lb">';
if(resale.RS_CATE_PRNT=="Fashion Goods")
	gridHtml+=		    	 '<p class="sale">Fashion Goods</p>';
else if(resale.RS_CATE_PRNT=="Women Clothes")
	gridHtml+=		    	 '<p class="sale">Women Clothes</p>';
else if(resale.RS_CATE_PRNT=="Men Clothes")
	gridHtml+=		    	 '<p class="sale">Men Clothes</p>';
else if(resale.RS_CATE_PRNT=="Household Appliances")
	gridHtml+=		    	 '<p class="sale">Household Appliances</p>';
else if(resale.RS_CATE_PRNT=="Book/Ticket/Hobbies")
	gridHtml+=		    	 '<p class="sale">Book/Ticket/Hobbies</p>';
else if(resale.RS_CATE_PRNT=="Kids/Pregnant/Delivery")
	gridHtml+=		    	 '<p class="new">Kids/Pregnant/Delivery</p>';
else if(resale.RS_CATE_PRNT=="Star Goods")
	gridHtml+=		    	 '<p class="new">Star Goods</p>';
else if(resale.RS_CATE_PRNT=="Sports/leisure")
	gridHtml+=		    	 '<p class="new">Sports/leisure</p>';
else if(resale.RS_CATE_PRNT=="Beauty/Cosmetic")
	gridHtml+=		    	 '<p class="new">Beauty/Cosmetic</p>';
else if(resale.RS_CATE_PRNT=="Vehicles")
	gridHtml+=		    	 '<p class="new">Vehicles</p>';

	gridHtml+=          '</div>';
//---------------------------------------------------------------------------------------------------------------
if(resale.FILE_ORI_NAME=='businessImg_'){
	gridHtml+=			'<img src="resources/img/resale/default-placeholder.jpg" style="height:300px" class="img-fluid" alt="Image">';
}
else {
	gridHtml+=	   		'<img src="resources/img/resale/'+resale.MEM_ID+'/'+resale.FILE_ORI_NAME +'" style="height:300px" class="img-fluid" alt="Image">';
}
//---------------------------------------------------------------------------------------------------------------
	gridHtml+=       	'<div class="mask-icon">'
                +			'<ul>'
                +    			'<li><a href="resaleDetail.do?rs_idx='+resale.RS_IDX+'&cPage='+pvo.nowPage+'" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>';

	gridHtml+=     				'<li><a href="javascript:clickWishGrid('+"'"+$('#mem_id').val()+"'"+','+resale.RS_IDX+',3)" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i id="rsWish_'+resale.RS_IDX+'"class="far fa-heart"></i></a></li>';
    gridHtml+=  			'</ul>'
                +		'</div>'
                +	'</div>'
                +	'<div class="why-text">'
                +		'<h4>'+resale.SUBJECT+'</h4>';
if(resale.PRICE!=null)                
	gridHtml+=          '<h5>' +resale.PRICE+' won'+'</h5>';

    gridHtml+=    	'</div>'
            +	'</div>'
            +'</div>';
	return gridHtml;

}

function setSmallCategory(count){
	
	$("#smallCategoryAll").text('( '+count.RESALE_ALL+' )');
	$("#smallCategoryFashion").text('( '+count.RESALE_FASHION+' )');
	$("#smallCategoryWomen").text('( '+count.RESALE_WOMEN+' )');
	$("#smallCategoryMen").text('( '+count.RESALE_MEN+')');
	$("#smallCategoryHousehold").text('( '+count.RESALE_HOUSEHOLD+' )');
	$("#smallCategoryBook").text('( '+count.RESALE_BOOK+' )');
	$("#smallCategoryKid").text('( '+count.RESALE_KIDS+' )');
	$("#smallCategoryStar").text('( '+count.RESALE_STAR+' )');
	$("#smallCategorySports").text('( '+count.RESALE_SPORTS+')');
	$("#smallCategoryBeauty").text('( '+count.RESALE_BEAUTY+' )');
	$("#smallCategoryVehicles").text('( '+count.RESALE_VEHICLES+' )');
}



//------------------------------------------------------------------------------




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


