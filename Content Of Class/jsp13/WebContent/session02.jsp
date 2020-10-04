<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<%
    //getAttribute(속성명)의 리턴타입은 Object.
	String user_id=(String) session.getAttribute("userID");
    String user_pw=(String) session.getAttribute("userPW");
    
    out.print("설정된 세션의 속성값[1]:"+user_id+"<br>");
    out.print("설정된 세션의 속성값[2]:"+user_pw+"<br>");
%>
</body>
</html>