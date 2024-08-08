<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
                        <li>CH17</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="about-us section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 c ol-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
						<!-- 내용을 입력해주세요 -->
						<!-- 
							문제) 305호 학생들의 각 성씨에 따른 인원수는 각각 몇명인지 작성해주세요.
							
							예)----------------------------
							'홍'씨 성을 가진 사람 : 00명
							'김'씨 성을 가진 사람 : 00명
							'조'씨 성을 가진 사람 : 00명
							'박'씨 성을 가진 사람 : 00명
							'정'씨 성을 가진 사람 : 00명
							'이'씨 성을 가진 사람 : 00명
							...
							...
							
							305호 학생들의 이름을 리스트, 배열, 등등 자유롭게 넣어놓고
							JSTL을 활용하여 위와 같은 형태로 출력해주세요.
						 -->
						 <%
							 String[] names = {
										"강미정","금서윤","김동영","김동윤",
										"김선경","김성재","김진원","김현경",
										"김현수","김환용","도명환","박상현",
										"박신애","박정현","백지열","이다예",
										"이슬미","이원우","이창은","이채민",
										"이채은","이홍석","장성훈","조민지",
										"조서연"
								};		 
							int nameSize = names.length;
						 	List<String> nameList = new ArrayList<String>();
						 	for(String name : names) {
						 		nameList.add(name);
						 	}
 						%>
						 <table class="table table-bordered">
							<tr style="text-align: center">
								<td>강</td>
								<td>김</td>
								<td>이</td>
								<td>조</td>
								<td>박</td>
							</tr>
							<tr>
								<c:set var="name" value="<%= nameList %>" />
								
								<c:set value="0" var="kangCnt"/>
								<c:set value="0" var="kimCnt"/>
								<c:set value="0" var="leeCnt"/>
								<c:set value="0" var="choCnt"/>
								<c:set value="0" var="parkCnt"/>
								
								<c:forEach items="${fn:length(name) }">
									<c:set var="fstNm" value="${fn:substring(name[i],0,1) }"/>
										<c:choose>
											<c:when test="${fstNm == '강'}">
												<c:set value="${kangCnt+1 }" var="kangCnt"/>
											</c:when>
										</c:choose>
								</c:forEach>
								<td>${kangCnt}</td>
							</tr>
						</table>
						<hr/>
						<p>전체학생 :<%= nameList %><p>
						<hr/>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>