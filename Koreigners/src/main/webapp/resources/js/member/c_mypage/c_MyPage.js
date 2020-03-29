function getData(category, id, cPage) {
	mem_id = id;
	console.log(mem_id);
	console.log(category);
	var url = "";
	if (category == 1) {
		url = 'getCompanyHireList.do?cPage=' + cPage;
	} else {
		url = 'getCompanyApply.do?cPage=' + cPage;
	}
	console.log(url);
	var param = {
		'mem_id' : mem_id,
		'category':category
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
			
			if(category==1){
				setCHire(data.cHire);
			}else if(category==2){
				setCApplier(data.cResume);
			}
			
			
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert("실패 : \n" + "jqXHR.readyState : " + jqXHR.readyState + "\n"
					+ "textStatus : " + textStatus + "\n" + "errorThrown : "
					+ errorThrown);
		}

	});
}
function setCHire(list) {
	setCHireHead();
	var dataTag = "";
	$.each(list, function(index, obj) {
		dataTag += setCHireData(this);
		console.log(this);
	});
	$("#list_box").html(dataTag);
}
function setCHireHead() {

	$("#tHead").html(
			"<tr>" + "<th>Title</th>" + "<th>work_type</th>" + "<th>cate_prnt_kor</th>"
					+ "<th>cate_child_ko</th>" + "<th>address</th>"
					+ "<th>Post Date</th>" + "</tr>"

	);
}
function setCHireData(cHire) {
	console.log(cHire);
	return  "<tr onclick='javascript:goHireDetailPage(" + cHire.hire_idx
			+ ")' style='cursor: pointer;'>" + "<td>" + cHire.title
			+ "</td>" + "<td>" + cHire["work_type"] + "</td>" + "<td>"
			+ cHire["cate_prnt_ko"] + "</td>" + "<td>" + cHire["cate_child_ko"]
			+ "</td>" + "<td>" + cHire["address"] +"</td>" + "<td>"
			+ cHire["regdate"] + "</td>" + "</tr>";

}

function goHireDetailPage(hire_idx) {
	window.open("about:blank").location.href="hireDetail.do?hire_idx=" + hire_idx;
} 


function setCApplier(list) {
	setCApplierHead();
	var dataTag = "";
	$.each(list, function(index, obj) {
		dataTag += setCApplierData(this);
		console.log(this);
	});
	$("#list_box").html(dataTag);
}
function setCApplierHead() {

	$("#tHead").html(
			"<tr>" + "<th>Title</th>" + "<th>work_type</th>" + "<th>cate_prnt_kor</th>"
					+ "<th>cate_child_ko</th>" + "<th>address</th>"
					+ "<th>Post Date</th>" + "</tr>"

	);
}
function setCApplierData(cResume) {
	console.log(cResume);
	return  "<tr onclick='javascript:goResumeDetailPage(" +'"'+ cResume.MEM_ID+'"'
			+ ")' style='cursor: pointer;'>" + "<td>" + cResume.MEM_ID
			+ "</td>" + "<td>" + cResume["MEM_NAME"] + "</td>" + "<td>"
			+cResume["WISH_SI"] +","+cResume["WISH_DO"] + "</td>" + "<td>" + cResume["JOB_CATE"]
			+ "</td>" + "<td>" + cResume["JOB_CATE_CHILD"] +"</td>" + "<td>"
			+ cResume["REGDATE"] + "</td>" + "</tr>";

}

function goResumeDetailPage(resume_m_id) {
	window.open("about:blank").location.href="resumePage_go.do?mem_id=" + resume_m_id;
} 





function setTfoot(pvo) {
	var tfoot = "";
	tfoot += '<tr><td><ol class="paging">'

	if (pvo.beginPage < pvo.pagePerBlock) {
		tfoot += '<li class="disable">이전으로</li>';
	} else {
		tfoot += '<li><a href="javascript:changeCategory(' + boardIdx + ","
				+ mem_id + "," + (pvo.beginPage - pvo.pagePerBlock)
				+ '")>이전으로</a></li>';
	}
	for (var k = pvo.beginPage; k <= pvo.endPage; k++) {
		if (k == pvo.nowPage) {
			tfoot += '<li class="now">' + k + '</li>';
		} else if (k != pvo.nowPage) {
			tfoot += '<li><a href="javascript:changeCategory(' + boardIdx
					+ ",'" + mem_id + "'," + k + ')">' + k + '</a></li>';
		}
	}
	if (pvo.endPage >= pvo.totalPage) {
		tfoot += '<li class="disable">다음으로</li>';
	} else {
		tfoot += '<li><a href="javascript:changeCategory(' + boardIdx + ","
				+ mem_id + "," + (pvo.beginPage + pvo.pagePerBlock)
				+ ')">다음으로</a></li>';
	}

	tfoot += '</ol></td></tr>'
	$("#tfoot").html(tfoot);

}