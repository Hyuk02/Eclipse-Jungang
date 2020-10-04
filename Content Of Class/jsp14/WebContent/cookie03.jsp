<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Cookie정보 삭제</title>
</head>
<body>
<%
    //클라언트로부터 넘어온 request객체로 부터 쿠키 얻기
	Cookie[] cookies = request.getCookies();
    
   //개별 쿠키별로 유효시간을 0으로 처리 쿠키.setMaxAge(0);
   for(int i=0;i<cookies.length;i++){
	   cookies[i].setMaxAge(0);// 클라이언트가 response를 받은 즉시삭제
	   response.addCookie(cookies[i]);
   }
   response.sendRedirect("cookie_read.jsp");
%>
</body>
</html>