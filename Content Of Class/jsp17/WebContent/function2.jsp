<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>jstl</title>
</head>
<body>
<%-- String[] texts = {"Hello,","Java","Server","Pages!"} --%>
<c:set var="texts" value="${fn:split('Hello, Java Server Pages!',' ')}"/>
  <c:forEach var="i" begin="0" end="${fn:length(texts)-1}"
        varStatus="status">
       <p>text[${i}]=${texts[i]}-
       ${status.first}-${status.last}
       -${status.current}-${status.index}-${status.count}
  </c:forEach>
  <p><c:out value="${fn:join(texts,'-') }"/>
</body>
</html>