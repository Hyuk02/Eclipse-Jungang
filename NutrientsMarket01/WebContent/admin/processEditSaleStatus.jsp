<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>배송상태수정</title>
</head>
<body>
<% String seq=request.getParameter("seq"); 
   String status=request.getParameter("status"); %>
<%-- db 연결설정 --%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" 
url="jdbc:mysql://localhost:3306/NutrientsMarketDB" user="root" password="1234"/>
  
<%-- db update처리 --%>  
<sql:update dataSource="${dataSource}" var="resultSet">
	update sale set status=? where seq=?
    <sql:param value="<%=status%>"/>
    <sql:param value="<%=seq%>"/>
</sql:update>
  
<%-- 이동 --%>
<c:redirect url="./editSaleStatus.jsp"/>

</body>
</html>