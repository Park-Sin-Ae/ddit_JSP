<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                        <li>CH01</li>
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
							1. 시큐리티 보호자원 이동 시, 인증 페이지를 작성해주세요.
							
							시큐리티 인증
							───────────────────────
							아이디 : ________
							비밀번호 : _________
							[ 로그인  ]
							
							*** loginSecurity.jsp에서 곧바로 로그인을 요청 시, 타겟 정보가 없기 떄문에 404에러가 발생한다.
						 -->
					 	<h3>시큐리티 인증</h3>
					 	<hr/>
					 	<form action="j_security_check" method="post">
						 	<div class="row">
						 		<div class="col-1">
						 			<label class="form-label">아이디</label>
						 		</div>
						 		<div class="col-11">
						 			<input type="text" class="form-control mb-4" name="j_username">
						 		</div>
						 		<div class="col-1">
						 			<label class="form-label">비밀번호</label>
						 		</div>
						 		<div class="col-11">
						 			<input type="text" class="form-control mb-4" name="j_password">
						 		</div>
						 	</div>
					 		<input type="submit" value="로그인" class="btn btn-primary">
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