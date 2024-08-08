<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문정보</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">주문정보</h1>
		</div>
	</div>

	<div class="container col-8 alert alert-info">
		<div class="text-center ">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong><!-- 배송주소 --></strong> <br> 성명 : <!-- 성명 -->	<br> 
				우편번호 : <!-- 우편번호 --><br> 
				주소 : <!-- 주소 -->(<!-- 국가 -->) <br>
			</div>
			<div class="col-4" align="right">
				<p>	<em>배송일: <!-- 배송일 --></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">			
			<tr>
				<th class="text-center">도서</th>
				<th class="text-center">#</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>

			<tr>
				<td class="text-center"><em><!-- 도서명 --> </em></td>
				<td class="text-center"><!-- 수량 --></td>
				<td class="text-center"><!-- 가격 --> 원</td>
				<td class="text-center"><!-- 합계 --> 원</td>
			</tr>

			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><!-- 총액 --></strong></td>
			</tr>
			</table>
				<a href="./shoppingInfo.jsp?cartId="class="btn btn-secondary" role="button"> 이전 </a>
				<a href="./thankCustomer.jsp"  class="btn btn-success" role="button"> 주문완료 </a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button"> 취소 </a>
		</div>
	</div>	
</body>
</html>
