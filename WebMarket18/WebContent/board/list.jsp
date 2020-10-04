<%@page import="mvc.model.BoardDTO"%><%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String sessionId=(String)session.getAttribute("sessionId");
    List<BoardDTO> boardList 
               =(List<BoardDTO>)request.getAttribute("boardlist");
    int total_record=(Integer)request.getAttribute("total_record");
    int pageNum=(Integer)request.getAttribute("pageNum");
    int total_page=(Integer)request.getAttribute("total_page");
    //검색조건추가에 따른 조건,검색내용 추가 받기
	String items=(String)request.getAttribute("items");
	String text=(String)request.getAttribute("text");
	
	//
  int currentBlock=(Integer)request.getAttribute("currentBlock");
  int startPage=(Integer)request.getAttribute("startPage");
  int endPage=(Integer)request.getAttribute("endPage");
  int total_segment=(Integer)request.getAttribute("total_segment");
%>
<script>
function checkForm(){
	if(${sessionId==null}){
		alert("로그인 해주세요");
		return false;
	}
	//writeForm으로 이동
	location.href=./BoardWriteFormAction.do?id=<%=sessionId%>
}
</script>    
<!DOCTYPE html><html><head><meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>게시판</title>
</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbtron">
  <div class="container">
  	<h1 class="display-3">게시판</h1>
  </div>
</div>
<div class="container">
	<form action="<c:url value="./BoardListAction.do"/>" 
	                                         method="post">
  <div>
    <div class="text-right">
    	<span class="badge badge-success">전체<%=total_record%>건</span>
    </div>
  </div>
  <div style="padding-top:50px;">
  <table class="table table-hover">	
  <tr>
   <th>번호</th><th>제목</th><th>작성일</th><th>조회</th><th>글쓴이</th>
  </tr>                                         
  <%
  	  for(int i=0;i<boardList.size();i++){
  		  BoardDTO notice=boardList.get(i);
  	  %>
  	  <tr>	 
  		<td><%=notice.getNum() %></td>
  		<td><a href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject() %></a></td>
  		<td><%=notice.getRegist_day() %></td>
  		<td><%=notice.getHit() %></td>  
  		<td><%=notice.getName() %></td>
  	   </tr>	  
  	 <% }%>
  	 </table>
  	 </div><%--리스트 끝 --%>
  	 <%-- 페이지 네비게이션 --%>
  	<c:set var ="pageNum" value='<%=pageNum%>'/>
  	<c:set var="total_page" value='<%=total_page %>'/>
  	<c:set var="startPage" value='<%=startPage %>'/>
  	<c:set var="endPage" value='<%=endPage%>'/>
  	<c:set var="total_segment" value='<%=total_segment%>'/>
  	<c:set var="currentBlock" value='<%=currentBlock%>'/>
  	 
  	 <div align="center">
  	    <c:set var="pageNume" value="<%=pageNum%>"/>
  	<ul class="pagination pagination-xs">
  	<%-- 이전 세그먼트 블록으로 이동 --%>
  	  <c:if test="${currentBlock<=1}">
  	  	<li class="previous disabled"><a href="#">Previous</a></li>
  	  </c:if>
  	  <c:if test="${currentBlock>1}">
  	    <li class="previous"><a href="<c:url value="./BoardListAction.do?pageNum=${startPage-1}&items=${items}&text=${text}"/>">Previous</a></li>
  	  </c:if>
    <%-- 현재 세그먼트 블록내에서의 페이지 리스트 --%>
  	    <c:forEach var="i" begin="${startPage}" end="${endPage}">
  	       <li <c:if test="${pageNum==i}">class='active'</c:if>><a href="<c:url value="./BoardListAction.do?pageNum=${i}&items=${items}&text=${text}"/>">
  	         <c:choose>
  	           <c:when test="${pageNum==i}">
  	              <font color='4C5317'><b>${i}</b></font>
  	           </c:when>
  	           <c:otherwise>
  	           		<font color='4C5317'>${i}</font>
  	           </c:otherwise>
  	         </c:choose>
  	       </a>
  	       </li>    
  	    </c:forEach>
  	 <%-- 다음 세그먼트 블록으로 이동 처리 --%>
  	 <c:if test="${currentBlock<total_segment}">
  	 	 <li class="next">
  	 	 <a href="<c:url value="./BoardListAction.do?pageNum=${endPage+1}&items=${items}&text=${text}"/>">Next</a>
  	 	 </li>
  	 </c:if>
  	 <c:if test="${currentBlock>=total_segment}">
  	  <li class="next disabled"><a href="#">Next</a></li>
  	 </c:if>   
    </ul>
  	 </div><%-- 페이지 네비게이션 끝. --%>
  	 
  	 
  	 <%--검색조건 --%>
  	 <div>
  	  <table>
  	   <tr>
  	   <td width="100%" align="left">&nbsp;&nbsp;
  	   <select name="items" class="txt">
  	    <option value="subject">제목에서</option>
  	    <option value="content">내용에서</option>  	   
  	   </select>
  	   <input type="text" name="text">
  	   <input type="submit" value="검색" id="btnAdd" class="btn btn-primary">
  	   </td>
  	   <td width="100%" align="right">
  	   <a href="#" onclick="checkForm();"
  	      class="btn btn-primary">&laquo;글쓰기</a>
  	   </td>
  	   </tr>
  	  </table>
  	 </div><%--검색조건 끝. --%>
  	 </form>
  	 <hr>
</div>
<jsp:include page="../footer.jsp"/>  	 
</body>
</html>