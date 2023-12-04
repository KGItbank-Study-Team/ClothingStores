<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/reviewWrite.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/reviewWrite.js" charset="utf-8"></script>
<title>후기 작성</title>
</head>
<body>
	<h2>후기 작성</h2>
	<div class="prodImg">
		<img alt="상품이미지" src="/resources/images/knit01_1.webp">
	</div>
	<div class="option-text">
		<p>${orderProdList.orderName}</p>
	</div>
	<div class="option-text2"><p>옵션1: blue, 2XL</p></div>
	<div class="star_rating">
		<span class="star on" value="1"> </span> 
		<span class="star" value="2"> </span> 
		<span class="star" value="3"> </span>  
		<span class="star" value="4"> </span>  	
		<span class="star" value="5"> </span>
	</div>

	<textarea id="test" class="star_box" placeholder="리뷰 내용을 작성해주세요."></textarea>
	<div id="test_cnt">(0 / 5000)</div>
	<input type="submit" class="btn02" value="리뷰 등록" />
</body>
</html>