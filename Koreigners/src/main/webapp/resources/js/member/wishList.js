var boardIdx=0;

$( function() {
		$("#wishListTable").hide();
	});



function changeCategory(btnValue) {
	boardIdx=btnValue;
	$("#wishListTable").show();
		var param={
				'board_idx' : boardIdx,  // '본인 vo변수이름 : 데이터이름'
				'mem_id' : $("#ID").val()	
		}
	
		//----------------------------------------
		 jQuery.ajaxSettings.traditional = true;
		 $.ajax({
				type : "get",
			 	url : "getWishList.do",  
				dataType : "json",
				async: false,
				data: param,
				success : function(data) {
					
					
					var list = data.list;
					console.log(">>>>>>>>>>>list :" + list); 
					
					var pvo = data.pvo;
					console.log(">>>>>>>>>>>pvo  :" + pvo); 
					
					if(boardIdx==1){
						setHouse(list);
					}
					else if(boardIdx==2){
						setJob(list,pvo);
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

function getListCPage(cPage){
	var param={
			'board_idx' : boardIdx,  // '본인 vo변수이름 : 데이터이름'
			'mem_id' : $("#ID").val()	
	}
	//----------------------------------------
	jQuery.ajaxSettings.traditional = true;
	$.ajax({
		url : 'getWishList.do?cPage=' + cPage,
		type : 'post',
		data: param,
		dataType : "json",
		success : function(data) {
			
			var list = data.list;
			console.log(">>>>>>>>>>>list :" + list); 
			
			var pvo = data.pvo;
			console.log(">>>>>>>>>>>pvo  :" + pvo); 
			
			if(boardIdx==1){
				setHouse(list);
			}
			else if(boardIdx==2){
				setJob(list,pvo);
			}
			setTfoot(pvo);
			
		}, 
		error : function() {
			console.log("실패");
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
	dataText += "<td class='price-pr'><a href='javascript:getDetail(" + hireData["hire_idx"] +  ' ,'  + pvo.nowPage +")'><p>" + hireData["title"] + "</p></a></td>";
	
	if(this["payment_codition"] == "year"){dataText += "<td class='quantity-box' id='salryTd'><div class='salaryCondtion'><span id='yearSalary'>Y</span>" + hireData["salary_max"] + "</div></td>"}
	else if(hireData["payment_codition"] == "month"){dataText += "<td class='quantity-box' id='salryTd'><div class='salaryCondtion'><span id='monthSalary'>M</span>" + hireData["salary_max"] + "</div></td>"}
	else if(hireData["payment_codition"] == "day"){dataText += "<td class='quantity-box' id='salryTd'><div class='salaryCondtion'><span id='daySalary'>D</span>" + hireData["salary_max"] + "</div></td>"}
	else if(hireData["payment_codition"] == "hour"){dataText += "<td class='quantity-box' id='salryTd'><div class='salaryCondtion'><span id='hourSalary'>H</span>" + hireData["salary_max"] + "</div></td>"}
	else {dataText += "<td class='quantity-box' id='salryTd'><div class='salaryCondtion'><span id='pay'>C</span>" + "Negotiable" + "</div></td>"}
	dataText += "<td class='add-pr'>" + hireData["regdate"] + "</td>";
	dataText += "</tr>";
	return dataText;
	
}







function setTfoot(pvo){
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
	
}