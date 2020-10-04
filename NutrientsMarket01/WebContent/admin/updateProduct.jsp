<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>상품 수정</title>
</head>
<script src ="../resources/js/validation2.js?ver=1"></script>
<body>
<%@include file="../dbconn.jsp" %>
<%
	String p_id = request.getParameter("id");
	System.out.println("p_id:"+p_id);
	String sql = "select * from product where p_id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, p_id);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	//category 값 저장
	String category = rs.getString("p_category");
	String brandName= rs.getString("p_brand");
%>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<jsp:include page="../menu.jsp" />	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title_Edit"/></h1>
		</div>
	</div>
	<div class="container">
	<div class="text-right">
		<a href="?language=ko&id=<%=p_id%>">Korean</a>|
		<a href="?language=en&id=<%=p_id%>">English</a> 
	</div>
		<form name="newProduct" action="./processUpdateProduct.jsp" 
		 class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productId"/></label>
				<div class="col-sm-3">
					<input type="text" name="productId" id="productId" class="form-control" 
					 value="<%=rs.getString("p_id")%>" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="pname"/></label>
				<div class="col-sm-3">
					<input type="text" name="pname" id="pname" class="form-control" 
						value="<%=rs.getString("p_name")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitPrice" id="unitPrice" class="form-control" 
						value="<%=rs.getInt("p_price")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea name="description" id="description" cols="50" rows="2" 
					class="form-control" required><%=rs.getString("p_description") %></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
				<div class="col-sm-3">
					<%-- <input type="text" name="manufacturer" id="manufacturer" 
					class="form-control" required value="<%=rs.getString("p_brand")%>"> --%>
					<select name="manufacturer" class="form-control"  id="manufacturer" style="height: 34px;">
					<%
					String sql3="select brandName from brand order by seq";
					PreparedStatement pstmt3 = con.prepareStatement(sql3);
					ResultSet rs3 = pstmt3.executeQuery();
					
					while(rs3.next()){
						out.print("<option value='"+rs3.getString(1)+"'"
								+(rs3.getString(1).equals(brandName)?"selected":"''")
								+">" +rs3.getString(1)+"</option>");
						}
					if(rs3!=null) rs3.close();
					if(pstmt3!=null) pstmt3.close();
				%>
				</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
				<select name="category" class="form-control"  id="category" style="height: 34px;">
				<%
					String sql2="select categoryName from category order by seq";
					PreparedStatement pstmt2 = con.prepareStatement(sql2);
					ResultSet rs2 = pstmt2.executeQuery();
				%>
				<% 
					while(rs2.next()){
					out.print("<option value='"+rs2.getString(1)+"'"
							+(rs2.getString(1).equals(category)?"selected":"''")
							+">" +rs2.getString(1)+"</option>");
					}
				%>
				</select>
				</div>
			</div>
			<%
				if(rs2!=null) rs2.close();
				if(pstmt2!=null) pstmt2.close();
			%>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitsInStock" id="unitsInStock" class="form-control" 
						value="<%=rs.getLong("p_stock")%>">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary" 
					value="<fmt:message key="button"/> " onclick="return CheckAddProduct()">
				</div>
			</div>
		</form>
	</div>
	<%
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(con!=null) con.close();
	%>
	</fmt:bundle>
	<jsp:include page="../footer.jsp" />
</body>
</html>