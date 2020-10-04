package mvc.database;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.util.Properties;

/* 싱글톤으로 작성*/
public class DBConnection {
	//자신타입의  instance필드
	private static DBConnection instance=new DBConnection();
	//생성자 캡슐화
	private DBConnection() {}
	//인스턴스 얻기 메소드
	public static DBConnection getInstance() {
		return instance;
	}
	//외부에서 접근가능한 getConnection()메소드 
	public Connection getConnection() {
		Connection con=null;
		String url="";
		String user="";
		String password="";
		
		try {	
		//file정보 얻기
		//File file=new File("C:\\jspworkspace\\WebMarket18\\src\\dbconnection.properties");
		File file=new File("C:\\Users\\admin\\git\\jsp06jsp07\\WebMarket18\\src\\dbconnection.properties");
		//속성,값 저장할 객체 생성
		Properties prop=new Properties();
		//파일정보를 읽을  통로생성
		FileReader fr=new FileReader(file);
		//저장
		prop.load(fr);
		//
		url=prop.getProperty("url");
		user=prop.getProperty("user");
		password=prop.getProperty("password");
	    //드라이버 메모리에 로딩
		Class.forName(prop.getProperty("driver"));
		//연결 맺기
		con=DriverManager.getConnection(url,user,password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
