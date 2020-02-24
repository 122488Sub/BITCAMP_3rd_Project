
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 자바코드를 없애고, 데이터출력은 EL 사용 형태로 변경 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세보기</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>

<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1, h3, p { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: orange; }
	.center { text-align: center; }
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>

<div id="container">
	<h1>글 상세</h1>
	
	<hr>
	<form action="updateInfoBoard.do" method="post">
		<input type="hidden" name="info_idx" value="${infoBoard.info_idx }">
	<table>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="info_title" 
					value="${infoBoard.info_title }">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${infoBoard.info_ins_user }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
			  <textarea class="form-control" id="summernote" name="info_content" placeholder="info_content" maxlength="140" rows="7">${infoBoard.info_content }</textarea>
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>${infoBoard.info_ins_dt }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${infoBoard.info_hit }</td>
		</tr>
		<tr>
			<td colspan="2" class="center">
				<input type="submit" value="글 수정">
			</td>
		</tr>
	</table>
	</form>
	<p>
		<a href="insertInfoBoard.jsp">글등록</a>
		<a href="deleteInfoBoard.do?info_idx=${infoBoard.getInfo_idx() }">글삭제</a>
		<a href="getInfoBoardList.do">글목록</a>
	</p>
</div>
<script type="text/javascript">
    $(document).ready(function() {
      $('#summernote').summernote({
        height: 300,
        minHeight: null,
        maxHeight: null,
        focus: true,
        callbacks: {
          onImageUpload: function(files, editor, welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
              sendFile(files[i], this);
            }
          }
        }
      });
    });
    
    function sendFile(file, el) {
      var form_data = new FormData();
      form_data.append('file', file);
      $.ajax({
        data: form_data,
        type: "POST",
        url: '/image',
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(url) {
          $(el).summernote('editor.insertImage', url);
          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        }
      });
    }
</script>
</body>
</html>








