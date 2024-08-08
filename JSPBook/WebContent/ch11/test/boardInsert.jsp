<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="kr.or.ddit.ch11.vo.BoardVO"%>
<%@page import="kr.or.ddit.ch11.dao.BoardRepository"%>
<%@page import="kr.or.ddit.ch11.vo.BoardFileVO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
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
                  1. 게시글 등록을 처리해주세요.
                     > 게시글 등록 성공 시, 상세보기 페이지(boardView.jsp)로 이동해주세요.
                     > 게시글 등록을 진행 중 해당 페이지에서 에러가 발생했을때, 에러 페이지(exceptionBoard_error.jsp)로 이동해주세요.
                     
                  2. 게시글 등록 시, 구현해야할 옵션 기능을 설정해주세요.
                     # 파일업로드
                     > 게시글 등록 시, 파일 크기는 2MB로 제한해주세요.
                     > 파일크기 2MB를 넘는 파일을 업로드 시, '업로드 파일 크기를 초과하였습니다' 메세지를 출력해주세요.
                     > 파일을 추가하지 않은 경우에는 일반 게시글이 등록될 수 있도록도 해주세요.
                     
                     # 작성자
                     > 작성자는 시큐리티 인증 후 진행하기 때문에, 인증된 사용자 id로 설정해주세요.
                        - 사용자 id는 시큐리티 인증 정보에서 꺼내주세요.               
                -->
                   <%
                     request.setCharacterEncoding("utf-8");
                      
                     String realFolder = request.getServletContext().getRealPath("/resources/assets/images");
                      
                     String title = "";      
                     String content = "";      
                     
                     int boardNo = 0;
                     
                     BoardRepository dao = BoardRepository.getInstance();
                     
                     BoardVO board = new BoardVO();
                     boardNo = dao.getNo();
                     
                     String writer = request.getRemoteUser();
                     
                     BoardFileVO fileVO = new BoardFileVO();
                     
                     int fileNo = 0;            // 파일 번호
                     String contentType = "";      // 파일 미디어타입
                     long fileSize = 0;         // 파일 크기
                     String fileName = "";   
                     int maxSize = 2 * 1024 * 1024;   // 2MB
                      File file = new File(realFolder);
                     if(!file.exists()){
                        file.mkdirs();
                     }
                     
                     String encType = "utf-8";
                  
                     DiskFileUpload upload = new DiskFileUpload();
                     upload.setSizeMax(9000000);   // 최대 크기
                     upload.setSizeThreshold(maxSize);            
                     upload.setRepositoryPath(realFolder);
                     List items = upload.parseRequest(request);
                     Iterator params = items.iterator();
                     
                     
                     
                     while(params.hasNext()){
                        FileItem item = (FileItem) params.next();
                        if(item.isFormField()){   //일반 데이터 일때
                           // 파라미터의 이름
                           String fieldName = item.getFieldName();
                           if(fieldName.equals("title")){
                              title = item.getString(encType);
                           }else if(fieldName.equals("content")){
                              content = item.getString(encType);
                           }
                        }else{   //파일 일때
                           fileName = item.getName();
                        
                        
                           contentType = item.getContentType();
                           fileSize = item.getSize();
                           /* if(fileSize > maxSize) {
                              out.println("업로드 파일 크기를 초과하였습니다");
                           } */
                           File saveFile = new File(realFolder + "/"+ fileName);
                           item.write(saveFile);   //파일 복사
                        }
                        
                     }
                     boardNo = boardNo + 1;
                     
                     fileVO.setNo(fileNo);
                     fileVO.setFileName(fileName);
                     fileVO.setContentType(contentType);
                     fileVO.setFileSize(fileSize);
                     
                     board.setNo(fileNo);
                     board.setTitle(title);
                     board.setContent(content);
                     board.setWriter(writer);
                     board.setHit(0);
                     board.setFileVO(fileVO);

                     dao.addBoard(board);
                     
                     response.sendRedirect("boardView.jsp?no="+boardNo);
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