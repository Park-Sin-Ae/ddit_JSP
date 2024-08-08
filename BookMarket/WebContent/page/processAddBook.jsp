<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="vo.Book"%>
<%@page import="dao.BookRepository"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
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
	
	String bookId = "";
	String name = "";
	String unitPrice = "";
	String author = "";
	String publisher = "";
	String releaseDate = "";
	String totalPages = "";
	String description = "";
	String category = "";
	String unitsInStock = "";
	String condition = "";
	String fileName = "";
	
	while(params.hasNext()) {
		FileItem item = (FileItem)params.next();
		if(item.isFormField()){		// 일반 데이터일때
			
			// 파라미터의 이름
			String fieldName = item.getFieldName();
			if(fieldName.equals("bookId")) {
				bookId = item.getString(encType);
			} else if(fieldName.equals("name")){
				name = item.getString(encType);
			}else if(fieldName.equals("unitPrice")){
				unitPrice = item.getString(encType);
			}else if(fieldName.equals("author")){
				author = item.getString(encType);
			}else if(fieldName.equals("publisher")){
				publisher = item.getString(encType);
			}else if(fieldName.equals("releaseDate")){
				releaseDate = item.getString(encType);
			}else if(fieldName.equals("totalPages")){
				totalPages = item.getString(encType);
			}else if(fieldName.equals("description")){
				description = item.getString(encType);
			}else if(fieldName.equals("category")){
				category = item.getString(encType);
			}else if(fieldName.equals("unitsInStock")){
				unitsInStock = item.getString(encType);
			}else if(fieldName.equals("condition")){
				condition = item.getString(encType);
			}
			
		} else {	// 파일 일때
			fileName = item.getName();
			File saveFile = new File(realFolder + "/" + fileName);
			item.write(saveFile);		// 파일 복사
		}
	}
	// 1) 등록 페이지에서 넘어온 데이터중 받지 않은 데이터가 존재합니다.
	//    받지 않은 데이터 bookId와 name을 받아주세요.
	/*
 	String bookId = request.getParameter("bookId");
 	String name = request.getParameter("name");
 	String unitPrice = request.getParameter("unitPrice");
 	String author = request.getParameter("author");
 	String publisher = request.getParameter("publisher");
 	String releaseDate = request.getParameter("releaseDate");
 	String totalPages = request.getParameter("totalPages");
 	String description = request.getParameter("description");	
 	String category = request.getParameter("category");
 	String unitsInStock = request.getParameter("unitsInStock");
 	String condition = request.getParameter("condition");
	*/
	
	Integer price;

	if (unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);

	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);

	BookRepository dao = BookRepository.getInstance();

	Book newBook = new Book();
	
	// 2) 나머지 데이터들 중 bookId, name 데이터를 newBook에 추가해주세요.

	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setTotalPages(Integer.parseInt(totalPages));
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(fileName);

	// 3) 새롭게 구성된 newBook을 책 전체 목록 데이터인 list에 추가해주세요.
	
	dao.addBook(newBook);

	response.sendRedirect("books.jsp");
%>