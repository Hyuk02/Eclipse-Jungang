<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Date now = new Date(); -->
<jsp:useBean id="now" class="java.util.Date"/>
<!-- DateTimeFormat() -->
<p>날짜 형식:<fmt:formatDate value="${now}" type="date"/><br>
<p>time 형식:<fmt:formatDate value="${now}" type="time"/><br>
<p>날짜time 형식:<fmt:formatDate value="${now}" type="both"/><br>

</body>
</html>