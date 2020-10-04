<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--  스크립틀릿 --%>
<%  String message=(String)request.getAttribute("message"); %><br>
인사말:<%=message %><br>
현재시간:${now}<%-- el표현식 --%>
</body>
</html>