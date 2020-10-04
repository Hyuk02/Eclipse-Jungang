<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
%>    
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title>
</head>
<body>
<%
    //1.드라이버 로드
     Connection con=null;
     try{
   //2.DB연결
     String url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false";
     String user="root";
     String password="1234";
     con=DriverManager.getConnection(url,user,password);
     //java프로그램은 default가 autocommit
     con.setAutoCommit(false);
     
   //3.쿼리객체 생성
    String sql="delete from member where id=?";
    System.out.println("sql:"+sql); 
   PreparedStatement pstmt=con.prepareStatement(sql);
    pstmt.setInt(1,Integer.parseInt(id));
    
   //4.실행및 결과 처리
     int result=pstmt.executeUpdate();//DB에 반영X, 메모리상의 처리
    
   if(result>0){
	       con.commit();//DB에 반영처리
    	   out.print("<script>alert('삭제 성공');</script>");
    	   out.print("<script>location.href='memberlist.jsp'</script>");
     }else{
    	 con.rollback();
    	 out.print("<script>alert('삭제 실패');</script>");
    	 out.print("<script>history.back();<script>");
     }
     }catch(Exception e){
    	 con.rollback();//되돌리기
    	 e.printStackTrace();
     }finally{
    	 //Default값으로 초기화
    	 con.setAutoCommit(true);
     }
%>
</body>
</html>