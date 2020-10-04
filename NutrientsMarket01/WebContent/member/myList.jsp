<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<% String id = (String)session.getAttribute("sessionId"); %>
<sql:setDataSource var="ds" 
				   driver="com.mysql.jdbc.Driver" 
				   url="jdbc:mysql://localhost:3306/NutrientsMarketDB" 
				   user="root" 
				   password="1234"
				   />
<sql:query var="rs" dataSource="${ds }">
	select * from sale where id=?
	<sql:param value="<%=id%>"/>
</sql:query>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>구매내역</title>
<script>
</script>
</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">구매내역</h1>
	</div>
</div>
<div class="container">
	<div style="padding-top: 50px">
		<table class="table table-hover">
			<tr>
				<th>상품명</th>
				<th>구매날짜</th>
				<th>가격</th>
				<th>수량</th>
				<th>조회</th>
			</tr>
				
			<c:forEach var="row" items="${rs.rows}">
				<c:set var="p_id" value="${row.p_id}"/>
				<c:set var="saleDate" value="${row.saleDate}"/>
				<c:set var="saleQty" value="${row.saleQty}"/>
				<c:set var="status" value="${row.status}"/>
				
				<sql:query var="rs2" dataSource="${ds }">
					select * from product where p_id=?
					<sql:param value="${p_id}"/>
				</sql:query>
			
				<c:forEach var="row2" items="${rs2.rows}">
					<c:set var="p_name" value="${row2.p_name}"/>
					<c:set var="p_price" value="${row2.p_price}"/>
					<tr>
						<td><a href="../product.jsp?id=<c:out value='${p_id}'/>"><c:out value='${p_name}'/></a></td>
						<td><c:out value='${saleDate}'/></td>
						<td><c:out value='${p_price}'/></td>
						<td><c:out value='${saleQty}'/></td>
						<td><a href="checkShipping.jsp?saleDate=${saleDate}&id=${p_id}" onclick="window.open(this.href, '_blank', 'width=950px,height=370px,toolbars=no,scrollbars=no,left=450,top=200'); 
						return false;" class="badge badge-success">배송내역 조회</a></td>
					</tr>
				</c:forEach>
			</c:forEach>
		</table>
	</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>