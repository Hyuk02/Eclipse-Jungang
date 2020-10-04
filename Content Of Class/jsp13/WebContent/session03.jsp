<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<%
	String name;
    String value;
    //session에 저장된 객체들의 이름얻기
    Enumeration en = session.getAttributeNames();

    int i=0;
    while(en.hasMoreElements()){
    	i++;
    	name=en.nextElement().toString();
    	value=session.getAttribute(name).toString();
    	out.print("설정된 세션의 속성이름["+i+"]:"+name+"<br>");
    	out.print("설정된 세션의 속성 값["+i+"]:"+value+"<br><br>");
    }    
%>

</body>
</html>