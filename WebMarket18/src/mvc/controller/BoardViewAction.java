package mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardViewAction implements Command {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		requestBoardView(request);
		return "/BoardView.do";
	}
	//글 상세 페이지 가져오기
		private void requestBoardView(HttpServletRequest request) {
		BoardDAO dao=BoardDAO.getInstance();
		//리스트로 되돌갈때 원래 페이지로 가기위한 값
		int num=Integer.parseInt(request.getParameter("num"));
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		
		//db에서 정보 얻기
		BoardDTO board=new BoardDTO();
		board=dao.getBoardByNum(num,pageNum);
		
		//view로 정보를 넘기기위한 설정
		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("board", board);
		}


}
