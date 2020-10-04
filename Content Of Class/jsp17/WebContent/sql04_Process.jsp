<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>jstl sql</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
   
    String id=request.getParameter("id");
    String passwd=request.getParameter("passwd");
%>
<%-- 연결설정 --%>
<sql:setDataSource
     var="dataSource"
     driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/JSPBookDB"
     user="root"
     password="1234"
/>
<%-- db정보 삭제처리 --%>
<sql:update dataSource="${dataSource}" var="resultSet">
   delete from member where id=? and passwd=?
   <sql:param value="<%=id %>"/>
   <sql:param value="<%=passwd %>"/>
</sql:update>

<%--결과 보기 --%>
<c:import url="sql01.jsp" var="url"/>
${url}

</body>
</html>