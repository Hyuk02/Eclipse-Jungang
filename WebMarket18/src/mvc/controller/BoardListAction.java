package mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardListAction implements Command {
	 static final int LISTCOUNT=5;
	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		requestBoardList(request);
		return "./board/list.jsp";
	}
	//등록된 글 목록 가져오기 - 한페이지당 5개의 글 출력
		private void requestBoardList(HttpServletRequest request) {
		//DB와 접속하여데이타를 가져오는 객체	
		 BoardDAO dao = BoardDAO.getInstance();
		 //db로 부터 가져온 게시글 정보를 담을 리스트 생성
		 List<BoardDTO> boardList = new ArrayList<>();
		 //출력할 게시글 리스트의 초기화 작업
		 int pageNum=1;//최초 페이지는 1PAGE로 설정
		 int limit=LISTCOUNT;//한 페이지당 출력 갯수 설정
		 //페이지리스트에서 해당 페이지를 클릭했을 때 해당 페이지가 넘어옴
		 if(request.getParameter("pageNum")!=null)
			 pageNum=Integer.parseInt(request.getParameter("pageNum"));
		 
		 //검색조건을 받는  변수 선언
		 String items=request.getParameter("items");
		 //검색 내용을 받는 변수
		 String text=request.getParameter("text");
		 
		 //조회된 전체 글의 수
		 int total_record=dao.getListCount(items,text);
		 
		 //검색내용과 페이지번호,페이지당 글갯수(5),검색조건
		 boardList=dao.getBoardList(pageNum,limit, items,text);
		 
		 //검색에 의해 조회된 전체 페이지 수
		 int total_page;
		 
		 //전체 글 건수 % 페이지당 글 갯수 나머지
		 if(total_record%limit==0) {//나머지가 없는 경우
			 total_page=total_record/limit;//정수/정수=정수
		 }else {//나머지가 있는 경우
			 total_page=total_record/limit;//정수/정수=정수
			 total_page = total_page+1;//자투리가 있는 경우 한페이 추가
		 }
		 
		 // segment단위로 페이지 처리하기
		 int pageLength=5;//한 화면에 5개페이지씩 보이도록 설정
		 int currentBlock=pageNum%pageLength==0?pageNum/pageLength:(pageNum/pageLength)+1;
		 
		 //현재 화면에 보여지는 페이지의 첫재페이지번호
		 int startPage=1+(currentBlock-1)*pageLength;//1,6
		 int endPage = startPage + pageLength -1;//5,10,
		 int total_segment=
	  (total_record%(limit*pageLength)==0)?
	    total_record/(limit*pageLength):
		 (total_record/(limit*pageLength)+1);
		 
		 //글 조회후 마지막페이지 보정
		 endPage=endPage>total_page?total_page:endPage;
		 
		 //결과를 view에 전달하기위해 request에 저장
		 request.setAttribute("pageNum", pageNum);// 페이지번호
		 request.setAttribute("total_page", total_page);// 전체 페이지 수
		 request.setAttribute("total_record", total_record);//전체 건수
		 request.setAttribute("boardlist", boardList);//해당페이지에 출력할 글목록
	     //검색조건추가에 따른 조건,검색내용 추가 전달
		 request.setAttribute("items", items);
		 request.setAttribute("text", text);
		 //segment처리 파라미터 설정
		 request.setAttribute("currentBlock", currentBlock);//현재화면의 블럭
		 request.setAttribute("startPage",startPage);//현재화면의 시작페이지
		 request.setAttribute("endPage",endPage);//현재화면의 끝페이지
		 request.setAttribute("total_segment",total_segment);//전체 블럭수
		}

}
