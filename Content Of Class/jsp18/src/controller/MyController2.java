package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyController2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, 
			             HttpServletResponse response) 
			             throws ServletException, IOException {
		/* 서블릿에서 처리한 결과물을  view로 저달하기위한 작업 */
		request.setAttribute("message", "Hello World");
		
		SimpleDateFormat sdf 
		    = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss.S");
		String now=sdf.format(new Date());
		
		request.setAttribute("now", now);
		
		/* request요청에 대한 결과 페이지(view) 이동 */
		RequestDispatcher rd
		   =request.getRequestDispatcher("view2.jsp");
		rd.forward(request, response);
	}

}
