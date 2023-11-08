<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="/resources/css/main_page.css" />
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script defer src="/resources/js/main_page.js"></script>
<script src="https://kit.fontawesome.com/09decccad8.js"
	crossorigin="anonymous"></script>
<title>SLIIMBEAR</title>
</head>
<body>
	<div id="top_sentence">
		<div id="oneTop">
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
	<header>
		<div class="menu-container">
			<div class="banner-container">
				<div class="slide slide_wrap">
					<div class="slide_item">
						<img src="/resources/images/Banner-images01.webp" alt="">
					</div>
					<div class="slide_item">
						<img src="/resources/images/Banner-images02.webp" alt="">
					</div>
					<div class="slide_item">
						<img src="/resources/images/Banner-images03.webp" alt="">
					</div>
					<div class="slide_item">
						<img src="/resources/images/Banner-images04.webp" alt="">
					</div>
					<div class="slide_item">
						<img src="/resources/images/Banner-images05.webp" alt="">
					</div>
					<div class="slide_item">
						<img src="/resources/images/Banner-images06.webp" alt="">
					</div>
					<div class="slide_prev_button slide_button">◀</div>
					<div class="slide_next_button slide_button">▶</div>
					<ul class="slide_pagination"></ul>
				</div>
			</div>

			<div id="users-container">
				<!-- "menu clearfix" -->
				<ul class="mainMenu">
					<div class="logo">
						<a href=""><img src="/resources/images/SlimBear-Logo01.png "
							alt=""></a>
					</div>
					<div class="menu-list">
						<li class="menu-item"><a href="">BEST🔥</a>
							<ul class="dropdown-content">
								<li><a href="">TOP</a></li>
								<li><a href="">BOTTOM</a></li>
								<li><a href="">OUTER</a></li>
							</ul></li>
						<li class="menu-item"><a href="">NEW</a></li>
						<li class="menu-item"><a href="">TOP</a>
							<ul class="dropdown-content">
								<li><a href="">맨투맨</a></li>
								<li><a href="">후드</a></li>
								<li><a href="">셔츠</a></li>
								<li><a href="">니트</a></li>
								<li><a href="">반발티</a></li>
							</ul></li>
						<li class="menu-item"><a href="">BOTTOM</a>
							<ul class="dropdown-content">
								<li><a href="">팬츠</a></li>
								<li><a href="">슬랙스</a></li>
								<li><a href="">데님</a></li>
								<li><a href="">반바지</a></li>
							</ul></li>
						<li class="menu-item"><a href="">OUTER</a>
							<ul class="dropdown-content">
								<li><a href="">코트</a></li>
								<li><a href="">패딩</a></li>
								<li><a href="">블레이저</a></li>
								<li><a href="">레더</a></li>
								<li><a href="">무스탕</a></li>
							</ul></li>
						<li class="menu-item"><a href="">UNDERWEAR</a>
							<ul class="dropdown-content">
								<li><a href="">상의</a></li>
								<li><a href="">하의</a></li>
							</ul></li>
						<li class="menu-item"><a href="">SPORTS</a>
							<ul class="dropdown-content">
								<li><a href="">상의</a></li>
								<li><a href="">하의</a></li>
							</ul></li>
						<li class="menu-item"><a href="">ACC</a>
							<ul class="dropdown-content">
								<li><a href="">벨트</a></li>
								<li><a href="">양말</a></li>
								<li><a href="">목도리</a></li>
								<li><a href="">장갑</a></li>
							</ul></li>
						<li class="menu-item"><a href="">COMMUNITY</a>
							<ul class="dropdown-content">
								<li><a href="">공지사항</a></li>
								<li><a href="">REVIEW</a></li>
								<li><a href="">상품문의</a></li>
								<li><a href="">FAQ</a></li>
							</ul></li>
					</div>
					<div class="userArea">
						<ul>
							<li>
								<div class="search">
									<input type="text" value="search" style="color: rgb(0, 0, 0);">
									<i class="fas fa-search"></i>
								</div>
							</li>
							<li class="menu-item"><a href="#"><img
									src="/resources/images/icon_user.png" alt="user"></a>
								<ul class="dropdown-content">
									<li><a href="/app/login">로그인</a></li>
									<li><a href="/app/join">회원가입</a></li>
									<li><a href="#">주문조회</a></li>
								</ul></li>
							<li><a href="#"><img class="fuck"
									src="/resources/images/icon_cart.png" alt="cart"></a></li>
						</ul>
					</div>
				</ul>
			</div>
			<!-- 메인메뉴 끝-->
		</div>
	</header>
	<main>
		<div id="one-text">
			<h2>SlimBear</h2>
			<br />
			<p>이것은 옷인가 이불인가</p>
			<p>당신의 몸을 따뜻하고 편안하게 감싸줄 옷</p>
			<p>
				현명한 선택, 그것은 <b>SlimBear</b> 입니다.
			</p>
		</div>
		<div id="one-best">
			<h3>실시간 인기 순위</h3>
			<h1>NOW BEST!</h1>
		</div>
		<div class="product-container">
			<div class="slider-wrapper">
				<button id="prev-slide"
					class="slide-button material-symbols-rounded">&lsaquo;</button>
				<ul class="image-list">
					<c:forEach var="item" items="${hotProductList}">
						<img class="image-item" src="/resources/images/${item.main_image}" alt="img-1" />
					</c:forEach>
				</ul>
				<button id="next-slide"
					class="slide-button material-symbols-rounded">&rsaquo;</button>
			</div>
			<div class="slider-scrollbar">
				<div class="scrollbar-track">
					<div class="scrollbar-thumb"></div>
				</div>
			</div>
		</div>
	</main>
	<footer>
		<div id="bottom_info">
			<div class="guide">
				<h2>SLIMBEAR</h2>
				<li><a href="/shopinfo/guide.html" style="color: black">Guide</a>
				</li>
				<li><a href="/member/agreement.html" style="color: black">Agreement</a>
				</li>
				<li><a href="/member/privacy.html" style="color: black">개인정보처리방침</a>
				</li>
			</div>
			<div class="address">
				<h2>Shop Information</h2>
				상호 : (주) 슬림모어 / SLIMMORE CO.<br /> 대표자 : 오승택<br />
				<li class="hidden"><span>TEL 070-7777-7777</span> <a
					href="none" class="more"> <i class="xi-angle-down"></i>
				</a>
					<div class="cons">
						<br /> 주소 : [04792] 서울특별시 종로구 돈화문로 26 단성사 5층<br /> 하우스슬림 종로<br />
						사업자번호 : 777-77-77777<br /> 통신판매업 번호 : 2018-서울동대문-0658<br />
						개인정보취급책임자 김재형, slimbear@naver.com<br /> 81, Gomisul-ro,
						Dongdaemun-gu, Seoul, Republic of Korea<br /> copyright © 슬로우앤드
						all rights reserved<br />
					</div></li>
			</div>
			<div class="call">
				<h2>C/S Center</h2>
				<b>070-7705-5595</b> OPEN am10:00 - pm17:00<br /> BREAK
				pm12:00-pm13:00<br />(sat / sun / holiday OFF)
			</div>
			<div class="bank">
				<h2>Banking Info</h2>
				기업은행 203-147356-01-014<br /> 예금주 이상혁
			</div>
			<div class="exchange">
				<h2>[교환/반품 주소]</h2>
				서울시 동대문구 천호대로5<br /> 동대문우체국 소포실 (주)슬림모어 물류창고<br /> 4,
				Cheonho-daero, Dongdaemun-gu, Seoul<br /> Republic of Korea<br />
				<u> 반품이나 교환 물품을 보내주실 때는<br /> 반드시 지정된 택배사를 이용해주세요 :)<br />
					공지사항에서 자세히 확인하실 수 있답니다.
				</u>
			</div>
			<div class="service">
				<h2>SERVICE</h2>
				<div style="margin-bottom: 40px;">
					고객님은 안전거래를 위해 현금 등으로 결제시<br /> 저희 쇼핑몰에서 가입한 구매안전 서비스를<br /> 이용하실 수
					있습니다.
				</div>
				<div id="service_logo">
					<img src="/resources/images/escrow_02.png" alt="" /> <img
						src="/resources/images/escrow_03.png" alt="" /> <img
						src="/resources/images/escrow_04.png" alt="" />
				</div>
			</div>
		</div>
	</footer>
</body>
</html>