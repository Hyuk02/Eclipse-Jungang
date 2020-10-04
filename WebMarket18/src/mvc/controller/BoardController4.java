package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;


public class BoardController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    static final int LISTCOUNT=5;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, 
			              HttpServletResponse response) throws ServletException, IOException {
	/* url로 부터 요청 정보 얻기*/
	String requestURI=request.getRequestURI();
	String contextPath=request.getContextPath();
	String command=requestURI.substring(contextPath.length());
	String className=command.substring(1,command.lastIndexOf(".do"));
	className="mvc.controller."+className;
	/*문자셋 설정*/
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out=response.getWriter();
	out.print("<html><body>"+request.getRequestURL()+"<br>"
	           +requestURI+"<br>"
	           +contextPath+"<br>"
	           +command+"<br>"
	           +className+"<br>"
	           +"</body></html>");
	
	/* 요청command에 따른 분기작업 */
	RequestDispatcher rd=null;
	String view="";
		  //db에서 조회한 글 리스트를 request에 저장
		  Class clazz = null;
		try {
			clazz = Class.forName(className);//로딩
			Command action = (Command)clazz.newInstance();//인스턴스생성
			view=action.command(request, response);
			
			rd=request.getRequestDispatcher(view);
			rd.forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}