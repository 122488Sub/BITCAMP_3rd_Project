<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<head>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/house/houseOption.css"> 

 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script type="text/javascript" src="resources/js/house/houseOption.js"></script>
</head>

<body>
<div id="filterBox">
	
	<div id="stayBox">
		<div>
		<label for="staySelect">Itinerary &ensp;</label>
		</div>
				<select id="staySelect" name="stay_num_min" class=""> 
					<option value="1" selected>1 month</option> 
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
						<option value="12" >1 year</option> 
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
		 	<div class="btnDiv buildBtn no-drag btnOneLine">Villa</div>
		 	<div class="btnDiv buildBtn no-drag btnOneLine">Goshiwon</div>
		 	<div class="btnDiv buildBtn no-drag btnOneLine">Semi-Office</div>
		</div>
		<div class="roomContent typeContent">
			<div><label>Room Type</label></div>
			<div class="btnDiv roomBtn no-drag btnOneLine" >Studio</div>
			<div class="btnDiv roomBtn no-drag btnOneLine">Two</div>
			<div class="btnDiv roomBtn no-drag btnOneLine">Three+</div>
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

 