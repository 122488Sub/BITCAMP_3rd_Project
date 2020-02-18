	
	
	function idDoubleCheck() {
		var id = $('#regForm [name="email"]').val()
		if(id == "") {
			alert("중복확인 에러 : 아이디를 입력하세요");
			return;
		}
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if(!regExp.test(id)){
			alert("잘못된 아이디입니다!\n아이디는 이메일의 양식으로 입력하세요")
			return;
		}
		console.log("id : " + id);
		location.href ="LoginController?type=idCheck&id="+id;
	}
	
	function uploadId(idIs, ok){
		
		if(idIs == false && ok == '0') {
			alert("사용가능한 아이디입니다.");
			
			return;
		
		} else if (idIs == true && ok == '2'){
			alert("사용중인 아이디입니다. \n 다시 아이디를 입력해주세요");
			session.invalidate();

			//document.email.value = id;
		}else if (idIs == false && ok == '1'){
			session.invalidate();
			
			//document.email.value = id;
		}
		
		
	}
	
	function signInClick() {
		var firstForm = document.forms[0];
		console.log("firstForm : " + firstForm);
		console.log("firstForm.elements.length : " + firstForm.elements.length);
		for (var i=0; i < firstForm.elements.length; i++) {
			if(firstForm.elements[i].value.trim() == "") {
				console.log("firstForm.elements[i].outerText : " + firstForm.elements[i].outerText);
				console.log("firstForm.elements[i] : " + i);
				alert(firstForm.elements[i].title + "을 입력하세요");
				firstForm.elements[i].focus();
				return;
			}
		}
		var id = $('#regForm [name="email"]').val();
		var name = $('#regForm [name="name"]').val();
		var phone = $('#regForm [name="phone"]').val();
		var password = $('#regForm [name="password"]').val();
		var password_conform= $('#regForm [name="password_conform"]').val();
		
		
		// 아이디(이메일) 체크 정규식
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if(!regExp.test(id)){
			
			alert(id+"잘못된 아이디입니다!\n아이디는 이메일의 양식으로 입력하세요");
			return;
		}
		
		// 이름 체크
		var nameKor=true;
		var nameEng=true;
		
		//한국어 정규식
		regExp = /^[가-힣]+$/;
		if(!regExp.test(name)){
			nameKor=false;
		}
		//영어 정규식
		regExp = /^[a-zA-Z]+$/;
		if(!regExp.test(name)){
			nameEng=false;
		}
		if( !((nameKor||nameEng) && name.length<=10) ){
			alert("잘못된 이름입니다.\n영문 혹은 한글만 10자이내로 입력해주세요");
		}
		
		// 휴대전화 체크
		regExp = /^01([0|1|6|7|8|9]?)?([0-9]{8})$/;
		if( !regExp.test(phone)){
			
			alert("휴대폰번호는 숫자만 입력해주세요.\nex 01012345678");
			return;
		}
		if(phone.length!=11){
			alert("휴대폰번호 자릿수를 지켜주세요.\nex) 01012345678");
			return;
		}
	
		//비밀번호 체크
		regExp = /(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,20}).{10,20}$/
		if(password!=password_conform){
			alert("비밀번호가 서로 다릅니다. 다시한번 확인해주세요.");
			return;
		}
		if( !regExp.test(password)){
			
			alert("비밀번호는 10자리이상 20자리이하의\n영문자+숫자+특수문자 조합으로  입력해주세요.");
			return;
		}
		
		firstForm.submit();
	}
	
// 새로고침 금지
	function noRefresh()
	{
	    if (event.keyCode == 116) 
	    {
	        alert("새로고침을 할 수 없습니다.");
	        event.keyCode = 2;
	        return false;
	    } 
	    else if(event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)) 
	    {
	        return false;
	    }
	}
	document.onkeydown = noRefresh;