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
                        <h1 class="page-title">파일 업로드</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>CH07</li>
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
                    	<!-- 
                    		1. 로그인 처리를 진행할 수 있도록 로그인 페이지를 작성해주세요.
                    			아이디 : _____________
                    			비밀번호 : ____________
                    			[ 로그인 ]  [ 회원가입 ]
                    		
                    		2. 로그인 처리 중 실패로 인해 넘어온 error정보를 출력해주세요. 
                    			- alert을 이용해 출력
                    			- text로 출력
                    			
                    			두 가지 방법 외에 다른 방법이 있다면 자유롭게 사용
                    	 -->
                    	 <%
                    	 	request.setCharacterEncoding("UTF-8");
                    	 	String res = request.getParameter("res");
                    	 	
                    	 	if(res == null) {
                    	 		res = "";
                    	 	} else {
                    	 		res = "일치하는 회원정보가 없습니다.";
                    	 	}
                    	 %>
                    	 <form action="ch07_test_signin_process.jsp" method="post">
                    	 	<div class="row">
	                    	 	<div>
		                           <label>아이디</label> 
		                           <input type="text" name="id" class="form-control">
		                           <p><%= res %></p>
		                        </div>
		                        <div class="mb-3">
		                           <label>비밀번호</label>
		                           <input type="text" name="pw" class="form-control" />
		                        </div>
                    	 	</div>
	                        	<input type="submit" class="btn btn-primary" value="로그인">
	                    	 	<input type="button" class="btn" value="회원가입">	
                    	 </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>