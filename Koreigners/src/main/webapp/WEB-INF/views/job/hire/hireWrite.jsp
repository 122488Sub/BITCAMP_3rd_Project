<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/hire/hireWrite.js"></script>
<script type="text/javascript" src="resources/js/daumAddr.js"></script>

</head>
<body>
<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Post of Search Firm membership</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
    
    
    <!-- Start Recruitment -->
	<form action="hirePost.do" method="post">
	<div class="cart-box-main">
		<div class="container">
			<div class="col-md-8 col-sm-10 col-xs-12" style="float:none; margin:0 auto">
				<div class="title-left">
	            	<h3>채용 공고 등록</h3>
	            </div>
	            	<input type="text" name="title" class="col-md-12 form-control" placeholder="제목">
				<hr class="mb-4">
				<div class="col-md-12 mb-3">
					<div class="row">
						<div class="col-md-3">
							<label class="font-weight-bold">근무 형태</label>
						</div>
						<div class="custom-control custom-radio col-md-3">
							<input type="radio" name="work_type" id="work_type0" class="custom-control-input" value="정규직">
							<label class="custom-control-label" for="work_type0">정규직</label>
						</div>
						<div class="custom-control custom-radio col-md-3">
							<input type="radio" name="work_type" id="work_type1" class="custom-control-input" value="계약직">
							<label class="custom-control-label" for="work_type1">계약직</label>
						</div>
						<div class="custom-control custom-radio col-md-3">
							<input type="radio" name="work_type" id="work_type2" class="custom-control-input" value="아르바이트">
							<label class="custom-control-label" for="work_type2">아르바이트</label>
						</div>
					</div>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<div class="row">
						<div class="col-md-2">
							<label class="font-weight-bold">채용 직종</label>
						</div>
						<div class="col-md-10">
							<div class="row">
								<div class="col-md-6">
									<select name="cate_prnt_ko" id="selectBox1" class="custom-select-box form-control">
										<c:forEach items="${jobWriteCate}" var="option">
											<option class="${option.key}">${option.value}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-6">	
									<select name="cate_child_ko" id="cate_child_ko" class="custom-select-box form-control">
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<div class="row">
						<div class="col-md-2">
							<label class="font-weight-bold">근무 시간</label>
						</div>
						<div class="col-md-10">
							<input type="text" id="work_time" class="form-control" name="work_time" placeholder="숫자만 입력해 주세요">
						</div>
					</div>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<label class="font-weight-bold">임금 조건</label>
					<div class="row">
						<div class="col-md-6">
								<div class="custom-control custom-radio">
									<input type="radio" name="payment_codition" id="hour" class="custom-control-input" value="hour">
									<label class="custom-control-label" for="hour">시급</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" name="payment_codition" id="day" class="custom-control-input" value="day">
									<label class="custom-control-label" for="day">일당</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" name="payment_codition" id="month" class="custom-control-input" value="month">
									<label class="custom-control-label" for="month">월급</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" name="payment_codition" id="year" class="custom-control-input" value="year">
									<label class="custom-control-label" for="year">연봉</label>
								</div>
								<div class="custom-control custom-radio">
									<input type="radio" name="payment_codition" id="companyLaw" class="custom-control-input" value="companyLaw">
									<label class="custom-control-label" for="companyLaw">회사 내규에 따름</label>
								</div>
						</div>
						<div class="col-md-6">
							<div class="col-md-12 mb-4">
								<div class="row">
									<label class="font-weight-bold">임금 상세 조건</label>
									<input type="text" class="form-control" name="payment_detail" placeholder="자세한 사항 입력( 예)면접 후 재조정 가능 )">
								</div>
							</div>
							<div class="row">
								<div class="col-md-5">
									<input type="text" class="form-control" name="salary_min" placeholder="임금 최저">
								</div>
								<div>-</div>
								<div class="col-md-5">
									<input type="text" class="form-control" name="salary_max" placeholder="임금 최고">
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<div class="row">
						<div class="col-md-6">
							<div class="col-md-5" style="padding:0px">
								<label class="font-weight-bold">채용 인원</label>
								<input type="text" class="form-control" name="hire_number">
							</div>
						</div>
						<div class="col-md-6">
							<label class="font-weight-bold">채용 연령</label>
							<div class="row">
								<div class="col-md-5">
									<input type="text" class="form-control" name="hire_age_min" placeholder="최소">
								</div>
								<div>-</div>
								<div class="col-md-5">
									<input type="text" class="form-control" name="hire_age_max" placeholder="최고 ">
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<div class="row">
						<div class="col-md-6">
							<label class="font-weight-bold">학력</label>
							<input type="text" class="form-control" name="education">
						</div>
						<div class="col-md-6">
							<label class="font-weight-bold">전공</label>
							<input type="text" class="form-control" name="major">
						</div>
					</div>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<div class="row">
						<div class="col-md-2">
							<label class="font-weight-bold">경력</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control" name="experience">
						</div>
					</div>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<div class="row">
						<div class="col-md-2">
							<label class="font-weight-bold">외국어</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control" name="foreign_language">
						</div>
					</div>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<div class="row">
						<div class="col-md-2">
							<label class="font-weight-bold">기타 우대 능력</label>
						</div>
						<div class="col-md-10">
							<input type="text" class="form-control" name="prefer_skills">
						</div>
					</div>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<label class="font-weight-bold">기숙사 제공 유무</label>
						<div class="custom-control custom-radio">
							<input type="radio" name="domitory" id="domitory0" class="custom-control-input" value="offer">
							<label class="custom-control-label" for="domitory0">기숙사 제공 함</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" name="domitory" id="domitory1" class="custom-control-input" value="do not offer">
							<label class="custom-control-label" for="domitory1">기숙사 제공 하지 않음</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" name="domitory" id="domitory2" class="custom-control-input" value="negotiation">
							<label class="custom-control-label" for="domitory2">회사 내규에 따름(협의)</label>
						</div>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<label class="font-weight-bold">식사 제공 여부</label>
						<div class="custom-control custom-radio">
							<input type="radio" name="meals" id="meals0" class="custom-control-input" value="do not offer">
							<label class="custom-control-label" for="meals0">제공 안함</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" name="meals" id="meals1" class="custom-control-input" value="lunch">
							<label class="custom-control-label" for="meals1">중식 제공</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" name="meals" id="meals2" class="custom-control-input" value="lunch & dinner">
							<label class="custom-control-label" for="meals2">2식 제공</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" name="meals" id="meals3" class="custom-control-input" value="breakfast & lunch & dinner">
							<label class="custom-control-label" for="meals3">3식제공</label>
						</div>
						<div class="custom-control custom-radio">
							<input type="radio" name="meals" id="meals4" class="custom-control-input" value="negotiation">
							<label class="custom-control-label" for="meals4">회사 내규에 따름(협의)</label>
						</div>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<label class="font-weight-bold">4대 보험</label>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" name="insuranceInfo" id="insuranceInfo0" class="custom-control-input" value="National Health Insurance">
							<label class="custom-control-label" for="insuranceInfo0">의료보험</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" name="insuranceInfo" id="insuranceInfo1" class="custom-control-input" value="Industrial accident Insurance">
							<label class="custom-control-label" for="insuranceInfo1">산재보험</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" name="insuranceInfo" id="insuranceInfo2" class="custom-control-input" value="Employment Insurance">
							<label class="custom-control-label" for="insuranceInfo2">고용보험</label>
						</div>
						<div class="custom-control custom-checkbox">
							<input type="checkbox" name="insuranceInfo" id="insuranceInfo3" class="custom-control-input" value="Welfare Insurance">
							<label class="custom-control-label" for="insuranceInfo3">국민연금보험</label>
						</div>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<label class="font-weight-bold">직무 내용</label>
					<textarea name="work_detail" class="form-control col-md-12" id="introduce"></textarea>
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<label class="font-weight-bold">지원 방법(전형 방법)</label>
					<input type="text" class="form-control" name="apply_way">
				</div>
				<hr>
				<div class="col-md-12 mb-3">
					<label class="font-weight-bold">제출 서류 / 준비물</label>
					<input type="text" class="form-control" name="prepare_doc">
				</div>
				<div class="col-md-12 mb-3">
					<div class="title-left">
		            	<h3 class="font-weight-bold">근무 지역</h3>
		            </div>
		            <div class="bg-light">
			            <div class="col-md-10">
				            <div class="mb-1">
					            <label>한글 주소</label>
					            <div class="row">
					            	<div class="col-md-9">
							            <input type="text" id="address" class="form-control" name="address" value="">
					            	</div>
					            	<div class="col-md-3">
										<input type="button"onclick="sample6_execDaumPostcode()" value="주소 찾기">
					            	</div>
					            </div>
				            </div>
			            </div>
			            <div class="col-md-10">
				            <div class="mb-1">
				            	<label>한글 상세 주소</label>
				            	<input type="text" id="addr_dt_kor" class="form-control" name="addr_dt_kor" value="">
				            </div>
				            <div class="mb-1">
				            	<label>영문 주소</label>
				            	<input type="text" id="address_en" class="form-control" name="address_en" value="">
				            </div>
				            <div class="mb-1">
				            	<label>영문 상세 주소</label>
				            	<input type="text" id="addr_dt_en" class="form-control" name="addr_dt_en" value="">
				            </div>
			            </div>
		            </div>
				</div>
			</div>
		</div>
	</div>    
    <!-- End Recruitment -->
    
    <div style="height:100px;float:none; margin:0 auto; text-align:center">
		<button type="submit" class="btn hvr-hover">채용공고등록</button>
		<input type="hidden" id="do_kor" class="input_box" name="do_kor" style="width: 10%;" value="" placeholder="상세주소">
	    <input type="hidden" id="gu_gun_eup_kor" class="input_box" name="gu_gun_eup_kor" style="width: 10%;" value="" placeholder="상세주소">
	    <input type="hidden" id="do_en" class="input_box" name="do_en" style="width: 10%;" value="" placeholder="상세주소">
	    <input type="hidden" id="gu_gun_eup_en" class="input_box" name="gu_gun_eup_eng" style="width: 10%;" value="" placeholder="상세주소">
	</div>
	
</form>
	
</body>
</html>