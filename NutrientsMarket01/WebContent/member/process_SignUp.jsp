<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birth = request.getParameter("birthyy")+"/"+request.getParameter("birthmm")+"/"+request.getParameter("birthdd") ;
		String email = request.getParameter("mail1")+"@"+ request.getParameter("mail2");
		String phone = request.getParameter("phone");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");
		
		Date current = new Date(System.currentTimeMillis());
		java.sql.Date sqlDate = new java.sql.Date(current.getTime());
		//Timestamp ts = new Timestamp(current.getTime()); -- 시분초 포함

%>

<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>회원가입 처리</title>
</head>
<body>


<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/NutrientsMarketDB" user="root" password="1234"/>

<c:catch var="ex">
<sql:update dataSource="${ds}" var="rs">
	insert into member values(?,?,?,?,?,?,?,?,?,?,?)
	<sql:param value="<%=id %>"/>
	<sql:param value="<%=pw %>"/>
	<sql:param value="<%=name %>"/>
	<sql:param value="<%=birth %>"/>
	<sql:param value="<%=email %>"/>
	<sql:param value="<%=phone %>"/>
	<sql:param value="<%=postcode %>"/>
	<sql:param value="<%=address %>"/>
	<sql:param value="<%=detailAddress %>"/>
	<sql:param value="<%=extraAddress %>"/>
	<sql:param value="<%=sqlDate %>"/>
</sql:update>
</c:catch>
${ex }
<c:if test="${empty ex}">
		<c:if test="${rs>0 }">
				<c:redirect url="resultMember.jsp?msg=1" />
		</c:if>
</c:if>

</body>
</html>