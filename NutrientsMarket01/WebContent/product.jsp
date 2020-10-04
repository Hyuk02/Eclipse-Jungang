<%@page import="dto.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="exceptionNoProduct.jsp" %>
<%@include file="./dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel = "stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>상품상세정보</title>
<script>
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>

<body>
<jsp:include page="./menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">상품 목록</h1>
		</div>
</div>
<%	
	String id = request.getParameter("id");
	//System.out.println("넘어온 id:"+id);
	String sql = "select * from product where p_id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rs = pstmt.executeQuery();
	Product product = new Product();
	if(rs.next()){
		product.setProductId(rs.getString("p_id"));
		product.setPname(rs.getString("p_name"));
		product.setUnitPrice(rs.getInt("p_price"));
		product.setDescription(rs.getString("p_description"));
		product.setBrand(rs.getString("p_brand"));
		product.setUnitsInStock(rs.getLong("p_stock"));
		product.setCategory(rs.getString("p_category"));
		product.setFilename(rs.getString("p_fileName"));
	}
	
	if(rs!=null) rs.close();
	if(pstmt!=null) pstmt.close();
	if(con!=null) con.close();
%>
<div class ="container">
	<div class = "row">
		<div class = "col-md-5">
			<img src="./resources/images/<%=product.getFilename()%>"
			style="width: 100%"/>
		</div>
		<div class="col-md-6">
		<h3><%=product.getPname() %></h3>
		<p><%=product.getDescription() %></p>
		<p><b>상품코드:</b><span class ="badge badge-danger"><%=product.getProductId() %></span>
		
		<p><b>카테고리:</b><%=product.getCategory() %><br>
		<p><b>제품명:</b><%=product.getPname() %><br>
		<p><b>가격:</b><%=product.getUnitPrice() %><br>
		<p><b>재고:</b><%=product.getUnitsInStock() %><br>
		
		<p><form name="addForm" 
				 action="./addCart.jsp?id=<%=product.getProductId() %>" 
				 method="post">
			<a href="#" class="btn btn-info" onclick="addToCart()">상품주문&raquo;</a>
			<a href="./cart.jsp" class="btn btn-warning" >장바구니&raquo;</a>
			<a href="${pageContext.request.contextPath}/ProductListAction.do?condition=null" class="btn btn-secondary">상품목록&raquo;</a>
		</form>		
</div>
</div>
</div>
<jsp:include page="./footer.jsp"/>

</body>
</html>