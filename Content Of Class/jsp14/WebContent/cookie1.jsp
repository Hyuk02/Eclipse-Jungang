<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>cookie</title>
</head>
<body>
<%
	//쿠키생성 new Cookie(이름,값);
	Cookie cookie = new Cookie("name",URLEncoder.encode("홍길동"));
	//브라우저로 쿠키 전송 addCookie(쿠키);
    response.addCookie(cookie);
%>
<%=cookie.getName() %> 
     쿠키의 값:<%=URLDecoder.decode(cookie.getValue())%>

</body>
</html>