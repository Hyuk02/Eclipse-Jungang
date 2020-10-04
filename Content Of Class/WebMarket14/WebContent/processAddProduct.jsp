<%@page import="dao.ProductRepository"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="dao" class="dao.ProductRepository" scope="session"/> --%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="product" class="dto.Product"/>
<jsp:setProperty property="*" name="product"/>
<%
String filename = "";
String realFolder = "/resources/images"; //웹 어플리케이션상의 절대 경로
String encType = "utf-8"; //인코딩 타입
int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

System.out.print(getServletContext().getRealPath(realFolder));

MultipartRequest multi = 
     new MultipartRequest(request, 
    		 getServletContext().getRealPath(realFolder), 
    		 maxSize, 
    		 encType, 
    		 new DefaultFileRenamePolicy());

 String productId = multi.getParameter("productId");
String name = multi.getParameter("pname");
String unitPrice = multi.getParameter("unitPrice");
String description = multi.getParameter("description");
String manufacturer = multi.getParameter("manufacturer");
String category = multi.getParameter("category");
String unitsInStock = multi.getParameter("unitsInStock");
String condition = multi.getParameter("condition");

Integer price;
if (unitPrice.isEmpty())	price = 0;
else price = Integer.valueOf(unitPrice);
long stock;
if (unitsInStock.isEmpty()) stock = 0;
else stock = Long.valueOf(unitsInStock);

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

ProductRepository dao 
=ProductRepository.getInstance();
%>
<jsp:setProperty property="productId" name="product" value="<%=productId%>"/>
<jsp:setProperty property="pname" name="product" value="<%=name%>"/>
<jsp:setProperty property="unitPrice" name="product" value="<%=Integer.parseInt(unitPrice)%>"/>
<jsp:setProperty property="description" name="product" value="<%=description%>"/>
<jsp:setProperty property="manufacturer" name="product" value="<%=manufacturer%>"/>
<jsp:setProperty property="category" name="product" value="<%=category%>"/>
<jsp:setProperty property="unitsInStock" name="product" value="<%=Long.parseLong(unitsInStock)%>"/>
<jsp:setProperty property="condition" name="product" value="<%=condition%>"/>
<jsp:setProperty property="filename" name="product" value="<%=fileName%>"/>
<%
	dao.addProduct(product);
	response.sendRedirect("./products.jsp");
%>

</body>
</html>
