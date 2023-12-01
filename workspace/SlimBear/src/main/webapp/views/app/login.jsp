<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header/header.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype HTML>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/login.css">
<script src="https://kit.fontawesome.com/51db22a717.js"
	crossorigin="anonymous"></script>
<script src="/resources/js/login.js"></script>
</head>
<body>
	<c:if test="${id != null && pwd != null}">
		<form action="/app/member/login" method="post">
			<input type="hidden" name="username" value="${id}">
			<input type="hidden" name="password" value="${pwd}">
		</form>
		<script>
			$('form').submit();
		</script>
	</c:if>


	<div id="header-container"></div>
	<div class="main-container">
		<div class="main-wrap">
			<div class="logo-wrap">
				<img src="/resources/images/SlimBear-Logo01.png">
			</div>
			<form action="/app/slimbear/login" method="post">
				<section class="login-input-section-wrap">
					<div class="login-input-wrap">
						<input name="id" placeholder="Username" type="text"></input>
					</div>
					<div class="login-input-wrap password-wrap">
						<input name="pwd" placeholder="Password" type="password"></input>
					</div>
					<div class="login-button-wrap">
						<button type="submit">로그인</button>
					</div>
					<div class="login-stay-sign-in">
						<i class="far fa-check-circle"></i> <span>항상 로그인</span>
					</div>
				</section>
			</form>
			<section class="Easy-sgin-in-wrap">
				<h2>간편 로그인</h2>
				<ul class="sign-button-list">
					<li><div class="login-container">
							<a href="/app/login/kakao/oauth" class="naver-login-button"> <img
								src="/resources/images/kakao_login.png" alt="카카오 로그인">
							</a>
						</div></li>
					<li><div class="login-container">
							<a href="/app/login/naver/oauth" class="naver-login-button"> <img
								src="/resources/images/naver_login.png" alt="네이버 로그인">
							</a>
						</div></li>
				</ul>
				<a href="http://localhost:8080/views/app/find_id.jsp" >아이디찾기
							</a>
							<p>|</p><a href="http://localhost:8080/views/app/find_password.jsp" >비밀번호찾기
							</a>
							<p>|</p><a href="http://localhost:8080/views/app/join.jsp" >회원가입
							</a>
							
			</section>
			<footer>
				<div class="copyright-wrap">
					<%
					// 이 부분에서 로그인 성공 또는 실패 여부에 따른 메시지를 표시합니다.
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					if ("사용자명".equals(username) && "비밀번호".equals(password)) {
						out.println("<p>로그인 성공!</p>");
					} else {
						out.println("<p>로그인 실패. 사용자명 또는 비밀번호가 올바르지 않습니다.</p>");
					}
					%>
				</div>
			</footer>
		</div>
	</div>
</body>
<%@ include file="footer/footer.jsp"%>
</html>