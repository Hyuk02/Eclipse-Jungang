<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<style>
  /* Make the image fully responsive */
  .carousel-inner img {
    width: 100%;
    height: 100%;
  }
  </style>
</head>
<body>
<jsp:include page="menu.jsp"/>
<div class="jumbotron">
	<div class="container text-center">
		<div class="form-inline">
				<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<h2 >Welcome to</h2><div>&nbsp;&nbsp;&nbsp;</div><h1>NutrientsMarket</h1>
		</div>
		<h3 class="text-center"><small>오직 나를 위한 맞춤 영양제를 추천해드립니다 !</small></h3>
	</div>
</div>

<div id="demo" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="product.jsp?id=P1236"><img src="./resources/images/banner0.PNG" alt="Los Angeles" width="1100" height="500"></a>
      <div class="carousel-caption">
        <h3>사과나무아래 달콤홍삼</h3>
        <p>첨가물없이 좋은재료(사과,홍삼)로 먹기 편하게 만든 어린이 홍삼음료</p>
      </div>   
    </div>
    <div class="carousel-item">
      <a href="product.jsp?id=P1237"><img src="./resources/images/banner2.PNG" alt="Los Angeles" width="1100" height="500"></a>
      <div class="carousel-caption">
        <h3>원스데일리 멀티비타민 3종</h3>
        <p>기능성분 21가지, 보조성분 54가지! 하루 한번 풍부한 멀티비타민</p>
      </div>   
    </div>
    <div class="carousel-item">
      <img src="./resources/images/banner3.PNG" alt="Los Angeles" width="1100" height="500">
      <div class="carousel-caption">
        <h3>안국 저분자 콜라겐 비티더스</h3>
        <p>하루 2포로 손쉽게 콜라겐을 섭취하세요!</p>
      </div>   
    </div>
  </div>
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
<hr>
<jsp:include page="footer.jsp"/>
</body>
</html>