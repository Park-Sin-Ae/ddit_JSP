<%@page import="java.util.Enumeration"%>
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
		
		Enumeration em = request.getParameterNames();
		
		StringBuffer sb = new StringBuffer();
		
		while(em.hasMoreElements()){
			String name = (String)em.nextElement();
			String pValue = request.getParameter(name);
			
			sb.append("<p>" + " : "  + "</p>");
			out.print(sb.toString());
		}
	%>
</body>
</html>