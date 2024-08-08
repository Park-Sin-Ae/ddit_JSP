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
	
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
		
		StringBuffer sb = new StringBuffer();
		
		sb.append("<p> 아이디 : ").append(name).append("</p>");
		sb.append("<p> 주소 : ").append(addr).append("</p>");
		sb.append("<p> 이메일 : ").append(email).append("</p>");
		
		out.print(sb.toString());
	%>
</body>
</html>