var boardIdx=0;
var mem_id;
var category=0;

$( function() {
	$("#listTable").hide();
});



function changeCategory(cate,btnValue,id,cPage) {
	//buttonColorChange(버튼번호, 버튼수량) 
	//common/buttonColorChange.js
	buttonColorChange(btnValue,4);
	
	boardIdx=btnValue;
	mem_id=id;
	category=cate;
	var url="";
	if(category==1){
		url='getWishList.do?cPage=' + cPage;
	}
	else{
		url='getMyAdsList.do?cPage=' + cPage;
	}
	$("#listTable").show();
		var param={
				'board_idx' : boardIdx,  // '본인 vo변수이름 : 데이터이름'
				'mem_id' : mem_id,
				'category':category
		}
		//----------------------------------------
		 jQuery.ajaxSettings.traditional = true;
		 $.ajax({
				type : "get",
			 	url : url,  
				dataType : "json",
				async: false,
				data: param,
				success : function(data) {
					
					var data = data;
					console.log(">>>>>>>>>>>data :" + data); 
					
					var pvo = data.pvo;
					console.log(">>>>>>>>>>>data.pvo  :" + pvo); 
					
					if(boardIdx==1){
						setHouse(data.house);
					}
					else if(boardIdx==2){
						setJob(data.hire,pvo);
					}else if(boardIdx==3){
						setResale(data.list);
					}
					else if(boardIdx==4){
						setInform(data.inform);
					}
					
					setTfoot(pvo);
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus+"\n"
						+ "errorThrown : " + errorThrown);
				}
				
			});			
	}



function setHouse(list){		 
	setHouseHead();
	var dataTag = "";
	$.each(list, function(index, obj){
		dataTag += setHouseData(this);
	});	
	$("#list_box").html(dataTag);
}
function setHouseHead(){
	
	$("#tHead").html(
			"<tr>"
			+"<th>idx</th>"
			+"<th>Title</th>"
			+"<th>RoomType</th>"
			+"<th>Location</th>"
			+"<th>Deposit/Monthly</th>"
			+"<th>Post Date</th>"
			+"</tr>"
	
	);
}
function setHouseData(houseData){
	console.log(houseData);
	var room_type;
	if( houseData["room_type"]==0)
		room_type="Villa";
	else if( houseData["room_type"]==1)
		room_type="Goshiwon";
	else if( houseData["room_type"]==2)
		room_type="Semi-Officetel";
	return "<tr class='trTag' onclick='javascript:goHouseDetailPage("+houseData.room_idx+")' style='cursor: pointer;'>"
		+"<td>" + houseData.room_idx+ "</td>"
		+"<td>" + houseData["subject"] + "</td>"
		+ "<td>" +room_type + "</td>"
		+ "<td>" + houseData["address"] + "</td>"
		+ "<td>" + houseData["deposit"]+"/" +houseData["monthly_rent"] + "</td>"
		+ "<td>" + houseData["room_reporting_date"] + "</td>"
		+ "</tr>";
	
}

function goHouseDetailPage(idx) {
	window.open("about:blank").location.href='house_detail.do?room_idx=' + idx;
} 


function setJob(list,pvo){		 
	setJobHead();
	var dataTag = "";
	$.each(list, function(index, obj){
		dataTag += setJobData(this,pvo);
	});	
	$("#list_box").html(dataTag);
}
function setJobHead(){
	
	$("#tHead").html(
            '<tr>'
            +'<th id="compName">Company Name</th>'
            +'<th id="location">Location</th>'
            +'<th id="title">Title</th>'
            +'<th id="salary">Salary</th>'
            +'<th id="post_date">Post Date</th>'
            +'</tr>'
	);
}
function setJobData(hireData,pvo){
	console.log(hireData);
	var dataText="";
	dataText += "<tr class='trTag'>";
	dataText += "<td class='thumbnail-img'><p>" +hireData["company_name"] + "</p></td>";
	dataText += "<td class='name-pr'>" + hireData["do_en"] + "</td>";
	dataText += "<td class='price-pr'><a href='javascript:getJobDetail(" + hireData["hire_idx"] +  ' ,'  + pvo.nowPage +")'><p>" + hireData["title"] + "</p></a></td>";
	
	if(this["payment_codition"] == "year"){dataText += "<td class='quantity-box' id='salryTd'><div class='salaryCondtion'><span id='yearSalary'>Y</span>" + hireData["salary_max"] + "</div></td>"}
	else if(hireData["payment_codition"] == "month"){dataText += "<td class='quantity-box' id='salryTd'><div class='salaryCondtion'><span id='monthSalary'>M</span>" + hireData["salary_max"] + "</div></td>"}
	else if(hireData["payment_codition"] == "day"){dataText += "<td class='quantity-box' id='salryTd'><div class='salaryCondtion'><span id='daySalary'>D</span>" + hireData["salary_max"] + "</div></td>"}
	else if(hireData["payment_codition"] == "hour"){dataText += "<td class='quantity-box' id='salryTd'><div class='salaryCondtion'><span id='hourSalary'>H</span>" + hireData["salary_max"] + "</div></td>"}
	else {dataText += "<td class='quantity-box' id='salryTd'><div class='salaryCondtion'><span id='pay'>C</span>" + "Negotiable" + "</div></td>"}
	dataText += "<td class='add-pr'>" + hireData["regdate"] + "</td>";
	dataText += "</tr>";
	return dataText;
	
}
function getJobDetail(hire_idx, cPage) {
	console.log("cPage : " + cPage);
	console.log("hire_idx : " + hire_idx);
	
	window.open("about:blank").location.href="hireDetail.do?cPage=" + cPage + "&hire_idx=" + hire_idx
}

