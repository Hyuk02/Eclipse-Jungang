<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <%
      request.setAttribute("message", "forward.jsp페이지에서 이동했어요.");
  	 RequestDispatcher rd
  	    =request.getRequestDispatcher("forwarded.jsp");
     rd.forward(request, response);
  %>
</body>
</html>