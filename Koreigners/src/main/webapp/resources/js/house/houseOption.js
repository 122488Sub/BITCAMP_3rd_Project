//function initFilter() {
$( function() {
	
	 $( "#deposit_slider-range" ).slider({
	      range: true,
	      min: 0,
	      max: 50000,
	      step: 100,
	      values: [ 0, 50000 ],
	      slide: function( event, ui ) {
	    	var tmp="";
	    	if (ui.values[ 1 ] ==50000)
	    		tmp='+';
	        $( "#depositBar" ).val( "$" + ui.values[ 0 ] + " ~ $" + ui.values[ 1 ]+tmp );
	        
	      },
	      change: function( event, ui ) {
	    	  setSliderValue();
	    	  getData();
	      }
	    });
	    $( "#depositBar" ).val( "$" + $( "#deposit_slider-range" ).slider( "values", 0 ) +
	      " ~ $" + $( "#deposit_slider-range" ).slider( "values", 1 )+'+' );
	    

		 $( "#monthly_slider-range" ).slider({
		      range: true,
		      min: 0,
		      max: 50000,
		      step: 100,
		      values: [ 0, 50000 ],
		      slide: function( event, ui ) {
		    	  var tmp="";
			    	if (ui.values[ 1 ] ==50000)
			    		tmp='+';
		        $( "#monthlyBar" ).val( "$" + ui.values[ 0 ] + " ~ $" + ui.values[ 1 ]+tmp );
		      },
		      change: function( event, ui ) {	 
		    	  setSliderValue();
		    	  getData();
		      }

		 });
		    
		 $( "#monthlyBar" ).val( "$" + $( "#monthly_slider-range" ).slider( "values", 0 ) +
				 " ~ $" + $( "#monthly_slider-range" ).slider( "values", 1 ) +'+');
		 
		 //----------------------------------------------------------
		 $(".buildBtn, .roomBtn").click(function(){
			 chkBuildAndRoomType(this);
			 getData();
		 });
		
		

});
	    


//=====================================================================
function chkBuildAndRoomType(chk){
	//alert($(chk).css( "background-color" ));
	if($(chk).css( "background-color" )=="rgb(40, 207, 209)"){
		$(chk).css( "background-color","#FFFFFF");
		
		if(chk.innerHTML=='Villa')					 build_type_List[0]= -1;
		else if(chk.innerHTML=='Goshiwon')  		 build_type_List[1]= -1;
		else if(chk.innerHTML=='Semi-<br>Officetel') build_type_List[2]= -1;
		
		if(chk.innerHTML=='Studio')					 room_type_List[0]= -1;
		else if(chk.innerHTML=='Two')				 room_type_List[1]= -1;
		else if(chk.innerHTML=='Three+')			 room_type_List[2]= -1;
		
	}
	else{
		$(chk).css( "background-color","#28cfd1");
		
		if(chk.innerHTML=='Villa')					 build_type_List[0]= 0;
		else if(chk.innerHTML=='Goshiwon')  		 build_type_List[1]= 1;
		else if(chk.innerHTML=='Semi-<br>Officetel') build_type_List[2]= 2;
		
		if(chk.innerHTML=='Studio')					 room_type_List[0]= 0;
		else if(chk.innerHTML=='Two')				 room_type_List[1]= 1;
		else if(chk.innerHTML=='Three+') 			 room_type_List[2]= 2;
	}
	
	 
	
}
function chkRoomType(val){
	if(val=='Studio')
		return 0;
	else if(val=='Two')
		return 1;
	else 
		return 2;
}


function setSliderValue(){
	depositMin= $( "#deposit_slider-range" ).slider( "values", 0 );
	depositMax= $( "#deposit_slider-range" ).slider( "values", 1 );
	monthlyMin= $( "#monthly_slider-range" ).slider( "values", 0 );
	monthlyMax= $( "#monthly_slider-range" ).slider( "values", 1 );
}