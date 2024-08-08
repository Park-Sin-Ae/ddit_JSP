<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<script>
	$(function() {
		var orderSelect = $("#orderSelect");
		
		$("#t1").hide();
		$("#t2").hide();	
		
		orderSelect.on("change", function() {
			var value = $(this).val();		// 선택한 selectbox 데이터
			
			if(value == "1") {
				$("#t1").show();
				$("#t2").hide();
			} else {
				$("#t2").show();
				$("#t1").hide();
			}
		});
	});
</script>
<body>
	<select id="orderSelect">
		<option>-출력선택-</option>
		<option value="1">가로출력</option>
		<option value="2">세로출력</option>
	</select>
	<div id="t1">
		<br/>
		<%
			String color = "";
		out.println("<table class='table table-bordered' width='100%'>");
		for(int i = 1; i <= 9; i++){
			out.println("<tr align='center'>");
			for(int j = 1; j <= 9; j++) {
				if( i % 2 == 0) {
					color = "red";
				} else {
					color = "black";
				}
				out.println("<td><font color ='" + color + "'>" + i +
						" x " + j + " = " + (i*j) + "</font></td>");
			}
			out.println("</tr>");
		}	
			out.println("</table>");
		%>
	</div>
	
	<div id="t2">
		<br/>
		<%
			out.println("<table class='table table-bordered' width='100%'>");
			for(int i = 1; i <= 9; i++){
				out.println("<tr align='center'>");
				for(int j = 1; j <= 9; j++) {
					if( j % 2 == 0) {
						color = "red";
					} else {
						color = "black";
					}
					out.println("<td><font color ='" + color + "'>" + j +
							" x " + i + " = " + (i*j) + "</font></td>");
				}
				out.println("</tr>");
			}	
				out.println("</table>");
		%>
	</div>
</body>
</html>