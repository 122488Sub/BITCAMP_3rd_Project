<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>summer note</title>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script src="resources/summernote/summernote-bs4.min.css"></script>
<script src="resources/summernote/summernote-bs4.min.js"></script>
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="resources/summernote/summernote-lite.css">
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Noto+Serif+KR:400,700|Jua|Gamja+Flower|&display=swap" rel="stylesheet">

<script type="text/javascript" src="resources/js/inform/infoInsert.js"></script>
<style>
	.center {
		float:none;
		margin: 0 auto;	
	}
</style>
</head>
<body>

<br><br><br>
	<!-- Start All Title Box -->
    <div class="all-title-box">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Post an Info</h2>
                </div>
            </div>
        </div>
    </div>
    <!-- End All Title Box -->
	
	<div class="cart-box-main">
		<div class="container">
			<div class="col-md-8 col-sm-10 col-xs-12 center">
				<div class="mb-5">
					<form method="post" id="boardInsert">
					<input type="hidden" id="info_file_name" name="info_file_name" value="">
						<table class="table">
							<tr>
								<th>
									<span>Title </span>
								</th>
								<td>
									<input type="text" name="info_title" class="form-control">
								</td>
							</tr>
							<tr>
								<th>
									<span>Category </span>
								</th>
								<td>
					
									<select id="info_category" name="info_category" class="col-md-4 form-control">
									    <option value="-----">-----</option>
										<option value="Information">Information</option>
										<option value="Food">Food</option>
										<option value="Travel">Travel</option>
										<option value="Etc">etc</option>
									</select>
								</td>
							</tr>
							
						</table>
						<textarea id="summernote" name="info_content"></textarea>
					</form>
				</div>
				<div style="text-align:center">
					<button id="article-save" class="btn hvr-hover">Upload</button>
					<button id="article-reset" class="btn hvr-hover">Reset</button>
				</div>
			</div>
		</div>	
	</div>
</body>
</html>