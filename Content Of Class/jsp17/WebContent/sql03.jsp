<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>jstl sql</title>
</head>
<%
	String id=request.getParameter("id");
%>
<%-- 한건을 db에서 가져와서 form에 출력하기 --%>
<sql:setDataSource var="dataSource" 
      url="jdbc:mysql://localhost:3306/JSPBookDB"
      driver="com.mysql.jdbc.Driver"
      user="root"
      password="1234"/>

<%-- 조회결과 가져오기 --%>
<sql:query var="resultSet" dataSource="${dataSource}">
    select name from member where id=?
    <sql:param value="<%=id %>"/>
</sql:query>
      
<body>
  <c:forEach var="row" items="${resultSet.rowsByIndex}">
    <c:forEach var="column" items="${row}">
    <form method="post" action="sql03_process.jsp">
     <p>아이디:<input type="text" name="id" value="<%=id%>" readonly><br>
     <p>비밀번호:<input type="password" name="passwd"><br>
     <p>이름:<input type="text" name="name" value="${column}"><br>
     <p><input type="submit" value="전송"> 
    </form>
    </c:forEach>
  </c:forEach>
</body>
</html>