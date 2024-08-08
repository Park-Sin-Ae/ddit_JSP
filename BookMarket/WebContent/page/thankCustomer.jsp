<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문완료</title>
</head>
<body>

	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">주문완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>
		<p>
			주문은	 [<!-- 배송일자 -->]
			에 배송될 예정입니다! !	
		<p>
			주문번호 :	주문번호(<!-- 주문 ID -->)		
	</div>
	<div class="container">
		<p>
			<a href="./books.jsp" class="btn btn-secondary"> &laquo; 상품목록</a>
		</p>
	</div>
</body>
</html>