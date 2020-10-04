<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<title>아이디 찾기</title>

<script>
				$(document).ready(function() {
					$('#radio_phone').click(function() {
						$('#radio_email').prop('checked', false);
						$('#hidden_email').attr('hidden',true);
						$('#hidden_phone').attr('hidden',false);
					});
					
					$('#radio_email').click(function() {
						$('#radio_phone').prop('checked', false);
						$('#hidden_phone').attr('hidden',true);
						$('#hidden_email').attr('hidden',false);
					});
					
				});
</script>
<script>
				function findPhone() {
					var name = document.getElementById("name").value;
					var phone = document.getElementById("phone").value;
					window.open("process_helpID.jsp?phone="+phone+"&name="+name);
				}
				
				function findEmail() {
					var name = document.getElementById("name").value;
					var email = document.getElementById("email").value;
					window.open("process_helpID.jsp?email="+email+"&name="+name);
				}
</script>

</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h3>아이디 찾기</h3>
	</div>
</div>

<div class="container">
		
		<form name=helpMember class="form-horizontal" method="post" onsubmit="return checkForm()" >
				
				<div class="form-group row list-group-item list-group-item-secondary ">
					<div class="col-sm-10 form-left btn-group">
					<label class="col-sm-2">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
						<input name="name" id="name" class="form-control col-sm-5" maxlength="10" required>
						<input class="form-control text-center col-sm-4" value="필수 입력 사항 입니다." readonly>
					</div>
				</div>
				<hr>
				
				<div class="form-group">
				<input type="radio" id="radio_phone" value="radio_phone">
				<label>등록한 전화번호로 찾기</label>
				<div class="form-group row list-group-item list-group-item-primary" id="hidden_phone" hidden>
					<label class="col-sm-2 text-center">전&nbsp;화&nbsp;번&nbsp;호</label>
					<div class="col-sm-8 btn-group">
						<input name="phone" id="phone" class="form-control" placeholder="가입 시 등록하신 전화번호를 입력해주세요.">
						<input type="button" value="인증하기" class="btn btn-light" onclick="findPhone()">
					</div>
				</div>
				</div>
				
				<div class="form-group">
				<input type="radio" id="radio_email" value="radio_email">
				<label>등록한 이메일로 찾기</label>
				<div class="form-group row list-group-item list-group-item-primary" id="hidden_email" hidden>
					<label class="col-sm-2 text-center">이&nbsp;메&nbsp;일</label>
					<div class="col-sm-8 btn-group">
						<input name="email" id="email" class="form-control" placeholder="가입 시 등록하신 이메일 주소를 입력해주세요.">
						<input type="button" value="인증하기" class="btn btn-light" onclick="findEmail()">
					</div>
					</div>
				</div>
				
		</form>
</div>
 <hr>
<jsp:include page="../footer.jsp"/>
</body>
</html>