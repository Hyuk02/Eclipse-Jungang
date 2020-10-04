<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>JSTL SQL</title>
<%@ include file="dbconn3.jsp" %>
</head>
<body>
     
<%--쿼리객체 생성 --%>
<sql:query var="resultSet" dataSource="${dataSource}">
   select * from member
</sql:query>

<%--결과 출력하기 --%>

<table border="1">
 <tr>
 <th>순번</th>
 <%-- resultSet.columNames속성:메타정보-칼럼명  --%>
 <c:forEach var="columnName" items="${resultSet.columnNames}">
    <th width="100"><c:out value="${columnName}"/></th>
 </c:forEach>
 </tr>
 <%-- rowsByIndex 순서대로 저장된행의 값 속성 --%>
 <c:forEach var="row" items="${resultSet.rowsByIndex}" varStatus="i">
  <tr>
    <td>${i.count}</td>
    <c:forEach var="column" items="${row}" varStatus="j">
     <td>
     <c:if test="${column!=null}">
        <c:if test="${j.index==0}">
         <a href="sql03.jsp?id=${column}"><c:out value="${column}"/></a>
        </c:if>
        <c:if test="${j.index!=0}">
        <c:out value="${column}"/>
        </c:if>
     </c:if>
     <c:if test="${column==null}">
     	 &nbsp;
     </c:if>
     </td>
    </c:forEach>
  </tr>
 </c:forEach>
</table>
</body>
</html>







