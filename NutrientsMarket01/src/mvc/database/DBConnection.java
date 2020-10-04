package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;

//싱글톤으로 작성
public class DBConnection {
	//자신타입의 instance필드
	private static DBConnection instance = new DBConnection();
	//생성자 캡슐화
	private DBConnection() {}
	//인스턴스 얻기 메소드
	public static DBConnection getInstance() {
		return instance;
	}
	//외부에서 접근가능한 getConnection()메소드
	public Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");//useSSL=false
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/NutrientsMarketDB?useSSL=false", "root", "1234");
			/* System.out.println("DB connection success"); */
		}catch (Exception e) {
			System.out.println("DB connection fail");
			e.printStackTrace();
		}
		
		return con;
	}
}
