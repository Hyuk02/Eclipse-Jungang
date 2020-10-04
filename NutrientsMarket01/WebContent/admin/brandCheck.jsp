<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	request.setCharacterEncoding("utf-8");
	String brandName = request.getParameter("brandName");
	//System.out.println("넘어온 카테고리:"+categoryName);
%>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" 
url="jdbc:mysql://localhost:3306/NutrientsMarketDB" user="root" password="1234"/>
<c:catch var="e">
<sql:query dataSource="${dataSource}" var="resultSet">
	select * from brand where brandName=?
	<sql:param value="<%=brandName %>"/>
</sql:query>
</c:catch>
${e}
<c:forEach var="row" items="${resultSet.rows }">fail</c:forEach>
<c:if test="${empty resultSet.rows}">success</c:if>
