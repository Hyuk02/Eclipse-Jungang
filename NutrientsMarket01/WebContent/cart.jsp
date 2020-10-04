<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<%	String cartId = session.getId(); %><!-- 주문번호 -->
<meta charset="UTF-8">
<title>장바구니</title>
<script>
function change(seq) {
	var id = document.getElementById("id"+seq).value;
		id = id.substring(0,id.indexOf("-"));
	var qty = document.getElementById("qty"+seq).value;
	var yesno = confirm("수정하시겠습니까?");
	if(yesno) location.href = "changeCart.jsp?id="+id+"&qty="+qty;
}
function k(seq){
	var btn = document.getElementById("btn"+seq);
	btn.disabled = "";
}
</script>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">장바구니</h1>
	</div>
</div>
<div class="container">
	<div style="padding-top: 50px">
		<table class="table table-hover">
			<tr>
				<th>상품</th>
				<th>가격</th>
				<th>수량</th>
				<th>소계</th>
				<th>비고</th>
			</tr>
			<%
				int sum = 0;
				List<Product> cartlist = (List<Product>) session.getAttribute("cartlist");
				if(cartlist == null) cartlist = new ArrayList<Product>();
				
				for(int i = 0; i <cartlist.size(); i++){
					Product product = cartlist.get(i);
					int total = product.getUnitPrice()*product.getQuantity();//단가*수량
					sum = sum + total;//sum(총 금액) = 개별상품의 가격 합.
			%>
			<tr>
				<td><a href="product.jsp?id=<%=product.getProductId() %>"><%=product.getProductId() %>&nbsp;-&nbsp;<%=product.getPname() %></a>
					<input type="hidden" value="<%=product.getProductId()%>-<%=product.getPname()%>"id="id<%=i%>">
				</td>
				<td><%=product.getUnitPrice() %></td>
				<td><input type="number" id="qty<%=i %>" value="<%=product.getQuantity() %>" onchange="k(<%=i %>)">
					<input type="button" class="btn btn-primary btn-sm" onclick="change(<%=i %>)" value="변경" id="btn<%=i %>" 
							disabled="disabled"></td>
				<td><%=total %></td>
				<td>
					<a href="./removeCart.jsp?id=<%=product.getProductId() %>" class="badge badge-danger">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
		<table width="100%">
			<tr>
				<td align="right">
					<a href="./payment.jsp?cartId=<%=cartId%>" class="btn btn-primary btn-block">주문하기</a>
				</td>
			</tr>
		</table>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>