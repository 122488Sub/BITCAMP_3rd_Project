<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/resale/write.css" />

<style>
.imgs_wrap {
	width: 600px;
	margin-top: 50px;
}

.imgs_wrap img {
	max-width: 200px;
}
</style>
<script type="text/javascript">
	function sendData() {
		var firstForm = document.forms[0];
		console.log("firstForm : " + firstForm);
		console.log("firstForm.elements.length : " + firstForm.elements.length);
		for (var i = 0; i < firstForm.elements.length; i++) {
			if (firstForm.elements[i].value.trim() == "") {
				if (i == 0 || ((i >= 2) && (i <= 23)))
					continue; //파일속성 제외
				console.log("firstForm.elements[i].outerText : "
						+ firstForm.elements[i].outerText);
				console.log("firstForm.elements[i] : " + i);
				alert(firstForm.elements[i].title + "을 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		firstForm.submit();
	}
</script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
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
				$(".imgs_wrap").append(img_html);
			}
			reader.readAsDataURL(f);
		});
	}
</script>
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
	    		<div class="col-md-10 col-sm-10 col-xs-12" style="float:none; margin:0 auto">
	    			<div class="title-left">
	    				<h3>Post Your Items</h3>
	    			</div>
	    				<input type="text" name="subject" class="col-md-12 form-control" placeholder="subtitle">
	    			<hr class="mb-4">
			    	<!-- imgBox Start -->
					<div id="imgBox">
						<label>사진 : </label>
						<div id="defaultImg">
							<img src="images/default-placeholder2.png" width="200px" height="200px">
						</div>
						<input type="file" id="input_imgs" name="filename" multiple	title="사진" />
						<div class="imgs_wrap"></div>
					</div>
					<!-- imgBox End -->
	    		</div>
	    	</div>
	    </div>
			
			<!-- cateMain Start -->
			<div id="cateMain">
				<div class="categoryBox">
					<label id="cateLabel">카테고리 : &nbsp;</label>
					<div id="cateBox1" class="cateBox">
						<ul>
							<li><button type="button" class="cate1">패션잡화</button></li>
							<li><button type="button" class="cate1">여성의류</button></li>
							<li><button type="button" class="cate1">남성의류</button></li>
							<li><button type="button" class="cate1">디지털/가전</button></li>
							<li><button type="button" class="cate1">도서/티켓/취미</button></li>
							<li><button type="button" class="cate1">유아/아동/출산</button></li>
							<li><button type="button" class="cate1">스타굿즈</button></li>
							<li><button type="button" class="cate1">스포츠 레저</button></li>
							<li><button type="button" class="cate1">뷰티/미용</button></li>
							<li><button type="button" class="cate1">스포츠레저</button></li>
							<li><button type="button" class="cate1">차량/오토바이</button></li>
						</ul>
					</div>
					<!-- cateBox1 End -->
					<div id="cateBox2" class="cateBox">
						<ul>
							<li><button type="button" class="cate2">패션잡화2</button></li>
							<li><button type="button" class="cate2">여성의류2</button></li>
							<li><button type="button" class="cate2">남성의류2</button></li>
							<li><button type="button" class="cate2">디지털/가전2</button></li>
							<li><button type="button" class="cate2">도서/티켓/취미2</button></li>
							<li><button type="button" class="cate2">유아/아동/출산2</button></li>
							<li><button type="button" class="cate2">스타굿즈2</button></li>
							<li><button type="button" class="cate2">스포츠 레저2</button></li>
							<li><button type="button" class="cate2">뷰티/미용2</button></li>
							<li><button type="button" class="cate2">스포츠레저2</button></li>
							<li><button type="button" class="cate2">차량/오토바이2</button></li>
						</ul>
					</div>
				</div>
				<!-- cateBox2 End -->
				<span id="cateText">카테고리 ></span>
				<span id="cateResult1"></span>
				<span id="cateResult2"></span>
			</div>
			<!-- cateMain End -->
			<div id="addrBox">

				<label style="float: left">거래지역 : &nbsp;</label>
				<div class="pac-card" id="pac-card">
					<div id="pac-container">
						<input id="pac-input" type="text" name="address" placeholder="주소를 입력하세요" title="주소">
					</div>
				</div>
			</div>
			<div id="map"></div>
			
			<label>가격 : &nbsp;</label> 
			<input type="number" name="price" placeholder="숫자만 입력하세요" title="가격"> 
			<label>&nbsp; 원</label>
			
			<label>설명 : &nbsp;</label>
			<textarea id="contentBox" name="content" placeholder="제품에 대한 설명을 입력하세요." rows="10" title="설명"></textarea>
			
			<label>해시태그 : &nbsp;</label> 
			<input type="text" name="hash_tag" placeholder="최대 5개 입력 가능합니다." title="해시태그">
			
			<input type="hidden" id="hiddenCate1" name="rs_cate_prnt" title="카테고리"> 
			<input type="hidden" id="hiddenCate2" name="category_child" title="하위 카테고리"> 
			<input type="button" value="등록하기" id="btn" onclick="sendData()">
		
		</form>

	<script type="text/javascript" src="./map/googleJS.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW24W9sP9njddFNugiBUaJ-AzVfpQb_MY&libraries=places&callback=initMap"
		async defer></script>

</body>
</html>