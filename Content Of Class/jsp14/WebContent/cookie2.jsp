<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
<%
    //쿠키 얻기
	Cookie[] cookies = request.getCookies();
    //얻은 쿠키들 중에서 
    if(cookies!=null && cookies.length>0){
    	for(int i=0;i<cookies.length;i++){
    		//쿠키이름이 동일한 쿠키가 존재하면 동일한 이름으로
    		if(cookies[i].getName().equals("name")){
    			//값을 변경할 값으로 쿠키 생성
    			Cookie cookie 
    			  = new Cookie("name",URLEncoder.encode("일지매"));
    			//응답객체에 실어서 클라이언트로 보냄
                response.addCookie(cookie);
    		}
    	}
    }
%>

</body>
</html>