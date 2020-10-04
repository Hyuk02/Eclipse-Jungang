<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcpTest.jsp" %>
<%
    String sql="select * from member order by id";
	PreparedStatement pstmt=con.prepareStatement(sql);
	ResultSet rs=pstmt.executeQuery();
%>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table border="1">
    <tr><td>아이디</td><td>이름</td><td>비밀번호</td></tr>
    <%
     while(rs.next()){
     out.print("<tr><td><a href='memberDetail.jsp?id="
                         +rs.getInt(1)+"'>"+rs.getInt(1)
                 +"</a></td><td>"+rs.getString(2)
                 +"</td><td>"+rs.getString(3)
                 +"</td></tr>");	 
     }
    %>
    </table>
</body>
</html>