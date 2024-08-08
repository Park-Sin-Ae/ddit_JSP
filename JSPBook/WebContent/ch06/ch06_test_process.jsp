<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>쉽게 배우는 JSP 웹 프로그래밍</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ include file="/pageModule/headPart.jsp"%>
</head>
<body>
	<%@ include file="/pageModule/header.jsp"%>

	<div class="breadcrumbs" style="padding-top: 40px;">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-12">
					<div class="breadcrumbs-content">
						<h1 class="page-title">내장객체</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-12">
					<ul class="breadcrumb-nav">
						<li><a href="/">INDEX</a></li>
						<li>CH06</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<section class="about-us section">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<!-- 
            	넘겨받은 모든 데이터를 아래와 같은 형식으로 출력해주세요.
            	
            	[결과]
            	아이디 : a001
            	비밀번호 : 1234
            	이름 : 홍길동
            	핸드폰번호 : 010-1234-1234
            	성별 : 남자
            	취미 : 운동 영화 독서
            	가입인사 : 
            	대덕인재개발원 403호 000입니다!
            	반갑습니다! 잘부탁드립니다!
            	
            	아래 두가지 방법 모두로 출력해주세요.
            	- 스크립트 태그를 이용한 방법으로 출력해주세요.
            	- JSTL을 이용한 방법으로 출력해주세요.
             -->
				<div class="row">
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<h5>스크립트 태그를 이용한 방법</h5>
							</div>
							<div class="card-body">
								<%
									request.setCharacterEncoding("UTF-8");
								
									String id =request.getParameter("id");
									String pw =request.getParameter("pw");
									String name =request.getParameter("name");
									String phone1 =request.getParameter("phone1");
									String phone2 =request.getParameter("phone2");
									String phone3 =request.getParameter("phone3");
									String gender =request.getParameter("gender");
									
									gender = gender.equals("M") ? "남자" : "여자";
									String[] hobby =request.getParameterValues("hobby");
								
									
									String comment = request.getParameter("comment");
									
								%>
								아이디:<%=id %><br/>
								비밀번호:<%=pw %><br/>
								이름:<%=name %><br/>
								연락처:<%=phone1 %>-<%=phone2 %>-<%=phone3 %><br/>
								성별:<%=gender %><br/>
								취미:
								<%
									if(hobby != null){
										for(int i=0; i<hobby.length;i++){
											
											if(hobby[i].equals("movie")){
												hobby[i] = "영화";
											}else if(hobby[i].equals("power")){
												hobby[i] = "운동";
											}else if(hobby[i].equals("book")){
												hobby[i] = "독서";
											}else{
												hobby[i] = "음악";
											}
											out.println(""+ hobby[i]);
										}
									}
									
								%>
								<br/>
								<p style="white-space:pre-wrap;">가입인사:<c:out value="<%=comment %>"/><br/>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card">
							<div class="card-header">
								<h5>JSTL을 이용한 방법</h5>
							</div>
							<div class="card-body">
								<c:set value="<%=id %>" var="id"/>
								<c:set value="<%=pw %>" var="pw"/>
								<c:set value="<%=name %>" var="name"/>
								<c:set value="<%=phone1 %>" var="phone1"/>
								<c:set value="<%=phone2 %>" var="phone2"/>
								<c:set value="<%=phone3 %>" var="phone3"/>
								<c:set value="<%=gender %>" var="gender"/>
								<c:set value="<%=hobby %>" var="hobby"/>
								<c:set value="<%=comment %>" var="comment"/><br/>
								
								 <p>아이디: ${id }</p>
								 <p>비밀번호: ${pw }</p>
								 <p>이름: ${name }</p>
								 <p>핸드폰번호: ${phone1 }-${phone2 }-${phone3 }</p>
								 <p>성별: ${gender }</p>
								 <p>취미:
								 <c:forEach items="${hobby }" var="hobby" varStatus="stat">
								 	<c:choose>
								 		<c:when test="${hobby.equals('movie') }">
								 			영화
								 		</c:when>
								 		<c:when test="${hobby.equals('book') }">
								 			독서
								 		</c:when>
								 		<c:when test="${hobby.equals('power') }">
								 			운동
								 		</c:when>
								 		<c:when test="${hobby.equals('music') }">
								 			음악
								 		</c:when>
								 		<c:otherwise>
								 		</c:otherwise>
								 	</c:choose>
								 	${hobby }
								</c:forEach></p>
								<p style="white-space:pre-wrap;">가입인사:<c:out value="<%=comment %>"/><br/>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<%@ include file="/pageModule/footer.jsp"%>

	<%@ include file="/pageModule/footerPart.jsp"%>
</body>
</html>