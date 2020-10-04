<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%><%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>회원 등록 처리</title>
</head>
<body>
<%  //한글 문자셋 설정
    request.setCharacterEncoding("utf-8");
    String name=request.getParameter("name");
    String passwd=request.getParameter("passwd");
	//1.드라이버 로딩
	Connection con=null;
	try{
	  Class.forName("com.mysql.jdbc.Driver");	
	//2.연결객체 생성
	  String url="jdbc:mysql://localhost:3306/WebMarketDB?useSSL=false";
	  String user="root";
	  String password="1234";
	   con=DriverManager.getConnection(url, user, password);
	//3.쿼리객체 생성
	Statement stmt=con.createStatement();
	//4.쿼리 실행 및 결과 받기
	//4-1. 데이타 입력 쿼리 
	 String sql="insert into member(name,passwd) values('"+name+"','"+passwd+"')";
	 System.out.println("쿼리문:"+sql);
	//4-2. 입력처리, executeUpdate()의 결과는 반영된 행의 수
	 int result=stmt.executeUpdate(sql);
	
	//5.결과 처리
	 if(result>0){
		 out.print("<script>alert('입력성공!');");
		 out.print("</script>");
	 }else{
		 out.print("<script>alert('입력실패!');");
		 out.print("history.back();");
		 out.print("</script>");
	 }
	}catch(Exception e){
		e.printStackTrace();
	}
	//6.자원해제
	con.close();
%>
</body>
</html>