<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header/header.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype HTML>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/resources/css/login.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@300&family=Open+Sans:wght@300&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
<script src="/resources/js/login.js"></script>
</head>
<body>
	<c:if test="${id != null && pwd != null}">
		<form action="/app/member/login" method="post">
			<input type="hidden" name="username" value="${id}"> <input type="hidden" name="password" value="${pwd}">
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
						<input id="usernameInput" name="id" placeholder="Username" type="text" for="logId"></input>
					</div>
					<div class="login-input-wrap password-wrap">
						<input name="pwd" placeholder="Password" type="password"></input>
					</div>
					<div class="login-button-wrap">
						<button type="submit"><span class="login-text">LOGIN</span></button>
					</div>
					<div class="login-stay-sign-in" id="staySignedIn">
						<input type="checkbox" class="save_id" id="saveId" name="checkId"><label for="saveId"><span>아이디 저장</span></label>
						<div class="forgot-id-password">
							<span><a href="/views/app/find_id.jsp">Forgotten ID</a></span>
							<span>or</span>
							<span><a href="/views/app/find_password.jsp">Password</a></span>
						</div>
						<br/>
					</div>
					<div class="social-login">
						<div style="display: inline-block; color: #5a5a5a;">
							<p>사용중이신 SNS 로 간편하게 로그인하세요!</p>
						</div>
						<div class="logo-position">
							<a href="/app/login/kakao/oauth" class="naver-login-button"> <img src="/resources/images/icon_social_kakao.png" alt="카카오 로그인"></a> <a href="/app/login/naver/oauth" class="naver-login-button"> <img src="/resources/images/icon_social_naver.png" alt="네이버 로그인"></a>
						</div>
					</div>
					<hr>
					<div class="join">
						<div class="join-text">
							<h3>슬림베어의 멤버쉽 혜택</h3>
							<br>
							<p>알찬 쇼핑이 되실수 있도록 
								<br>
								적립금과 쿠폰, 이벤트가 준비됩니다.
								<br>
								등급별 혜택과 연말 선물을 받아보세요!
							</p>
						</div>
					</div>
						<button class="join-btn"><a href="/app/join">회원가입 </a></button>
				</section>
			</form>
		</div>
	</div>
</body>
	<%@ include file="footer/footer.jsp"%>
</html>