<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>회원 찾기</title>
</head>
<body>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/NutrientsMarketDB" user="root" password="1234"/>

<% 
String id = request.getParameter("id"); 
String phone = request.getParameter("phone"); 
String email = request.getParameter("email"); 

if(phone!=null & email==null){
%>

<sql:query var="rs" dataSource="${ds}">
		select * from member where phone=? and id=?
		<sql:param value="<%=phone %>"/>
		<sql:param value="<%=id %>"/>
</sql:query>

<c:forEach var="row" items="${rs.rows}">
	<script>
			alert("고객님의 비밀번호는 ${row.pw}입니다.");
			window.opener.location.href = "login_Member.jsp";
			self.close();
	</script>
</c:forEach>

	<script>
			alert('입력하신 정보와 일치하는 회원이 없습니다.');
			opener.helpMember.id.focus();
			self.close();
	</script>

<%}else if(email!=null & phone==null){ %>

<sql:query var="rs2" dataSource="${ds}">
		select * from member where email=? and id=?
		<sql:param value="<%=email %>"/>
		<sql:param value="<%=id %>"/>
</sql:query>

<c:forEach var="row2" items="${rs2.rows }">
	<script>
			alert("고객님의 비밀번호는 ${row2.pw}입니다.");
			window.opener.location.href = "login_Member.jsp";
			self.close();
	</script>
</c:forEach>


	<script>
			alert('입력하신 정보와 일치하는 회원이 없습니다.');
			opener.helpMember.id.focus();
			self.close();
	</script>
<%} %>
</body>
</html>