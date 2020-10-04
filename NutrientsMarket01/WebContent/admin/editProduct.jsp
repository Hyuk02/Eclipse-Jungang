<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>상품 편집</title>
</head>
<% String edit=request.getParameter("edit"); %>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<%if(edit.equals("update")) {%>
			<h1 class="display-3">상품 수정</h1>
		<%}else if(edit.equals("delete")) {%>
			<h1 class="display-3">상품 삭제</h1>
		<%} %>
	</div>
</div>
<div class="container">
 <div class="row" align="center">
 <%@ include file="../dbconn.jsp" %>
  <%
     String sql="select * from product"; 
  	 PreparedStatement pstmt=con.prepareStatement(sql);
  	 ResultSet rs=pstmt.executeQuery();
  	 while(rs.next()){
  %>
  <div class="card" style="width:350px">
    <img class="card-img-top" src="../resources/images/<%=rs.getString("p_fileName")%>" alt="Product image" style="width:100%">
    <div class="card-body">
      <h4 class="card-title"><%=rs.getString("p_name")%></h4>
      <p class="card-text"><%=rs.getString("p_description")%></p>
      <p class="card-text"><%=rs.getString("p_price")%>원</p>
    </div>
       <%
    	if(edit.equals("update")){
   	   %>
      <a href="./updateProduct.jsp?id=<%=rs.getString("p_id")%>" 
      		class="card-footer bg-info text-white" role="button">수정 &raquo;></a>
       <%}else if(edit.equals("delete")){ %>
      <a href="./deleteProduct.jsp?id=<%=rs.getString("p_id")%>" 
      		onclick="deleteConfirm('<%=rs.getString("p_id")%>')"
      	 	class="card-footer bg-danger text-white">삭제 &raquo;></a>
       <%} %>
  </div>
  <%} 
     if(rs!=null) rs.close();
     if(pstmt!=null)pstmt.close();
     if(con!=null)con.close();
  %>
 </div>
<hr>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>
<script>
function deleteConfirm(id){
	if(confirm("해당 상품 "+id+"을 삭제합니다!!")==true){
		location.href='./deleteProduct.jsp?id='+id;
	}else{
		return;
	}
}
</script>