<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<title>로그인</title>
</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
			<h1 class="display-3">로그인</h1>
	</div>
</div>

<div class="container" align="center">
	<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please Sign In</h3>
			<%
					String error = request.getParameter("error");
					if(error!=null){
						out.print("<div class='alert alert-danger'> 아이디와 비밀번호를 확인해주세요 ! </div");
					}
			%>
			<form class="form-signin" action="process_LoginMember.jsp" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" name="id" id="id" placeholder="ID" required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">PASSWORD</label>
					<input type="password" class="form-control" name="pw" id="pw" placeholder="PASSWORD" required>
				</div>
				<button type="submit" class="btn btn btn-lg btn-success btn-block">로그인</button>
				<div class="btn-group btn-group-sm">
				<a  href="helpID.jsp" class="btn btn-secondary" >아이디 찾기</a>
				<a  href="helpPW.jsp" class="btn btn-secondary" >비밀번호 찾기</a>
				</div>
			</form>
	</div>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>