function setResale(list){		 
	setResaleHead();
	var dataTag = "";
	$.each(list, function(index, obj){
		dataTag += setResaleData(this);
	});	
	$("#list_box").html(dataTag);
}
function setResaleHead(){
	
	$("#tHead").html(
            '<tr>'
            +'<th id="imgbox">Product image</th>'
            +'<th id="subject">Title</th>'
            +'<th id="listPrice">Price</th>'
            +'<th id="addr">Location</th>'
            +'<th id="listDate">Post Date</th>'
            +'</tr>'
	);
}
function setResaleData(resaleData){
	console.log(resaleData);
	console.log("zz");
	var dataText="";
	dataText += "<tr class='trTag'>";
if(resaleData.file_ori_name ==null){
	dataText +=	'<td><div><img class="imgFileList" src="resources/img/resale/default-placeholder.jpg"></div></td>';
}

else{
	console.log(resaleData.file_ori_name);
	dataText +=	'<td><div><img class="imgFileList" style="width:200px; height:100px;" src="resources/img/resale/'+resaleData.file_ori_name+'"></div></td>';
}
	dataText += "<td class='listSubject'><p>" +resaleData["subject"] + "</p></td>";
	dataText += "<td class='listPrice'><p>" + resaleData["price"] + "</p></td>";
	dataText += "<td class='addr'><p>"+ resaleData["address"] + "</p></td>";
	dataText += "<td class='listDate'><p>"+ resaleData["regdate"] + "</p></td>";
	dataText += "</tr>";
	return dataText;
	
}


function setInform(list){		 
	setInformHead();
	var dataTag = "";
	$.each(list, function(index, obj){
		dataTag += setInformData(this);
	});	
	$("#list_box").html(dataTag);
}

function setInformHead(){
	$("#tHead").html(
			"<tr>" + "<th>Idx</th>" + "<th>Category</th>" + "<th>Title</th>"
			+ "<th>PostDate</th>" + "<th>Hit</th>"+ "</tr>"

	);
}
function setInformData(inform){
	return "<tr class='trTag' onclick='javascript:goInformDetailPage(" 
			+ inform.info_idx
			+ ")' style='cursor: pointer;'>" + "<td>" + inform.info_idx
			+ "</td>" + "<td>" + inform["info_category"] + "</td>" + "<td>"
			+ inform["info_title"] + "</td>" + "<td>" + inform["info_ins_dt"]
			+ "</td>" + "<td>" + inform["info_hit"] +"</td>" + "</tr>";
}

function goInformDetailPage(info_idx) {
	window.open("about:blank").location.href="InformDetail_go.do?info_idx=" + info_idx;
} 


function setTfoot(pvo){
	console.log(pvo.beginPage);
	console.log(pvo.pagePerBlock);
	console.log(pvo.endPage);
	console.log(pvo.totalPage);
	var tfoot = "";
	tfoot += '<div id="pagingBox"><div id="olPaging"><ol class="paging">';
		
	if(pvo.beginPage < pvo.pagePerBlock){
		tfoot += '<li class="disable" id="pointer">이전으로</li>';
	} else{ 
		tfoot += '<li id="pointer"><a href="javascript:changeCategory('+category+","+ boardIdx+","+mem_id+"," + (pvo.beginPage - pvo.pagePerBlock) + '")>이전으로</a></li>';
	}
	for(var k=pvo.beginPage; k<=pvo.endPage; k++) {
		if(k == pvo.nowPage) {
			tfoot += '<li class="now">'+ k +'</li>';
		}
		else if (k != pvo.nowPage) {
			tfoot += '<li><a href="javascript:changeCategory('+category+","+boardIdx+",'"+mem_id+"',"+ k +')">'+ k +'</a></li>';
		}
		console.log("k: "+k);
	}
	if(pvo.endPage >= pvo.totalPage) {
		tfoot+= '<li class="disable" id="pointer">다음으로</li>';
	} else {
		tfoot += '<li id="pointer"><a href="javascript:changeCategory('+category+","+boardIdx+","+mem_id+","+ (pvo.beginPage + pvo.pagePerBlock)+')">다음으로</a></li>';
	}
	
	tfoot += '</ol></td></tr>'
	$("#tfoot").html(tfoot);
	
}