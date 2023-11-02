<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header/header.jsp"%>
<%@ page import="java.io.PrintWriter"%>
<!doctype HTML>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="login.css">
<script src="https://kit.fontawesome.com/51db22a717.js"
	crossorigin="anonymous"></script>
<script src="login.js"></script>
</head>
<body>
	<div id="header-container"></div>
	<div class="main-container">
		<div class="main-wrap">
			<div class="logo-wrap">
				<img src="../../images/SlimBear-Logo01.png">
			</div>
			<form action="login.jsp" method="post">
				<section class="login-input-section-wrap">
					<div class="login-input-wrap">
						<input name="username" placeholder="Username" type="text"></input>
					</div>
					<div class="login-input-wrap password-wrap">
						<input name="password" placeholder="Password" type="password"></input>
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
					<li><button>
							<i class="fas fa-qrcode"></i><span>QR코드로 로그인</span>
						</button></li>
					<li><button>
							<i class="fab fa-facebook-square"></i><span>페이스북</span>
						</button></li>
					<li><button>
							<i class="fab fa-line"></i><span>라인</span>
						</button></li>
				</ul>
				<p class="forget-msg">아이디º비밀번호 찾기 | 회원가입</p>
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