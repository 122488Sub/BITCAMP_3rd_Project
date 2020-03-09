<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<head>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 

 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script type="text/javascript" src="resources/js/house/houseOption.js"></script>
 
 <style> 
 	
 	#filterBox{
 		width:550px;
 		text-align:left;
 		margin-left: 15px;
 	}
 	label{
 		 font: 700 16px/1 'Montserrat', sans-serif;
 	
 	}
 	
 	.slider-range{
 		width: 230px;
 		margin-top: 5px;
 	}
 	
 	#stayBox, #barBox, #typeBox{
 		width:100%;
 		margin-top: 15px;
 	}
 	.barText{
 		width: 100px;
 	}
 	.barContent{
 		
 		float: left;
 		width: 50%;
 		
 	}
 	#barBox::after {
   content: "";
   display: block;
   clear: both;
}

 	
 	select {
 		margin-top: 5px;
	  
	  border: none;
	  box-shadow: none;
	  background: transparent;
	  background-image: none;
	  -webkit-appearance: none;
	  outline: none;
	  cursor: pointer;
	
	  /* Hide arrow on FF */
	  -moz-appearance: none;
	  text-indent: 0.01px;
	  text-overflow: ellipsis;
	  
	  border: 1.5px solid;/* #00498c;*/
	  border-radius: 40px 80px / 80px 40px;
	  padding: 7px 38px 7px 17px;
	  /* You can style text of the active select option */
	 
	  text-transform: uppercase;
	  letter-spacing: 2px;
	 /* color: #00498c;*/
	}
select::-ms-expand {
  display: none;
}
optgroup {
  color: inherit;
  font: inherit;
}

#headerBox{
	position: relative;
	float: right;
	
}
#stayBox{
	float: none;

}
#headerSelect{	
	
}
#staySelect{

	 font: 700 16px/1 'Montserrat', sans-serif;
	 width: 40%;
}

.typeContent , .btnDiv{
	float:left;
	
}
.typeContent {
	width:48%;
}
.btnDiv{
    width: 30%;
    text-align: center;
    background-color: aqua;
    height: 46px;
}
.btnOneLine{
	line-height: 46px;
}

.type::after, .btnDiv::after {
   content: "";
   display: block;
   clear: both;
}

.bulidContent{
	margin-right: 15px;
}
.btnDiv{
	margin-right: 5px;
}
 </style>
</head>

<body>
<div id="filterBox">
	
	<div id="stayBox">
		<div>
		<label for="staySelect">Itinerary &ensp;</label>
		</div>
				<select id="staySelect" name="stay_num_min" class=""> 
					<option value="1">1 month</option> 
					<option value="2">2 months</option> 
						<option value="3">3 months</option> 
						<option value="4">4 months</option> 
						<option value="5">5 months</option> 
						<option value="6">6 months</option> 
						<option value="7">7 months</option> 
						<option value="8">8 months</option> 
						<option value="9">9 months</option>
						<option value="10">10 months</option> 
						<option value="11">11 months</option> 
						<option value="12" selected>1 year</option> 
						<option value="13">2 years</option> 
				</select>
	
	</div>
	
	
	
	<div id="barBox">
		<div class="barContent">
		  <label for="depositBar">Deposit &ensp;</label>
		  <input type="text" id="depositBar" class="barText" readonly style="border:0; color:#f6931f; font-weight:bold;">
		  <div id="deposit_slider-range" class="slider-range"></div>
		</div>
		<div class="barContent">
		  <label for="monthlyBar">Monthly &ensp; </label>
		  <input type="text" id="monthlyBar" class="barText" readonly style="border:0; color:#f6931f; font-weight:bold;">
		  <div id="monthly_slider-range" class="slider-range"></div>
		</div>
	</div>
	
	<div id="typeBox">
		<div class="bulidContent typeContent">
			<div><label> Bulid Type</label></div>
		 	<div class="btnDiv btnOneLine">Villa</div>
		 	<div class="btnDiv btnOneLine">Goshiwon</div>
		 	<div class="btnDiv">Semi-<br>Officetel</div>
		</div>
		<div class="roomContent typeContent">
			<div><label>Room Type</label></div>
			<div class="btnDiv btnOneLine">Studio</div>
			<div class="btnDiv">Two<br>BedRoom</div>
			<div class="btnDiv">Three+<br>BedRoom</div>
		</div>
	</div>
</div>

<!--  
<div id="headerBox">
		<select id="headerSelect" name="" class=""> 
			<option value="1" selected>Recently Updated </option> 
			<option value="2">Lowest Deposit </option>
			<option value="3">Lowest Monthly rent </option> 
		</select>
	</div>-->
</body>

 