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
                        <li>CH13</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
	<%
		String v = request.getParameter("v");
		if(v != null && v.equals("2")){
			%>
			<script>
				alert("로그인 세션이 1분으로 연장되었습니다!");
			</script>
			<%
		} else {
			// 세션 시간 default time 30초 설정
			session.setMaxInactiveInterval(30);
		}
		
		// 세션 유효시간 담아두기
		int maxInterval = session.getMaxInactiveInterval();
	%>
	<c:set value="<%= maxInterval %>" var="time"/>
    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
						<!-- 내용을 입력해주세요 -->
						<!-- 
							1. 초기 세션 만료시간을 30초로 설정해주세요.
							2. 세션 만료시간이 15초일때, "로그인 세션이 곧 만료됩니다. 연장하시겠습니까?"라는
							아림창이 나타나고 [확인] 버튼을 클릭 시 , 세션 만료시간을 60초로 연장 후 해당페이지에서
							60초부터 세션 만료시간이 관리될 수 있도록 설정해주세요.
							
							[취소]버튼을 클릭 시, 세션 만료가 그대로 진행되게 하고 세션만료 시간이 0일떄,
							"로그인 세션 시간이 만료되어 자동 로그아웃 되었습니다"를 출력해주세요.
						 -->
						<div class="col-4">
							<div class="card">
								<div class="card-header">
									<p>현재 세션 현황입니다.</p>
								</div>
								<div class="card-body">
									<p>설정된 세션 시간은 ${time }초 입니다.</p>
									<h5 id="timer"></h5>
								</div>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
<script>
$(function(){
	var time = "${time}";		// 30초
	
	setInterval(() => {
		$("#timer").html("남은시간 : " + time + "초");
		if(time == 15) {	// 15초 일때
			if(confirm("로그인 세션이 곧 종료됩니다. 연장하시겠습니까?")){
				location.href="ch13_test_process.jsp";
			}
		}else if (time == 0) {
			location.href="ch13_test_exit.jsp";
		}
		time--;
	}, 1000);
});
</script>
</html>