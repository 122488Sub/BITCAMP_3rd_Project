<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
	//request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
	//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
	String inputYn = request.getParameter("inputYn"); 
	String roadFullAddr = request.getParameter("roadFullAddr"); 
	String roadAddr = request.getParameter("roadAddr"); 
	String jibunAddr = request.getParameter("jibunAddr"); 
	String zipNo = request.getParameter("zipNo"); 
	String addrDetail = request.getParameter("addrDetail"); 
	String admCd    = request.getParameter("admCd");
	String rnMgtSn = request.getParameter("rnMgtSn");
	String bdKdcd  = request.getParameter("bdKdcd");
	String siNm  = request.getParameter("siNm");
	String sggNm  = request.getParameter("sggNm");
	String emdNm  = request.getParameter("emdNm");
	String liNm  = request.getParameter("liNm");
	String rn  = request.getParameter("rn");
	String udrtYn  = request.getParameter("udrtYn");
	String buldMnnm  = request.getParameter("buldMnnm");
	String buldSlno  = request.getParameter("buldSlno");
	String mtYn  = request.getParameter("mtYn");
	String lnbrMnnm  = request.getParameter("lnbrMnnm");
	String lnbrSlno  = request.getParameter("lnbrSlno");
	String korAddr  = request.getParameter("korAddr");
%>
</head>
<script type="text/javascript">
function init(){
	var url = location.href;
	//var confmKey = "devU01TX0FVVEgyMDIwMDIxMTE3NDA0NzEwOTQ1ODQ=";// 영문 승인키
	var confmKey = "devU01TX0FVVEgyMDIwMDIxMTE3NDA0NzEwOTQ1ODQ=";// 영문 승인키
	var resultType = "2"; // 도로명주소 검색결과 화면 출력유형, 1 : 도로명, 2 : 도로명+지번
	var inputYn= "<%=inputYn%>";
	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.resultType.value = resultType;
		
		document.form.action="http://www.juso.go.kr/addrlink/addrEngUrl.do"; // 영문인터넷망
		//document.form.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do"; // 한글인터넷망
		document.form.submit();
	}else{
		window.close();
		opener.jusoCallBack("<%=roadFullAddr%>","<%=roadAddr%>","<%=addrDetail%>" 
				, "<%=jibunAddr%>","<%=zipNo%>", "<%=admCd%>", "<%=rnMgtSn%>"
				, "<%=bdKdcd%>", "<%=siNm%>", "<%=sggNm%>", "<%=emdNm%>", "<%=liNm%>", "<%=rn%>", "<%=udrtYn%>"
				, "<%=buldMnnm%>", "<%=buldSlno%>", "<%=mtYn%>", "<%=lnbrMnnm%>", "<%=lnbrSlno%>", "<%=korAddr%>");
	}
}


</script>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START--> 
		<!-- 
		<input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/>
		 -->
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 END-->
	</form>
</body>
</html>