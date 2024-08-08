<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="form03_process.jsp" method="post">
		<label>오렌지</label>
		<input type="checkbox" name="fruit" value="orange">
		<label>사과</label>
		<input type="checkbox" name="fruit" value="apple">
		<label>바나나</label>
		<input type="checkbox" name="fruit" value="banana">
		
		<input type="submit" class="btn btn-primary" value="전송">
	</form> 
</body>
</html>