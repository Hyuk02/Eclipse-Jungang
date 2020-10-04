<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="../dbconn.jsp"%>
<%
   request.setCharacterEncoding("UTF-8");
   String brandName=request.getParameter("brandName");
   String description=request.getParameter("description");
   //db에 저장
   String sql
     ="insert into brand(brandName,description) values(?,?)";
   PreparedStatement pstmt=con.prepareStatement(sql);
   pstmt.setString(1, brandName);
   pstmt.setString(2, description);
   
   int result = pstmt.executeUpdate();
   
   response.sendRedirect("./adminPage.jsp");
%>