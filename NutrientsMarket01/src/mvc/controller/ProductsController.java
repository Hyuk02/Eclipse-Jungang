package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductRepository;
import dto.Product;

public class ProductsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><body>"+request.getRequestURL()+"<br>"
		           +requestURI+"<br>"
		           +contextPath+"<br>"
		           +command+"</body></html>");
		
		RequestDispatcher rd = null;
		if(command.equals("/ProductListAction.do")) {
			requestBoardList(request);
			rd = request.getRequestDispatcher("./products.jsp");//경로?
		}
		rd.forward(request, response);
	}

	//상품 목록 가져오기
	private void requestBoardList(HttpServletRequest request) {
		//DB와 접속하여 데이터를 가져오는 객체
		ProductRepository dao = ProductRepository.getInstance();
		//db로부터 가져온 게시글 정보를 담을 리스트 생성
		List<Product> productList = new ArrayList<Product>();
		
		//정렬조건을 받는 변수
		
		String condition = request.getParameter("condition");
		String category = request.getParameter("category");
		productList = dao.getProductList(condition,category);
		System.out.println("@"+productList);
		
		//결과를 view에 전달하기 위해 request에 저장
		request.setAttribute("productList", productList);//해당페이지에출력할글목록
		request.setAttribute("category", category);
		request.setAttribute("condition", condition);		
		
	}

}
