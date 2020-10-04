<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
		String id = request.getParameter("id");
%>

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/NutrientsMarketDB" user="root" password="1234"/>

<sql:query dataSource="${ds}" var="rs">
	select * from member where id=?
	<sql:param value="<%=id%>"/>
</sql:query>

<c:forEach var="row"  items="${rs.rows}">
<c:set var="idc" value="${row.id}"/>
</c:forEach>
<c:if test="${empty idc}">success</c:if>
<c:if test="${not empty idc}">fail</c:if>

