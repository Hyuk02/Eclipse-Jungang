<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>회원가입</title>

<script>
				$(document).ready(function() {
					
					var idFormat = /^[a-z0-9][a-z0-9_\-]{4,10}$/;
					var pwFormat =  /^[A-Za-z0-9`\-=\\\[\];,\./~!@#\$%\^&\*\(\)_\+|\{\}:<>\?]{4,10}$/;
					var emailFormat = /^[a-z0-9][a-z0-9_\-]{4,10}$/;
					var phoneFormat = /^(0[1-6]{2}|02|010)([0-9]{3,4})([0-9]{4})$/;
					
					$('#idCheck').click(function() {
						if($('#id').val()==''){
							$('#result').html("아이디를 입력하세요.");
							$('#id').focus();
							return;
						}
						
						if(!idFormat.test($('#id').val())){
							$('#result').removeClass();
							$('#result').addClass("badge badge-danger");
							$('#result').html("4~10자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
							$('#id').focus();
							return false;
						}
							$.ajax({url:'idCheck.jsp?id='+$('#id').val()
										,success:function(data){
																				if(data.trim()=='fail'){
																					$('#result').removeClass();
																					$('#result').addClass("badge badge-danger");
																					$('#result').html('');
																					$('#result').html('이미 사용 중인 아이디 입니다.');
																					$('#id').val('');
																					$('#id').focus();
																					$('#id').attr('readonly',false);
																				}else if(data.trim()=='success'){
																					$('#result').removeClass();
																					$('#result').addClass("badge badge-light");
																					$('#result').html('');
																					$('#result').html('사용 가능한 아이디 입니다.');
																					$('#pw').focus();
																					$('#id').attr('readonly',true);
																					$('#idChecked').val('true');
																				}		
																			}
						});
							
							
					});
					
					$('#pw_confirm').change(function() {
						if($('#pw').val()==null || $('#pw_confirm').val()==null){
							$('#result_pw').removeClass();
							$('#result_pw').addClass("badge badge-danger");
							$('#result_pw').html("비밀번호를 입력해주세요");
							$('#pwChecked').val('false');
							$('#pw').focus();
							return false;
						}
						
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
							$('#pwChecked').val('false');
							$('#pw').focus();
							return false;
						}
						
						if(pwFormat.test($('#pw').val())==pwFormat.test($('#pw_confirm').val())){
							$('#result_pw').removeClass();
							$('#result_pw').addClass("badge badge-light");
							$('#result_pw').html("사용 가능한 비밀번호 입니다.");
							$('#pwChecked').val('true');
						}
					});
					
					
					$('#mail1').change(function() {
							if(!emailFormat.test($('#mail1').val())){
								$('#result_email').removeClass();
								$('#result_email').addClass("badge badge-danger");
								$('#result_email').html("이메일 형식에 맞지 않습니다.");
								$('#mail1').focus();
								return false;
							}
							if(emailFormat.test($('#mail1').val())){
								$('#result_email').removeClass();
								$('#result_email').html("");
								$('#result_email').val('true');
								$('#phone').focus();
							}
					});
					
					$('#phone').change(function() {
						if(!phoneFormat.test($('#phone').val())){
							$('#result_phone').removeClass();
							$('#result_phone').addClass("badge badge-danger");
							$('#result_phone').html("전화번호 형식에 맞지 않습니다.");
							$('#phone').focus();
							return false;
						}
						
						if(phoneFormat.test($('#phone').val())){
							$('#result_phone').removeClass();
							$('#result_phone').html("");
							$('#result_phone').val("true");
							$('#postcode').focus();
						}
					});
					
});
</script>

<script>

				function checkForm() {
					var checked = $('#idChecked').val();
					if(checked=='false'){
						alert('아이디 중복 확인을 해주세요.');
						return false;
					}
					
					var checkedPW = $('#pwChecked').val();
					if(checkedPW=='false'){
						alert('비밀번호를 정확하게 입력해주세요.');
						return false;
					}
					
					var checkedPhone = $('#result_phone').val();
					if(checkedPhone!=='true'){
						alert('전화번호를 정확하게 입력해주세요.')
						return false;
					}
					var checkedEmail = $('#result_email').val();
					if(checkedEmail!='true'){
						alert('이메일을 정확하게 입력해주세요.')
						return false;
					}
					
				}
</script>

</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
			<h1 class="display-3">회원가입</h1>
	</div>
</div>

<div class="container">
		<form name=newMember class="form-horizontal" action="process_SignUp.jsp" method="post" onsubmit="return checkForm()" >
				
				<div class="form-group row">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-8 btn-group">
						<input name="id" id="id" class="form-control col-sm-4" placeholder="아이디 입력" minlength="4" maxlength="10" required>
						<input type="button" class="col-sm-2 btn btn-warning" value="중복확인" id="idCheck">
						<input type="hidden" name="idChecked" id="idChecked" value="false">
					</div>
					<span id="result" class=""></span>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" name="pw" class="form-control" id="pw" placeholder="비밀번호 입력" minlength="4" maxlength="10" required>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" name="pw_confirm" id="pw_confirm" class="form-control" placeholder="비밀번호 확인" minlength="4" maxlength="10" >
						<input type="hidden" name="pwChecked" id="pwChecked" value="false">
					</div>
					<div id="result_pw" class=""></div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">이름</label>
					<div class="col-sm-2">
						<input name="name"class="form-control" minlength="2" maxlength="10"  required>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">생일</label>
					<div class="col-sm-4   btn-group">
						<input name="birthyy" maxlength="4" placeholder="4자리 연도" size="6" class="form-control col-sm-4">
						<select name="birthmm" class="form-control col-sm-3" style="height: 34px;">
							<option value="1">1월</option>
							<option value="2">2월</option>
							<option value="3">3월</option>
							<option value="4">4월</option>
							<option value="5">5월</option>
							<option value="6">6월</option>
							<option value="7">7월</option>
							<option value="8">8월</option>
							<option value="9">9월</option>
							<option value="10">10월</option>
							<option value="11">11월</option>
							<option value="12">12월</option>
						</select>
						<input name="birthdd" maxlength="2" placeholder="일" size="6" class="form-control col-sm-3">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-5  btn-group">
						<input name="mail1" id="mail1" maxlength="50" class="form-control col-sm-5" required><span class="form-control col-sm-1" style="height: 34px;">@</span>
						<select name="mail2"  required  class="form-control col-sm-4" style="height: 34px;">
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
						<div class="col-sm"></div>
						<div id="result_email" class="" value="false"></div>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-3">
						<input name="phone" id="phone" class="form-control" placeholder="전화번호"  required>
					</div>
					<div id="result_phone" class="" value="false"></div>
				</div>
				
				<div class="form-group row ">
					<label class="col-sm-2">우편번호</label>
					<div class="col-sm-8  btn-group">
						<input type="text" name="postcode" id="postcode" class="form-control col-sm-4" placeholder="우편번호">
						<input type="button" value="우편번호 찾기" onclick="execDaumPostcode()" class="btn btn-warning">
					</div>
				</div>
				
				<div class="form-group row">
	   				 <label class="col-sm-2">주소</label>
	   				 <div class="col-sm-5">
	    				<input name="address" id="address" class="form-control" placeholder="주소">
	  				  </div>
				</div>
	
				<div class="form-group row">
	 				  <label class="col-sm-2">상세주소</label>
	  				  <div class="col-sm-5">
	    				<input id="detailAddress" name="detailAddress" class="form-control" placeholder="상세주소">
	    			  </div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2">참고</label>
					<div class="col-sm-5">
						<input name="extraAddress" id="extraAddress" class="form-control" placeholder="참고">
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" value="등록" class="btn btn-primary">
						<input type="reset" value="취소" class="btn btn-secondary">
					</div>
				</div>
				
		</form>
</div>
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