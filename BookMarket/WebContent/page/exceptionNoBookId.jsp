<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서ID 오류</title>
</head>
<body>
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">해당 도서가 존재하지 않습니다.</h2>
		</div>
	</div>
	<div class="container">
		<p>url 정보</p>
		<p>
			<a href="products.jsp" class="btn btn-secondary"> 도서 목록 &raquo;</a>			
	</div>
</body>
</html>
