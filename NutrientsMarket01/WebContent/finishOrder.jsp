<%@page import="java.util.Locale"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="dbconn.jsp" %>
<sql:setDataSource var="ds" 
				   driver="com.mysql.jdbc.Driver" 
				   url="jdbc:mysql://localhost:3306/NutrientsMarketDB" 
				   user="root" 
				   password="1234"
				   />
<%
	String id = (String)session.getAttribute("sessionId");
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
	
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	/* con.setAutoCommit(false); */
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.KOREA);
	Date date = new Date();
	String saleDate = sdf.format(date);
	
	int status = 1;
	PreparedStatement pstmt=null;
	for(int i = 0; i < list.size(); i++) {
		String p_id = list.get(i).getProductId();
		int p_price = list.get(i).getUnitPrice();
		int saleQty = list.get(i).getQuantity();
%>
<c:catch var="ex">
	<sql:update dataSource="${ds}" var="rs">
		insert into sale(sessionId,saleDate,p_id,p_price,id,saleQty,status) values(?,?,?,?,?,?,?)
		<sql:param value="<%=session.getId() %>"/>
		<sql:param value="<%=saleDate %>"/>
		<sql:param value="<%=p_id %>"/>
		<sql:param value="<%=p_price %>"/>
		<sql:param value="<%=id %>"/>
		<sql:param value="<%=saleQty %>"/>
		<sql:param value="<%=status %>"/>
	</sql:update>
	<%--변경된 재고 반영 --%>
	<sql:query dataSource="${ds}" var="rs2">
		select p_stock from product where p_id=?
		<sql:param value="<%=p_id %>"/>
	</sql:query>
	<c:forEach var="row" items="${rs2.rows}">
		<c:set var="nowStock" value="${row.p_stock}"></c:set>
	</c:forEach>
</c:catch>
${ex }
<%		String sql="update product set p_stock=p_stock-? where p_id=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, saleQty);
		pstmt.setString(2, p_id);
		pstmt.executeUpdate();
	} 
		try{
		if(con!=null) con.close();
		if(pstmt!=null) pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
<%
	//세션정보 삭제
	session.removeAttribute("cartlist");
	//쿠키에 저장된 장바구니 정보 삭제
	for(int j = 0; j < cookies.length; j++){
		Cookie thisCookie = cookies[j];
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
<c:if test="${empty ex}">
	<c:if test="${rs>0 }">
			<c:redirect url="/ProductListAction.do?condition=null" />
	</c:if>
</c:if>

