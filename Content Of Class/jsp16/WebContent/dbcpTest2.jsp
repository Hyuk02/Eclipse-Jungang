<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>dbcp</title>
</head>
<body>
<%
	Connection con=null;
try{
	   
	// Obtain our environment naming context
	Context initCtx = new InitialContext();
	Context envCtx = (Context) initCtx.lookup("java:comp/env");

	// Look up our data source
	DataSource ds = (DataSource)envCtx.lookup("jdbc/MysqlDB");
    //연결맺기
	con=ds.getConnection();
    
	out.print("<h3>연결되었습니다.</h3>");
	
}catch(Exception e){
	out.print("<h3>연결에 실패하였습니다.</h3>");
	e.printStackTrace();
}finally{
	if(con!=null) con.close();
}

%>

</body>
</html>