<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>jstl</title>
</head>
<body>
<c:url var="url1" value="../shopping.do"/>
<c:url var="url2" value="/shopping.do">
    <c:param name="Add" value="isdn-001"/>
</c:url>
<%-- 이동할 url경로 지정 --%>
<c:url var="url3" 
   value="http://localhost:8080/jsp17/core06-gugu.jsp"/>
<%-- 지정경로로 이동 할 링크택의 href값으로 사용 --%>   
 <a href="${url3}">${url3}</a>
</body>
</html>