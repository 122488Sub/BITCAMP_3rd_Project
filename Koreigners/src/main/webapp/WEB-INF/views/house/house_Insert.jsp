<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<style>
	
	#container {
		width: 90%;
		margin: 0 auto;
		color: black;
	}
	
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse;
			margin: 0 auto;
			width:100%;
	 }
	table, th, td {
		border: 1px solid black;
		margin: 10px auto;
	}
	td {
		text-align: left;
		padding-left: 15px;
		padding-right: 15px;
	}
	#mapDisp{
		
		width: 100%;
		height: 250px;
		margin: 0 auto;
		margin-bottom: 5px;
	}
	.td_div {
		margin-top: 5px;
		margin-bottom: 5px;
	}
	th { background-color: orange; width:10%; }

	.td_option{
		width:18%;
	}
	
}
	
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!-- jQuery 기본 js파일-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<!--  jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
<script type="text/javascript" src="resources/js/house/houseInsert.js"></script>

</head>
<body>
	
	<div id="container">
	
	<form action="" id="form" name="form" method="post" enctype="multipart/form-data">
	<input type="hidden" name="mem_email">
	<h1>House Info</h1>
	<hr>
	
	<table>
		<tr>
			<th> TITLE</th>
			<td colspan="3">
				<div class="td_div">
					<input type="text" name="subject" size="30">
				</div>
			</td>
		</tr>
		<tr>
			<th>Buliding Type</th>
			<td style="width:40%">
				<div class="td_div">
					<input type="radio"  value="0" name="build_type"> villa
					<input type="radio"  value="1" name="build_type" style="margin-left: 15px"> Goshiwon
					<input type="radio"  value="2" name="build_type" style="margin-left: 15px"> Semi-Officetel
				</div>
			</td>
			<th>Room Type</th>
			<td style="width:40%">
				<div class="td_div">
					<input type="radio"  value="0" name="room_type"> Studio
					<input type="radio"  value="1" name="room_type" style="margin-left: 15px"> Two BedRoom
					<input type="radio"  value="2" name="room_type" style="margin-left: 15px"> Three+ BedRoom
				</div>
			</td>
		</tr>	
		<tr>
			<th>Loctation</th>
			<td colspan="3">
				<div class="td_div">
					<label style="width:30%">RoadAddress:</label>
					<input type="text" id="roadAddr" name="address" readonly="readonly" style="width:60%;  margin-left: 5px;"> 
					<input type="button"  value="Search" onclick="goPopup();" style="width:10%">
				</div>
				<div class="td_div">
					<label style="width:30%">DetailAddress:</label>
					<input type="text" 	 id="addrDetail" name="address_detail" readonly="readonly" style="width:71%;"> 
				</div>
				<input type="hidden" id="siNm" 		 name="do_en" 		   title="주소" value="">
				<input type="hidden" id="sggNm" 	 name="gu_gun_eup_eng" title="주소" value="">
				<div id="mapDisp" style="border: 1px solid black;"></div>
			</td>
		</tr>
		<tr>
			<th>Area</th>
			<td style="width:40%">
				<div class="td_div">
					<label style="width:70%">Square Meter: </label>
					<input type="number" id="" name="room_area" style="width:30%; " step="1" min="1" value='0'>
				</div>
			</td>
			<th>Floor</th>
			<td style="width:40%">
				<div class="td_div">
					<label style="width:20%">Buliding: </label>
					<input type="number" id="" name="bulid_layers" style="width:30%; " step="1" min="1" value='0'>
					<label style="width:20%; margin-left: 10px;">Floor: </label>
					<input type="number" id="" name="floor_layers" style="width:30%; " step="1" min="-3" value='0'>
				</div>
				<div class="td_div">
					
				</div>
				<div class="td_div">
					<input type="radio"  value="0" name="floor_type" checked="checked"> Nomal
					<input type="radio"  value="1" name="floor_type" style="margin-left: 15px"> RoofTops
					<input type="radio"  value="2" name="floor_type" style="margin-left: 15px"> Semi-basement
				</div>
			</td>
		</tr>
		<tr>
			<th>Available Days</th>
			<td>
				<div class="td_div">
					<input type="radio"  value="0" name="radio_available_date"> Immediately
				</div>
				<div class="td_div">
					<input type="radio"  id="radio_available_date_After" value="1" name="radio_available_date"> After this
					<input type="text" id="datepicker" readonly="readonly">
					
				</div>
				<input type="hidden" id="current_date" name="current_date">
				<input type="hidden" id="available_date" name="available_date">
				
			</td>
			<th>Itinerary</th>
			<td>
				<div class="td_div">
					<select name="stay_num_min" class=""> 
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
						<option value="13">2 years</option> </select>
				</div>
				
				
			</td>
		</tr>
		
	</table>
	<!-- ------------------------------------------------------------------------------------------------------------------- -->
	<h1>Transaction Information</h1>
	<hr>
	<table>
		<tr>
			<th>Pricing<br>Information</th>
			<td colspan="3">
				<div class="td_div">
					Deposit <input type="text" id="deposit" class="" name="deposit" size="30" onkeyup="inputNumberAutoComma(this)" value='0' ><br>
					Monthly rent <input type="text" id="monthly_rent"class=" " name="monthly_rent" size="30" onkeyup="inputNumberAutoComma(this)" value='0'><br>
					Management expense <input type="text" id="text_management_expense" class=" " name="text_management_expense" size="30" onkeyup="inputNumberAutoComma(this)" > 
					<input type="checkbox" value="0" name="chk_management_expense">none<br>
					<input type="hidden" id="management_expense" name="management_expense">
				</div>
			</td>
		</tr>
	</table>	
	
	<!-- ------------------------------------------------------------------------------------------------------------------- -->
	<h1>Facilities information</h1>
	<hr>
	<table>
		<tr>
			<th>Cooling and Heating</th>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="air_conditioner" value="1"> Air conditioner</td>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="heating" value="1"> Heater</td>
			<td colspan="3"></td>
		
		</tr>
		<tr >
			<th rowspan="2">Living facility</th>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="closet" value="1"> Closet</td>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="desk" value="1"> Desk</td>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="chair" value="1"> Chair</td>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="bad_type" value="1"> bed</td>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="refrigerator" value="1"> Refrigerator</td>
		
		</tr>
		<tr>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="laundry" value="1"> Laundry </td>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="kitchen_stove" value="1"> Kitchen_stove</td>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="sink" value="1"> Sink</td>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="bathroom" value="1" > Bathroom</td>
			<td> </td>
		
			
		</tr>
		<tr>
			<th>Ohter</th>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="internet" value="1"> Internet</td>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="wifi" value="1"> Wifi</td>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="elevator" value="1"> Elevator</td>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="pet" value="1"> Pet</td>
			<td class="td_option"> <input type="checkbox" class="chk_option" name="parking" value="1"> Parking</td>
		</tr>
	</table>	
	
	<h1>Room Image</h1>
	<hr>
	<table>
		<tr>
			<th>업로드</th>
			<td>
				<div class="td_div">
					<input type="file" id="file" name="file" multiple>
				</div>
			</td>
		</tr>
	</table>
	<div class="td_div">
		<input type="button" value="새글 등록" onclick="insertForm();">
	</div>
	</form>
	<p><a href="house_main.do ">글 목록 가기</a></p>
</div>

</body>
</html>











