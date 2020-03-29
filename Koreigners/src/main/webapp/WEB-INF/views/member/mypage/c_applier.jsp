<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/css/header.css" rel="stylesheet" type="text/css">
    <link href="resources/css/style.css" rel="stylesheet" type="text/css">
    <link href="resources/css/member/mypageCompany.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
	
	<script>
	var mem_id="";
	$( function() {
		getData(2,'${mem_id}',1);
		
	});
		
	function getData(category,id,cPage) {
		mem_id=id;
		console.log(mem_id);
		var url="";
		if(category==1){
			url='getCompanyHireList.do?cPage=' + cPage;
		}
		else{
			url='getCompanyApply.do?cPage=' + cPage;
		}
		
		var param={
				'mem_id' : mem_id
		}
		
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
					console.log(">>"+data.cResume[0].MEM_NAME);
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
	</script>
</head>


<body>
<div id="moveBox">
	<ul>
		<li class="tabs">
			<img class="icon" src="resources/img/common/setting.png">&nbsp;
			<a href="myPage_go.do?type=profile">My Profile</a>
		</li>
		<li class="tabs">
			<img class="icon2" src="resources/img/common/people.png">&nbsp;
			<a href="myPage_go.do?type=hire">My Recruitment</a>
		</li>
		<li class="tabs" style="background:#E2E2E2;">
			<img class="icon" src="resources/img/common/document.png">&nbsp;
			<a href="myPage_go.do?type=applier">My Applicants</a>
		</li>
		
	</ul>
</div>
지원자리스트 페이지!!!
</body>
</html>