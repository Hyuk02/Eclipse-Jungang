package mvc.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.management.RuntimeErrorException;

import mvc.database.DBConnection;

/*data access Object */
public class BoardDAO {
	//자신타입의 필드 선언
	private static BoardDAO instance;
	//default생성자 캡슐화
	private BoardDAO() {}
	//자신타입의 인스턴스 제공 메소드
	public static BoardDAO getInstance() {
		if(instance==null) instance=new BoardDAO();
		return instance;
	}
	//조회된 board테이블의 레코드(row)건수 
	public int getListCount(String items, String text) {
	 //DB접속객체 생성
	 Connection con=null;
	 PreparedStatement pstmt=null;
	 ResultSet rs=null;
	 
	 //조회건수 저장 변수 선언
	 int x=0;
	 String sql="";
	 //매개변수로 넘어온 검색조건 과 검색내용을 분석하여 쿼리 작성
	 //검색조건이 없을 때
		if(items==null || text.trim().length()==0)
		 sql="select count(*) from board";
		else //검색조건이 있을 때
			sql="select count(*) from board where " + items+" like '%"+text+"%'";
	 System.out.println("sql:"+sql);
	 
     try {
    	   //DB연결하기
    	   con=DBConnection.getInstance().getConnection();
    	   //쿼리실행
    	   pstmt=con.prepareStatement(sql);
    	   //결과받기
    	   rs=pstmt.executeQuery();
    	   //결과처리
    	   if(rs.next()) x=rs.getInt(1);
    	 
     }catch(Exception e) {//예외처리
    	 System.out.println("getListCount()에러:"+e);
     }finally {// 
    	 try {//자원해제 처리
    		 if(rs!=null) rs.close();
    		 if(pstmt!=null) pstmt.close();
    		 if(con!=null)con.close();
    	 }catch(Exception e) {
    		 throw new RuntimeException(e.getMessage());
    	 }
     }
		return x;//조회 건수 리턴
	}
	
	//조회 목록 리턴 메소드
	public List<BoardDTO> getBoardList(int pageNum, int limit, String items, String text) {
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  ResultSet rs=null;
	  
	  //글 전체 건수 가져오기
	  int total_record=getListCount(items, text);
	  //시작페이지의 글 번호
	  int start=(pageNum-1)*limit;//파라미터로 넘어온 페이지와 페이지당 건수를 곱하여 시작글번호 지정
	  //
	  int index=start+1;
	  
	  //조건에 따른 쿼리문 생성
	  String sql="";	 
	  //검색 내용이 없을 때
	 if(items==null || text.trim().length()==0)
		sql="select * from board order by num desc";
	 else //검색조건이 있을 때
		sql="select * from board where " + items+" like '%"+text+"%' order by num desc";
	  
	  //view로 보낼 게시글 리스트객체 생성
	  ArrayList<BoardDTO> list=new ArrayList<BoardDTO>();
	  try {
		  //db연결맺기
		   con=DBConnection.getInstance().getConnection();
		   pstmt=con.prepareStatement(sql);
		   rs=pstmt.executeQuery();
		   while(rs.absolute(index)) {//한행씩 전진
		      BoardDTO board=new BoardDTO();
		      //board빈에 결과 값 설정
		      board.setNum(rs.getInt("num"));
		      board.setId(rs.getString("id"));
		      board.setName(rs.getString("name"));
		      board.setSubject(rs.getString("subject"));
		      board.setContent(rs.getString("content"));
		      board.setRegist_day(rs.getString("regist_day"));
		      board.setHit(rs.getInt("hit"));
		      board.setIp(rs.getString("ip"));
		     
		      //리스트에 추가
		      list.add(board);
		      
		      //한페이지 글 제한 갯수(5)이내면 증가
		      if(index<(start+limit) && index <=total_record)
		    	  index++;
		      else//한페이지를 채우면 종료
		    	  break;
		   }
	  }catch (Exception e) {
		System.out.println("getBoardList()에러:"+e);
	}finally {// 
   	 try {//자원해제 처리
		 if(rs!=null) rs.close();
		 if(pstmt!=null) pstmt.close();
		 if(con!=null)con.close();
	 }catch(Exception e) {
		 throw new RuntimeException(e.getMessage());
	 }
   }
	return list;//조회 리스트 리턴
	}
	
