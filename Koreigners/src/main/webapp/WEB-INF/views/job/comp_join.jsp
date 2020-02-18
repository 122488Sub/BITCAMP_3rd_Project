<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>


	var cate_kor = "";
	var si_kor = "";
	$(function(){
		
		//카테고리 세션박스 변경 시 하위 카테고리 select ajax
		$("#selectBox1").change(function(){
			console.log("바뀜");
			var selectBox1 = document.getElementById("selectBox1");
			console.log(this.value);
			cate_kor = this.value;
			
			$.ajax("getCateJson.do", {
				type: "get",
				dataType : "json",
				data: {"cate_kor" : cate_kor},
				success : function(data){
					alert("성공 ~~ data : " + data);
					
					var strData = JSON.stringify(data);
					console.log("strData : " + strData);
					
					var jsData = JSON.parse(strData); //자바 스크립트 데이터로 형 변환
					console.log("jsData : " + jsData);
					
					
					var dataTag = "";
					$.each(data, function(index, obj){
						dataTag += "<option value=" + this.cate_child_ko +">"
						dataTag += this.cate_child_ko;
						dataTag += "</option>";
					});
					
		
					$("#cate_child").html(dataTag);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("Ajax 처리 실패 : \n" +
						  "jqXHR.readyState : " + jqXHR.readyState + "\n" +
						  "textStatus : " + textStatus + "\n" +
						  "errorThrown : " + errorThrown);
				}
			});	
		});
		
		//지역 도 세션박스 변경 시 하위 카테고리 select ajax
		$("#do_kor").change(function(){
			console.log("바뀜");
			var selectBox1 = document.getElementById("gu_gun_eup_kor");
			console.log(this.value);
			si_kor = this.value;
			
			$.ajax("getSiJson.do", {
				type: "get",
				dataType : "json",
				data: {"si_kor" : si_kor},
				success : function(data){
					alert("성공 ~~ data : " + data);
					
					var strData = JSON.stringify(data);
					console.log("strData : " + strData);
					
					var jsData = JSON.parse(strData); //자바 스크립트 데이터로 형 변환
					console.log("jsData : " + jsData);
					
					var dataTag = "";
					$.each(data, function(index, obj){
						dataTag += "<option value=" + this.gu_gun_eup_kor +">"
						dataTag += this.gu_gun_eup_kor;
						dataTag += "</option>";
					});
		
					$("#gu_gun_eup_kor").html(dataTag);
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert("Ajax 처리 실패 : \n" +
						  "jqXHR.readyState : " + jqXHR.readyState + "\n" +
						  "textStatus : " + textStatus + "\n" +
						  "errorThrown : " + errorThrown);
				}
			});	
		});
		
	});
</script>
</head>


<body>
	<!-- private int COMPANY_IDX, EMPLOYEE_NUM; 
	private int company_idx, employee_num; 
	private String , , , company_cate, , 
	               , , address, , business_img, 
	               , domitory, meals, , ip, manager_email;  
	private Date regdate;
	 -->
	<form action="#" method="post">
	
		<label>아이디 : </label><input type="text" name="mem_id"><br>
		<label>비밀번호 : </label><input type="text" name="password"><br>
		<label>비밀번호 확인 : </label><input type="text" name="conf_password"><br>
		<label>회사명 : </label><input type="text" name="company_name"><br>
		<label>대표자명 : </label><input type="text" name="ceo_name"><br>
		
		<label>주소 : </label><input type="text" name="address"><br>
		
		<label>직종선택 : </label>
		<select name="company_cate" id="selectBox1">
			<c:forEach items="${jobCateMap}" var="option">
				<option class="${option.key}">${option.value}</option>
			</c:forEach>
		</select>
		
		<select name="cate_child" id="cate_child">
		</select><br>
		
		
		<label>지역 : </label>
		<select name="do_kor" id="do_kor">
			<c:forEach items="${addrDoMap}" var="do_kor">
				<option class="${do_kor.key}">${do_kor.value}</option>
			</c:forEach>
		</select>
		
		<select name="gu_gun_eup_kor" id="gu_gun_eup_kor">
		</select><br>
		
		
		<label>지역 : </label><input type="text" name="business_num"><br>
		
		<label>인사담당자 : </label><input type="text" name="hr_manager"><br>
		
		<label>대표전화 : </label><input type="text" name="company_telephone"><br>
		
		<label>사업내용 : </label><input type="text" name="business_info"><br>
		
		<label>기숙사제공유무 : </label><input type="text" name="business_info"><br>
		
		
		
		<input type="submit" value="회원가입">
	</form>

</body>
</html>