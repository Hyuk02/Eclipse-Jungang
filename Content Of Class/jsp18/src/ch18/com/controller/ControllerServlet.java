package ch18.com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch18.com.model.LoginBean;


public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /* url요청이 get방식일때 처리 메소드*/
	protected void doGet(HttpServletRequest request, 
			             HttpServletResponse response) 
			              throws ServletException, IOException {
		doPost(request,response);
	}

    /* url요청이 post방식일때 처리 메소드*/
	protected void doPost(HttpServletRequest request, 
			              HttpServletResponse response) 
			               throws ServletException, IOException {
	 /* 요청에 대한 응답으로 전달되는 콘텐츠의 MIME타입과 문자셋 설정 */	
     response.setContentType("text/html; charset=UTF-8");
     /* url요청으로 넘어온 파라미터 받기 */
     String id=request.getParameter("id");
     String password=request.getParameter("passwd");
     
     /* 모델을 이용하여 로그인시 패스워드 맞는지 여부 확인 */
     LoginBean bean = new LoginBean();
     
     bean.setId(id);
     bean.setPasswd(password);
     
     /* 이동한 뷰에서 사용하위한 객체를  request에 저장 */
     request.setAttribute("bean", bean);
     
     boolean status=bean.validate();
     
     //비밀번호 맞는지 여부에 따른 결과 페이지 분기 처리
     if(status) {//패스워드가 "admin" 인경우
    	 RequestDispatcher rd
    	      =request.getRequestDispatcher("mvc_success.jsp");
    	 rd.forward(request, response);
     }else {//패스워드가 "admin"이 아닌 경우
    	 RequestDispatcher rd
    	     =request.getRequestDispatcher("mvc_error.jsp");
    	 rd.forward(request, response);
     }
	}
}
