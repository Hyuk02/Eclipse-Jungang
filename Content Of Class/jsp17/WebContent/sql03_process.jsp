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
    String passwd=request.getParameter("passwd");
    String name=request.getParameter("name");
%>
<sql:setDataSource
      var="dataSource"
      driver="com.mysql.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/JSPBookDB"
      user="root"
      password="1234"
/>
<%-- 수정처리 --%>
<sql:update dataSource="${dataSource}" var="resultSet">
	update member set name=? where id=? and passwd=?
	<sql:param value="<%=name%>"/>
	<sql:param value="<%=id %>"/>
	<sql:param value="<%=passwd %>"/>
</sql:update>
<%--결과보기 --%>
<c:import url="sql01.jsp" var="url"/>
${url}

</body>
</html>