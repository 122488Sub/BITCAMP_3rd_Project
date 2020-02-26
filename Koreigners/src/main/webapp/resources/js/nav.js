
$(function() {
	if(sessionStorage.getItem("tokenStr") != null){
	    $("#menu_wrap").append("<li class='menu'><a href='javascript:logOut();'>Log out</a></li>");
	    $("#menu_wrap").append("<li class='menu'><a href='javascript:myPage();'>MyPage</a></li>");  
	} else {
		$("#menu_wrap").append("<li class='menu'><a href='login_go.do'>Sign in</a></li>");
	    $("#menu_wrap").append("<li class='menu'><a href='join_go.do'>Register</a></li>"); 
	}
	
});

 function myPage(){
	var frm = document.token;
	
	frm.tokenStr.value = sessionStorage.getItem("tokenStr");
	frm.action = "myPage_go.do";
	frm.method = "post";
	frm.submit();
 }
 
 function logOut(){
	 sessionStorage.clear();
	 
	 var frm = document.logout;
	 frm.action = "login_go.do";
	 frm.method = "post";
	 frm.submit();
 }