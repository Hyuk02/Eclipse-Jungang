<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dto.Product"%> 
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="../dbconn.jsp" %>
<%
	List<Product> productList = (List<Product>)request.getAttribute("productList");	
	String condition = (String)request.getAttribute("condition");
	String category = (String)request.getAttribute("category");
%>

<!DOCTYPE html><html><head><meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>상품목록</title>
</head>

<body>
<jsp:include page="./menu.jsp"/>

<div class="jumbotron" style="background-color: #8FBC94;">

<div class="container text-center">
<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active">
     <img src="./resources/images/slide1.jpg" alt="Nutri-Market" width="800" height="600">
      <div class="carousel-caption">
     	<p><b>뉴트리 마켓의 모든 제품은 전문적인 연구의 결과물입니다.</b></p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="./resources/images/slide2.jpg" alt="Nutri-Market" width="800" height="600">
      <div class="carousel-caption">
        <p>뉴트리 마켓은 건강을 쌓는 새로운 습관을 만듭니다.</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="./resources/images/slide3.jpg" alt="Nutri-Market"  width="800" height="600" >
      <div class="carousel-caption">
        <p>모든 제품은 친환경적인 재료로 만들었습니다.</p>
      </div>   
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
</div>
</div>

<div class="container">
<form action="<c:url value="./ProductListAction.do"/>" method="post">
	<!-- 조건 분류 -->
	<div align="right">
	<table style="align-right">
		<tr class="btn-group">			
            <td>&nbsp;&nbsp;
				<select name="category" class="txt" style="height: 34px;">
					<option value="%%">전체보기</option>
					<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" 
					url="jdbc:mysql://localhost:3306/NutrientsMarketDB" user="root" password="1234"/>
					<sql:query dataSource="${dataSource}" var="resultSet">
						select categoryName from category order by categoryName
					</sql:query>
					<c:forEach var="row" items="${resultSet.rowsByIndex}">
					<c:forEach var="column" items="${row}" varStatus="j">
						<option value="${column}"><c:out value="${column}"/></option>
					</c:forEach>
					</c:forEach>
					             
	            </select>
	                         
	            <select name="condition"  class="txt" style="height: 34px;">
					<option value="price asc">낮은가격순</option>
					<option value="price desc">높은가격순</option>            
	            </select>
	            <input type="submit" value="검색" id="btnAdd" class="btn btn-warning" style="height: 34px;">
            </td>            
        </tr>
   </table>
   </div>
   
   <table style="align-right">
		<tr >
        </tr>
   </table>
   <hr>
   
   <!-- 상품 목록 -->
	<div class="row" align="center">
    <%
    	for(int i=0;i<productList.size();i++){    		
    		Product notice = productList.get(i);
     %>	 
    	<div class="col-md-3">
			<img src="./resources/images/<%=notice.getFilename()%>"
    	       style="width:100%">
    	  	<h3><%=notice.getPname()%></h3>
    	  	<p><%=notice.getDescription()%></p>
    	  	<p><%=notice.getUnitPrice()%></p>
    	  	<p><a href="${pageContext.request.contextPath}/product.jsp?id=<%=notice.getProductId()%>"
    	    class="btn btn-secondary" role="button">상세정보 &raquo;</a>
    	  	</p>
    	</div>
    <%		 
       }
    %>
 	</div>
	<hr>
</form>
</div>
<jsp:include page="./footer.jsp"/>
</body>
</html>