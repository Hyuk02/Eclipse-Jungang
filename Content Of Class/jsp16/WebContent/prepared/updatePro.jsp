<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    //한글 문자셋 설정
    request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
    String name=request.getParameter("name");
    String passwd=request.getParameter("passwd");
	
    //1.드라이버 로딩
    Connection con=null;
    try{
    	Class.forName("com.mysql.jdbc.Driver");
    //2.연결맺기
 String url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false";
        String user="root";
        String password="1234";
        con=DriverManager.getConnection(url, user, password);
    //3.쿼리객체 생성
    String sql="update member set name=?,passwd=? where id=?";
    System.out.println("sql:"+sql);
    PreparedStatement pstmt=con.prepareStatement(sql);
   pstmt.setString(1,name);
   pstmt.setString(2,passwd);
   pstmt.setInt(3,Integer.parseInt(id));
    //4.쿼리실행 및 결과 처리
     int result=pstmt.executeUpdate();
    if(result>0){
     out.print("<script>alert('수정완료');</script>");
     out.print("<script>location.href='updateForm.jsp?id="+id+"'</script>");
    }else{
    	out.print("<script>alert('수정실패');</script>");
        out.print("<script>history.back();</script>");	
    }
    
    }catch(Exception e){
    	e.printStackTrace();
    }
%>
