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
<%@ include file="header.jsp" %>
<%
	// Calendar 클래스는 추상 클래스로 직접 객체를 생성할 수 없습니다. 
	// 그래서 getInstance()라는 정적 메서드(static method)를 사용하여 
	// Calendar 객체의 인스턴스를 얻습니다.
	
	Calendar time = Calendar.getInstance();
%>
<p>현재 시간 : <%= time.getTime() %></p>
</body>
</html>