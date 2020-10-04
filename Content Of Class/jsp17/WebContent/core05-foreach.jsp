<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>jstl</title>
</head>
<body>
<%-- 배열을 저장하는 변수 선언 --%>
<c:set var="intArray" value="<%=new int[]{1,2,3,4,5} %>"/>

<c:forEach var="i" items="${intArray}" 
                  begin="2" end="4" varStatus="status">
<%-- status.index:인덱스번호, status.count:실행회수, ${i}객체의 index번호에 해당하는 값 --%>  
<%-- status.first:첫번째 인지여부(true/false)
	 status.last:마지막인지 여부(true/false)
	 status.current:현재 값
 --%>                
  ${status.index}-${status.count} -[${i}]
  -${status.first}-${status.last}-${status.current}<br>
</c:forEach>

</body>
</html>