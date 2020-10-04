<%@page import="sun.util.calendar.CalendarDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%
	String id = (String)session.getAttribute("sessionId");	//로그인아이디

	Calendar cal = Calendar.getInstance(); 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	cal.add(Calendar.DATE, 3);
	
	String deliveryDate = sdf.format(cal.getTime());
	
	if(id == null){
%>
<c:redirect url="./member/login_Member.jsp" />
<%} %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#select').change(function(){
		var tpg = $("option:selected", this).val();
		$('#requestMessage').val(tpg);
	});	
});

function k(seq){
	var btn = document.getElementById("btn"+seq);
	btn.disabled = "";
}

$(document).ready(function(){
	document.querySelector('input[id="pxt"]:checked').value;
});

var $menuEle = $('dt'); // 탭메뉴를 변수에 지정
$menuEle.click(function() { // 탭메뉴 클릭 이벤트
    $('dd').addClass('hide');
    $(this).next().removeClass('hide');
})

$(document).ready(function(){
	$('.tab_menu_btn').on('click', function() {
		//버튼 색 제거,추가
		$('.tab_menu_btn').removeClass('on');
		$(this).addClass('on')

		//컨텐츠 제거 후 인덱스에 맞는 컨텐츠 노출
		var idx = $('.tab_menu_btn').index(this);

		$('.tab_box').hide();
		$('.tab_box').eq(idx).show();
	});
});
</script>
<style>
button {
  background:none;
  border:0;
  outline:0;
  cursor:pointer;
}
.tab_menu_btn.on {
  border-bottom:2px solid #00008B;
  font-weight:700;
  color:#00008B;
}
.tab_menu_btn:hover {
  color:#1E90FF;
}
.tab_box {
  display:none;
  padding:20px;
}
.tab_box.on {
  display:block;
}
</style>
<meta charset="UTF-8"> 
<title>배송 정보</title>
</head>
<body>
<jsp:include page="menu.jsp"/>
<sql:setDataSource var="ds" 
				   driver="com.mysql.jdbc.Driver" 
				   url="jdbc:mysql://localhost:3306/NutrientsMarketDB" 
				   user="root" 
				   password="1234"
				   />
				   
<sql:query var="rs" dataSource="${ds }">
	select * from member where id=?
	<sql:param value="<%=id %>"/>
</sql:query>

<div class="jumbotron">
	<div class="container">
		<h1 class="display-3">결제 화면</h1>
	</div>
</div>

