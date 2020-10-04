<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="dao" class="dao.ProductRepository" scope="session"/>       --%>  
<%
    //파라미터로 넘어온 id값으로
	String id=request.getParameter("id");
    //id값이 넘어왔는지 확인
    if(id==null|| id.trim().equals("")){//id값이 넘오지않았으면 상품리스트페이지로 이동.
       response.sendRedirect("products.jsp");
       return;
    }
    //id값이 존재하면 상품처리 객체생성
    ProductRepository dao=ProductRepository.getInstance();
    //해당id에 맞는 상품정보 얻기
    Product product =  dao.getProductById(id);
    if(product==null){//해당id로 상품 존재하지않으면 에러페이지로 이동.
    	response.sendRedirect("exceptionNoProductId.jsp");
    return;
    }
    //상품 전체 리스트 얻기
    List<Product> goodsList = dao.getAllProducts();
    //상품정보 담을 객체 생성
    Product goods = new Product();
    //리스트 상품정보 얻은 후 id가 같으면 반복 종료;
    for(int i=0;i<goodsList.size();i++){
    	goods=goodsList.get(i);
    	if(goods.getProductId().equals(id)){
    		break;
    	}
    }
    //세션에 cartlist가 있는지 여부 확인
    //없으면 cartlist를 생성하여 session에 저장.
    ArrayList<Product> list 
       =(ArrayList<Product>)session.getAttribute("cartlist");
    if(list==null){
    	System.out.println("세션에 cartlist정보가 없음,새로만듦");
    	list = new ArrayList<Product>();
    	session.setAttribute("cartlist", list);
    }
    
    int cnt=0;
    Product goodsQnt = new Product();
    //장바구에 동일 상품이 존재하면
    //수량 추가
    for(int i=0;i<list.size();i++){
    	goodsQnt=list.get(i);
    	if(goodsQnt.getProductId().equals(id)){
    		cnt++;
    		int orderQuantity=goodsQnt.getQuantity()+1;//장바구니수량 증가
    		goodsQnt.setQuantity(orderQuantity);
    	}
    }
    //장바구니에 해당 상품이 없으면
    if(cnt==0){
    	goods.setQuantity(1);//1개로 설정
    	list.add(goods);
    }
    System.out.println("상품수량:"+cnt);
    //try{
    //상세페이지로 이동시 원래 상품 정보출력
    response.sendRedirect("product.jsp?id="+id);
    //}catch(Exception e){
    //	e.printStackTrace();
   // }
    //request.setAttribute("id", id);
    // RequestDispatcher rd
    // = request.getRequestDispatcher("product.jsp?id="+id);
    //rd.forward(request, response);
    
%>










