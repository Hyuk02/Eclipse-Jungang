<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>timeZone</title>
</head>
<body>
<f:set var="now" value="<%=new java.util.Date() %>"/>
<f:out value="${now}"/><br><br>

<fmt:timeZone value="Hongkong">
	<fmt:formatDate value="${now}" type="both" 
	            dateStyle="long" timeStyle="short"/>
</fmt:timeZone>
<br>
<fmt:timeZone value="Beijing">
	<fmt:formatDate value="${now}" type="both" 
	            dateStyle="full" timeStyle="full"/>
</fmt:timeZone>


</body>
</html>