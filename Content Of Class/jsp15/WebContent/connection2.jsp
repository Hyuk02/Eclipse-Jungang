<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection con=null;
try {
	  Class.forName("com.mysql.jdbc.Driver");
	  String path = "/dbconnection.properties";
	  String realPath=application.getRealPath(path);
	  out.print(realPath);
	   File file =new File(realPath);
	  FileReader read=new FileReader(file);
	  Properties props=new Properties();
	  props.load(read);
	  //props.put("user","root");
	  //props.put("password","1234");
con=DriverManager
.getConnection("jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false"
		       ,props);
if(con!=null) out.println("연결 성공!<br>");

Statement stmt = con.createStatement();
String sql="select * from member order by id";
ResultSet rs = stmt.executeQuery(sql);
while(rs.next()){
	out.print(rs.getInt(1)+"-"
          +rs.getString(2)+"-"+rs.getString(3)+"<br>");
}

}catch(Exception e) {
	e.printStackTrace();
}finally{
	con.close();
}

%>