<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		DiskFileUpload upload = new DiskFileUpload();
		
		List items = upload.parseRequest(request);
		Iterator params = items.iterator();
		
		while(params.hasNext()) {
			FileItem item = (FileItem)params.next();
			
			if(!item.isFormField()){
				String fileFieldName = item.getFieldName();
				String fileName = item.getName();
				
				String contentType = item.getContentType();
				
				long fileSize = item.getSize();
				
				File file = new File("/" + fileName);
				item.write(file);
				out.println("요청 파라미터 이름 : " + fileFieldName + "<br/>");
				out.println("저장 파일 이름 : " + fileName + "<br/>");
				out.println("파일 콘텐츠 타입 : " + contentType + "<br/>");
				out.println("파일 크기 : " + fileSize + "<br/>");
			}
		}
	%>
</body>
</html>