<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>validation</title>
<script>
/* 요소의 name을 접근 - 계층적 접근 */
function checkForm(){
	var id=document.loginForm.id.value;
	var pwd=document.loginForm.pwd.value;
	alert(id+","+pwd);
}
</script>
</head>
<body>
<form name="loginForm">
<p> 아이디:<input type="text" name="id">
<p> 비번:<input type="password" name="pwd">
<input type="submit" value="로그인" onclick="checkForm()">
</form>
</body>
</html>