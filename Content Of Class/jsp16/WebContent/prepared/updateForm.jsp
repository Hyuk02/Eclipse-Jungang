<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%><%@page import="java.sql.ResultSet"%><%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int id=Integer.parseInt(request.getParameter("id"));

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
 String sql="select id,name,passwd from member where id=?";
 PreparedStatement pstmt=con.prepareStatement(sql);
//4.쿼리실행 및 결과 처리
   pstmt.setInt(1, id);
  ResultSet rs=pstmt.executeQuery();    
  if(rs.next()){
%>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form action="updatePro.jsp" method="post">
  아이디: <input type="text" name="" value="<%=rs.getInt(1)%>" 
         disabled="disabled"><br>
       <input type="hidden" name="id" value="<%=rs.getInt(1)%>">  
 이름: <input type="text" name="name" value="<%=rs.getString(2)%>"><br>
 비밀번호: <input type="password" name="passwd" value="<%=rs.getString(3)%>"><br>
  <input type="submit" value="전송">
  <input type="reset" value="취소">
  <input type="button" 
   onclick="javascript:location.href='memberlist.jsp'" 
          value="리스트로 ">
  </form>
  <input type="button" value="삭제" 
       onclick="isdelete(<%=rs.getInt(1)%>)">
</body>
</html>
<% }}catch(Exception e){e.printStackTrace();} %>
<script>
function isdelete(id){
  var yesno=confirm(id+"를 삭제할까요?");
  if(yesno)
	  location.href='memberDelete.jsp?id='+id;
}
</script>




