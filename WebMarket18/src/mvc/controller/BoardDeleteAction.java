package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;

public class BoardDeleteAction implements Command {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		requestBoardDelete(request);
		return "/BoardListAction.do";
	}

	 //게시글 삭제메소드
	  private void requestBoardDelete(HttpServletRequest request) {
	  //request로 넘어온 파라미터 처리
	   int num=Integer.parseInt(request.getParameter("num"));
	   int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		
	   //db에서 삭제 처리
	   BoardDAO dao=BoardDAO.getInstance();
	   dao.deleteBoard(num);
			
		}
}
