<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<% 
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birth = request.getParameter("birthyy")+"/"+request.getParameter("birthmm")+"/"+request.getParameter("birthdd") ;
		String email = request.getParameter("mail1")+"@"+request.getParameter("mail2");
		String phone = request.getParameter("phone");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/semiproject" user="root" password="1234"/>

<sql:update dataSource="${ds}" var="rs">
		update member set pw=?, name=?,  birth=?, email=?, phone=?, postcode=?, address=?, detailAddress=?, extraAddress=? where id=?
		<sql:param value="<%=pw %>"/>
		<sql:param value="<%=name %>"/>
		<sql:param value="<%=birth %>"/>
		<sql:param value="<%=email %>"/>
		<sql:param value="<%=phone %>"/>
		<sql:param value="<%=postcode %>"/>
		<sql:param value="<%=address %>"/>
		<sql:param value="<%=detailAddress %>"/>
		<sql:param value="<%=extraAddress %>"/>
		<sql:param value="<%=id %>"/>
</sql:update>

<c:if test="${rs>=1 }">
		<c:redirect url="resultMember.jsp?msg=0" />
</c:if>

</body>
</html>
