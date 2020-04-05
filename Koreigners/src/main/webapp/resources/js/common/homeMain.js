var sort="";
$( function() {
	getRecentPosts();
});
function sortRecent(data){
	var reg1=data[0].INFO_INS_DT;
	var reg2=data[0].RS_REGDATE;
	var reg3=data[1].INFO_INS_DT;
	var reg4=data[1].RS_REGDATE;
	var setValue="";
	if( reg1>reg2){
		if(reg2>reg3){
			if(reg3>reg4){
				sort="1234";
				setValue += setRecentInform(data[0]);
				setValue += setRecentResale(data[0]);
				setValue += setRecentInform(data[1]);
				setValue += setRecentResale(data[1]);
			}
			else{
				sort="1243";
				setValue += setRecentInform(data[0]);
				setValue += setRecentResale(data[0]);
				setValue += setRecentResale(data[1]);
				setValue += setRecentInform(data[1]);
			}
		}
		else{
			sort="1324";
			setValue += setRecentInform(data[0]);
			setValue += setRecentInform(data[1]);
			setValue += setRecentResale(data[0]);
			setValue += setRecentResale(data[1]);
		}
	}else{
		if(reg1>reg4){
			if(reg3>reg4){
				sort="2134";
				setValue += setRecentResale(data[0]);
				setValue += setRecentInform(data[0]);
				setValue += setRecentInform(data[1]);
				setValue += setRecentResale(data[1]);
			}
			else{
				sort="2143";
				setValue += setRecentResale(data[0]);
				setValue += setRecentInform(data[0]);
				setValue += setRecentResale(data[1]);
				setValue += setRecentInform(data[1]);
			}
		
		}else{
			sort="2413";
			setValue += setRecentResale(data[0]);
			setValue += setRecentResale(data[1]);
			setValue += setRecentInform(data[0]);
			setValue += setRecentInform(data[1]);
		}
	}
	return setValue;
}
function setRecentInform(inform){
	console.log(inform.INFO_IDX);
	var wishBool=0;
	if(informWishList.indexOf(inform.INFO_IDX)!== -1) 
		wishBool=1;
	else
		wishBool=-1;
	
	
	var setValue="";
	setValue+= 	'<div class="col-lg-3 col-md-6 special-grid best-seller">'
	setValue+=		'<div class="products-single fix">'
	setValue+=			'<div class="box-img-hover">'
	setValue+=				'<div class="type-lb">'
	setValue+=	    			'<p class="sale">'+ inform.INFO_CATEGORY +'</p>'
	setValue+=				'</div>';
if(inform.INFO_FILE_NAME!=null && inform.INFO_FILE_NAME!='' && typeof inform.INFO_FILE_NAME!='undefined'){	
	setValue+=				'<img src="'+inform.INFO_FILE_NAME+'" style="height:300px" class="img-fluid" alt="Image">';
}
else if(inform.INFO_FILE_NAME==null || inform.INFO_FILE_NAME=='' || typeof inform.INFO_FILE_NAME == "undefined" ){
	setValue+=				'<img src="resources/img/common/document.png" style="height:300px" class="img-fluid" alt="Image">';
}
	setValue+=				'<div class="mask-icon">'
	setValue+=			 	   '<ul>'
	setValue+=				        '<li><a href="javascript:goInformDetailPage('+ inform.INFO_IDX+')" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>';
if(wishBool==1){		
	setValue+=        				'<li><a href="javascript:clickWishGrid('+"'"+$('#mem_id').val()+"'"+','+inform.INFO_IDX+',4)" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i id="wish_'+inform.INFO_IDX+'" class="fas fa-heart"></i></a></li>';
}
else{
	setValue+=        				'<li><a href="javascript:clickWishGrid('+"'"+$('#mem_id').val()+"'"+','+inform.INFO_IDX+',4)" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i id="wish_'+inform.INFO_IDX+'" class="far fa-heart"></i></a></li>';
}	
	setValue+=				    '</ul>'
	setValue+=				'</div>'
	setValue+=			'</div>'
	setValue+=			'<div class="why-text">'
	setValue+=				'<h4>'+inform.INFO_TITLE +'</h4>'
	setValue+=				'<h5>'+inform.INFO_INS_DT +'</h5>'
	setValue+=			'</div>'
	setValue+=		'</div>'
	setValue+=	'</div>';
	return setValue;
}

function setRecentResale(resale){
	console.log(resale.RS_IDX);
	var wishBool=0;
	if(resaleWishList.indexOf(resale.RS_IDX)!== -1) 
		wishBool=1;
	else
		wishBool=-1;
	
	var setValue="";
	setValue+= 	'<div class="col-lg-3 col-md-6 special-grid top-featured">'
	setValue+=		'<div class="products-single fix">'
	setValue+=			'<div class="box-img-hover">'
	setValue+=				'<div class="type-lb">'
	setValue+=	    			'<p class="new">'+ 'Resale' +'</p>'
	setValue+=				'</div>';
if(resale.RS_FILENAME=='businessImg_'){		
	setValue+=				'<img src="resources/img/resale/default-placeholder.jpg" style="height:300px" class="img-fluid" alt="Image">';
}
else {
	setValue+=				'<img src="resources/img/resale/'+resale.RS_MEM_ID+'/'+resale.RS_FILENAME+'" style="height:300px" class="img-fluid" alt="Image">';
}
	setValue+=				'<div class="mask-icon">'
	setValue+=			 	   '<ul>'
	setValue+=				        '<li><a href="resaleDetail.do?rs_idx='+resale.RS_IDX+'&cPage=1" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>'
if(wishBool==1){		
	setValue+=        				'<li><a href="javascript:clickWishGrid('+"'"+$('#mem_id').val()+"'"+','+resale.RS_IDX+',3)" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i id="rsWish_'+resale.RS_IDX+'" class="fas fa-heart"></i></a></li>';
}
else{
	setValue+=        				'<li><a href="javascript:clickWishGrid('+"'"+$('#mem_id').val()+"'"+','+resale.RS_IDX+',3)" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i id="rsWish_'+resale.RS_IDX+'" class="far fa-heart"></i></a></li>';
}
	setValue+=				    '</ul>'
	setValue+=				'</div>'
	setValue+=			'</div>'
	setValue+=			'<div class="why-text">'
	setValue+=				'<h4>'+resale.RS_SUBJECT+'</h4>'
	setValue+=				'<h5>'+resale.RS_REGDATE+'</h5>'
	setValue+=			'</div>'
	setValue+=		'</div>'
	setValue+=	'</div>';
	return setValue;
}

var informWishList = new Array();
var resaleWishList = new Array();

function getRecentPosts() {
	
	var url = 'getRecentPosts.do';
	

	jQuery.ajaxSettings.traditional = true;
	$.ajax({
		type : "get",
		url : url,
		dataType : "json",
		async : false,
		success : function(data) {

			var data = data;
			console.log(">>>>>>>>>>>data :" + data);
			
			var recentPosts = data.recentPosts;
			console.log(">>>>>>>>>>>data.recentPosts :" + recentPosts);
			
			var informWish = data.informWish;
			var resaleWish = data.resaleWish;
			
			$.each(informWish, function(index, obj) {
				console.log(this);
				informWishList.push(this.INFO_IDX);
				
			});
			$.each(resaleWish, function(index, obj) {
				console.log(this);
				resaleWishList.push(this.RS_IDX);
			});
			
			$('#recentList').html(sortRecent(recentPosts));
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


