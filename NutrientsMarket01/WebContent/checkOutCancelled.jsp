<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
		request.setCharacterEncoding("utf-8");

		String id =  session.getId();
%>
<sql:setDataSource var="ds" 
				   driver="com.mysql.jdbc.Driver" 
				   url="jdbc:mysql://localhost:3306/NutrientsMarketDB" 
				   user="root" 
				   password="1234"
				   />
<sql:update dataSource="${ds}" var="rs">	
	 delete from delivery where sessionId=?
	<sql:param value="<%=id %>"/>
</sql:update>
<%
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null || cookies.equals("")){
		for(int i = 0; i <cookies.length; i++){
			Cookie thisCookie = cookies[i];
			String n = thisCookie.getName();
			if(n.equals("Shipping_cartId")){
				shipping_cartId = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}else if(n.equals("Shipping_name")){
				shipping_name = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}else if(n.equals("Shipping_shippingDate")){
				shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}else if(n.equals("Shipping_country")){
				shipping_country = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}else if(n.equals("Shipping_zipCode")){
				shipping_zipCode = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}else if(n.equals("Shipping_addressName")){
				shipping_addressName = URLDecoder.decode(thisCookie.getValue(),"UTF-8");
			}
		}
	}
	//세션정보 삭제
	session.removeAttribute("cartlist");
	//쿠키에 저장된 장바구니 정보 삭제
	for(int i = 0; i < cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		//쿠키 유효기간 설정 0(즉시삭제);
		if(n.equals("Shipping_cartId")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_name")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_shippingDate")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_country")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_zipCode")) thisCookie.setMaxAge(0);
		if(n.equals("Shipping_addressName")) thisCookie.setMaxAge(0);
		
		//응답객체 추가
		response.addCookie(thisCookie);
	}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>주문 취소</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">주문 취소</h1>
	</div>
</div>
<div class="container">
	<h2 class="alert alert-danger">주문이 취소되었습니다.</h2>
</div>
<div class="container">
	<a href="./products.jsp" class="btn btn-secondary">&laquo;상품목록</a>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>