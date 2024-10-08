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
                        <li>CH08</li>
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
						<!-- 자바스크립트 onsubmit 이벤트 -->
						<form action="" method="post" name="loginForm" onsubmit="return submitEvent()">
							아이디 : <input type="text" name="id"><br/>
							비밀번호 : <input type="text" name="pw"><br/>
							<input type="submit" value="전송">
						</form>
						
						<!-- jquery form 태그를 이용한 submit 이벤트 -->
						<form action="" method="post" id="loginForm2">
							아이디 : <input type="text" name="id" id="id2"><br/>
							비밀번호 : <input type="text" name="pw" id="pw2"><br/>
							<input type="submit" value="전송">
						</form>
						<!-- jquery click 이벤트 -->
						<form action="" method="post" id="loginForm3">
							아이디 : <input type="text" name="id" id="id3"><br/>
							비밀번호 : <input type="text" name="pw" id="pw3"><br/>
							<input type="button" value="전송" id="submitBtn3">
						</form>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script type="text/javascript">
function submitEvent() {
	console.log("submitEvent() click...");
	
	var id = document.loginForm.id.value;
	var pw = document.loginForm.pw.value;
	
	console.log(id);
	console.log(pw);
	
	if(id == ""){
		alert("아이디를 입력해주세요");
		return false;
	}
	if(pw == ""){
		alert("비밀번호를 입력해주세요");
		return false;
	}
}

$(function() {
	var loginForm2 = $("#loginForm2");
	var loginForm3 = $("#loginForm3");
	var submitBtn3 = $("#submitBtn3");
	
	loginForm2.submit(function() {
		var id = $("#id2").val();
		var pw = $("#pw2").val();
		
		if(id == ""){
			alert("아이디를 입력해주세요");
			return false;
		}
		if(pw == ""){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		$(this).submit();
	});
	
	submitBtn3.on("click", function() {
		var id = $("#id3").val();
		var pw = $("#pw3").val();
		
		if(id == ""){
			alert("아이디를 입력해주세요");
			return false;
		}
		if(pw == ""){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		loginForm3.submit();
	});
});

</script>
</html>