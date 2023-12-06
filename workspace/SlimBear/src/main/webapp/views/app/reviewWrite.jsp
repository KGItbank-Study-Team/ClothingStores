<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.lang.String" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/reviewWrite.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/reviewWrite.js" charset="utf-8"></script>
<title>후기 작성</title>
</head>
<body>
	<form action="/app/review/upload" method="post" enctype="multipart/form-data" id="reviewForm">
		<h2>후기 작성</h2>
		<div class="prodImg">
			<img alt="상품이미지" src="https://slimbearbucket.s3.ap-northeast-2.amazonaws.com/images/${product.main_image}">
		</div>
		<div class="option-text">
			<p>${product.name}</p>
		</div>
		<div class="option-text2">
			<p>색상: ${color}</p>
			<p>사이즈: ${size}</p>
			<p>수량: ${cnt}</p>
			<input type="hidden" name="prod_code" value="${prodCode}">
			<input type="hidden" name="prod_code" value="${reviewUID}">
		</div>
		<div class="star_rating">
			<span class="star on" value="1"> </span> 
			<span class="star" value="2"> </span> 
			<span class="star" value="3"> </span> 
			<span class="star" value="4"> </span> 
			<span class="star" value="5"> </span>
		</div>
		 <input type="hidden" name="score" id="rating" value="0">
		<input type="text" name="title" class="inputTitle" placeholder="제목을 입력해주세요.">
		<textarea id="test" name="content" class="star_box" placeholder="리뷰 내용을 작성해주세요."></textarea>
		<div id="test_cnt">(0 / 5000)</div>
		<input type="file" name="file1" id="file1">
		<img id="preview1" alt="Preview Image" class="imgUpload">
		<input type="file" name="file2" id="file2"> 
		<img id="preview2" alt="Preview Image" class="imgUpload">
		<input type="file" name="file3" id="file3"> 
		<img id="preview3" alt="Preview Image" class="imgUpload">
		<input type="file" name="file4" id="file4"> 
		<img id="preview4" alt="Preview Image" class="imgUpload">
		<input type="submit" class="btn02" value="리뷰 등록" />
	</form>
</body>
</html>