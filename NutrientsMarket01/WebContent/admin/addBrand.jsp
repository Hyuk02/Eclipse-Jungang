<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>브랜드 등록</title>
<link rel="stylesheet"  href="../resources/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#brandCheck').click(function(){
		if($('#brandName').val()==''){
			alert('브랜드를 입력하세요');
			$('#brandName').focus();
			return;
		}
		$.ajax({
			type:'GET',//요청메소드 방식
			url:'brandCheck.jsp?brandName='+$('#brandName').val().trim(),// val('success')
			dataType:"text",// 요청한 결과 값의 타입
			success:function(data){//콜백함수
				//alert(data);
				if($.trim(data)=="fail"){//이미존재하면    fail값
				  $('#result').removeClass();//동적으로   class제거
				  $('#result').addClass("badge badge-danger");
				  $('#result').html('이미 존재하는 브랜드입니다.');
				  $('#brandName').val('');
				  $('#brandName').focus();
				  $('#brandName').attr('readonly',false);
				}else{//사용가능하면  success값
				  $('#result').removeClass();//동적으로   class제거
				  $('#result').addClass("badge badge-success");
				  $('#result').html('추가 가능한 브랜드입니다.');	
				  $('#description').focus();
				  $('#brandName').attr('readonly',true);//수정불가처리
				  $('#brandChecked').val('true');
				}
			}
		});
	});
});
function checkForm() {
	var checked = $('#brandChecked').val();
	if(checked =='false'){
		alert('브랜드 중복 확인이 필요합니다.');
		return false;
	}
}
</script>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">브랜드 등록</h1>
	</div>
	</div>
	<div class="container">
	
	<div class="form-group row">
	<label class="col-sm-3">등록된 브랜드 보기</label>
	<div class="col-sm-3">
		<select name="categories" class="form-control"  id="manufacturer" style="height: 34px;">
			<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" 
			url="jdbc:mysql://localhost:3306/NutrientsMarketDB" user="root" password="1234"/>
			<sql:query dataSource="${dataSource}" var="resultSet">
				select brandName from brand order by brandName
			</sql:query>
			<c:forEach var="row" items="${resultSet.rowsByIndex}">
				<c:forEach var="column" items="${row}" varStatus="j">
				<option><c:out value="${column}"/></option>
				</c:forEach>
			</c:forEach>
		</select>
	</div>
	</div>
	<form action="processAddBrand.jsp" method="post" class="form-horizontal" onsubmit="return checkForm()">
	 <div class="form-group row">
	   <label class="col-sm-3">브랜드명</label>
	   <div class="col-sm-3">
	   		<input name="brandName" id="brandName" class="form-control" placeholder="브랜드명 입력" maxlength="10" required>
	   		<input type="button" class="btn btn-warning" value="중복확인" id="brandCheck">
			<label id="result" class="badge badge-success"></label>
			<input type="hidden" name="brandChecked" id="brandChecked" value="false">
	   </div>
	</div>
	<div class="form-group row">
	   <label class="col-sm-3">브랜드 설명</label>
	   <div class="col-sm-8">
	   		<textarea class="form-control col-sm-5" rows="3" name="description" id="description" required></textarea>
	   </div>
	</div>
	<div class="form-group row">
	   <div class="col-sm-offset-2 col-sm-10">
	   		<input type="submit" class="btn btn-primary" value="등록">
	   		<input type="reset" class="btn btn-primary" value="취소">
	   </div>
	</div>
	
	</form>
	</div>
	<jsp:include page="../footer.jsp"/>
</body>
</html>