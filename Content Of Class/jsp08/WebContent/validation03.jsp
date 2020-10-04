<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>아이디와 비밀번호 길이 검사</title>
<script>
function checkLogin(){
	var form=document.loginForm;//document내의 name으로 접근
	//id의 길이 4~12까지
	if(form.id.value.length<4|| form.id.value.length >12){
		alert('아이디는 4~12자 이내로 입력합니다.');
		form.id.select();//form.id.focus();
		return;
	}
	if(form.password.value.length <4){
		alert("비밀번호는 4자 이상으로 입력해야합니다.");
		form.password.select();
		return;
	}
	form.submit();//submit()함수 action으로 데이타 전송
}
</script>
</head>
<body>
<form name="loginForm" 
      action="validation03_process.jsp" method="post">
 <p>아이디:<input type="text" name="id">
 <p>비밀번호:<input type="password" name="password">
 <p><input type="button" value="전송" onclick="checkLogin()">
</form>

</body>
</html>