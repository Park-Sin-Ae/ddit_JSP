<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@page import="kr.or.ddit.ch07.MemberDAO"%>
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
                    	1. 회원 목록 페이지를 작성해주세요.
                    	
                    	[ 등록 ]
                    	______________________________
                    	이미지	     회원정보			버튼
                    	______________________________
                    	[ 이	]     아이디 : a001      [상세]
                    	[ 미 ]     비번 : 1234
                    	[ 지 ]     이름 : 홍길동
                    	[ 란 ]     성별 : 남자
                    	______________________________
                    	[ 이	]     아이디 : a002      [상세]
                    	[ 미 ]     비번 : 1234
                    	[ 지 ]     이름 : 홍길순
                    	[ 란 ]     성별 : 여자
                    	______________________________
                    	... 
                     -->
                     
                     <h2>회원목록</h2>
                     <hr>
                     <a class="btn btn-primary" href="ch07_test_signup.jsp">회원등록</a>
                     <hr>
                     <div class="row">
                     <%
                     	request.setCharacterEncoding("UTF-8");
                     	
                     	String gender ="";
                     
                     	MemberDAO dao = MemberDAO.getInstance();
                     	List<MemberVO> memList = dao.getMemberList();
                     	for(MemberVO mem : memList) {
                     		if(mem.getMem_sex().equals("male")) {
                     			gender = "남자";
                     		} else {
                     			gender = "여자";
                     		}
	                 %>	
                     	<div class="col-md-3">
                     		<div class="card">
                     			<div class="card-header">
                     				<p><%= mem.getMem_name() %>님의 정보</p>
                     			</div>
                     			<div class="card-body">
                     			<img alt="" src="${pageContext.request.contextPath }/resources/images/<%= mem.getFilename() %>" style="width: 100%"/>
                     				아이디 : <%= mem.getMem_id() %> <br/>
                     				비밀번호 : <%= mem.getMem_pw() %><br/>
                     				성별 : <%= gender %>
                     			</div>
                     		</div>
                     	</div>
                     <%} %>
                     </div>
                     
					</div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>