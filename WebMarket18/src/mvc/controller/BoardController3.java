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


public class BoardController3 extends HttpServlet {
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
	/*문자셋 설정*/
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	PrintWriter out=response.getWriter();
	out.print("<html><body>"+request.getRequestURL()+"<br>"
	           +requestURI+"<br>"
	           +contextPath+"<br>"
	           +command+"</body></html>");
	
	/* 요청command에 따른 분기작업 */
	RequestDispatcher rd=null;
	String view="";
	
	  if(command.equals("/BoardListAction.do")) { 
		  //db에서 조회한 글 리스트를 request에 저장
		  Command action=new BoardListAction();
		  view=action.command(request, response);
		   
      }else if(command.equals("/BoardWriteFormAction.do")) {
    	  Command action=new BoardWriteFormAction();
		  view=action.command(request, response);
    	  
      }else if(command.equals("/BoardWriteAction.do")) {
    	  Command action=new BoardWriteAction();
		  view=action.command(request, response);
    	  
      }else if(command.equals("/BoardViewAction.do")) {//선택된 글 상세페이지
    	  Command action=new BoardWriteAction();
		  view=action.command(request, response);
    	 
    	 
      }else if(command.equals("/BoardView.do")) {//글 상세페이지 출력
    	  Command action=new BoardWriteAction();
		  view=action.command(request, response);
    	 
    	  
      }else if(command.equals("/BoardUpdateAction.do")) {//글 상세페이지 출력
    	  Command action=new BoardUpdateAction();
		  view=action.command(request, response);
    	  
	}else if(command.equals("/BoardDeleteAction.do")) {
		Command action=new BoardDeleteAction();
		  view=action.command(request, response);
	}
	  rd=request.getRequestDispatcher(view);
	  rd.forward(request, response);
	}
	
 

	
	
	

	

	
}