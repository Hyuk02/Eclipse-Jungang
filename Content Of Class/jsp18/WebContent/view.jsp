<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view.jsp</title>
</head>
<body>
<%
	String msg=(String)request.getAttribute("message");
%>
루트의 뷰<%=msg%>
</body>
</html>