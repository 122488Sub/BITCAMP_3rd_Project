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
//	document.cookie = 'userToken=;';
	deleteCookie("userToken");
	console.log("user토큰  :  " + document.cookie);
	location.href = "logout.do";
	
}



$(function(){
	
	if(sessionStorage.getItem("tokenStr") != null){
	    $("#menu_wrap").append("<li class='menu'><a href='javascript:logout()'>Log out</a></li>");
	    $("#menu_wrap").append("<li class='menu'><a href='myPage_go.do?type=profile'>MyPage</a></li>");  
	} else {
		$("#menu_wrap").append("<li class='menu'><a href='login_go.do'>Sign in</a></li>");
	    $("#menu_wrap").append("<li class='menu'><a href='register_go.do'>Register</a></li>"); 
	}
	
	
});