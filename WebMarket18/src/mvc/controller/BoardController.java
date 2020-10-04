package mvc.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//초기화 처리
	private Map<String,Command> commandMap=new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String conf=config.getInitParameter("config");
		Properties props = new Properties();
		FileInputStream fi=null;
		try {
			  fi=new FileInputStream(conf);
			  props.load(fi);
		}catch(Exception e) {
			throw new ServletException();
		}finally {
			try {
				if(fi!=null) fi.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//finally끝.
		//String commandName = props.getProperty("/BoardListAction.do");
		//System.out.println("commandName:"+commandName);
		Iterator keys=props.keySet().iterator();
		while(keys.hasNext()) {
			String command =(String)keys.next();
			String className=props.getProperty(command);
			try {
			Class clazz = Class.forName(className);
			Command commandInstance =(Command)clazz.newInstance();
			commandMap.put(command,commandInstance);
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, 
			              HttpServletResponse response) throws ServletException, IOException {
		command(request, response);
	}
	
	public void command(HttpServletRequest request, 
			              HttpServletResponse response)throws ServletException,IOException {
      		
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
		Command action=null; 
		try {
				action = (Command)commandMap.get(command);
				view=action.command(request, response);
				
				rd=request.getRequestDispatcher(view);
				rd.forward(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}	
	}

}