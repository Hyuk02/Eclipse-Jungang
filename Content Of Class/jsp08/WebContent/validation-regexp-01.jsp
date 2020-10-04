<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function checkForm(){
	//var regExp = /Java/i;
	var regExp = new RegExp('java','i');// 'i'-ignoreCase
	var str=document.frm.title.value;
	var result=regExp.exec(str);//문자열내에서 해당패턴 찾아서 리턴 exec()
	alert(result[0]);
}

</script>
<body>
<form name="frm">
<p> 제목:<input type="text" name="title">
<input type="submit" value="전송" onclick="checkForm()">
</form>

</body>
</html>