
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@include file = "../dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String realFolder = "/resources/images"; //웹 어플리케이션 상의 절대 경로
	String encType = "UTF-8";
	int maxSize = 5*1024*1024;
	
	MultipartRequest multi = new MultipartRequest(request,
			getServletContext().getRealPath(realFolder),
			maxSize, encType, new DefaultFileRenamePolicy());
	
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String brandName = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");

	int price;
	if (unitPrice.isEmpty()) price = 0;
	else price = Integer.valueOf(unitPrice);

	long stock;
	if (unitsInStock.isEmpty()) stock = 0;
	else stock = Long.valueOf(unitsInStock);
	
	Enumeration<String> files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String sql = "insert into product(p_id,p_name,p_price,p_description,p_brand,p_stock,p_category,p_fileName)"
				+" values(?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5, brandName);
 	pstmt.setLong(6, stock);
	pstmt.setString(7, category);
 	pstmt.setString(8, fileName);
	pstmt.executeUpdate();

	if(pstmt!=null) pstmt.close();
	if(con!=null) con.close();
		
%>


<%	
	response.sendRedirect("./adminPage.jsp");
%>
