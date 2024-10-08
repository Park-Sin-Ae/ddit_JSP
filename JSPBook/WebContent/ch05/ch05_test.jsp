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
							문제입니다.
							아이디, 비밀번호, 이름, 성별, 핸드폰번호, 주소를 입력받을 폼을 구성하고
							> 성별의 데이터는 남자일때는 M, 여자일때는 G로 설정해주세요.
							> input value="M", value="G"
							입력받은 데이터를 ch05_test_process.jsp로 전달하세요.
						 -->
						 <form action="ch05_test_process.jsp" method="post">
						 	<label class="form-label">아이디</label>
							<input class="form-control" type="text" name="id"/><br/>
							<label class="form-label">비밀번호</label>
							<input class="form-control" type="text" name="pw"/><br/>
							<label class="form-label">이름</label>
							<input class="form-control" type="text" name="name"/><br/>
							<label class="form-label">성별</label>
							<input class="form-check-input"  type="radio" value="M" name="gender">남자
							<input class="form-check-input"  type="radio"value="G" name="gender">여자<br/>
							<label class="form-label">핸드폰번호</label>
							<input class="form-control" type="text" name="hp"/><br/>
							<label class="form-label">주소</label>
							<input class="form-control" type="text" name="addr"/><br/>
							<input class="btn btn-primary" type="submit" value="전송"/><br/>
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