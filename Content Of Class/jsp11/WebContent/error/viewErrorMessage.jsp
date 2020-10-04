<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>예외 발생</title>
</head>
<body>
<!-- 출력페이지 데이타 크기가 513바이트 보다 적으면 ie인 경우, ie자체 메세지 출력 -->
요청 처리 과정에서 예외가 발생하였습니다.<br>
빠른 시간내에 문제를 해결하도록 하겠습니다..
<p>
 에러타입:<%=exception.getClass().getName()%><br>
에러 메세지:<%=exception.getMessage() %><br>
예외 유형:<%=exception.toString() %><br>

</body>
</html>