<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>session</title>
</head>
<body>
<h4>----- 세션삭제 전 -------------</h4>
<% 
    String name;
    String value;
    
    Enumeration en=session.getAttributeNames();
    int i=0;
    
    while(en.hasMoreElements()){
      i++;
      name=en.nextElement().toString();
      value=session.getAttribute(name).toString();
      out.print("설정된 세션이름["+i+"]:"+name+"<br>");
      out.print("설정된 세션값["+i+"]:"+value+"<br>");
    }
    
    //세션에서 속성제거
    session.removeAttribute("userID");
%>

<h4>----- 세션삭제 후 -------------</h4>
<%
    i=0;
   //소모성 객체인 enumeration에 다시 값 저장
   //반복자는 값을 저장하고 있지않음.
   en=session.getAttributeNames();
   
 while(en.hasMoreElements()){
  i++;
  name=en.nextElement().toString();
  value=session.getAttribute(name).toString();
  out.print("설정된 세션이름["+i+"]:"+name+"<br>");
  out.print("설정된 세션값["+i+"]:"+value+"<br>");
}
%>
</body>
</html>