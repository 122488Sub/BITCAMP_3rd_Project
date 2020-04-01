<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="bootstrap/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="bootstrap/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="bootstrap/css/custom.css">

<link href="resources/css/common/page.css" rel="stylesheet" type="text/css">
<link href="resources/css/common/button.css" rel="stylesheet" type="text/css">

<link href="resources/css/common/page.css" rel="stylesheet" type="text/css">
</head>

<body>

	<div class="wishlist-box-main">
	<a href="InfoInsert_go.do">New Post</a>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="table-main table-responsive">
						<table class="table" id="infoList">
							<thead id="tHead">

							</thead>
							<tbody id="list_box">

							</tbody>

						</table>
						<div id="tfoot"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

$( function() {
	getData(1,"");
});

function getData(cPage,searchKey) {
	
	var url = 'getInformListData.do?cPage=' + cPage;
	
	console.log(url);
	var param = {
		
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
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("실패 : \n" + "jqXHR.readyState : " + jqXHR.readyState + "\n"
					+ "textStatus : " + textStatus + "\n" + "errorThrown : "
					+ errorThrown);
		}

	});
	

}
function goInformDetailPage(info_idx) {
	console.log("?????????");
	window.open("about:blank").location.href="InformDetail_go.do?info_idx=" + info_idx;
} 
</script>

</body>
</html>
