<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id =request.getParameter("id");
    String pwd=request.getParameter("pwd");
    if(id.equals("hong") & pwd.equals("1234")){
%>
Hello id<님> 환영합니다.
<%}else{ %>
id와 비번을 확인하세요.
<%} %>
</body>
</html>