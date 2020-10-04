<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>jstl</title>
</head>
<body>
<c:catch var="ex">
<c:import url="http://search.daum.net/search" 
           charEncoding="utf-8" var="daumNews" scope="request">  
           <c:param name="w" value="tot"/>
           <c:param name="DA" value="23A"/>   
           <c:param name="rtmaxcoll" value="NNS"/>   
           <c:param name="q" value="축구"/>   
</c:import>
</c:catch>
${ex}
<%-- import태그에서 선언한 변수로 내용 출력 --%>
${daumNews}

</body>
</html>