<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>jstl</title>
</head>
<body>
<c:out value="<" escapeXml="true"/><br>
<c:out value=">" escapeXml="true"/><br>
<c:out value="&" escapeXml="true"/><br>
<c:out value="''" escapeXml="true"/><br>
<c:out value='""' escapeXml="true"/><br>
&lt;<br>
&gt;<br>
&amp;<br>
&#039;&#039;<br>
&#034;&#034;<br>
<<br>
><br>

</body>
</html>