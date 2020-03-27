var boardIdx=0;
var mem_id;

$( function() {
		$("#wishListTable").hide();
	});



function changeCategory(btnValue,id,cPage) {
	boardIdx=btnValue;
	mem_id=id;
	var url='getWishList.do?cPage=' + cPage;
	
	$("#wishListTable").show();
		var param={
				'board_idx' : boardIdx,  // '본인 vo변수이름 : 데이터이름'
				'mem_id' : mem_id	
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
	return "<tr onclick='javascript:goHouseDetailPage("+houseData.room_idx+")' style='cursor: pointer;'>"
		+"<td>" + houseData.room_idx+ "</td>"
		+"<td>" + houseData["subject"] + "</td>"
		+ "<td>" + houseData["room_type"] + "</td>"
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
	dataText += "<tr>";
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
	dataText += "<tr>";
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

function setTfoot(pvo){
	var tfoot = "";
	tfoot += '<tr><td><ol class="paging">'
		
	if(pvo.beginPage < pvo.pagePerBlock){
		tfoot += '<li class="disable">이전으로</li>';
	} else{ 
		tfoot += '<li><a href="javascript:changeCategory('+ boardIdx+","+mem_id+"," + (pvo.beginPage - pvo.pagePerBlock) + '")>이전으로</a></li>';
	}
	for(var k=pvo.beginPage; k<=pvo.endPage; k++) {
		if(k == pvo.nowPage) {
			tfoot += '<li class="now">'+ k +'</li>';
		}
		else if (k != pvo.nowPage) {
			tfoot += '<li><a href="javascript:changeCategory('+boardIdx+",'"+mem_id+"',"+ k +')">'+ k +'</a></li>';
		}
	}
	if(pvo.endPage >= pvo.totalPage) {
		tfoot+= '<li class="disable">다음으로</li>';
	} else {
		tfoot += '<li><a href="javascript:changeCategory('+boardIdx+","+mem_id+","+ (pvo.beginPage + pvo.pagePerBlock)+')">다음으로</a></li>';
	}
	
	tfoot += '</ol></td></tr>'
	$("#tfoot").html(tfoot);
	
}