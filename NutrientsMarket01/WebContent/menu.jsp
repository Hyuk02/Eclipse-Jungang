<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 	/*로그인 여부 확인*/
	String sessionId = (String)session.getAttribute("sessionId");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Menu</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default">
<!--  <div class="container-fluid"> -->
 
	 <div class="navbar-header">

		<a class="navbar-brand" href="${pageContext.request.contextPath}/home.jsp">
		<img class="float-left" alt="나뭇잎" width="80px" src="${pageContext.request.contextPath}/resources/images/green.png">
		<h3 class="text-center">NutriMarket</h3>
		</a>
	</div>

	<ul class="nav navbar-nav">
    	<li><a href="${pageContext.request.contextPath}/ProductListAction.do?condition=null">상품목록</a></li>
    	<li><a href="${pageContext.request.contextPath}/BoardListAction.bo?pageNum=1">후기 게시판</a></li>
		<li><a href="${pageContext.request.contextPath}/admin/adminPage.jsp">관리자 페이지</a></li>		
	</ul>
	
	<ul class="nav navbar-nav">
		<c:choose>
		 <c:when test="${empty sessionId}">
		 	<li class="nav-item"><a class="nav-link" 
		 		href="${pageContext.request.contextPath}/member/login_Member.jsp">로그인</a>
		 	<li class="nav-item"><a class="nav-link" 
		 		href="${pageContext.request.contextPath}/member/SignUp.jsp">회원가입</a>
		 </c:when>
		 <c:otherwise>
		 	<li style="padding-top:7px;color:#6B8A24;">[<%=sessionId %>님]</li>
		 	<li class="nav-item"><a class="nav-link" 
		 		href="${pageContext.request.contextPath}/member/logout_Member.jsp">로그아웃</a></li>
			<li class="nav-item dropdown direction-right">
	      <a class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">마이페이지</a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="${pageContext.request.contextPath}/cart.jsp">장바구니</a>
	        <a class="dropdown-item" href="${pageContext.request.contextPath}/member/myList.jsp">주문내역</a>
	        <a class="dropdown-item" href="${pageContext.request.contextPath}/member/MyPage.jsp">내정보 수정</a>
	      </div>
	    </li>
		 </c:otherwise>
		</c:choose>
  	</ul>
<!--   	</div> -->
</nav>
</body>
</html>