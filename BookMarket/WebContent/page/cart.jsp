<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Cart</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left">
						<a href="./deleteCart.jsp?cartId=" class="btn btn-danger">삭제하기</a>
					</td>
					<td align="right"><a href="./shoppingInfo.jsp?cartId=" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>

		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover">
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>

				<tr>
					<td>책ID - 이름</td>
					<td>가격</td>
					<td>수량</td>
					<td>합계</td>
					<td><a href="./removeCart.jsp?id=" class="badge badge-danger">삭제</a></td>
				</tr>
				
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th>총 합계</th>
					<th></th>
				</tr>
			</table>
			<a href="./books.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>