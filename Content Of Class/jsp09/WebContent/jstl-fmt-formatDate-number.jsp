<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Date now = new Date() -->
<jsp:useBean id="now" class="java.util.Date"/>
<p> 데이트 타임형식 <fmt:formatDate value="${now}" type="both"/>

<!-- "날짜형태의 문자열"을 Date로 변환 -->
<!-- String date = "20-10-2020"; -->
<c:set var="date" value="20-10-2020"/>
<fmt:parseDate value="${date}" var="parsedDate" pattern="dd-MM-yyyy"/>
<!-- Date().toString() -->
<p>parsed Date:<c:out value="${parsedDate}"/>

</body>
</html>