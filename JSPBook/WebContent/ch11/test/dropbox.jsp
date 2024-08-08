<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
<%@page import="kr.or.ddit.ch11.dao.BoardRepository"%>
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
						첨부한 파일들을 확인 할 수 있는 자료실 페이지를 구성해주세요.

						메뉴박스
						[게시판][자료실]
						─────────────────────────────────────────────────────────────────────────────						
						
						자료실
						┌───────────┐	┌───────────┐
						│	파일명	│	│	파일명	│
						├───────────┤	├───────────┤
						│	이미지	│	│	이미지	│
						├───────────┤	├───────────┤
						│ 	다운로드	│	│ 	다운로드	│
						└───────────┘	└───────────┘	...
						[목록]
						
						1. 게시판에서 등록했던 게시글에 포함된 모든 파일들을 자료실에서 목록으로 출력해주세요.
						2. 파일 출력
							> 업로드 된 파일이 이미지 파일인경우, 이미지 썸네일을 [이미지]에 출력해주세요.
							> 이미지 파일이 아닌 일반 파일일경우, 해당 파일의 확장자에 맞는 아이콘으로 [이미지]에 출력해주세요.
						3. 다운로드를 클릭 하면 다운로드가 가능하게 해주세요. 
					 -->
					 	<%
					 		boolean admChk = request.isUserInRole("admin");
					 	%>
					 
					 	<c:set value="<%=admChk %>" var="chk"/>
					 	<h3>메뉴박스</h3>
						<hr/>
						<a href="boardList.jsp" class="btn btn-primary">게시판</a>					
						<a href="dropbox.jsp" class="btn btn-danger">자료실</a>
						<c:if test="${chk }">			
						<a href="logout.jsp" class="btn btn-warning">로그아웃</a>
						</c:if>					
						<hr/>			
						<h2>자료실</h2>		
						<hr/>			
						<div class="row">
						<%
					 	request.setCharacterEncoding("UTF-8");
					 
						BoardRepository dao = BoardRepository.getInstance();
						List<BoardVO> boardList = dao.selectBoardList();
						
						for(BoardVO vo : boardList){
							
							String url = "";
							String c = vo.getFileVO().getContentType();
							
							
							if (c.equals("image/jpg") || c.equals("image/png") || c.equals("image/jpeg")) {
								url = "/resources/assets/images/" + vo.getFileVO().getFileName();
							}
							else if("application/x-zip-compressed".equals(c)) {
								url ="/resources/assets/images/fileIcon/zip.jpg";
							}else if("video/x-msvideo".equals(c)) {
								url = "/resources/assets/images/fileIcon/avi.jpg";
							}else if("application/msword".equals(c)) {
								url = "/resources/assets/images/fileIcon/doc.jpg";
							}else if("image/gif".equals(c)) {
								url = "/resources/assets/images/fileIcon/gif.jpg";
							}else if("audio/mpeg".equals(c)) {
								url = "/resources/assets/images/fileIcon/mp3.jpg";
							}else if("application/pdf".equals(c)) {
								url = "/resources/assets/images/fileIcon/pdf.jpg";
							}else if("application/vnd.ms-powerpoint".equals(c)) {
								url = "/resources/assets/images/fileIcon/ppt.jpg";
							}else if("text/plain".equals(c)) {
								url = "/resources/assets/images/fileIcon/txt.jpg";
							}else if("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet".equals(c)) {
								url = "/resources/assets/images/fileIcon/xls.jpg";
							}
						%>
							<div class="col-md-2">
								<div class="card">
									<div class="card-header">
										<p><%= vo.getFileVO().getFileName() %></p>
									</div>
									<div class="card-body">
										<img src="${pageContext.request.contextPath }<%= url %>" style="width: 100%"/>
										<p>Size : <%= vo.getFileVO().getFileSize() %></p>
									</div>
									<div class="card-footer">
										<a href="<%= request.getContextPath() %><%=url %>" download="<%= vo.getFileVO().getFileName() %>">Download</a>
									</div>
								</div>
							</div>
						
						<%
							}
						
						 %>
							
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