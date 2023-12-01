<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/reviewWrite.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/reviewWrite.js" charset="utf-8"></script>
<title>리뷰 쓰기</title>
</head>
<body>
	<h2>리뷰 쓰기</h2>
	<div class="prodImg">
		<img alt="상품이미지" src="/resource/">
	</div>
	<div class="star_rating">
		<span class="star on" value="1"> </span> 
		<span class="star" value="2"> </span> 
		<span class="star" value="3"> </span> 
		<span class="star" value="4"> </span> 
		<span class="star" value="5"> </span>
	</div>

	<textarea class="star_box" placeholder="리뷰 내용을 작성해주세요."></textarea>

	<input type="submit" class="btn02" value="리뷰 등록" />
</body>
</html>