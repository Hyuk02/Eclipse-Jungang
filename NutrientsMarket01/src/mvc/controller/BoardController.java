package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* url로 부터 요청 정보 얻기 */
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		/* 문자셋 설정 */
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html><body>" + request.getRequestURL() + "<br>" + requestURI + "<br>" + contextPath + "<br>"
				+ command + "</body></html>");

		
		  //요청command에 따른 분기작업 
		RequestDispatcher rd=null;
		  if(command.equals("/BoardListAction.bo")) { //db에서 조회한 글 리스트를 request에 저장
			  requestBoardList(request); 
			  rd = request.getRequestDispatcher("./board/list.jsp"); 
		  }else if(command.equals("/BoardWriteFormAction.bo")) { 
			  requestGetName(request); 
			  rd= request.getRequestDispatcher("./board/writeForm.jsp");
		  }else if(command.equals("/BoardWriteAction.bo")) { //form에 넘어온 새글 db저장
			  requestBoardWrite(request); //db에 저장된 리스트 조회한 후 request에 저장
			  rd=request.getRequestDispatcher("/BoardListAction.bo"); 
		  }else if(command.equals("/BoardViewAction.bo")) {//선택된 글 상세페이지
		  requestBoardView(request); rd=request.getRequestDispatcher("/BoardView.bo");
		  }else if(command.equals("/BoardView.bo")) {//글 상세페이지 출력
		  rd=request.getRequestDispatcher("./board/view.jsp"); }else
		  if(command.equals("/BoardUpdateAction.bo")) {//글 상세페이지 출력 //update내용db에 저장하기
		  requestBoardUpdate(request);
		  rd=request.getRequestDispatcher("/BoardListAction.bo"); 
		  }else if(command.equals("/BoardDeleteAction.bo")) {
				//삭제처리
			  requestBoardDelete(request);
			//게시글 리스트로 이동
			rd=request.getRequestDispatcher("/BoardListAction.bo");
		} 
		  
		  
		  rd.forward(request,response);
		 
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

	// update정보 db에 저장하기
	private void requestBoardUpdate(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		// 리스트로 되돌갈때 원래 페이지로 가기위한 값
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		// db에서 정보 얻기
		BoardDTO board = new BoardDTO();
		board.setNum(num);
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
		board.setFileName(request.getParameter("fileName"));

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String write_day = formatter.format(new Date());

		board.setWrite_day(write_day);

		dao.updateBoard(board);

		// view로 정보를 넘기기위한 설정
		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("board", board);

	}

	// 글 상세 페이지 가져오기
	private void requestBoardView(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		// 리스트로 되돌갈때 원래 페이지로 가기위한 값
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		// db에서 정보 얻기
		BoardDTO board = new BoardDTO();
		board = dao.getBoardByNum(num, pageNum);

		// view로 정보를 넘기기위한 설정
		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("board", board);
	}

	// 새글 등록 메소드
	private void requestBoardWrite(HttpServletRequest request){


		String realFolder = "./resources/images"; //웹 어플리케이션 상의 절대 경로
		String encType = "UTF-8";
		int maxSize = 5*1024*1024;
		String fileName = null;
		
		try {
			MultipartRequest multi = new MultipartRequest(request,
					getServletContext().getRealPath(realFolder),
					maxSize, encType, new DefaultFileRenamePolicy());
			
			Enumeration<String> files = multi.getFileNames();
			String fname = (String)files.nextElement();
			fileName = multi.getFilesystemName(fname);
			
			// DB저장객체 생성
			BoardDAO dao = BoardDAO.getInstance();

			BoardDTO board = new BoardDTO();		
			
			board.setId(multi.getParameter("id"));
			board.setSubject(multi.getParameter("subject"));
			board.setProduct(multi.getParameter("product"));
			board.setContent(multi.getParameter("content"));
			board.setFileName(fileName);

			System.out.println(board.getId());
			System.out.println(board.getSubject());
			System.out.println(board.getProduct());
			System.out.println(board.getContent());
			System.out.println(board.getFileName());

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			String write_day = formatter.format(new Date());

			board.setHit(0);
			board.setWrite_day(write_day);

			dao.insertBoard(board);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		
		


	}

	private void requestGetName(HttpServletRequest request) {
		String id = request.getParameter("id");
		BoardDAO dao = BoardDAO.getInstance();
		String name = dao.getNameById(id);
		request.setAttribute("name", name);
	}

	// 등록된 글 목록 가져오기 - 한페이지당 5개의 글 출력
	private void requestBoardList(HttpServletRequest request) {
		// DB와 접속하여데이타를 가져오는 객체
		BoardDAO dao = BoardDAO.getInstance();
		// db로 부터 가져온 게시글 정보를 담을 리스트 생성
		List<BoardDTO> boardList = new ArrayList<>();
		// 출력할 게시글 리스트의 초기화 작업
		int pageNum = 1;// 최초 페이지는 1PAGE로 설정
		int limit = LISTCOUNT;// 한 페이지당 출력 갯수 설정
		// 페이지리스트에서 해당 페이지를 클릭했을 때 해당 페이지가 넘어옴
		if (request.getParameter("pageNum") != null)
			pageNum = Integer.parseInt(request.getParameter("pageNum"));

		// 검색조건을 받는 변수 선언
		String items = request.getParameter("items");
		// 검색 내용을 받는 변수
		String text = request.getParameter("text");

		// 조회된 전체 글의 수
		int total_record = dao.getListCount(items, text);

		// 검색내용과 페이지번호,페이지당 글갯수(5),검색조건
		boardList = dao.getBoardList(pageNum, limit, items, text);

		// 검색에 의해 조회된 전체 페이지 수
		int total_page;

		// 전체 글 건수 % 페이지당 글 갯수 나머지
		if (total_record % limit == 0) {// 나머지가 없는 경우
			total_page = total_record / limit;// 정수/정수=정수
		} else {// 나머지가 있는 경우
			total_page = total_record / limit;// 정수/정수=정수
			total_page = total_page + 1;// 자투리가 있는 경우 한페이 추가
		}

		// seqment단위로 페이지 처리하기
		int pageLength = 5;// 한 화면에 5개페이지씩 보이도록 설정
		int currentBlock = pageNum % pageLength == 0 ? pageNum / pageLength : (pageNum / pageLength) + 1;
		// 현재 화면에 보여지는 페이지의 첫째 페이지번호
		int startPage = 1 + (currentBlock - 1) * pageLength;// 1,6
		int endPage = startPage + pageLength - 1;// 5,10,
		int total_segment = (total_record % (limit * pageLength) == 0) ? total_record / (limit * pageLength)
				: (total_record / (limit * pageLength) + 1);

		// 글 조회후 마지막페이지 보정
		endPage = endPage > total_page ? total_page : endPage;

		// 결과를 view에 전달하기위해 request에 저장
		request.setAttribute("pageNum", pageNum);// 페이지번호
		request.setAttribute("total_page", total_page);// 전체 페이지 수
		request.setAttribute("total_record", total_record);// 전체 건수
		request.setAttribute("boardlist", boardList);// 해당페이지에 출력할 글목록
		// 검색조건추가에 따른 조건,검색내용 추가 전달
		request.setAttribute("items", items);
		request.setAttribute("text", text);

		// segment처리 파라미터 설정
		request.setAttribute("currentBlock", currentBlock);// 현재 화면의 블럭
		request.setAttribute("startPage", startPage);// 현재화면의 시작페이지
		request.setAttribute("endPage", endPage);// 현재화면의 끝페이지
		request.setAttribute("total_segment", total_segment);// 전체 블럭수
	}
	
	
}