<%@page import="dto.Product"%><%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>  
<%-- <jsp:useBean id="dao" class="dao.ProductRepository" scope="session"/> --%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>상품상세정보</title>
<script>
/* javascript 함수 선언 function 함수명(아규먼트){실행문;} */
function addToCart(){
	if(confirm("상품을 장바구니에 추가하시겠습니까?")){
		document.addForm.submit();//action경로로 이동처리
	}else{
		document.addForm.reset();//초기화 처리
	}
}
</script>
<!-- <link rel="stylesheet" 
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/> -->
<link rel="stylesheet"  href="./resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
   <div class="container">
   	<h1 class="display-3">상품 정보</h1>
   </div>
</div>
<%
	String id=request.getParameter("id");
System.out.println("넘어온 id:"+id);
    
ProductRepository dao 
=ProductRepository.getInstance();
    Product product=dao.getProductById(id);
    
    
%>
<div class="container">
 <div class="row">
    <div class="col-md-5">
     <img src="./resources/images/<%=product.getFilename()%>" style="width:100%">
    </div>
  <div class="col-md-6">
  <h3><%=product.getPname()%></h3>
  <p><%=product.getDescription() %></p>
  <p><b>상품코드:</b><span class="badge badge-danger"><%=product.getProductId()%></span>  
  <p><b>제조사</b>:<%=product.getManufacturer() %>
  <p><b>분류</b>:<%=product.getCategory() %>
  <p><b>재고수</b>:<%=product.getUnitsInStock() %>
  <h4><%=product.getUnitPrice() %>원</h4>
  <p><form name="addForm" 
         action="./addCart.jsp?id=<%=product.getProductId()%>" 
         method="post">
  <a href="#" class="btn btn-info" onclick="addToCart()">상품주문&raquo;</a>
  <a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
  <a href="./products.jsp" class="btn btn-secondary">상품 목록&raquo;</a>
  </form>
  </div>
 </div>
</div><!-- container.  -->
<jsp:include page="footer.jsp"/>
</body>
</html>