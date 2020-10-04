<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="product" class="dto.Product"/>
<jsp:setProperty property="*" name="product"/>
<%-- <jsp:getProperty property="productId" name="product"/><br>
<jsp:getProperty property="pname" name="product"/><br>
<jsp:getProperty property="unitPrice" name="product"/><br>
<jsp:getProperty property="description" name="product"/><br>
<jsp:getProperty property="manufacturer" name="product"/><br>
<jsp:getProperty property="category" name="product"/><br>
<jsp:getProperty property="unitsInStock" name="product"/><br>
<jsp:getProperty property="condition" name="product"/><br> --%>
<%
	productDAO.addProduct(product);
	response.sendRedirect("./products.jsp");
%>

</body>
</html>