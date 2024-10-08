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
							회원가입 페이지를 작성해주세요.
							아이디 : _____________
							비밓번호 : _____________
							이름 : ______________
							성별 : O 남자 O 여자
							프로필 이미지 : [ 파일선택 ]
							-----------------------
							[ 가입하기 ] [ 뒤로가기 ]
						-->
						<form action="ch07_test_signup_process.jsp" method="post" enctype="multipart/form-data">
	                     <div class="row">
	                        <div>
	                           <label>아이디</label> 
	                           <input type="text" name="id"  class="form-control">
	                        </div>
	                        <div>
	                           <label>비밀번호</label>
	                           <input type="text" name="pw" class="form-control" />
	                        </div>
	                        <div>
	                           <label>이름</label>
	                            <input type="text" name="name" class="form-control" />
	                        </div>
	
	                        <div class="mb-3">
	                           <label for="gender" class="form-label">성별</label>
	                           <div class="form-check">
	                              <input class="form-check-input" type="radio" id="genderMale" name="gender" value="male" required> 
	                              <label class="form-check-label" for="genderMale">남성</label>
	                           </div>
	                           <div class="form-check">
	                              <input class="form-check-input" type="radio" id="genderFemale" name="gender" value="female" required> 
	                              <label class="form-check-label" for="genderFemale">여성</label>
	                           </div>
	                        </div>
	
	                        <div>
	                           <label>프로필 이미지</label><br /> 
	                           <input type="file" name="filename" class="form-control" />
	                        </div>
	                        <div>
	                           <input type="submit" value="가입하기" class="btn btn-primary" /> 
	                           <input type="button" value="뒤로가기" class="btn btn-primary"  onclick="redirectToLink()"/><br/>
	                        </div>
	                     </div>
                  	</form>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script>
function redirectToLink() {
    window.location.href = 'ch07_test_signin.jsp'; // 여기에 원하는 URL 입력
}
</script>
</html>