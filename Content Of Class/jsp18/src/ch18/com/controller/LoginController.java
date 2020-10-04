package ch18.com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* 어노테이션 방식으로 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding()처리
		request.setCharacterEncoding("utf-8");
		
		String username=request.getParameter("id");
		String password=request.getParameter("passwd");
		
		//출력객체
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out=response.getWriter();
		String htmlResponse="<html>";
		htmlResponse+="<h3>아이디:"+username+"<br>";
		htmlResponse+="비밀번호:"+password+"</h3><br>";
		htmlResponse+="</html>";
		
		out.print(htmlResponse);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
