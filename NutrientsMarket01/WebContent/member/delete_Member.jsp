<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/NutrientsMarketDB" user="root" password="1234"/>

<c:catch var="ex">
	<sql:update dataSource="${ds }" var="rs">
			delete from member where id=?
			<sql:param value="<%=sessionId %>"/>
	</sql:update>
</c:catch>
${ex }

<c:if test="${rs>0 }">
	<c:import url="logout_Member.jsp"/>
	<c:redirect url="resultMember.jsp"/>
</c:if>