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
     
   //3.쿼리객체 생성
    String sql="delete from member where id="+id;
    System.out.println("sql:"+sql); 
   Statement stmt=con.createStatement();
    
   //4.실행및 결과 처리
     int result=stmt.executeUpdate(sql);
     if(result>0){
    	   out.print("<script>alert('삭제 성공');</script>");
    	   out.print("<script>location.href='memberlist.jsp'</script>");
     }else{
    	 out.print("<script>alert('삭제 실패');</script>");
    	 out.print("<script>history.back();<script>");
     }
     }catch(Exception e){
    	 e.printStackTrace();
     }
%>
</body>
</html>