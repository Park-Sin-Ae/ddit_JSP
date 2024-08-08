<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
                        <li>CH03</li>
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
							*** JSTL을 활용하여 아래 문제를 작성해주세요.
							1) 305호 반 학생 이름 모두를 Core태그 set에 저장한 후, 전체를 출력해주세요.
							2) 학생 4명씩 끊어서 출력해주세요.
								이름 이름 이름 이름
								이름 이름 이름 이름
								이름 이름 이름 이름
								이름 이름 이름 이름
								...
							3) 4명씩 끊어서 출력할 때, 본인의 이름을 '본인'으로 출력해주세요.
							 > 본인 글자를 출력 시, 굵은 글씨 / 녹색으로 출력해주세요.
						 -->
						 <h5>305반 전체 인원(25명)</h5>
						 <%
// 						 	List<String> list = new ArrayList<String>();
// 						 	list.add("강미정");
// 						 	list.add("금서윤");
// 						 	list.add("김동영");
// 						 	list.add("김동윤");
// 						 	list.add("김선경");
// 						 	list.add("김성재");
// 						 	list.add("김진원");
// 						 	list.add("김현경");
// 						 	list.add("김현수");
// 						 	list.add("김환용");
// 						 	list.add("도명환");
// 						 	list.add("박상현");
// 						 	list.add("박신애");
// 						 	list.add("박정현");
// 						 	list.add("백지열");
// 						 	list.add("이다예");
// 						 	list.add("이슬미");
// 						 	list.add("이원우");
// 						 	list.add("이창은");
// 						 	list.add("이채민");
// 						 	list.add("이채은");
// 						 	list.add("이홍석");
// 						 	list.add("장성훈");
// 						 	list.add("조민지");	
// 						 	list.add("조서연");
							String[] names = {
									"강미정","금서윤","김동영","김동윤",
									"김선경","김성재","김진원","김현경",
									"김현수","김환용","도명환","박상현",
									"박신애","박정현","백지열","이다예",
									"이슬미","이원우","이창은","이채민",
									"이채은","이홍석","장성훈","조민지",
									"조서연"
							};
							// 제일 마지막 count 수에 의한 </tr>을 닫아주기 위한 조건의 값으로 쓰기 위해
							int nameSize = names.length;
						 	List<String> nameList = new ArrayList<String>();
						 	for(String name : names) {
						 		nameList.add(name);
						 	}
						 %>
						 <c:set value="<%=nameList %>" var="names"/>
						 <c:set value="<%=nameSize %>" var="size"/>
						 <div class="row">
						 	<div class="col-md-4">
						 		<table class="table table-bordered">
						 			<c:forEach items="${names }" var="name" varStatus="stat">
						 				<c:if test="${stat.index % 4 == 0 }">
						 					<tr align="center">
						 				</c:if>
						 				<c:if test="${name == '박신애' }">
						 					<td><font color="crimson"><b>본인</b></font></td>
						 				</c:if>
						 				<c:if test="${name != '박신애' }">
						 					<td>${name }</td>
						 				</c:if>
						 				<c:if test="${stat.count % 4 == 0 }">
						 					</tr>
						 				</c:if>
						 				<c:if test="${size == stat.count }">
						 					<td></td><td></td>
						 					</tr>
						 				</c:if>
						 			</c:forEach>
						 		</table>
						 	</div>
						 </div>
<%-- 						 <%= list %> --%>
<%-- 						<c:set value="<%= list %>" var="student" /> --%>
<!-- 							<table class="table table-bordered"> -->
<!-- 								<tr> -->
<%-- 							<c:forEach items="${student }" var="item" varStatus="stat"> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${item == '박신애'}"> --%>
<!-- 									<font color="green">본인</font> -->
<%-- 								</c:when> --%>
<%-- 							</c:choose> --%>
<%-- 									<td>${item }</td> --%>
<%-- 						 		<c:if test="${stat.count % 4 == 0 }"> --%>
<!-- 						 			<tr></tr> -->
<%-- 						 		</c:if> --%>
<%-- 							</c:forEach> --%>
<!-- 								</tr> -->
<!-- 							</table> -->
						 
						 
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>