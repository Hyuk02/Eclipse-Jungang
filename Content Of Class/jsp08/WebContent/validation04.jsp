<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function checkForm(){
	for(i=0;i<document.frm.id.value.length;i++){
		var ch=document.frm.id.value.charAt(i);//한 자를 뽑기
  if( (ch<'a'||ch>'z') && (ch>'A'||ch<'Z') && (ch>'0' || ch<'9')){
		     alert("아이디는 영문 소문자만 입력 가능합니다.");
		     document.frm.id.select();
		     return;
		}
	}
	
	if(isNaN(document.frm.password.value)){
		alert("비밀번호는 숫자만 입력 가능합니다.");
		document.frm.password.select();
		return;
	}
	
	if(!isNaN(document.frm.name.value.substr(0,1))){// 0<=범위<1
		alert("이름은 숫자로 시작할 수 없습니다.");
	    document.frm.name.select();
	    return;
	}
	document.frm.submit();//action으로 데이타 전송
}
</script>
</head>
<body>
<form name="frm">
  <p>아이디:<input type="text" name="id">
  <p>비밀번호:<input type="password" name="password">
  <p>이름 :<input type="text" name="name">
  <input type='button' value='전송' onclick="checkForm()">
</form>
</body>
</html>