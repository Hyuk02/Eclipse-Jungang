<%@page import="mvc.model.BoardDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  BoardDTO board=(BoardDTO)request.getAttribute("board");
  int num=(Integer)request.getAttribute("num");
  int nowPage=(Integer)request.getAttribute("page");
%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<link rel="stylesheet" 
  href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
<title>Insert title here</title></head>
<script>
function deleteConfirm(num,pageNum){
	var yesno=confirm(num+"번 글을 삭제할까요?");
	if(yesno){
		location.href='./BoardDeleteAction.bo?num='+num+'&pageNum='+pageNum;
	}
}
</script>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
 <div class="container">
 	<h1 class="disply-3">게시판</h1>
 </div>
</div>
<!-- 글쓰기 폼 -->
<div class="container">
	<form name="newUpdate" 
action="BoardUpdateAction.bo?num=<%=board.getNum()%>&pageNum=<%=nowPage%>"
	  class="form-horizontal" 
	  method="post">
	  <input type="hidden" name="id" class="form-control" value="${sessionId}">
	  <div class="form-group row">
	      <label class="col-sm-2 control-label">작성자</label>
	      <div class="col-sm-3">
	      	   <input name="name" class="form-control" value="<%=board.getId()%>" readonly>
	      </div>
	  </div>
	  <div class="form-group row">
	      <label class="col-sm-2 control-label">제품</label>
	      <div class="col-sm-5">
	      	   <input name="product" class="form-control" placeholder="product"  value="<%=board.getProduct()%>" readonly>
	      </div>
	  </div>
	  <div class="form-group row">
	      <label class="col-sm-2 control-label">제목</label>
	      <div class="col-sm-5">
	      	   <input name="subject" class="form-control" placeholder="subject"  value="<%=board.getSubject()%>" readonly>
	      </div>
	  </div>
	  <div class="form-group row">
	      <label class="col-sm-2 control-label">내용</label>
	      <div class="col-sm-5" style="word-break:break-all">
	      	 <textarea rows="5" cols="80" 
	      	 name="content" class="form-control" 
	       placeholder="content" readonly><%=board.getContent()%></textarea>
	       <br>
	       <img src="./resources/images/<%=board.getFileName()%>" style="width:100%"/>
	       <%-- <% out.print(board.getFileName()); %> --%>
	      </div>
	  </div>
	  
	  <div class="form-group row">
	      <div class="col-sm-10 col-sm-offset-2">
	       <c:set var="userId" value="<%=board.getId() %>"/>
	       <c:if test="${sessionId==userId}">
	         <p>
	         <a href="javascript:deleteConfirm('<%=board.getNum()%>','<%=nowPage%>')"
	                     class="btn btn-danger">삭제</a>
	      	   <!-- <input type="submit" class="btn btn-success" value="수정">
	      	   <input type="reset" class="btn btn-primary" value="취소"> -->
	       </c:if>
	       <a href="./BoardListAction.bo?pageNum=<%=nowPage%>" class="btn btn-primary">목록</a>
	      </div>
	  </div>	
	</form>
	<hr>
</div>
 <jsp:include page="../footer.jsp"/>
</body>
</html>