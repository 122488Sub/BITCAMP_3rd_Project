function deleteCookie(name) {
	//document.cookie = createCookie(name,"",-1);
	  var expireDate = new Date();
	  
	  //어제 날짜를 쿠키 소멸 날짜로 설정한다.
	  expireDate.setDate( expireDate.getDate() - 1 );
	  document.cookie = name + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
}
function logout(){
	sessionStorage.clear();
	console.log("user토큰  :  " + document.cookie);
	deleteCookie("autoCookie");
	deleteCookie("userToken");
	location.href = "logout.do";
	
}


function postAd(postType, mem_cate) {
	console.log("postType : " + postType);
	
	if(postType == 'hire') {
		if(mem_cate == 'c') {
			location.href = "hireWrite_go.do";			
		} else if(mem_cate == 'p') {
			location.href = "myPage_go.do?type=resume";
		} else {
			location.href = "login_go.do";
		}
	}
		
	if(postType == 'house') {
		location.href = "house_insert.do";
	}
	
	if(postType == 'resale') {
		location.href = "resale_go.do";
	}
	
	if(postType == 'main') {
		location.href = "post.do";
	}
	
	
}
