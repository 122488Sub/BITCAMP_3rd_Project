<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>

<body>
<!-- 지도부분 -->
<jsp:include page="../common/republic_korea.jsp"/>
<h1><a href="house_insert.do">insert</a></h1>

<div id="listDisp">



</div>

<div id="mapDisp">

</div>

<script>
	
	//페이징로딩후 자동시작 //
	$(window).on('load',function(){
		console.log("gd");
		getInitData();
		$(".div_option").load("/koreigner/resources/html/houseOption.jsp"); //수정해야함
	});
	//여기까지 페이징로딩후 자동시작//
	
	
	
	//도-All체크 선택시 //
	function chkParent() { 	
	    $(".chk_do_child").prop('checked', false);
	    
	    
	    var do_en=$(".chk_do_parent").val() ;
	    
	    
	    if(  $(".chk_do_parent").is(":checked") ) {
	    	$('#selectDo_'+ do_en).val('1');
	    	do_List.push(do_en);
	    	
	    }else{
	    	$('#selectDo_'+ do_en).val('0');
	    	do_List.splice(do_List.indexOf(do_en), 1);
	    }
	    
	    console.log(do_List);
	    
	    getData();
	};
	
	//시 선택시 //
	function chkChild(chk) { 	
		var do_en=$(".chk_do_parent").val() ;
		alert(chk.value);
	    $(".chk_do_parent").prop('checked', false); 
	    
	    if(  chk.checked ) {
	    	alert('1');
	    	$('#selectDo_'+ do_en).val('0');
	    	if(do_List.indexOf(do_en)!=1){
	    		do_List.splice(do_List.indexOf(do_en), 1);
	    	}
	    	si_List.push(chk.value);
	    	
	    }else{
	    	alert('2');
	    	si_List.splice(si_List.indexOf(chk.value), 1);
	    }
	    
	   
	    getData();
	}; 
	

	
	
	
	function getData() {
		
		var param={
				'do_enList' : do_List,
				'gu_gun_eup_engList' : si_List
		}
		//----------------------------------------
		//도 선택 값 파라미터 추가 
		var do_enParam = $(".chk_do_parent").val();
		 $(".th_selectDoSi").html("Select)"+ (si_List.length + do_List.length) );
		//----------------------------------------
		 //추후 옵션 필터값 자리
		var option=[];
		option.push("TQTQTQTQ");
		option.push("wRwRwR");
		//----------------------------------------
		
		 jQuery.ajaxSettings.traditional = true;
		 $.ajax({
				type : "get",
			 	url : "getHouseDoList.do", 
				dataType : "json",
				async: false,
				data: param,
				success : function(data) {
					
					console.log(data);
					//응답받은 데이터 형식 : [{}, {}, ... , {}] - 배열
					var strData = JSON.stringify(data); //JSON -> string
					console.log("-" + strData + "-");
					
					var jsData = JSON.parse(strData); //string -> JavaScript 객체화
					console.log("-" + jsData + "-");
					
					
					//-------------------------------------------------
					var dispHtml = "";
					dispHtml = "<ul>";
					if(data.length==0) {
						dispHtml += "<li>데이터가 없어요 ㅠㅜ</li>";
						
					}
					else{
						//시군구 테이블 값 지정
						
						$.each(data, function(index, obj){
						
							dispHtml += "<li>";
							dispHtml += "<a href='house_detail.do?room_idx="+this.room_idx+"'>";
							dispHtml += 	this.room_idx;
							dispHtml += "</a>";
							dispHtml += "/ ";
							dispHtml += this.mem_email+ "/ ";
							dispHtml += this.subject + "/ ";
							dispHtml += this.do_en+ "/ ";
							dispHtml += this.gu_gun_eup_eng;
							dispHtml += this.address+ "/ ";
							dispHtml += this.address_detail+ "/ ";
							dispHtml += this.room_reporting_date;
							dispHtml += "</li>";
						}); 
						
					}
					//-------------------------------------------------
					dispHtml += "</ul>";
					$("#listDisp").html(dispHtml);
				
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus+"\n"
						+ "errorThrown : " + errorThrown);
				}
				
			});	
		
	}
	function getInitData() {
		 //추후 옵션 필터값 자리
		var option=[];
		option.push("TQTQTQTQ");
		option.push("wRwRwR");
		//----------------------------------------
		 $.ajax({
				type : "get",
			 	url : "getHouseAllList.do",  
				dataType : "json",
				async: false,
				data: { //보낼 데이터
					//"name": data변수 or 값
					//.do에서 ()@RequestParam(value="name") 자료형 새변수명) 으로 사용됨
					//이때 데이터가 배열이면 자료형은 @RequestParam(value="name[]") List<String> 새변수명)으로 처리
					//"do_enParam": do_enParam,
					"option": option
				},
				success : function(data) {
					
					console.log(data);
					//응답받은 데이터 형식 : [{}, {}, ... , {}] - 배열
					var strData = JSON.stringify(data); //JSON -> string
					console.log("-" + strData + "-");
					
					var jsData = JSON.parse(strData); //string -> JavaScript 객체화
					console.log("-" + jsData + "-");
					
					
					//-------------------------------------------------
					var dispHtml = "";
					dispHtml = "<ul>";
					if(data.length==0) {
						dispHtml += "<li>데이터가 없어요 ㅠㅜ</li>";
						
					}
					else{
						//모든 시군구의 반환 값 지정
						$.each(data, function(index, obj){ //수정해야함
							dispHtml += "<li>";
							dispHtml += "<a href='house_detail.do?room_idx="+this.room_idx+"'>";
							dispHtml += 	this.room_idx;
							dispHtml += "</a>";
							dispHtml += "/ ";
							dispHtml += this.mem_email+ "/ ";
							dispHtml += this.subject + "/ ";
							dispHtml += this.do_en+ "/ ";
							dispHtml += this.gu_gun_eup_eng;
							dispHtml += this.address+ "/ ";
							dispHtml += this.address_detail+ "/ ";
							dispHtml += this.room_reporting_date;
							dispHtml += "</li>";
						}); 
					}
					//-------------------------------------------------
					dispHtml += "</ul>";
					$("#listDisp").html(dispHtml);
					$(".th_selectDoSi").html("");
					$(".tbody_dosi").html("<h2>&nbsp;&nbsp;← Please select an region</h2>");
					
					
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus+"\n"
						+ "errorThrown : " + errorThrown);
				}
				
			});			
	}
	
	
</script>
</body>
</html>
