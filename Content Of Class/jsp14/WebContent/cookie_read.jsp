<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Cookie</title>
</head>
<body>
<%
    //요청객체(request)로 전달되는 쿠키 정보 얻기
	Cookie[] cookies=request.getCookies();
    if(cookies!=null && cookies.length>0){
     	for(int i=0;i<cookies.length;i++){
    %>		
    <%=cookies[i].getName() %> = 
          <%=URLDecoder.decode(cookies[i].getValue()) %> <br> 		
<% }
   }
    else if((cookies!=null && cookies.length < 2)
    		  && cookies[0].getName().equals("JSESSIONID")){
%>
쿠키가 존재하지 않습니다.
<%} %>
</body>
</html>