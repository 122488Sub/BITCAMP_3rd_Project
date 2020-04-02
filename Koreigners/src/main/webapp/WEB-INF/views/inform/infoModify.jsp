<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>summer note</title>

<!-- Site CSS -->
<link rel="stylesheet" href="bootstrap/css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="bootstrap/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="bootstrap/css/custom.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script src="resources/summernote/summernote-bs4.min.css"></script>
<script src="resources/summernote/summernote-bs4.min.js"></script>
<script src="resources/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="resources/summernote/summernote-lite.css">
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Noto+Serif+KR:400,700|Jua|Gamja+Flower|&display=swap" rel="stylesheet">

<script type="text/javascript" src="resources/js/inform/infoModify.js"></script>
</head>
<body>
	
	<form method="post" id="boardInsert">
		<input type="hidden" name="info_mem_id" value="${inform.info_mem_id }">
		<input type="hidden" id="info_select_category" value="${inform.info_category }">
		<input type="hidden" name="info_idx" value="${inform.info_idx }">
		<input type="hidden" id="info_file_name" name="info_file_name" value="${inform.info_file_name }">
		<table>
			<tr>
				<th>
					<span>TITLE </span>
				</th>
				<td>
					<input type="text" name="info_title" style="border-radius: 5px" value="${inform.info_title }">
				</td>
			</tr>
			<tr>
				<th>
					<span>Category </span>
				</th>
				<td>
	
					<select id="info_category" name="info_category" class="">
					    <option value="-----">-----</option>
						<option value="Information">Information</option>
						<option value="Food">Food</option>
						<option value="Travel">Travel</option>
						<option value="Etc">Etc</option>
					</select>
				</td>
			</tr>
			
		</table>
		<textarea id="summernote" name="info_content">${inform.info_content }</textarea>
	</form>
	<button id="article-save">저장하기</button>
	<button id="article-reset">초기화</button>
</body>
</html>