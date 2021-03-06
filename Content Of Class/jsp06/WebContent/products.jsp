<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/>    
<!DOCTYPE html><html>
<head><meta charset="UTF-8">
<title>상품목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
   <div class="container">
   	<h1 class="display-3">상품 목록</h1>
   </div>
</div>
<%
   List<Product> list = productDAO.getListOfProduct();
   System.out.println("등록상품갯수:"+list.size());
%>
<div class="container">
 <div class="row" align="center">
    <%
    	for(int i=0;i<list.size();i++){
    		 Product p=list.get(i);
     %>		 
    	<div class="col-md-4">
    	  <h3><%=p.getPname() %></h3>
    	  <p><%=p.getDescription() %></p>
    	  <p><%=p.getUnitPrice() %></p>
    	  <p><a href="./product.jsp?id=<%=p.getProductId()%>"
    	    class="btn btn-secondary" role="button">상세정보 &raquo;</a>
    	  </p>
    	</div>
    <%		 
       }
    %>
 </div>
<hr>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>