<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<% 
	String saleDate = request.getParameter("saleDate");
	String id = request.getParameter("id");
%>
<sql:setDataSource var="ds" 
				   driver="com.mysql.jdbc.Driver" 
				   url="jdbc:mysql://localhost:3306/NutrientsMarketDB" 
				   user="root" 
				   password="1234"
				   />
<sql:query var="rs" dataSource="${ds }">
		select * from sale where saleDate=? and p_id=?
		<sql:param value="<%=saleDate %>"/>
		<sql:param value="<%=id %>"/>
</sql:query>
<c:forEach var="row" items="${rs.rows}">
	<c:set var="p_id" value="${row.p_id}"/>
	<c:set var="sessionId" value="${row.sessionId}"/>
	<c:set var="status" value="${row.status}"/>
</c:forEach>

<sql:query var="rs2" dataSource="${ds }">
	select * from product where p_id=?
	<sql:param value="${p_id }"/>
</sql:query>
<c:forEach var="row2" items="${rs2.rows}">
	<c:set var="p_description" value="${row2.p_description}"/>
	<c:set var="p_name" value="${row2.p_name}"/>
</c:forEach>

<sql:query var="rs3" dataSource="${ds }">
	select * from delivery where sessionId=?
	<sql:param value="${sessionId }"/>
</sql:query>
<c:forEach var="row3" items="${rs3.rows}">
	<c:set var="deliveryDate" value="${row3.deliveryDate}"/>
</c:forEach>

<!DOCTYPE html>
<html>
<head>
<style>
#red{color: red;}
#black{color: black;}
</style>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>배송내역 조회</title>
</head>
<body>
<div class="jumbotron alert alert-success">
	<h3 align="center" id="black">주문하신 <strong><c:out value='${p_name}'/></strong>
						상품이 "<strong id="red"><c:out value='${status==1?"결제완료":status==2?"배송준비중":status==3?"배송중":status==4?"배송완료":"수령완료"}'/></strong>"상태 입니다. </h3>
</div>
	<table class="table table-hover">
			<tr>
				<th>상품명</th>
				<th>상품설명</th>
				<th>가격</th>
				<th>수량</th>
			</tr>
				<c:forEach var="row" items="${rs.rows}">
					<c:set var="saleQty" value="${row.saleQty}"/>
					<c:set var="p_price" value="${row.p_price}"/>
					<c:forEach var="row2" items="${rs2.rows}">
						<c:set var="p_desciption" value="${row2.p_descripion}"/>
						<tr>		
							<td><a href="../product.jsp?id=<c:out value='${p_id}'/>"><c:out value='${p_name}'/></a></td>
							<td><c:out value='${p_description}'/></td>
							<td><c:out value='${p_price}'/></td>
							<td><c:out value='${saleQty}'/></td>
						</tr>
					</c:forEach>
				</c:forEach>
			<tr>
				<td class="text-left"><p><em>도착 예정일 : <strong><c:out value='${deliveryDate}'/></strong></em></td>
				<td></td>
				<td class="text-right"><strong>총액 : </strong></td>
				<td class="text-center text-danger"><strong><c:out value='${saleQty*p_price}'/></strong></td>
			</tr>
		</table>
		<div align="center">
			<button class="btn btn-primary col-2" onclick="self.close()">닫기</button>
		</div>
		
</body>
</html>