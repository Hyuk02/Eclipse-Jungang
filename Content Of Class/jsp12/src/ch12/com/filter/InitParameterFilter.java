package ch12.com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class InitParameterFilter implements Filter {
	//web.xml에 등록된 초기화 정보얻기위한 변수 선언
	private FilterConfig filterConfig = null;
	
	//init()에서 정보 얻기
   public void init(FilterConfig fConfig) 
		           throws ServletException {
	   System.out.println("Filter02 초기화...(최초1회 실행)");
	   //web.xml에 등록된 초기화 정보얻기
		this.filterConfig=fConfig;
	}
	public void destroy() {
		System.out.println("Filter02 해제...(서버에서 제거시 실행)");
	}

	public void doFilter(ServletRequest request, 
			             ServletResponse response, 
			             FilterChain chain) throws IOException, 
	                       ServletException {
    System.out.println("Filter02 수행....(자원 요청시 마다)");
    
    String id=request.getParameter("id");
    String passwd=request.getParameter("passwd");
    
    //init()메소드에서 얻은 초기화 정보를 파라미터명으로 얻기
    //getInitParameter(파라미터명);
    String param1=filterConfig.getInitParameter("param1");
    String param2=filterConfig.getInitParameter("param2");
    System.out.println("param1:"+param1);
    System.out.println("param2:"+param2);
    
    String message;
    
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
	PrintWriter writer = response.getWriter();
	
	if(id.equals(param1) && passwd.equals(param2)) {
		message ="로그인 성공했습니다.";
	}else {
		message = "로그인 실패했습니다.";
	}
	    //메세지 출력
	    writer.print(message);
	
	    //자원으로 request를 보냄
		chain.doFilter(request, response);
	}

	

}
