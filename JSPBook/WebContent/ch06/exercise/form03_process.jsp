<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String[] fruits = request.getParameterValues("fruit");
	%>
	
	<b>선택한 과일</b>
	<p><%
			if(fruits != null) {
				for(int i = 0; i < fruits.length; i++) {
					out.println(" " + fruits[i]);
				}
			}
		%></p>
	
</body>
</html>