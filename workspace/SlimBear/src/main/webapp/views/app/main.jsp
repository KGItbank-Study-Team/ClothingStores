<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="/resources/css/main_page.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script defer src="/resources/js/main_page.js"></script>
<script src="https://kit.fontawesome.com/09decccad8.js"
	crossorigin="anonymous"></script>
<title>SLIIMBEAR</title>
</head>
<body>
	<jsp:include page="header/header.jsp"></jsp:include>
	<main>
		<div class="banner-container">
			<!-- 상단 제품 스크롤배너 -->
			<div class="slide slide_wrap">
				<c:forEach var="item" items="${productBannerTop}">
					<div class="slide_item">
						<a href="/app/product?p=${item.prod_uid}"><img
							src="/resources/images/${item.image}" alt=""></a>
					</div>
				</c:forEach>
				<div class="slide_prev_button slide_button">◀</div>
				<div class="slide_next_button slide_button">▶</div>
				<ul class="slide_pagination"></ul>
			</div>
		</div>
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
						<img class="image-item" src="/resources/images/${item.main_image}"
							alt="img-1" />
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
	<jsp:include page="footer/footer.jsp" />
</body>
</html>