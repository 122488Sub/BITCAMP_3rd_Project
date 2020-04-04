function buttonColorChange(clickBtnValue,btnQuantity){
	
	for(var i=1; i<=btnQuantity; i++) {
	    if(i!=clickBtnValue){
	    	if(! $("#btn"+i).hasClass("btn59acff")){
	    		$("#btn"+i).addClass("btn59acff");
	    	}
	    	if( $("#btn"+i).hasClass("btn92faed")){
	    		$("#btn"+i).removeClass("btn92faed");
	    	}
	    }
	    else{
	    	if( $("#btn"+i).hasClass("btn59acff")){
	    		$("#btn"+i).removeClass("btn59acff");
	    	}
	    	if( !$("#btn"+i).hasClass("btn92faed")){
	    		$("#btn"+i).addClass("btn92faed");
	    	}
	    }
	    
	}
	
}