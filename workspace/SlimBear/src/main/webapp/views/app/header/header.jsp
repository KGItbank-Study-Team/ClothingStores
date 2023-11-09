<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script defer src="/resources/js/header.js"></script>
<script src="https://kit.fontawesome.com/09decccad8.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<title>슬림베어</title>
</head>
<body>
	<div id="top_sentence">
		<div id="oneTop1">
			<ul class="text-slide">
				<li class="slide-sentence"><a href="#none">♥핸드메이드 코트 10%
						SALE♥ ~2023.10.31 23:59PM</a></li>
				<br />
				<li class="slide-sentence"><a href="#none">쌀쌀해진 날씨, 슬로우앤드와
						함께 준비하기</a></li>
				<br />
				<li class="slide-sentence"><a href="#none">로그인 후 슬로우앤드의 다양한
						혜택을 만나보세요</a></li>
				<br />
			</ul>
		</div>
	</div>
	<div>
		<div id="users-container">
			<!-- "menu clearfix" -->
			<ul class="mainMenu">
				<div class="logo">
					<a href="/"><img src="/resources/images/SlimBear-Logo01.png"
						alt=""></a>
				</div>
				<div class="menu-list">
					<li class="menu-item">
						<a href="">BEST🔥</a>
						<ul class="dropdown-content">
							<li><a href="">TOP</a></li>
							<li><a href="">BOTTOM</a></li>
							<li><a href="">OUTER</a></li>
						</ul>
					</li>
					
					<li class="menu-item">
						<a href="">탑</a>
						<ul class="dropdown-content">
							<li><a href="/app/product/category?category=6">후드티</a></li>
							<li><a href="/app/product/category?category=6">셔츠</a></li>
							<li><a href="/app/product/category?category=6">반소매 티셔츠</a></li>
							<li><a href="/app/product/category?category=6">맨투맨</a></li>
							<li><a href="/app/product/category?category=6">반팔티</a></li>
							<li><a href="/app/product/category?category=6">니트</a></li>
						</ul>
					</li>
					
					<li class="menu-item">
						<a href="">아우터</a>
						<ul class="dropdown-content">
							<li><a href="/app/product/category?category=6">패딩</a></li>
							<li><a href="/app/product/category?category=6">코트</a></li>
							<li><a href="/app/product/category?category=6">재킷</a></li>
							<li><a href="/app/product/category?category=6">가디건</a></li>
							<li><a href="/app/product/category?category=6">무스탕</a></li>
							<li><a href="/app/product/category?category=6">가죽자켓</a></li>
						</ul>
					</li>
					
					<li class="menu-item">
						<a href="">바텀</a>
						<ul class="dropdown-content">
							<li><a href="/app/product/category?category=6">팬츠</a></li>
							<li><a href="/app/product/category?category=6">슬랙스</a></li>
							<li><a href="/app/product/category?category=6">데님</a></li>
							<li><a href="/app/product/category?category=6">반바지</a></li>
						</ul>
					</li>
					
					<li class="menu-item">
						<a href="">언더웨어</a>
						<ul class="dropdown-content">
							<li><a href="/app/product/category?category=6">드로즈</a></li>
							<li><a href="/app/product/category?category=6">삼각</a></li>
						</ul>
					</li>
					
					<li class="menu-item">
						<a href="">스포츠</a>
						<ul class="dropdown-content">
							<li><a href="/app/product/category?category=6">상의</a></li>
							<li><a href="/app/product/category?category=6">하의</a></li>
						</ul>
					</li>
				
					<li class="menu-item"><a href="">COMMUNITY</a>
						<ul class="dropdown-content">
							<li><a href="/app/board/notice">공지사항</a></li>
							<li><a href="/app/board/notice">REVIEW</a></li>
							<li><a href="/app/board/notice">상품문의</a></li>
							<li><a href="/app/board/notice">FAQ</a></li>
						</ul></li>
				</div>
				<div class="userArea">
					<ul>
						<li>
							<div class="search">
								<input type="text" value="search" style="color: rgb(0, 0, 0);"
									class="inputArea"> <i class="fas fa-search"></i>
							</div>
						</li>
						<sec:authorize access="isAuthenticated()">
							<sec:authentication var="user" property="principal" />
							<li>${user.username} 님 안녕하세요</li>
							<li class="menu-item"><a href="#"><img
									src="/resources/images/icon_user.png" alt="user"></a>
								<ul class="dropdown-content">
									<li><a href="/app/member/logout"><b>로그아웃</b></a></li>
									<li><a href="/app/member/myPage"><b>회원정보</b></a></li>
								</ul></li>
							<li>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<li class="menu-item"><a href="#"><img
									src="/resources/images/icon_user.png" alt="user"></a>
								<ul class="dropdown-content">
									<li><a href="/app/login">로그인</a></li>
									<li><a href="/app/join">회원가입</a></li>
									<li><a href="">주문조회</a></li>
								</ul></li>
							<li>
						</sec:authorize>
						<li>
						<a href="/app/cart"><img class="fuck"
							src="/resources/images/icon_cart.png" alt="cart"></a>
						</li>
					</ul>
				</div>
			</ul>
		</div>
		<!-- 메인메뉴 끝-->
	</div>
</body>
</html>