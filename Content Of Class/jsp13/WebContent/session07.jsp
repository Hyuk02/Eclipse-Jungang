<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<h4>------ 세션 유효 시간 변경 전 -----------</h4>
<%
    //getMaxInactiveInterval() 초단위 
	int time=session.getMaxInactiveInterval()/60;
    out.print("세션 유효 시간:"+time+"분<br>");
%>
<h4>------ 세션 유효 시간 변경 후 -----------</h4>
<%
    //setMaxInactiveInterval(초단위 ) 변경
	session.setMaxInactiveInterval(60*60);
    time=session.getMaxInactiveInterval()/60;
    
    out.print("세션 유효 시간:"+time+"분<br>");
%>
</body>
</html>