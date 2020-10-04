<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcpTest.jsp"%>
<%
    request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id");
    String name=request.getParameter("name");
    String passwd=request.getParameter("passwd");
    PreparedStatement pstmt=null;
    String sql="";
    if(name!=null && !"".equals(name)){
    	sql="update member set name=? where id=?";
    	pstmt=con.prepareStatement(sql);	
    	pstmt.setString(1,name);
    	pstmt.setInt(2,Integer.parseInt(id));
    	pstmt.executeUpdate();
    	System.out.println("x");
    }
    if(passwd!=null && !"".equals(passwd)){
    	sql="update member set passwd=? where id=?";
    	pstmt=con.prepareStatement(sql);
    	pstmt.setString(1, passwd);
    	pstmt.setInt(2,Integer.parseInt(id));
    	pstmt.executeUpdate();
    	System.out.println("y");
    }
%>    
<script>
alert("수정완료");
location.href='memberDetail.jsp?id=<%=id%>';
</script>