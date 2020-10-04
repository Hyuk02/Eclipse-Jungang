package controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/* HttpServlet클래스를 상속받아서  서블릿클래스 생성*/
public class MyController extends HttpServlet{
/* 부모클래스(HttpServlet) doGet()메소드 재정의 */
	@Override
	protected void doGet(HttpServletRequest request, 
			             HttpServletResponse response) 
			             throws ServletException, IOException {
	 /* 뷰로 전달할 메세지를  request객체에 저장 */
	 request.setAttribute("message", "Hello! Java Server Pages");
	 /* 뷰페이지로 이동*/
	 RequestDispatcher rd=request.getRequestDispatcher("view.jsp");
	 rd.forward(request, response);
	}
}
