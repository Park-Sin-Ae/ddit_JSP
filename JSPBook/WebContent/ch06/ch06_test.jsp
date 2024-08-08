<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>쉽게 배우는 JSP 웹 프로그래밍</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<%@ include file="/pageModule/headPart.jsp"%>
</head>
<body>
	<%@ include file="/pageModule/header.jsp"%>

	<div class="breadcrumbs" style="padding-top: 40px;">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6 col-32">
					<div class="breadcrumbs-content">
						<h1 class="page-title">폼태그</h1>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-32">
					<ul class="breadcrumb-nav">
						<li><a href="/">INDEX</a></li>
						<li>CH06</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<section class="about-us section">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-12 col-md-12 col-32">
					<div class="content-left wow fadeInLeft" data-wow-delay=".3s">
						<!-- 
			            	아이디, 비밀번호 : 1234, 이름 , 핸드폰번호, 성별, 취미, 가입인사 입력 폼양식을 만들고
			            	ch06_test_process.jsp로 결과를 전송해주세요.
			            	
			            	- 연락처 첫번째 자리는 select 태그를 이용해주세요
			            	- 성별은 남자일 때 value를  'M'으로 설정하고 여자일 때 'G'로 설정해주세요.
			            	  > 같은 name 값으로 설정해주세요 
			            	- 취미는 운동, 독서, 영화, 음악 총 4가지 선택지를 주고 value는 모두 영문으로 설정해주세요.
			            	  > 같은 name 값으로 설정해주세요
			            	  > 운동 : power
			            	  > 독서 : book
			            	  > 영화 : movie
			            	  > 음악 : music
			            	- 가입인사는 textarea를 이용해주세요.
						 -->
						<form action="ch06_test_process.jsp" method="post" name="member"class="form-control">
							<div class="row">
								<div class="col-3">
									<label>아이디</label>
								</div>
								<div class="col-9">
									<input type="text" name="id" value="" /> <input type="button"
										value="중복확인" class="btn btn-primary"><br />
								</div>
								<div class="col-3">
									<label>비밀번호</label>
								</div>
								<div class="col-9">
									<input type="text" name="pw" value="" /><br />
								</div>
								<div class="col-3">
									<label>이름</label>
								</div>
								<div class="col-9">
									<input type="text" name="name" value="" /><br />
								</div>
								<div class="col-3">
									<label>핸드폰번호 </label>
								</div>
								<div class="col-9">
									<select name="phone1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="019">019</option>
									</select>- 
										<input type="text" name="phone2" value="" size="4" maxlength="4" />- 
										<input type="text" name="phone3" value="" size="4" maxlength="4" /><br />
								</div>
								<div class="col-3">
									<label>성별</label>
								</div>
								<div class="col-9">
									<input type="radio" name="gender" value="M" />남자&nbsp; 
									<input type="radio" name="gender" value="G" />여자<br/>
								</div>
								<div class="col-3">
									<label>취미</label>
								</div>
								<div class="col-9">
									<input type="checkbox" name="hobby" value="power" /> 운동&nbsp; 
									<input	type="checkbox" name="hobby" value="book" /> 독서&nbsp; 
									<input type="checkbox" name="hobby" value="movie" /> 영화&nbsp; 
									<input type="checkbox" name="hobby" value="music" /> 음악&nbsp;<br/>
								</div>
								<div class="col-3">
									<label>가입인사</label>
								</div>
								<div class="col-9">
									<textarea rows="10" cols="50" name="comment"
										placeholder="가입 인사를 입력해주세요!" wrap="hard"></textarea>
								</div>
								<div class="col-1">
									<input type="submit" value="전송" />
								</div>
								<div class="col-1"> 
									<input type="reset"	value="리셋" /><br />
								</div>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/pageModule/footer.jsp"%>

	<%@ include file="/pageModule/footerPart.jsp"%>
</body>
</html>