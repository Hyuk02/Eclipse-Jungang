<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
	String id=request.getParameter("idname");
    String pwd=request.getParameter("pw");
    String name=request.getParameter("myname");
    String phone1=request.getParameter("phone1");
    String phone2=request.getParameter("phone2");
    String phone3=request.getParameter("phone3");
    String gender=request.getParameter("dgener");
    String[] hobbies=request.getParameterValues("hobbies");
    String comment=request.getParameter("comment");
%>
<%=id %><br>
<%=pwd %><br>
<%=name %><br>
<%=phone1 %>-<%=phone2 %>-<%=phone3 %><br>
<%=gender.equals("yes")?"남":"여" %><br>
<%=Arrays.toString(hobbies) %><br>
<%=comment %><br>
<!-- 액션태그를 이용한 bean생성 -->
<jsp:useBean id="memberRepository" 
             class="dao.MemberRepository"
             scope="session"/>
<jsp:useBean id="member" class="dto.Member" scope="page"/>
<!-- 속성 값 설정 -->
<%-- <jsp:setProperty property="idname" name="member"/><br>
<jsp:setProperty property="pw" name="member"/><br>
<jsp:setProperty property="myname" name="member"/><br>
<jsp:setProperty property="phone1" name="member"/><br>
<jsp:setProperty property="phone2" name="member"/><br>
<jsp:setProperty property="phone3" name="member"/><br>
<jsp:setProperty property="gender" name="member"/><br>
<jsp:setProperty property="hobbies" name="member" param="hobby"/><br>
<jsp:setProperty property="comment" name="member"/><br> --%>
<jsp:setProperty property="*" name="member"/>

<!-- 속성 값 출력 -->
<jsp:getProperty property="idname" name="member"/><br>
<jsp:getProperty property="pw" name="member"/><br>
<jsp:getProperty property="myname" name="member"/><br>
<jsp:getProperty property="phone1" name="member"/><br>
<jsp:getProperty property="phone2" name="member"/><br>
<jsp:getProperty property="phone3" name="member"/><br>
<jsp:getProperty property="gender" name="member"/><br>
<jsp:getProperty property="hobbies" name="member"/><br>
<jsp:getProperty property="comment" name="member"/><br>
<%
hobbies = member.getHobbies();
  for(int i=0;i<hobbies.length;i++)
	  out.print(hobbies[i]+",");
%>
<%=Arrays.toString(hobbies)%><br>
<%=Arrays.toString(member.getHobbies()) %><br>
<%
	memberRepository.addMember(member);
%>
<jsp:forward page="nextPage.jsp"/>
</body>
</html>