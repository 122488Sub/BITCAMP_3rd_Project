
$(function() {
	if(sessionStorage.getItem("tokenStr") != null){
	    $("#menu_wrap").append("<li class='menu'><a href='javascript:logout()'>Log out</a></li>");
	    $("#menu_wrap").append("<li class='menu'><a href='myPage_go.do?type=profile'>MyPage</a></li>");  
	} else {
		$("#menu_wrap").append("<li class='menu'><a href='login_go.do'>Sign in</a></li>");
	    $("#menu_wrap").append("<li class='menu'><a href='register_go.do'>Register</a></li>"); 
	}
	
});

function logout(){
	sessionStorage.clear();
	location.href = "logout.do";
}