package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionTest3 {
	public static void main(String[] args) {
		Connection con=null;
		try {
			 Class.forName("com.mysql.jdbc.Driver");
			 con=DriverManager
				.getConnection("jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false"
				               , "root"
				               , "1234");
			  if(con!=null) System.out.println("연결 성공");
			
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
