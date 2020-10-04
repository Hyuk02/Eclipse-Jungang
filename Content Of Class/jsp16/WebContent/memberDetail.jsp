<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbcpTest.jsp" %>
<%
    String id=request.getParameter("id");
    String sql="select * from member where id=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(id));
	ResultSet rs=pstmt.executeQuery();
	if(rs.next()){
%>    
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="updateMember.jsp" method="post">
    <p>아이디:<input type="text" name="" 
               disabled value="<%=rs.getInt(1)%>"> </p>
            <input type="hidden" name="id" 
              value="<%=rs.getInt(1)%>">
    <p>이름:<input type="text" name="name" 
              value="<%=rs.getString(2)%>">
    <p>비밀번호:<input type="password" name="passwd" id="passwd">
    <p>비밀번호 확인:<input type="password" name="passwd2" id="passwd2">          
    <p><input type="submit" value="수정" onclick="return check()">
    <p><input type="reset" value="취소">
    <p><input type="button" value="리스트로" onclick="golist()">            
    </form>
</body>
</html>
<%}%>
<script>
function golist(){
	location.href='memberlistdbcp.jsp';
}
function check(){
 var pwd1 = document.getElementById("passwd").value;
 var pwd2 = document.getElementById("passwd2").value;
 if(pwd1.length>0){
	 if(pwd1!=pwd2) {
		 alert("비번이  서로 다릅니다.");
		 document.getElementById("passwd").focus();
		 return false;
	 }
 }
}
</script>
