<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String name=(String)request.getAttribute("name"); %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<link rel="stylesheet" 
  href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
<title>Insert title here</title></head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
 <div class="container">
 	<h1 class="disply-3">게시판</h1>
 </div>
</div>
<!-- 글쓰기 폼 -->
<div class="container">
	<form name="newWrite" action="./BoardWriteAction.do"
	  class="form-horizontal" 
	  method="post" onsubmit="return checkForm()">
	  <input type="hidden" name="id" class="form-control" value="${sessionId}">
	  <div class="form-group row">
	      <label class="col-sm-2 control-label">성명</label>
	      <div class="col-sm-3">
	      	   <input name="name" class="form-control" value="<%=name%>" placeholder="name" readonly>
	      </div>
	  </div>
	  <div class="form-group row">
	      <label class="col-sm-2 control-label">제목</label>
	      <div class="col-sm-5">
	      	   <input name="subject" class="form-control" placeholder="subject" autofocus>
	      </div>
	  </div>
	  <div class="form-group row">
	      <label class="col-sm-2 control-label">내용</label>
	      <div class="col-sm-8">
	      	   <textarea rows="5" cols="80" name="content" class="form-control" placeholder="content"></textarea>
	      </div>
	  </div>
	  
	  <div class="form-group row">
	      <div class="col-sm-10 col-sm-offset-2">
	      	   <input type="submit" class="btn btn-primary" value="등록">
	      	   <input type="reset" class="btn btn-primary" value="취소">
	      </div>
	  </div>	
	</form>
	<hr>
</div>
 <jsp:include page="../footer.jsp"/>
</body>
</html>