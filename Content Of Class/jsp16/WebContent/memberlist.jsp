<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  //1.db 드라이버 로딩,
  Connection con=null;
  try{
	  Class.forName("com.mysql.jdbc.Driver");
  //2.연결 맺기
      String url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false";
	  String user="root";
	  String password="1234";
      con=DriverManager.getConnection(url, user, password);
  //3.statment문 생성
   Statement stmt=con.createStatement();
  //4.쿼리실행 및 결과 처리
    String sql="select id,name,passwd from member order by id";
    ResultSet rs=stmt.executeQuery(sql);    
%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>회원리스트</title>
</head>
<body>
   <%
   out.print("<table border=1>");
   out.print("<tr><th>아이디</th><th>이름</th><th>비번</th></tr>");
      while(rs.next()){
    out.print("<tr>");	  
    out.print("<td><a href='updateForm.jsp?id="+rs.getInt(1)+"'>"+rs.getInt(1)+"</a></td>");
    out.print("<td>"+rs.getString(2)+"</td>");
    out.print("<td>"+rs.getString(3)+"</td>");	  
    out.print("</tr>");	  
      }
   out.print("</table>");   
   %>
</body>
</html>
<%
  }catch(Exception e){
	  e.printStackTrace();
  }finally{
	  con.close();
  }
%>