<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>쉽게 배우는 JSP 웹 프로그래밍</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="/pageModule/headPart.jsp" %>
</head>
<body>
	<%@ include file="/pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">JSP 개요</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH05</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
						<!-- 내용을 입력해주세요 -->
						<!-- 
							ch05_test.jsp에서 전달 받은
							아이디, 비밀번호, 이름, 성별, 핸드폰번호, 주소를 
							taglib를 이용하여 출력해주세요.
							
							[출력 예시]
							아이디 : a001
							비밀번호 :1234
							이름 : 홍길동
							성별 : 남자
							핸드폰번호 : 010-1234-1234
							주소 : 대전시 중구 오류동 123
							
							그리고, 데이터 출력 후 5초 뒤에 www.naver.com 홈페이지로 이동시켜주세요.
						 -->
						 <%
						 	request.setCharacterEncoding("UTF-8");
						 
						 	String userId = request.getParameter("id");
						 	String userPw = request.getParameter("pw");
						 	String userNm = request.getParameter("name");
						 	String gender = request.getParameter("gender");
						 	String userHp = request.getParameter("hp");
						 	String userAddr = request.getParameter("addr");
						 	
						 %>
						
						 <c:set value="<%= userId %>" var="id"></c:set>
						 <c:set value="<%= userPw %>" var="pw"></c:set>
						 <c:set value="<%= userNm %>" var="name"></c:set>
						 <c:set value="<%= gender %>" var="gender"></c:set>
						 <c:set value="<%= userHp %>" var="hp"></c:set>
						 <c:set value="<%= userAddr %>" var="addr"></c:set>
						 <p>아이디 : ${id}</p>						 
						 <p>비밀번호 : ${pw}</p>						 
						 <p>이름 : ${name}</p>
						 
						 						 
						 <p>성별 : 
						 	 <c:if test="${gender == 'M' }">
						 		<c:out value="남자"></c:out>
							 </c:if>
							 <c:if test="${gender == 'G' }">
							 		<c:out value="여자"></c:out>
							 </c:if>
						 </p>						 
						 <p>핸드폰번호 : ${hp}</p>						 
						 <p>주소 : ${addr}</p>		
						 
<%-- 						 <% response.setHeader("Refresh", "5;url='http://www.naver.com'"); %>				  --%>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>