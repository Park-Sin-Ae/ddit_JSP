<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>Welcome</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
</head>
<body>	
	<%@ include file="menu.jsp" %>
	<!--
		선언문 태그를 이용하여 "Book Market Mall"과 "Welcome to Book Market!"를 저장하는 변수를 선언합니다.
		표현문 태그를 이용하여 설정한 변수 값을 출력합니다.
	-->
	<%!
		String greeting ="Book Market Mall";
		String tagline = "Welcome to Book Market!";
	%>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">
				<!-- greeting 변수를 출력합니다. -->
				<%= greeting %>
			</h1>
		</div>
	</div>
	<main role="main">
	<div class="container">
		<div class="text-center">
			<h3>
				<!-- tagline 변수를 출력합니다. -->
				<%= tagline %>
			</h3>			
		</div>
		<hr>
	</div>
	</main>
	<footer class="container">
		<p>&copy; BookMarket</p>
	</footer>
</body>
</html>