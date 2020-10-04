<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>회원정보</title>

<% 
String id = (String)session.getAttribute("sessionId");
%>

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/NutrientsMarketDB" user="root" password="1234"/>
<sql:query var="rs" dataSource="${ds }">
		select * from member where id=?
		<sql:param value="<%=id %>"/>
</sql:query>

<script>
			
			function deleteMember() {	
				var yesNo = confirm("정말로 탈퇴하시겠습니까?");
				if(yesNo){
					location.href = "delete_Member.jsp"
				}else return;
			}
			
			var pwFormat =  /^[A-Za-z0-9`\-=\\\[\];,\./~!@#\$%\^&\*\(\)_\+|\{\}:<>\?]{4,10}$/;
			
			$(document).ready(function(){
				$('#pw_confirm').mouseenter(function() {
					
					if($('#pw').val()!=$('#pw_confirm').val()){
						$('#result_pw').removeClass();
						$('#result_pw').addClass("badge badge-danger");
						$('#result_pw').html("비밀번호를 동일하게 입력해주세요");
						$('#pwChecked').val('false');
						$('#pw').focus();
						return false;
					}
					
					if(!pwFormat.test($('#pw').val()) || !pwFormat.test($('#pw_confirm').val())){
						$('#result_pw').removeClass();
						$('#result_pw').addClass("badge badge-danger");
						$('#result_pw').html("4~10자 영문 대 소문자, 숫자, 특수문자(따옴표 제외)를 사용하세요.");
						$('#pw').focus();
						return false;
					}
					
					if(pwFormat.test($('#pw').val())==pwFormat.test($('#pw_confirm').val())){
						$('#result_pw').removeClass();
						$('#result_pw').addClass("badge badge-light");
						$('#result_pw').html("사용 가능한 비밀번호 입니다.");
					}
				});
			});
</script>

</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
			<h1 class="display-3">내 정보 관리</h1>
	</div>
</div>

<c:forEach var="row" items="${rs.rows}">
		<c:set var="email" value="${row.email }"/>
		<c:set var="mail1" value="${email.split('@')[0]}"/>
		<c:set var="mail2" value="${email.split('@')[1]}"/>
		
		<c:set var="birth" value="${row.birth}"/>
		<c:set var="year" value="${birth.split('/')[0]}"/>
		<c:set var="month" value="${birth.split('/')[1]}"/>
		<c:set var="day" value="${birth.split('/')[2]}"/>	

<div class="container">
		<form name=updateMember class="form-horizontal" action="process_MyPage.jsp" method="post" onsubmit="return checkForm()">
				
				<div class="form-group row">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input name="id" id="id" class="form-control" value="<c:out value='${row.id}'/>" disabled>
						<input type="hidden" name="id" id="id" value="<c:out value='${row.id}'/>" >
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">새 비밀번호</label>
					<div class="col-sm-3">
						<input type="password" name="pw" class="form-control" id="pw" placeholder="새 비밀번호 입력" maxlength="10">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">새 비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" name="pw_confirm" id="pw_confirm" class="form-control" placeholder="새 비밀번호 확인" maxlength="10" >
						<div id="result_pw" class=""></div>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">이름</label>
					<div class="col-sm-2">
						<input name="name" class="form-control" maxlength="10" value='<c:out value="${row.name }"/>'>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">생일</label>
					<div class="col-sm-4 btn-group">
						<input name="birthyy" maxlength="4" size="6" value="<c:out value='${year }'/>" class="form-control col-sm-4">
						<select name="birthmm" class="form-control col-sm-3" style="height: 34px;">
							<option value="1" <c:if test="${month==1 }">selected</c:if>>1월</option>
							<option value="2" <c:if test="${month==2 }">selected</c:if>>2월</option>
							<option value="3" <c:if test="${month==3 }">selected</c:if>>3월</option>
							<option value="4" <c:if test="${month==4 }">selected</c:if>>4월</option>
							<option value="5" <c:if test="${month==5 }">selected</c:if>>5월</option>
							<option value="6" <c:if test="${month==6 }">selected</c:if>>6월</option>
							<option value="7" <c:if test="${month==7 }">selected</c:if>>7월</option>
							<option value="8" <c:if test="${month==8 }">selected</c:if>>8월</option>
							<option value="9" <c:if test="${month==9 }">selected</c:if>>9월</option>
							<option value="10" <c:if test="${month==10 }">selected</c:if>>10월</option>
							<option value="11" <c:if test="${month==11 }">selected</c:if>>11월</option>
							<option value="12" <c:if test="${month==12 }">selected</c:if>>12월</option>
						</select>
						<input name="birthdd" maxlength="2" size="6" value="<c:out value='${day }'/>" class="form-control col-sm-3">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-5 btn-group">
						<input name="mail1" maxlength="50" class="form-control col-sm-5"><span class="form-control col-sm-1">@</span>
						<select name="mail2" class="form-control col-sm-4" style="height: 34px;">
							<option value="naver.com" <c:if test="${mail2=='naver.com'}">selected</c:if>>naver.com</option>
							<option value="daum.net" 	<c:if test="${mail2=='daum.net'}">selected</c:if>>daum.net</option>
							<option value="gmail.com" <c:if test="${mail2=='gmail.com'}">selected</c:if>>gmail.com</option>
						</select>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-3 ">
						<input name="phone" id="phone" class="form-control" value="${row.phone }">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">우편번호</label>
					<div class="col-sm-3 btn-group">
						<input type="text" name="postcode" id="postcode" class="form-control" value="${row.postcode }">
						<input type="button" value="우편번호 찾기" onclick="execDaumPostcode()" class="btn btn-warning">
					</div>
				</div>
				
				<div class="form-group row">
	   				 <label class="col-sm-2">주소</label>
	   				 <div class="col-sm-5">
	    				<input name="address" id="address" class="form-control" value="${row.address }">
	  				  </div>
				</div>
	
				<div class="form-group row">
	 				  <label class="col-sm-2">상세주소</label>
	  				  <div class="col-sm-5">
	    				<input id="detailAddress" name="detailAddress" class="form-control"  value="${row.detailAddress }">
	    			  </div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">참고</label>
					<div class="col-sm-5">
						<input name="extraAddress" id="extraAddress" class="form-control"  value="${row.extraAddress }">
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" value="수정" class="btn btn-primary">
						<a href="javascript:deleteMember();" class="btn btn-danger">회원탈퇴</a>
						<a href="home.jsp" class="btn btn-secondary">홈으로</a>
					</div>
				</div>
				
		</form>
</div>
</c:forEach>
<hr>
<jsp:include page="../footer.jsp"/>
</body>
</html>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>