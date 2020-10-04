package mvc.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardWriteAction implements Command {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		requestBoardWrite(request);
		return "/BoardListAction.do";
	}

	//새글 등록 메소드
		private void requestBoardWrite(HttpServletRequest request) {
			//DB저장객체 생성
		 BoardDAO dao=BoardDAO.getInstance();
		 
		 BoardDTO board=new BoardDTO();
		 board.setId(request.getParameter("id"));
		 board.setName(request.getParameter("name"));
		 board.setSubject(request.getParameter("subject"));
		 board.setContent(request.getParameter("content"));
		 
		 System.out.println(board.getId());
		 System.out.println(board.getName());
		 System.out.println(board.getSubject());
		 System.out.println(board.getContent());
		 
		 SimpleDateFormat formatter 
		   = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		 String regist_day=formatter.format(new Date());
		 
		 board.setHit(0);
		 board.setRegist_day(regist_day);
		 board.setIp(request.getRemoteAddr());//ip주소 
		 
		 dao.insertBoard(board);
		 
		}
}
