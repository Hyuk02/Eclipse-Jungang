<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="../dbconn.jsp"%>
<%
   request.setCharacterEncoding("UTF-8");
   String categoryName=request.getParameter("categoryName").trim();
   String description=request.getParameter("description").trim();
   //System.out.println("입력내용:"+categoryName+" "+description);
   //db에 저장
   String sql
     ="insert into category(categoryName,description) values(?,?)";
   PreparedStatement pstmt=con.prepareStatement(sql);
   pstmt.setString(1, categoryName);
   pstmt.setString(2, description);
   
   int result = pstmt.executeUpdate();
   
   response.sendRedirect("./adminPage.jsp");
%>