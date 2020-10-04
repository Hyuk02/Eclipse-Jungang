<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="sun.misc.Perf.GetPerfAction"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	/* String sessionId = (String)session.getAttribute("sessionId"); */
	String cartId = session.getId();
%>
<sql:setDataSource var="ds" 
				   driver="com.mysql.jdbc.Driver" 
				   url="jdbc:mysql://localhost:3306/NutrientsMarketDB" 
				   user="root" 
				   password="1234"
				   />
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">주문 완료</h1>
	</div>
</div>
<div class="container alert alert-success" align="center">
	<h3>주문해주셔서 감사합니다.</h3>
</div>
<sql:query var="rs" dataSource="${ds }">
		select * from delivery where sessionId=?
		<sql:param value="<%=cartId%>"/>
</sql:query>

<c:forEach var="row" items="${rs.rows}">
	<c:set var="name" value="${row.name}"/>
	<c:set var="phone" value="${row.phone}"/>
	<c:set var="postcode" value="${row.postcode}"/>
	<c:set var="address" value="${row.address}"/>
	<c:set var="detailAddress" value="${row.detailAddress}"/>
	<c:set var="deliveryDate" value="${row.deliveryDate}"/>
	<c:set var="requestMessage" value="${row.requestMessage}"/>
</c:forEach>

	<div class="container alert alert-light">
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<h4><strong>배송 주소</strong></h4>
				<br>
				<p><strong>성명</strong> : <c:out value='${name}'/>
				<p><strong>전화번호</strong> : <c:out value='${phone}'/>
				<p><strong>우편번호</strong> : <c:out value='${postcode}'/>
				<p><strong>주소</strong> : <c:out value='${address}'/> <c:out value='${detailAddress}'/>
				<p><strong>배송 요청사항</strong> : <c:out value="${requestMessage }"/>
			</div>
			<div class="col-5" align="right">
				<p><em>주문하신 상품은 <strong><c:out value='${deliveryDate}'/></strong> 까지 배송될 예정입니다.</em>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품명</th>
					<th class="text-center">상품수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					int sum = 0;
					List<Product> cartlist = (List<Product>) session.getAttribute("cartlist");
					if(cartlist == null) cartlist = new ArrayList<Product>();
					
					for(int i = 0; i < cartlist.size(); i++){
						Product product = cartlist.get(i);
						int total = product.getUnitPrice()*product.getQuantity();//단가*수량
						sum = sum + total;//sum(총 금액) = 개별상품의 가격 합.
				%>
				<tr>
					<td class="text-center"><%=product.getPname() %></td>
					<td class="text-center"><%=product.getQuantity() %></td>
					<td class="text-center"><%=product.getUnitPrice() %></td>
					<td class="text-center"><%=total %></td>
				</tr>
				<%} %>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액 : </strong></td>
					<td class="text-center text-danger"><strong><%=new DecimalFormat("#,###").format(sum) %></strong></td>
				</tr>
			</table>
			<!-- 확정메뉴 -->
			<a href="./finishOrder.jsp" class="btn btn-success btn-block" role="button">확인</a>
		</div>
	</div>
	<div class="" align="center">
		<a href="./checkOutCancelled.jsp" class="btn btn-primary" role="button">취소</a>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>