<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">관리자 페이지</h1>
	</div>
</div>
<div class="container">
	<div class="list-group">
		<a href="./editSaleStatus.jsp" 
			class="list-group-item list-group-item-action list-group-item-info">배송 상태 관리</a>
		<a href="./addProduct.jsp" 
			class="list-group-item list-group-item-action list-group-item-success">상품 등록</a>
		<a href="./editProduct.jsp?edit=update" 
			class="list-group-item list-group-item-action list-group-item-success">상품 수정</a>
		<a href="./editProduct.jsp?edit=delete" 
			class="list-group-item list-group-item-action list-group-item-success">상품 삭제</a>
		<a href="./addCategory.jsp" 
			class="list-group-item list-group-item-action list-group-item-warning">카테고리 등록</a>
		<a href="./addBrand.jsp" 
			class="list-group-item list-group-item-action list-group-item-warning">브랜드 등록</a>
		<a href="./logout.jsp" 
			class="list-group-item list-group-item-action list-group-item-danger">관리자 로그아웃</a>
	</div>
</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>