	public String getNameById(String id) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String name="";
		try {
			  con=DBConnection.getInstance().getConnection();
			  String sql="select name from member where id=?";
			  pstmt=con.prepareStatement(sql);
			  pstmt.setString(1,id);
			  rs=pstmt.executeQuery();
			  
			  if(rs.next()) {
				  name=rs.getString(1);
			  }
		}catch(Exception e) {
			System.out.println("getNameById()에러:"+e);
		}finally {// 
	   	 try {//자원해제 처리
			 if(rs!=null) rs.close();
			 if(pstmt!=null) pstmt.close();
			 if(con!=null)con.close();
		 }catch(Exception e) {
			 throw new RuntimeException(e.getMessage());
		 }
	   }
  	return name;
  }
	public void insertBoard(BoardDTO board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			  con=DBConnection.getInstance().getConnection();
	String sql="insert into board(id,name,subject,content,regist_day,hit,ip) values(?,?,?,?,?,?,?)";
	          //쿼리객체 새성
			  pstmt=con.prepareStatement(sql);		  
	          //파라미터 설정
	          pstmt.setString(1, board.getId());
			  pstmt.setString(2, board.getName());
			  pstmt.setString(3, board.getSubject());
			  pstmt.setString(4, board.getContent());
			  pstmt.setString(5, board.getRegist_day());
			  pstmt.setInt(6, board.getHit());
			  pstmt.setString(7,board.getIp());
			  
			  //update실행
			  pstmt.executeUpdate();
			  
		}catch(Exception e) {
			System.out.println("insertBoard()에러:"+e);
		}finally {// 
	   	 try {//자원해제 처리
			 if(pstmt!=null) pstmt.close();
			 if(con!=null)con.close();
		 }catch(Exception e) {
			 throw new RuntimeException(e.getMessage());
		 }
	   }
	}
	
	//board정보 리턴
	public BoardDTO getBoardByNum(int num, int pageNum) {
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		BoardDTO board=null;
		//조회수 증가 처리
		updateHit(num);
		try {
			  con=DBConnection.getInstance().getConnection();
			  String sql="select * from board where num=?";
			  pstmt=con.prepareStatement(sql);
			  pstmt.setInt(1,num);
			  rs=pstmt.executeQuery();
			  
			  if(rs.next()) {
				  board=new BoardDTO();
				  board.setNum(rs.getInt("num"));
				  board.setId(rs.getString("id"));
				  board.setName(rs.getString("name"));
				  board.setSubject(rs.getString("subject"));
				  board.setContent(rs.getString("content"));
				  board.setRegist_day(rs.getString("regist_day"));
				  board.setHit(rs.getInt("hit"));
				  board.setIp(rs.getString("ip"));
			  }
		}catch(Exception e) {
			System.out.println("getBoardByNum()에러:"+e);
		}finally {// 
	   	 try {//자원해제 처리
			 if(rs!=null) rs.close();
			 if(pstmt!=null) pstmt.close();
			 if(con!=null)con.close();
		 }catch(Exception e) {
			 throw new RuntimeException(e.getMessage());
		 }
	   }
		return board;// board리턴
	}
	
	//조회수 증가 메소드
	public void updateHit(int num) {
		//db연결객체 생성
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			 //db연결하기
			 con=DBConnection.getInstance().getConnection();
			 //쿼리문 작성
			 String sql="update board set hit=hit+1 where num=?";
			 //쿼리객체 생성
			 pstmt=con.prepareStatement(sql);
			 //바인딩변수처리
			 pstmt.setInt(1, num);
			 //dbupdate처리
			 pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("updateHit()에러:"+e);
		}finally {
		  try {
			  if(pstmt!=null) pstmt.close();
			  if(con!=null)con.close();
		  }catch(Exception e) {
			  throw new RuntimeException(e.getMessage());
		  }
		}
	}
	
	//글내용수정 메소드
	public void updateBoard(BoardDTO board) {
		Connection con=null;
		PreparedStatement pstmt=null;
		try {
			  con=DBConnection.getInstance().getConnection();
	String sql="update board set subject=?,content=?,regist_day=?,ip=? where num=?";
	          //쿼리객체 새성
			  pstmt=con.prepareStatement(sql);		  
	          //파라미터 설정
			  pstmt.setString(1, board.getSubject());
			  pstmt.setString(2, board.getContent());
			  pstmt.setString(3, board.getRegist_day());
			  pstmt.setString(4,board.getIp());
			  pstmt.setInt(5, board.getNum());
			  
			  //update실행
			  pstmt.executeUpdate();
			  
		}catch(Exception e) {
			System.out.println("updateBoard()에러:"+e);
		}finally {// 
	   	 try {//자원해제 처리
			 if(pstmt!=null) pstmt.close();
			 if(con!=null)con.close();
		 }catch(Exception e) {
			 throw new RuntimeException(e.getMessage());
		 }
	   }
	}
	//db에서 해당 글번호로 삭제처리
   public void deleteBoard(int num) {
     //DB연결객체 생성
	  Connection con=null;
	  PreparedStatement pstmt=null;
	  try {
		  //db연결하기
		  con=DBConnection.getInstance().getConnection();
		  String sql="delete from board where num=?";
		  //쿼리객체 생성
		  pstmt=con.prepareStatement(sql);
		  //바인딩변수 설정
		  pstmt.setInt(1,num);
		  //삭제 쿼리 실행
		  pstmt.executeUpdate();
	  }catch(Exception e) {
		  System.out.println("deleteBoard()오류발생:"+e);
	  }finally {//자원해제 처리 
		 try {
			 if(pstmt!=null) pstmt.close();
			 if(con!=null) con.close();
		 }catch(Exception e) {
			 throw new RuntimeException(e.getMessage());
		 }
	  }
	}
}