package ch12.com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

public class AuthenFilter implements Filter {
	public void init(FilterConfig fConfig) 
			           throws ServletException {
		System.out.println("Filter01 초기화...(최초 1회만 실행)");
	}
	

	public void doFilter(ServletRequest request, 
			             ServletResponse response, 
			             FilterChain chain) throws IOException, ServletException {
        //doFilter()실행전 처리내용
		System.out.println("Filter01.jsp 수행...(url요청시 실행)");
		 request.setCharacterEncoding("utf-8");
		String name=request.getParameter("name");
        
        //넘어온 파라미터 값 확인 
        if(name==null || name.equals("")) {
        	//응답콘텐츠 생성 작업
        	//문자셋
        	response.setCharacterEncoding("utf-8");
        	//생성 페이지 타입 설정
        	response.setContentType("text/html; charset=utf-8");
        	//내용출력객체 생성 responses.getWriter()로 출력객체 생성
        	PrintWriter writer = response.getWriter();
        	String message = "입력된 name 값은 null입니다.";
        	//메세지 전송 print(메세지)
        	writer.println(message);
        	return;//return문에 의해 자원까지 request가 전달 안됨.
        }
        //필터가 1개, 자원으로 request전달 
		chain.doFilter(request, response);
	}

	public void destroy() {
		System.out.println("Filter01 해제...(1회만 실행)");
		
	}

}
