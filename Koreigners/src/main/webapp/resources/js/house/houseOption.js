//function initFilter() {
$( function() {
	
	 $( "#deposit_slider-range" ).slider({
	      range: true,
	      min: 0,
	      max: 500,
	      values: [ 75, 300 ],
	      slide: function( event, ui ) {
	    	var tmp="";
	    	if (ui.values[ 1 ] ==500)
	    		tmp='+';
	        $( "#depositBar" ).val( "$" + ui.values[ 0 ] + " ~ $" + ui.values[ 1 ]+tmp );
	        
	      }
	    });
	    $( "#depositBar" ).val( "$" + $( "#deposit_slider-range" ).slider( "values", 0 ) +
	      " ~ $" + $( "#deposit_slider-range" ).slider( "values", 1 ) );
	    

		 $( "#monthly_slider-range" ).slider({
		      range: true,
		      min: 0,
		      max: 500,
		      values: [ 75, 300 ],
		      slide: function( event, ui ) {
		    	  var tmp="";
			    	if (ui.values[ 1 ] ==500)
			    		tmp='+';
		        $( "#monthlyBar" ).val( "$" + ui.values[ 0 ] + " ~ $" + ui.values[ 1 ]+tmp );
		      }
		    });
		    $( "#monthlyBar" ).val( "$" + $( "#monthly_slider-range" ).slider( "values", 0 ) +
		      " ~ $" + $( "#monthly_slider-range" ).slider( "values", 1 ) );
	 
//}
});
	    
   