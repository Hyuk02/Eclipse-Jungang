<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file = "../dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String realFolder = "/resources/images"; //웹 어플리케이션 상의 절대 경로
	String encType = "UTF-8";
	int maxSize = 5*1024*1024;
	
	/* System.out.println(getServletContext().getRealPath(realFolder)); */
	
	MultipartRequest multi = new MultipartRequest(request,
			getServletContext().getRealPath(realFolder),
			maxSize, encType, new DefaultFileRenamePolicy());
	
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
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
	
	//쿼리 객체 생성
	String sql = "select * from product where p_id=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	//바인딩변수 처리
	pstmt.setString(1, productId);
	//입력 실행
	ResultSet rs = pstmt.executeQuery();
	
	if(rs.next()){
		if(fileName!=null){ //파일 전송시 처리
			sql = "Update product set p_name=?, p_price=?, p_description=?"
					+",p_brand=?, p_category=?, p_stock=?"
					+", p_fileName=? where p_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, manufacturer);
			pstmt.setString(5, category);
			pstmt.setLong(6, stock);
			pstmt.setString(7, fileName);
			pstmt.setString(8, productId);
			pstmt.executeUpdate();
		}else{//파일 미 전송시 처리
			sql="Update product set p_name=?, p_price=?, p_description=?"
					+",p_brand=?, p_category=?, p_stock=?"
					+" where p_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, manufacturer);
			pstmt.setString(5, category);
			pstmt.setLong(6, stock);
			pstmt.setString(7, productId);
			
			pstmt.executeUpdate();
		}
	}
	
	//자원 해제
	if(rs!=null) rs.close();
	if(pstmt!=null) pstmt.close();
	if(con!=null) con.close();
	
	response.sendRedirect("editProduct.jsp?edit=update");
%>
    