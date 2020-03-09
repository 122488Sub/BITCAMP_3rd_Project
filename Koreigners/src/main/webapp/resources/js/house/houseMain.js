	

	$( function() {
		getData();
		$(".tbody_dosi").html("<h2>&nbsp;&nbsp;← Please select an region</h2>");
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
		 $(".th_selectDoSi").html("Select)"+ (si_List.length + do_List.length -2) );
		//----------------------------------------
		 jQuery.ajaxSettings.traditional = true;
		 $.ajax({
				type : "get",
			 	url : "getHouseListData.do",  
				dataType : "json",
				async: false,
				data: param,
				success : function(data) {
					var dataTag = "";
					var i = 1;
					
					var list = data.list;
					console.log(">>>>>>>>>>>list :" + list); 
					
					var pvo = data.pvo;
					console.log(">>>>>>>>>>>pvo  :" + pvo); 
					
					$.each(list, function(index, obj){
						dataTag += "<tr>";
						dataTag += "<td><a href='house_detail?room_idx=" + this.room_idx+"'>" + this.room_idx+ "</a></td>";
						dataTag += "<td>" + this["subject"] + "</td>";
						dataTag += "<td>" + this["room_type"] + "</td>";
						dataTag += "<td>" + this["address"] + "</td>";
						dataTag += "<td>" + this["deposit"]+"/" +this["monthly_rent"] + "</td>";
						dataTag += "<td>" + this["room_reporting_date"] + "</td>";
						dataTag += "</tr>";
					});	
					
					
					$("#list_box").html(dataTag);
					
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
					
					
					
					
					
					$(".th_selectDoSi").html("");
					
					
					
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
				'do_enList' : do_List,  // '본인 vo변수이름 : 데이터이름'
				'si_enList' : si_List
		}
		 jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url : 'getHouseListData.do?cPage=' + cPage,
			type : 'post',
			data: param,
			dataType : "json",
			success : function(data) {
				
				var list = data.list;
				
				var pvo = data.pvo;
				console.log(">>>>>>>>>>>pvo  :" + pvo); 
				
				var dataTag = "";
				var i = 1;
				
				$.each(list, function(index, obj){
					
					dataTag += "<tr>";
					dataTag += "<td><a href='house_detail?room_idx=" + this.room_idx+"'>" + this.room_idx+ "</a></td>";
					dataTag += "<td>" + this["subject"] + "</td>";
					dataTag += "<td>" + this["room_type"] + "</td>";
					dataTag += "<td>" + this["address"] + "</td>";
					dataTag += "<td>" + this["deposit"]+"/" +this["monthly_rent"] + "</td>";
					dataTag += "<td>" + this["room_reporting_date"] + "</td>";
					dataTag += "</tr>";
				
				});	
				$("#list_box").html(dataTag);
				
				var tfoot = "";
				tfoot += '<tr><td colspan="5"><ol class="paging">'
					
				if(pvo.beginPage < pvo.pagePerBlock){
					tfoot += '<li class="disable">이전으로</li>';
				} else{
					tfoot += '<li><a href="javascript:getListCPage(' + pvo.beginPage - pvo.pagePerBlock + '}")>이전으로</a></li>';
				}
				for(var k=pvo.beginPage; k<=pvo.endPage; k++) {
					if(k == pvo.nowPage) {
						tfoot += '<li class="now">' + k + '</li>';
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
				
			}, 
			error : function() {
				console.log("실패");
			}
		});
	}