<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
%>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/NutrientsMarketDB" user="root" password="1234"/>

<!-- 
		결과보기
		while(rs.next()){
			session.setAttribute("sessionId",id);
			response.sendRedirect("경로");
		}
 -->

<sql:query dataSource="${ds }" var="rs">
	select * from member where id=? and pw=?
	<sql:param value="<%=id %>"/>
	<sql:param value="<%=pw %>"/>
</sql:query>

<c:forEach var="row" items="${rs.rows }">
	<%
		session.setAttribute("sessionId", id);
	%>
	<c:redirect url="resultMember.jsp?msg=2"/>
</c:forEach>

<c:redirect url="login_Member.jsp?error=1"/>