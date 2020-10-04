<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   String id=request.getParameter("id");
   String name=request.getParameter("name");
   String postcode=request.getParameter("postcode");
   String address=request.getParameter("address");
   String detailAddress=request.getParameter("detailAddress");
   String extraAddress=request.getParameter("extraAddress");
%> 
<%=id %><br>
<%=name %><br>
<%=postcode %><br>
<%=address %><br>
<%=detailAddress %><br>
<%=extraAddress %><br>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>