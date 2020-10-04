package ch18.com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.ConnectionTest1;

public class LoginBean {
	//속성(property)
	private String id;
	private String passwd;
	//기본생성자(default생성자)
	public LoginBean() {}
	//getters/setters메소드
	public String getId() {	return id;	}
	public void setId(String id) {		this.id = id;	}
	public String getPasswd() {		return passwd;	}
	public void setPasswd(String passwd) {		this.passwd = passwd;	}
	
	//추가메소드
	public boolean validate() {
	  ConnectionTest1 conTest=new ConnectionTest1();
	  Connection con=conTest.getConnection();
	  String sql="select password from member where id=?";
	  try {
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1,id);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()) {
			if(passwd.equals(rs.getString(1)))
				return true;
			else
				return false;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return false;
	}
}
