<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title>
</head>
<body>
<!-- db연결모듈만 include해서 실행 -->
<%@ include file="dbcpTest.jsp"%>
<%
     try{
     request.setCharacterEncoding("utf-8");
     String name=request.getParameter("name");
     String passwd=request.getParameter("passwd");
     
     String sql="insert into member(name,passwd) values(?,?)";
     PreparedStatement pstmt=con.prepareStatement(sql);
     pstmt.setString(1,name);
     pstmt.setString(2,passwd);
     
     int result = pstmt.executeUpdate();
     if(result>0){
    	 out.print("<script>alert('입력성공');</script>");
    	 out.print("<script>location.href='memberlistdbcp.jsp'</script>");
     }else{
    	 out.print("<script>alert('입력실패');</script>");
     }
     }catch(Exception e){
    	 e.printStackTrace();
     }finally{
    
    	 con.close();
     }
%>
</body>
</html>