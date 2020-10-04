<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    System.out.println("fname:"+fname);
    System.out.println("lname:"+lname);
%>
Hello <%=fname %> <%=lname %>
</body>
</html>