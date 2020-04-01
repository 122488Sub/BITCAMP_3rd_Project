
	$(document).ready(function() {
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '내용',	//placeholder 설정
			  fontNames: ['굴림', '굴림체', '돋움', '돋움체', '궁서', '궁서체', '바탕', '바탕체', '맑은 고딕', 'Do Hyeon', 'Black Han Sans', 'Noto Serif KR', 'Jua', 'Gamja Flower'],
			  fontNamesIgnoreCheck: ['맑은 고딕 Bold', 'Do Hyeon', 'Black Han Sans', 'Noto Serif KR', 'Jua', 'Gamja Flower'],
			  callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadSummernoteImageFile(files,this);
					}
				}
		});
	});
	
	$(document).ready(function() {
		$('#summernote').summernote();
	});
	
	//사진 업로드 (수정 불필요)
	function uploadSummernoteImageFile(file, editor) {
		for (let i = 0; i < file.length; i++) {
			data = new FormData();
			data.append("file", file[i]);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile.do",
				contentType : false,
				processData : false,
				success : function(data) {
	            	//항상 업로드된 파일의 url이 있어야 한다.
	            	console.log(data);
					$(editor).summernote('insertImage', data);
				}
			});
		}
	}
	
	//초기화, 저장
	$(document).ready(function() {
	 
	    $("#article-reset").on("click", function () {
	      $('textarea[name="info_content"]').summernote("code", "");
	    });
	    $('#article-save').on("click", function () {
	    	
	      if(checkInform()){
		      var markupStr = $('textarea[name="info_content"]').summernote('code'); //textarea의 내용 HTML코드로 추출
		      var params = $("#boardInsert").serialize();
		      
		      
		      $("#boardInsert").attr('action',"InfoInsert_process.do").submit();
	      }
	    });
	  });
	function checkInform(){
		if($('input[name=info_title]').val()==''){
			 alert("Plese Checked [Title]");
			 $('input[name=info_title]').focus();
			 return false;
		}
		if($("#info_category  option:selected").val()=='-----'){
			 alert("Plese Checked [Category]");
			 $('#info_category').focus();
			 return false;
		}
		return true;
	}