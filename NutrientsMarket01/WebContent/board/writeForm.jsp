<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	String sessionId=(String)request.getAttribute("sessionId");
%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<link rel="stylesheet" 
  href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
<title>Insert title here</title></head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
 <div class="container">
 	<br><br>
 	<h1 class="disply-3">글쓰기</h1>
 </div>
</div>
<!-- 글쓰기 폼 -->
<div class="container">
	<form name="newWrite" action="./BoardWriteAction.bo"
	  class="form-horizontal" enctype="multipart/form-data"
	  method="post" onsubmit="return checkForm()">
	  <input type="hidden" name="id" class="form-control" value="${sessionId}">
	  <div class="form-group row">
	      <label class="col-sm-2 control-label">작성자</label>
	      <div class="col-sm-3">
	      	   <input name="name" class="form-control" value="${sessionId}" readonly>
	      </div>
	  </div>
	 <div class="form-group row">
		<label class="col-sm-2 control-label">제품</label>
		<div class="col-sm-5">
			<select name="product" id="product" class="form-control" style="height: 34px;">
				<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" 
				url="jdbc:mysql://localhost:3306/NutrientsMarketDB" user="root" password="1234"/>
				<sql:query dataSource="${dataSource}" var="resultSet">
					select p_name from product order by p_name
				</sql:query>
				<c:forEach var="row" items="${resultSet.rowsByIndex}">
					<c:forEach var="column" items="${row}" varStatus="j">
					<option value="${column}"><c:out value="${column}"/></option>
					</c:forEach>
				</c:forEach>
			</select>
		</div>
	</div>
	  <!-- <div class="form-group row">
	      <label class="col-sm-2 control-label">제품</label>
	      <div class="col-sm-5">
	      	   <input name="product" class="form-control" placeholder="product" autofocus>
	      </div>
	  </div> -->
	  <div class="form-group row">
	      <label class="col-sm-2 control-label">제목</label>
	      <div class="col-sm-5">
	      	   <input name="subject" class="form-control" placeholder="subject" required>
	      </div>
	  </div>
	  <div class="form-group row">
	      <label class="col-sm-2 control-label">내용</label>
	      <div class="col-sm-8">
	      	   <textarea rows="5" cols="80" name="content" class="form-control" placeholder="content"></textarea>
	      </div>
	  </div>
	  
	  <div class="form-group row">
				<label class="col-sm-2">사진첨부</label>
				<div class="col-sm-5">
					<input type="file" name="fileName" id="fileName" class="form-control">
					<img id="foo"src="#" />
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#foo').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#fileName").change(function() {
        readURL(this);
    });
</script>
</html>