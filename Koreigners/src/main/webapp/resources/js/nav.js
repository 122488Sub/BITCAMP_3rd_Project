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


function postAd(obj) {
	console.log("postType : " + obj);
	
	if(obj == 'job') {
		location.href = "";
	}
	
	if(obj == 'house') {
		location.href = "house_insert.do";
	}
	
	if(obj == 'resale') {
		location.href = "resale_go.do";
	}
	
	if(obj == 'main') {
		location.href = "post.do";
	}
	
	
}
