<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%><%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection con=null;
try {
	//드라이버 로딩
   Class.forName("com.mysql.jdbc.Driver");
   con=DriverManager
.getConnection("jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false&user=root&password=1234");
   if(con!=null) 
	   out.println("연결 성공<br>");
   //쿼리 객체 생성
   Statement statement = con.createStatement();
   String sql="select * from member where id=1";
   //쿼리결과 받기
   ResultSet rs=statement.executeQuery(sql);
   rs.next();
   out.print(rs.getInt(1)+","+rs.getString(2)
                         +","+rs.getString(3)+"<br>");
}catch(Exception e) {
	e.printStackTrace();
}finally{
	con.close();
}
%>