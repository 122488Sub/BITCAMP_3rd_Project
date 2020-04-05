<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>


<link rel="stylesheet" href="resources/css/resale/write.css" />

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW24W9sP9njddFNugiBUaJ-AzVfpQb_MY&language=en&libraries=places&callback=initMap" async defer></script>
<script type="text/javascript">
	function sendData() {
		var firstForm = document.forms[0];
		
		if($('input[name=subject]').val()==''){
			 alert("Plese Checked [Title]");
			 $('input[name=subject]').focus();
			 return false;
		}
		
		if($('input[name=rs_cate_prnt]').val()==''){
			 alert("Plese Checked [Category]");
			 $('input[name=subject]').focus();
			 return false;
		}
		if($('input[name=category_child]').val()==''){
			 alert("Plese Checked [Category]");
			 $('input[name=subject]').focus();
			 return false;
		}
		if($('input[name=price]').val()==''){
			 alert("Plese Checked [Price]");
			 $('input[name=price]').focus();
			 return false;
		}  
		if($('#contentBox').val()==''){
			 alert("Plese Checked [Content]");
			 $('input[name=content]').focus();
			 return false;
		}
		if($('input[name=address]').val()==''){
			 alert("Plese Checked [Address]");
			 $('input[name=address]').focus();
			 return false;
		}
		
		firstForm.submit();
		
	}
	
	$(function() {
		$(".cate1").bind("click", function() { // cate1클래스 클릭하면 해당 태그 텍스트 파싱
			var text = $(this).text();
			$("#cateResult1").html(text + " > "); //해당 아이디에 파싱 텍스트 추가 
			$('#hiddenCate1').val(text); //input태그에 텍스트 값 저장
		});

		$(".cate2").bind("click", function() { // cate2클래스 클릭하면 해당 태그 텍스트 파싱
			var text = $(this).text();
			$("#cateResult2").html(text); //해당 아이디에 파싱 텍스트 추가 
			$('#hiddenCate2').val(text); //input태그에 텍스트 값 저장
		});
	});

	//------------------다중 이미지 미리보기 제공

	var sel_files = [];
	$(function() {
		$("#input_imgs").on("change", handleImgsFilesSelect);
	});

	function handleImgsFilesSelect(e) {
		var files = e.target.files;
		var fileArr = Array.prototype.slice.call(files);

		fileArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다. ");
				return;
			}

			sel_files.push(f);

			var reader = new FileReader()
			reader.onload = function(e) {
				var img_html = "<img src=\""+ e.target.result + "\" />";
				console.log("img_html :" + img_html);
				$("#attachedImg").append(img_html);
			}
			reader.readAsDataURL(f);
		});
	}
	
	//영문주소 팝업창=============================================================================================
	//form에 name 값 설정
	function goPopup(){
	    // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrEngUrl.do)를 호출하게 됩니다.
	     var pop = window.open("resources/common/jusoPopup_eng.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	 }
	 
	function jusoCallBack(roadFullAddr, roadAddr, addrDetail, jibunAddr, zipNo, admCd, rnMgtSn
	                   , bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, korAddr){
	    // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	    $('#roadAddr').val(roadAddr);
	    $('#addrDetail').val(addrDetail);
	    $('#sggNm').val(sggNm);
	    $('#siNm').val(siNm);
	    
	    printMap(roadAddr);
	    
	 }
 
	//영문주소 팝업창 end =============================================================================================
		
	function printMap(roadAddr){
		$("#mapDisp").load("resources/html/googleMap.jsp?location="
		   		+roadAddr.replace(/ /gi,"%20"));
	}
</script>
</head>
<body>

		<br><br><br>
		<!-- Start All Title Box -->
	    <div class="all-title-box">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <h2>Resale Posting</h2>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- End All Title Box -->
    
		<form action="resalePost.do" method="post" enctype="multipart/form-data">
	    <div class="cart-box-main">
	    	<div class="container">
	    		<div class="col-md-8 col-sm-10 col-xs-12" style="float:none; margin:0 auto">
	    			<div class="title-left">
	    				<h3>Post Your Items</h3>
	    			</div>
	    				<input type="text" title="제목" name="subject" class="col-md-12 form-control" placeholder="Enter the subtitle." title="Title">
	    			<hr class="mb-4">
	    			<!-- cateMain Start -->
						<div id="cateMain">
							<div class="categoryBox">
								<label id="cateLabel">Category</label>
								<div class="row">
									<div id="cateBox1" class="cateBox">
										<ul>
											<li><button type="button" class="cate1">Fashion Goods</button></li>
											<li><button type="button" class="cate1">Women Clothes</button></li>
											<li><button type="button" class="cate1">Men Clothes</button></li>
											<li><button type="button" class="cate1">Household Appliances</button></li>
											<li><button type="button" class="cate1">Book/Ticket/Hobbies</button></li>
											<li><button type="button" class="cate1">Kids/Pregnant/Delivery</button></li>
											<li><button type="button" class="cate1">Star Goods</button></li>
											<li><button type="button" class="cate1">Sports/leisure</button></li>
											<li><button type="button" class="cate1">Beauty/Cosmetic</button></li>
											<li><button type="button" class="cate1">Vehicles</button></li>
										</ul>
									</div>
									<div id="cateBox2" class="cateBox">
										<ul>
											<li><button type="button" class="cate2">Fashion Goods 2</button></li>
											<li><button type="button" class="cate2">Women Clothes 2</button></li>
											<li><button type="button" class="cate2">Men Clothes 2</button></li>
											<li><button type="button" class="cate2">Household Appliances 2</button></li>
											<li><button type="button" class="cate2">Book/Ticket/Hobbies 2</button></li>
											<li><button type="button" class="cate2">Kids/Pregnant/Delivery 2</button></li>
											<li><button type="button" class="cate2">Star Goods 2</button></li>
											<li><button type="button" class="cate2">Sports/leisure 2</button></li>
											<li><button type="button" class="cate2">Beauty/Cosmetic 2</button></li>
											<li><button type="button" class="cate2">Vehicles 2</button></li>
										</ul>
									</div>
								</div>
							</div>
							<span class="cateText">Category ></span>
							<span id="cateResult1" class="cateText"></span>
							<span id="cateResult2" class="cateText"></span>
						</div>
					<!-- cateMain End -->					
	    			<hr class="mb-4">
						<div class="row">
							<div class="col-md-3">
				    			<label>Price</label>
							</div>
							<div class="col-md-9">
				    			<input type="number" name="price" class="form-control" placeholder="Enter the price. Number Only!" title="Price">
							</div>
						</div>
	    			<hr class="mb-4">
	    				<label>Content</label>
						<textarea id="contentBox" name="content" class="form-control"></textarea>
	    			<hr class="mb-4">
			    	<!-- imgBox Start -->
					<div id="imgBox">
						<div class="row">
							<div class="col-md-3">
				    			<label>Photo</label>
							</div>
							<div class="col-md-9 mb-3">
								<input type="file" id="input_imgs" name="filename" multiple	title="사진" style="margin-left:10px">
							</div>
							<div class="col-md-12">
								<div id="attachedImg"></div>
							</div>
						</div>		
					</div>
					<!-- imgBox End -->
					<hr class="mb-4">
						<div class="row">
							<div class="col-md-3">
				    			<label>Trading region</label>
							</div>
							<div class="col-md-9">
							
							
								<label>RoadAddress:</label>
								<div class="row mb-3">
									<div class="col-md-10">
										<input type="text" id="roadAddr" name="address" class="form-control" readonly="readonly"> 
									</div>
									<div class="col-md-2">
										<input type="button" value="Search" onclick="goPopup();" >
									</div>
								</div>
								
								<div id="mapDisp" class="form-control"></div>
							</div>
						</div>		
	    			<hr class="mb-4">
	    				<div class="row">
							<div class="col-md-3">
				    			<label>Hashtag</label>
							</div>
							<div class="col-md-9">
				    			<input type="text" name="hash_tag" class="form-control" placeholder="Maximum 5 Hashtags are available." title="HashTag">
							</div>
						</div>
	    		</div>
	    	</div>
	    </div>
			
			<input type="hidden" id="hiddenCate1" name="rs_cate_prnt" title="카테고리"> 
			<input type="hidden" id="hiddenCate2" name="category_child" title="하위 카테고리">
			<div style="text-align:center; margin-bottom:50px; margin-right:10px">			
				<input type= "button" class="btn hvr-hover" onclick="sendData()" value="Upload">
				<button type="reset" class="btn hvr-hover">reset</button>
			</div>
		
		</form>

	

</body>
</html>