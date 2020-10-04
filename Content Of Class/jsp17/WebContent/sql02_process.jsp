<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>jstl sql</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    String passwd=request.getParameter("passwd");
%>
<%-- db저장하기 --%>
<sql:setDataSource var="dataSource" 
      url="jdbc:mysql://localhost:3306/JSPBookDB"
      driver="com.mysql.jdbc.Driver"
      user="root"
      password="1234"/>
      
<%-- 입력처리 --%>
<sql:update dataSource="${dataSource}" var="resultSet">
     insert into member(id,passwd,name) values(?,?,?)
     <sql:param value="<%=id %>"/>
     <sql:param value="<%=passwd %>"/>
     <sql:param value="<%=name %>"/>
</sql:update>

<%--결과 페이지 보이기 --%>
<c:import url="sql01.jsp" var="url"/>
${url}

</body>
</html>