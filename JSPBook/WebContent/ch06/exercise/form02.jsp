<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="form02_process.jsp" method="post">
		<label>이름 :</label>
		<input type="text" name="name">
		<label>주소 :</label>
		<input type="text" name="addr">
		<label>이메일</label>
		<input type="text" name="email">
		<input type="submit" value="전송">
	</form>
</body>
</html>