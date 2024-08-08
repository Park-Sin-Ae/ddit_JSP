<%@page import="kr.or.ddit.ch07.MemberVO"%>
<%@page import="kr.or.ddit.ch07.MemberDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
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
							1. 회원가입 처리를 진행해주세요.
								- 회원가입 시, 등록에 필요한 항목 모두를 이용해 가입을 진행해주세요.
								- 프로필 이미지가 있기 때문에 파일 처리도 함께 해주세요.
								- 가입 완료 후, 로그인 페이지로 이동해주세요.
						-->
						<% request.setCharacterEncoding("UTF-8");
						// D:/JSP_SPRING/00.JSP/workspace_jsp/.metadata/.plugins
						// /org.eclips.wst.server.core/tmp0/wtpwebapps/WebMarket/resources/images
						String realFolder = request.getServletContext().getRealPath("/resources/images");
						File file = new File(realFolder);
						if(!file.exists()){
							file.mkdirs();
						}
						
						int maxSize = 5 * 1024 * 1024;	// 5MB
						String encType = "UTF-8";
						
						DiskFileUpload upload = new DiskFileUpload();
						upload.setSizeMax(9000000);	// 최대 크기
						upload.setSizeThreshold(maxSize);
						upload.setRepositoryPath(realFolder);
						List items = upload.parseRequest(request);
						Iterator params = items.iterator();
						
						String id = "";
						String pw = "";
						String name = "";
						String gender = "";
						String filename = "";
						
						while(params.hasNext()) {
							FileItem item = (FileItem)params.next();
							if(item.isFormField()){		// 일반 데이터일때
								
								// 파라미터의 이름
								String fieldName = item.getFieldName();
								if(fieldName.equals("id")) {
									id = item.getString(encType);
								} else if(fieldName.equals("pw")){
									pw = item.getString(encType);
								} else if(fieldName.equals("name")){
									name = item.getString(encType);
								}else if(fieldName.equals("gender")){
									gender = item.getString(encType);
								}else if(fieldName.equals("filename")){
									filename = item.getString(encType);
								}
								
							} else {	// 파일 일때
								filename = item.getName();
								File saveFile = new File(realFolder + "/" + filename);
								item.write(saveFile);		// 파일 복사
							}
						}
						MemberDAO dao = MemberDAO.getInstance();
						
						MemberVO member = new MemberVO();
						member.setMem_id(id);
						member.setMem_pw(pw);
						member.setMem_name(name);
						member.setMem_sex(gender);
						member.setFilename(filename);

						dao.insertMember(member);
						
						response.sendRedirect("ch07_test_signin.jsp");
						%>
						
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>