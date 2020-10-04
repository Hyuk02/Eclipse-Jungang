<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.Product"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
		request.setCharacterEncoding("utf-8");

		String cartId = request.getParameter("cartId");
		String name = request.getParameter("name");
		String email = request.getParameter("mail1")+"@"+ request.getParameter("mail2");
		String phone = request.getParameter("phone");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String requestMessage = request.getParameter("requestMessage");
		String deliveryDate = request.getParameter("deliveryDate");
		
%>

<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>주문완료 처리</title>
</head>
<body>
<sql:setDataSource var="ds" 
				   driver="com.mysql.jdbc.Driver" 
				   url="jdbc:mysql://localhost:3306/NutrientsMarketDB" 
				   user="root" 
				   password="1234"
				   />
<c:catch var="ex">
<sql:update dataSource="${ds}" var="rs">
	insert into delivery(sessionId,name,phone,email,postcode,address,detailAddress,deliveryDate,requestMessage) values(?,?,?,?,?,?,?,?,?)
	<sql:param value="<%=cartId %>"/>
	<sql:param value="<%=name %>"/>
	<sql:param value="<%=phone %>"/>
	<sql:param value="<%=email %>"/>
	<sql:param value="<%=postcode %>"/>
	<sql:param value="<%=address %>"/>
	<sql:param value="<%=detailAddress %>"/>
	<sql:param value="<%=deliveryDate %>"/>
	<sql:param value="<%=requestMessage %>"/>
</sql:update>
</c:catch>
${ex }
<c:if test="${empty ex}">
		<c:if test="${rs>0 }">
				<c:redirect url="orderConfirmation.jsp" />
		</c:if>
</c:if>
</body>
</html>