<c:forEach var="row" items="${rs.rows}">
<div class="container pt-10">
	<form action="processPayment.jsp" class="form-horizontal" method="post">
		<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>">
		<div class="tab_wrap">
			<div class="tab_menu_container">
				<button class="tab_menu_btn on" id="preAddr" type="button" >기존 배송지</button>
				<button class="tab_menu_btn" id="newAddr" type="button">신규 배송지</button>
			</div>
			<!-- tab_menu_container e -->

			<div class="tab_box_container">
				<div class="tab_box on">
					<script>
						$(document).ready(function() {
							$('#preAddr').click(function(){
								 $('#postcode').val("<c:out value="${row.postcode }"/>");
								 $("#postcode").attr("readonly",true);
								 $('#address').val("<c:out value="${row.address }"/>");
								 $("#address").attr("readonly",true);
								 $('#detailAddress').val("<c:out value="${row.detailAddress }"/>");
								 $("#detailAddress").attr("readonly",true);
							});
						 });
						
					</script>
				</div>
				<div class="tab_box"><!-- 탭박스 2 -->
					<script>
						$(document).ready(function() {
							$('#newAddr').click(function(){
								 $('#postcode').val("");
								 $("#postcode").attr("readonly",false);
								 $("#postcode").attr("placeholder","우편번호");
								 $('#address').val("");
								 $("#address").attr("readonly",false);
								 $("#address").attr("placeholder","주소를 입력하세요.");
								 $('#detailAddress').val("");
								 $("#detailAddress").attr("readonly",false);
								 $("#detailAddress").attr("placeholder","상세주소를 입력하세요.");
							});
						 });
					</script>
				</div>
			</div>
			<!-- tab_box_container e -->
		</div>
		<!-- tab_wrap e -->
		
		<div class="form-group row">
			<label class="col-sm-2"></label>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">우편번호</label>
			<div class="col-sm-7">
				<input type="text" id="postcode" class="form-control mb-3 sm-3 col-sm-3" name="postcode" 
					   value='<c:out value="${row.postcode }"/>' maxlength="5" required>
				<div class="input-group-append">
					<button type="button" onclick="addressFind()" class="btn btn-primary btn-sm mb-3 sm-3" style="height: 34px;">우편번호 찾기</button>
				</div>
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">주소</label>
			<div class="col-sm-8">
				<input type="text" id="address" name="address" class="form-control col-sm-7 mb-3 mr-3 " value='<c:out value="${row.address }"/>' readonly required>
				<input type="text" id="detailAddress" name="detailAddress" class="form-control col-sm-7 mb-3 mr-3" value='<c:out value="${row.detailAddress }"/>' readonly required>
			</div>	
		</div>	
		
		<div class="form-group row">
			<label class="col-sm-2">성명</label>
			<div class="col-sm-3">
				<input name="name" class="form-control sm-3" value='<c:out value="${row.name }"/>' readonly required>
			</div>
		</div>	
		
		<div class="form-group row">
			<label class="col-sm-2">이메일</label>
			<div class="col-sm-5">
				<input name="mail1" class="form-control col-sm-6" maxlength="20" value='<c:out value="${row.email }"/>' readonly required>
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-sm-2">연락처</label>
			<div class="col-sm-3">
				<input name="phone" maxlength="20" class="form-control mb-3 sm-3" value='<c:out value="${row.phone }"/>' readonly required>
			</div>
		</div>	
	
	<div class="form-group row">
		<label class="col-sm-2">배송 요청사항</label>
			<div class="col-sm-5">
				<select id="select" class="show-tick form-control noBSselect" style="height: 34px;">
					<option value="">직접 입력</option>
					<option value="문 앞에 놔주세요.">문 앞에 놔주세요.</option>
					<option value="경비실에 맡겨주세요.">경비실에 맡겨주세요.</option>
					<option value="택배함에 놔주세요.">택배함에 놔주세요.</option>
				</select>
				<input type="text" class="form-control mb-3 sm-3" placeholder="요구사항을 입력해주세요." name="requestMessage"  id="requestMessage">
			</div>
		</div>
		<div class="container alert alert-info">
			<div class="row justify-content-between">
				<div class="row col-2" align="left"></div>
				<div class="row col-3" align="right">
					<p>
						<em>배송 예정일 : <%=deliveryDate %></em>
					</p>
					<input type="hidden" id="sqlDate" name="deliveryDate"
						value="<%=deliveryDate %>">
				</div>
			</div>
			<div>
				<table class="table table-hover">
					<tr>
						<th class="text-center">상품명</th>
						<th class="text-center">상품수량</th>
						<th class="text-center">가격</th>
						<th class="text-center">소계</th>
					</tr>
					<%
						int sum = 0;
						List<Product> cartlist = (List<Product>) session.getAttribute("cartlist");
						if(cartlist == null) cartlist = new ArrayList<Product>();
						
						for(int i = 0; i < cartlist.size(); i++){
							Product product = cartlist.get(i);
							int total = product.getUnitPrice()*product.getQuantity();//단가*수량
							sum = sum + total;//sum(총 금액) = 개별상품의 가격 합.
					%>
					<tr>
						<td class="text-center"><%=product.getPname() %></td>
						<td class="text-center"><%=product.getQuantity() %></td>
						<td class="text-center"><%=product.getUnitPrice() %></td>
						<td class="text-center"><%=total %></td>
					</tr>
					<%} %>
					<tr>
						<td></td>
						<td></td>
						<td class="text-right"><strong>총액 : </strong></td>
						<td class="text-center text-danger"><strong><%=new DecimalFormat("#,###").format(sum) %></strong></td>
					</tr>
				</table>
			</div>
		</div>

		<input type="submit" class="btn btn-outline-primary btn-block"
			value="결제하기">
		</form>
	</div>
</c:forEach>
	<jsp:include page="footer.jsp"/>
</body>
</html>
<!-- 우편번호 찾기 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script> 
	// 우편번호찾기
   function addressFind() {
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

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("postcode").value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
   }   
</script>