package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionTest1 {
  public Connection getConnection() { 
		Connection con=null;
		try {
			//드라이버 로딩
		   Class.forName("com.mysql.jdbc.Driver");
		   con=DriverManager
.getConnection("jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false&user=root&password=1234");
		   if(con!=null) System.out.println("연결 성공");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
