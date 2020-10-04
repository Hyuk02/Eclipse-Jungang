<%@page import="java.util.Arrays"%><%@page import="dto.Member"%>
<%@page import="dao.MemberRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 MemberRepository memberReposi
   =(MemberRepository)session.getAttribute("memberRepository");
%>
<% Member member=memberReposi.getMember("hong");%>
<%=member.getIdname() %><br>
<%=member.getMyname() %><br>
<%=Arrays.toString(member.getHobbies()) %><br>
</body>
</html>