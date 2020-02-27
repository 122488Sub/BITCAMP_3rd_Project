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
		getInitData();
		$(".div_option").load("/koreigner/resources/html/houseOption.jsp"); //수정해야함
	});
	//여기까지 페이징로딩후 자동시작//
	
	//도-All체크 선택시 //
	function chkParent() { 	
	    $(".chk_do_child").prop('checked', false);
	    
	    
	    var do_en=$(".chk_do_parent").val() ;
	    
	    
	    if(  $(".chk_do_parent").is(":checked") ) {
	    	do_List.push(do_en);
	    }else{
	    	do_List.splice(do_List.indexOf(do_en), 1);
	    }
	    
	    $(".chk_do_child").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
			 if(si_List.indexOf($(this).val())!= -1){
				 si_List.splice(si_List.indexOf($(this).val()), 1);
		     }
		});
	    
	    console.log(do_List);
	    
	    getData();
	};
	
	//시 선택시 //
	function chkChild(chk) { 	
		var do_en=$(".chk_do_parent").val() ;
		//alert(chk.value);
	    $(".chk_do_parent").prop('checked', false); 
	    
	    if(  chk.checked ) {
	    
	    	if(do_List.indexOf(do_en)!= -1){
	    		do_List.splice(do_List.indexOf(do_en), 1);
	    	}
	    	si_List.push(chk.value);
	    	
	    }else{
	    	si_List.splice(si_List.indexOf(chk.value), 1);
	    }
	    
	    getData();
	}; 
	

	
	function getData() {
		
		var param={

				'do_enList' : do_List,  // '본인 vo변수이름 : 데이터이름'
				'si_enList' : si_List
		}
		//----------------------------------------
	
		 $(".th_selectDoSi").html("Select)"+ (si_List.length + do_List.length -2) );
		//----------------------------------------
		
		
		 jQuery.ajaxSettings.traditional = true;
		 $.ajax({
				type : "get",
			 	url : "getHouseSearchList.do", 
				dataType : "json",
				async: false,
				data: param,
				success : function(data) {				
					//console.log(data);
					//응답받은 데이터 형식 : [{}, {}, ... , {}] - 배열
					//var strData = JSON.stringify(data); //JSON -> string
					//console.log("-" + strData + "-");	
					//var jsData = JSON.parse(strData); //string -> JavaScript 객체화
					//console.log("-" + jsData + "-");
					
					
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
		
		//----------------------------------------
		 $.ajax({
				type : "get",
			 	url : "getHouseAllList.do",  
				dataType : "json",
				async: false,
				success : function(data) {
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
