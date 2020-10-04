<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>배송 상태 변경</title>
<script>
function updateStatus(seq){
	var no=document.getElementById("seq"+seq).value;
	var status=document.getElementById("status"+seq).value;
	var yesNo=confirm('수정하시겠습니까?');
	if(yesNo){
	location.href
     ="processEditSaleStatus.jsp?seq="+no+"&status="+status;
	}else{
		location.reload();
	}
}
</script>
</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">배송상태 변경</h1>
	</div>
</div>
<div class="container">
	<div style="padding-top: 50px">
		<table class="table table-hover">
			<tr>
				<th class="text-center">주문자(id)</th>
				<th class="text-center">주문번호</th>
				<th class="text-center">주문날짜</th>
				<th class="text-center">상품ID</th>
				<th class="text-center">개수</th>
				<th class="text-center">배송상태</th>
			</tr>
			<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"  url="jdbc:mysql://localhost:3306/NutrientsMarketDB" 
				   user="root" password="1234"/>
			<sql:query var="rs" dataSource="${ds}">
				select * from sale order by seq
			</sql:query>
			<%int seq=1; %>
			<c:forEach var="row" items="${rs.rows}">
				<c:set var="seq<%=seq %>" value="${row.seq}"/>
				<c:set var="id" value="${row.id}"/>
				<c:set var="sessionId" value="${row.sessionId}"/>
				<c:set var="saleDate" value="${row.saleDate}"/>
				<c:set var="p_id" value="${row.p_id}"/>
				<c:set var="saleQty" value="${row.saleQty}"/>
				<c:set var="status" value="${row.status}"/>
				<c:set var="seq" value="${row.seq}"/>
				<tr>
					<input type="hidden" id="seq<%=seq %>" value="${seq}">
					<td class="text-center"><c:out value='${id}'/></td>
					<td class="text-center"><c:out value='${sessionId}'/></td>
					<td class="text-center"><c:out value='${saleDate}'/></td>
					<td class="text-center"><c:out value='${p_id}'/></td>
					<td class="text-center"><c:out value='${saleQty}'/></td>
					<td><select name="status" id="status<%=seq%>" >
							<option value="1" <c:if test="${status==1 }">selected</c:if>>결제완료</option>
							<option value="2" <c:if test="${status==2 }">selected</c:if>>배송접수</option>
							<option value="3" <c:if test="${status==3 }">selected</c:if>>배송중</option>
							<option value="4" <c:if test="${status==4 }">selected</c:if>>배송완료</option>
							<option value="5" <c:if test="${status==5 }">selected</c:if>>수령완료</option>
							<input type="button" onclick="updateStatus(<%=seq++%>)" value="수정">
						</select>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>