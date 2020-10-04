<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	Connection con = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");//useSSL=false
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/NutrientsMarketDB?useSSL=false", "root", "1234");
	}catch (Exception e) {
		out.println("DB connection fail");
		e.printStackTrace();
	}
%>