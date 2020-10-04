<%@page import="java.sql.ResultSet"%><%@page import="java.sql.Statement"%><%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection con=null;
try {
	 Class.forName("com.mysql.jdbc.Driver");
	 con=DriverManager
		.getConnection("jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false"
		               , "root"
		               , "1234");
	  if(con!=null) out.println("연결 성공");
	  
	  Statement stmt = con.createStatement();
	  String sql
	      ="select name, passwd from member order by name desc";
	  ResultSet rs=stmt.executeQuery(sql);
	  out.print("<table border='1'>");
	  out.print("<tr><th>이름</th><th>비밀번호</th></tr>");
	  while(rs.next()){
		  out.println("<tr><td>"+rs.getString(1)
		              +"</td><td>"+rs.getString(2)+"</td></tr>");
	  }
	  out.print("</table>");
}catch(Exception e) {
	e.printStackTrace();
}finally{
	con.close();
}

%>