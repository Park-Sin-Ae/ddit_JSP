<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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
		response.setIntHeader("Refresh", 5);
	%>
	<%
		Date day = Calendar.getInstance().getTime();
		String am_pm;
		int hour = day.getHours();
		int minute = day.getMinutes();
		int second = day.getSeconds();
		if(hour / 12 == 0) {
			am_pm = "AM";
		} else{
			am_pm = "PM";
			hour = hour - 12;
		}
	%>
	<p>현재 시간은  <%= hour %> : <%= minute %> : <%= second %> <%= am_pm %> </p>
	
	<a href="response_data.jsp">Google 홈페이지로 이동하기</a>
</body>
</html>


