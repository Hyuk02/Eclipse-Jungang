package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;


public class ConnectionTest2 {
	public static void main(String[] args) {
		Connection con=null;
		try {
			  Class.forName("com.mysql.jdbc.Driver");
			  Properties props=new Properties();
			  props.put("user","root");
			  props.put("password","1234");
		con=DriverManager
		.getConnection("jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false"
				       ,props);
		if(con!=null) System.out.println("연결 성공!");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
