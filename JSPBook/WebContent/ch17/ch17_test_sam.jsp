<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
							문제) OOO반 학생들의 각 성씨에 따른 인원수는 각각 몇명인지 작성해주세요.
							
							예) --------------------
							'홍'씨 성을 가진 사람 : oo명
							'유'씨 성을 가진 사람 : oo명
						 	'정'씨 성을 가진 사람 : oo명
						 	...
						 -->
						<!-- 이름을 ',' 단위로 구분하여 String 문자열 형태로 넣는다. -->
						<c:set value="홍길동,홍길순,유재석,정형돈,하동훈,정준하,박명수,길성준,노홍철" var="names"/>
						전체학생 : 
						<c:forEach items="${names }" var="nms">
							<c:out value="${nms }"/>
						</c:forEach>
						<br/><br/>

						<!-- 
							#### 첫번째 방법
							방법 1) JSTL과 카운팅 변수를 선언한 방법
						 -->
						
						<!-- function 태그 split 함수를 이용해 ','를 구분으로 각 이름을 분리한다. -->
						<c:set value="${fn:split(names, ',') }" var="name"/>
						
						<!-- 분리해서 만들어진 이름 별, 성을 변수로 분리하여 카운팅할 수 있도록 초기화한다. -->
						<c:set value="0" var="hongCnt"/>
						<c:set value="0" var="yuCnt"/>
						<c:set value="0" var="jeongCnt"/>
						<c:set value="0" var="haCnt"/>
						<c:set value="0" var="parkCnt"/>
						<c:set value="0" var="gilCnt"/>
						<c:set value="0" var="noCnt"/>
						
						<!-- split으로 분리한 배열의 사이즈 만큼 반복문을 돌려, 각 성에 해당하는 카운트 변수를 성과 일치할때 1씩 증가시킨다. -->
						<c:forEach items="${name }" var="nm" varStatus="stat">
							<c:choose>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '홍' }">
									<c:set value="${hongCnt+1 }" var="hongCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '유' }">
									<c:set value="${yuCnt+1 }" var="yuCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '정' }">
									<c:set value="${jeongCnt+1 }" var="jeongCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '하' }">
									<c:set value="${haCnt+1 }" var="haCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '박' }">
									<c:set value="${parkCnt+1 }" var="parkCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '길' }">
									<c:set value="${gilCnt+1 }" var="gilCnt"/>
								</c:when>
								<c:when test="${fn:substring(name[stat.index], 0, 1) == '노' }">
									<c:set value="${noCnt+1 }" var="noCnt"/>
								</c:when>
							</c:choose>
							
							<p>[${stat.count}번째] 이름 : ${nm}&nbsp;
								<font color="red">
									('${fn:substring(name[stat.index], 0, 1) }' 씨 Count 증가!)
								</font>
							</p>
							<table class="table table-bordered">
								<tr align="center">
									<td>홍</td>
									<td>유</td>
									<td>정</td>
									<td>하</td>
									<td>박</td>
									<td>길</td>
									<td>노</td>
								</tr>
								<tr align="center">
									<td>${hongCnt }</td>
									<td>${yuCnt }</td>
									<td>${jeongCnt }</td>
									<td>${haCnt }</td>
									<td>${parkCnt }</td>
									<td>${gilCnt }</td>
									<td>${noCnt }</td>
								</tr>
							</table>
							<br/>
						</c:forEach>

						<h3>최종 집계 결과!!</h3>
						<table class="table table-bordered">
							<tr align="center">
								<td>홍</td>
								<td>유</td>
								<td>정</td>
								<td>하</td>
								<td>박</td>
								<td>길</td>
								<td>노</td>
							</tr>
							<tr align="center">
								<td>${hongCnt }</td>
								<td>${yuCnt }</td>
								<td>${jeongCnt }</td>
								<td>${haCnt }</td>
								<td>${parkCnt }</td>
								<td>${gilCnt }</td>
								<td>${noCnt }</td>
							</tr>
						</table>
						<br/><hr/>
						 
						<!-- 
							#### 두번째 방법
							방법 2) 컬렉션 map과 JSTL을 활용한 방법
						 -->
					 	<%
					 		List<String> list = new  ArrayList<String>();
					 		String[] names = {"홍길동","홍길순","유재석","정형돈","하동훈","정준하","박명수","길성준","노홍철"};
					 		for(int i = 0; i < names.length; i++){
					 			list.add(names[i]);
					 		}
					 		
					 		Map<String, Integer> map = new HashMap<>(); 
					 	%>
					 	<!-- 성을 key로 성에 따른 카운트 값을 value로 설정할 map 셋팅 -->
					 	<c:set var="map" value="<%=map %>"/>
					 	
					 	전체 학생 : 
					 	<!-- list에 있는 이름들을 먼저 확인해본다. -->
					 	<c:forEach items="<%=list %>" var="item">
					 		<c:out value="${item } "/>
					 	</c:forEach>
					 	
					 	<br/><hr/>
					 	
					 	<!-- 
					 		list의 이름을 하나씩 꺼내서 substring 함수를 이용하여 성을 만든 후,
					 		map의 키로 넣어 값이 있는지 여부를 체크한다.
					 		값이 없으면 map의 성을 키로 값은 1로 초기 셋팅한다.
					 		여부를 체크 후 값이 있으면 해당 성을 키로, 해당 성의 값의 +1한 값을 추가로 넣는다.
					 	 -->
					 	<c:forEach items="<%=list %>" var="item">
					 		<c:choose>
					 			<c:when test="${map.get(fn:substring(item, 0, 1)) eq null }">
					 				<c:out value="${map.put(fn:substring(item, 0, 1), 1) }"/>
					 			</c:when>
					 			<c:otherwise>
					 				<c:out value="${map.put(fn:substring(item, 0, 1), map.get(fn:substring(item, 0, 1)) + 1) }"/>
					 			</c:otherwise>
					 		</c:choose>
					 	</c:forEach>
					 	<br/>
					 	
					 	<c:forEach items="<%=map.keySet() %>" var="item">
					 		<font color='red'>'${item }'씨</font> 성을 가진 사람 수 : ${map.get(item) }명<br/>
					 	</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="/pageModule/footer.jsp" %>

	<%@ include file="/pageModule/footerPart.jsp" %>
</body>
</html>