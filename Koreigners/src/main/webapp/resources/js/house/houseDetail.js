var opacityData=new Array(16);
var opacityLowUpper=['closet','desk','chair','bed','aircondition'
					,'heating','bathroom','sink','stove','refrigerator'
					,'laundry','pet','internet','wifi','elevator','parking'];
$(function() {
	
	for(var i=0; i<16; i++){                          
		opacityData[i] = $("input[name=opacity]")[i].value;
    }
	checkSize();
	$(window).resize(function (){
	  // width값을 가져오기
	  checkSize();
	});
});
function checkSize(){
	var width_size = window.innerWidth;
	  console.log(width_size);
	  // 800 이하인지 if문으로 확인
	  if (width_size <= 768) {
		  changeMinSizeUtilities();
	  }else{
		  changeMaxSizeUtilities();
	  }
}
function toCapitalize(text) {
	var text = text.replace(/^./, text[0].toUpperCase());
    return text;
}

function changeMinSizeUtilities(){
	var utilTableHtml="";
	utilTableHtml += '<colgroup>';
	utilTableHtml +=	'<col width="20%" span="4">';
	utilTableHtml += '</colgroup>';
	
for(var i=0; i<16; i++){       
if(i%4==0)
	utilTableHtml += '<tr>';
	utilTableHtml += '	<td>';
	utilTableHtml += '		<div style="opacity:'+(opacityData[i]==1? 1.0:0.3) +'" >';
	utilTableHtml += '			<div><img id="icon_closet" src="resources/img/house/icon/'+opacityLowUpper[i]+'.png"></div>';
	utilTableHtml += '			<div>'+toCapitalize(opacityLowUpper[i])+'</div>';
	utilTableHtml += '		</div>';
	utilTableHtml += '	</td>';
if(i%4==3)
	utilTableHtml += '</tr>';
  }
	$("#utilTable").html(utilTableHtml);
}

function changeMaxSizeUtilities(){
	var utilTableHtml="";
	utilTableHtml += '<colgroup>';
	utilTableHtml +=	'<col width="12%" span="8">';
	utilTableHtml += '</colgroup>';
	
for(var i=0; i<16; i++){       
if(i%8==0)
	utilTableHtml += '<tr>';
	utilTableHtml += '	<td>';
	utilTableHtml += '		<div style="opacity:'+(opacityData[i]==1? 1.0:0.3) +'" >';
	utilTableHtml += '			<div><img id="icon_closet" src="resources/img/house/icon/'+opacityLowUpper[i]+'.png"></div>';
	utilTableHtml += '			<div>'+toCapitalize(opacityLowUpper[i])+'</div>';
	utilTableHtml += '		</div>';
	utilTableHtml += '	</td>';
if(i%8==7)
	utilTableHtml += '</tr>';
  }
	$("#utilTable").html(utilTableHtml);
	
}




// 천단위 이상의 숫자에 콤마( , )를 삽입하는 함수
function clickModify() {
	post_goto('house_Modify.do', {'room_idx':getParam("room_idx")},false);
}


function clickDelete() {
	var jbResult = prompt( 'If you want to delete this post, please enter "Delete".', '' );
	if(jbResult=='Delete'){
		post_goto('house_Delete.do', {'room_idx':getParam("room_idx")},false);
	}
	else if(jbResult!=null){
		alert("You entered it incorrectly");
	}
}


