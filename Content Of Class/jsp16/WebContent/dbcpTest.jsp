<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>dbcptest</title>
</head>
<body>
<%
    //연결객체 생성
	Connection con=null;
try{
	   //Context정보 얻기
	   Context init = new InitialContext();
	   //context정보에서 datasource정보 얻기
	   Context ctx =(Context)init.lookup("java:comp/env");
	   //이름이 "jdbc/MysqlDB"인 리소스 얻기
	   DataSource ds =(DataSource)ctx.lookup("jdbc/MysqlDB");
	   //연결설정
	   con=ds.getConnection();
	   out.print("<h3>연결되었습니다.</h3>");
}catch(Exception e){
	out.print("<h3>연결에 실패하였습니다.</h3>");
	e.printStackTrace();
}
%>
</body>
</html>