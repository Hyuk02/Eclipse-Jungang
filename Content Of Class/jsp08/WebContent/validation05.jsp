<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>Insert title here</title>
<script>
function chechkMember(){
	//정규표현식 생성
	var regExpId=/^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var regExpName=/^[가-힣]*$/;
	var regExpPasswd=/^[0-9]*$/;
	var regExpPhone=/^\d{3}-\d{3,4}-\d{4}$/;
	var regExpEmail
=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	var form=document.member;
	var id=form.id.value;
	var name=form.name.value;
	var passwd=form.password.value;
    var phone=form.phone1.value+"-"+form.phone2.value
             +"-"+form.phone3.value;
	var email=form.email.value;
	
	//아이디는 문자로 시작해주세요
	if(!regExpId.test(id)){
		alert(id);
		alert("아이디는 문자로 시작해주세요");
		form.id.select();
		return;
	}
	//이름은 한글만 입력해주세요
	if(!regExpName.test(name)){
		alert('이름은 한글만 입력해주세요');
		from.name.select();
		return;
	}
	//비밀번호는 숫자만 입력해주세요
	if(!regExpPasswd.test(passwd)){
		alert('패스워드는 숫자만 입력해주세요');
		form.password.select();
		return;
	}
	//연락처 입력을 확인해주세요
	if(!regExpPhone.test(phone)){
		alert('연락처를 확인하세요');
		form.phone2.select();
		return;
	}
	//이메일을 확인해주세요
	if(!regExpEmail.test(email)){
		alert('이메일을 확인하세요');
		form.email.select();
		return;
	}
	
	form.submit();//이상 없으면 전송
}
</script>
</head>
<body>
<h3>회원가입</h3>
<form name="member">
<p>아이디:<input type="text" name="id">
<p>비밀번호:<input type="password" name="password">
<p>이름:<input type="text" name="name">
<p>연락처:<select name="phone1">
        <option value="010">010</option>
        <option value="011">011</option>
        <option value="016">016</option>
        <option value="017">017</option>
         </select>
         -<input type="text" maxlength="4" size="4" name="phone2">
         -<input type="text" maxlength="4" size="4" name="phone3">
<p> 이메일:<input name="email">
<p> <input type="button" value="가입하기" onclick="chechkMember()">
</form>
</body>
</html>