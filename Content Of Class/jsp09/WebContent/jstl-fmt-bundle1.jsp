<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title>
</head>
<body>
<p>---- fmt:bundle ----</p>
<fmt:bundle basename="ch09.com.bundle.myBundle.message">
 <p>제목:<fmt:message key="title" var="title"/>
         ${title}
 <p><fmt:message key="username" var="user"/>         
    이름:${user }
</fmt:bundle>
<br>
<%-- 로케일 en으로 변경 --%>
<fmt:setLocale value="en"/>
<fmt:bundle basename="ch09.com.bundle.myBundle.message">
 <p>제목:<fmt:message key="title" var="title"/>
         ${title}
 <p><fmt:message key="username" var="user"/>         
    이름:${user }
</fmt:bundle>

<p>----- setbundle ---- <p>
<fmt:setLocale value="ko"/> <!-- 로케일 ko -->
<fmt:setBundle basename="ch09.com.bundle.myBundle.message" 
                   var="resouceBundle"/>
<p>제목:<fmt:message key="title" bundle="${resouceBundle}"/>
<p>이름:<fmt:message key="username" bundle="${resouceBundle}"/>




</body>
</html>