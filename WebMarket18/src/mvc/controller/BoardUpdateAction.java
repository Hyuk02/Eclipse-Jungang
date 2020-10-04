package mvc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardUpdateAction implements Command{

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		requestBoardUpdate(request);
		return "/BoardListAction.do";
	}
	
	//update정보 db에 저장하기
		private void requestBoardUpdate(HttpServletRequest request) {
			BoardDAO dao=BoardDAO.getInstance();
			//리스트로 되돌갈때 원래 페이지로 가기위한 값
			int num=Integer.parseInt(request.getParameter("num"));
			int pageNum=Integer.parseInt(request.getParameter("pageNum"));
			
			//db에서 정보 얻기
			BoardDTO board=new BoardDTO();
			board.setNum(num);
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));
			
			SimpleDateFormat formatter 
			   = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			 String regist_day=formatter.format(new Date());
			 
			 board.setRegist_day(regist_day);
			 board.setIp(request.getRemoteAddr());//ip주소 
			 
			 dao.updateBoard(board);
			
			//view로 정보를 넘기기위한 설정
			request.setAttribute("num", num);
			request.setAttribute("page", pageNum);
			request.setAttribute("board", board);
			
		}


}
