<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	//파라미터로 넘어온 id정보가 없으면 상품리스트로 이동
	if(id==null||id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	} 
	
	//파라미터로 넘어온 id정보다 있으면
	/* ProductRepository dao = ProductRepository.getInstance();
	//상품정보 얻기
	Product product = dao.getProductById(id); 
	//해당상품 정보가 없으면 에러페이지
	if(product==null){
		response.sendRedirect("exceptionNoProductId.jsp");
		return;
	} 
	 */
	//해당상품정보가 있으면
	List<Product> cartList = (List<Product>)session.getAttribute("cartlist");
	Product goodsQnt = new Product();
	for(int i=0;i<cartList.size();i++){
		goodsQnt = cartList.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cartList.remove(goodsQnt);
		}
	}
	
	//삭제한 내용 확인을 위해 cart페이지로 이동
	
	
	response.sendRedirect("cart.jsp");
%>