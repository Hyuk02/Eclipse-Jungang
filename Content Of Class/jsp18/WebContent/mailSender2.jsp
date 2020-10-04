<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<form action="MailSenderController2" method="POST">
  <input type="submit" value="메일전송">
</form>
<div>
      <input type="hidden" name="message" id="message" value="<%=request.getAttribute("message")%>">
  <input type="hidden" name="email" value="<%=request.getAttribute("email")%>">
    <div class="form-group">
      <label for="confirm">Email:</label>
      <input type="text" class="form-control" id="confirm" name="confirm">
    </div>
    <div>
        <button type="button" class="button" onclick="check()">
            <span class="default">확인 <i class="icon fa fa-paper-plane"></i></span>
        </button>
    </div>
</div>
</div>
<script>
function check(){
	var m1=document.getElementById("message").value;
	var m2=document.getElementById("confirm").value;
	if(m1==m2){
		alert("인증성공");
	}else{
		alert("인증번호를 확인하세요");
	}
}
</script>
</body>
</html>