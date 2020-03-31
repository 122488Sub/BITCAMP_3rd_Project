<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Site CSS -->
<link rel="stylesheet" href="bootstrap/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="bootstrap/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="bootstrap/css/custom.css">

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
							<thead>
								
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
	getData(1);
});

function getData(cPage) {
	
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
			
			$.each(informList, function(index, obj) {
				console.log(this);
			});
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("실패 : \n" + "jqXHR.readyState : " + jqXHR.readyState + "\n"
					+ "textStatus : " + textStatus + "\n" + "errorThrown : "
					+ errorThrown);
		}

	});
}
</script>

</body>
</html>
