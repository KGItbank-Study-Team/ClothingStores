<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="header/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/notice.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/secret.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<title>SECRET</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

</head>
<body>
<div id="wrap">
	<div id="container">
		<div id="contents">

			<div
				class="xans-element- xans-board xans-board-securepackage-4 xans-board-securepackage xans-board-4 ">
				<div
					class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
					<div class="path">
						<span>현재 위치</span>
						<ol>
							<li><a href="/">홈</a></li>
							<li><a href="/board/index.html">게시판</a></li>
							<li title="현재 위치"><strong>상품문의</strong></li>
						</ol>
					</div>
					<div class="titleArea">
						<h2>
							<font color="333333">상품문의</font>
						</h2>
						<p></p>
					</div>
				</div>
				<!-- 
				<div class="one_tab">
					<ul module="Layout_BoardInfo">
						<li><a href=""></a></li>
						<li><a href=""></a></li>
					</ul>	
				</div>
				 -->
				<form id="boardSecureForm" name=""
					action="/exec/front/Board/secure/6" method="post" target="_self"
					enctype="multipart/form-data">
					<input id="no" name="no" value="1729507" type="hidden" /> <input
						id="board_no" name="board_no" value="6" type="hidden" /> <input
						id="return_url" name="return_url"
						value="/article/상품문의/6/1729507/?no=1729507&amp;board_no=6&amp;page="
						type="hidden" />
					<div
						class="xans-element- xans-board xans-board-secure-4 xans-board-secure xans-board-4 ec-base-box typeThin ">
						<div class="secret">
							<h3 class="boxTitle">비밀글보기</h3>
							<fieldset>
								<legend>비밀글보기</legend>
								<p class="info">
									이 글은 비밀글입니다. <strong class="txtEm">비밀번호를 입력하여 주세요.</strong><br />관리자는
									확인버튼만 누르시면 됩니다.
								</p>
								<p class="password">
									<label for="secure_password">PASSWORD</label> <input
										id="secure_password" name="secure_password" fw-filter=""
										fw-label="비밀번호" fw-msg="" value="" type="password" />
								</p>
								<div class="ec-base-button gColumn">
									<a href="/views/app/inquiry.jsp" class="btnNormal sizeM">LIST</a> <a
										href="#none" class="btnEm sizeM"
										onclick="BOARD.form_submit('boardSecureForm');">OK</a>
								</div>
							</fieldset>
						</div>
					</div>
				</form>
			</div>
		</div>
		<jsp:include page="footer/footer.jsp" />
	</div>
</div>
</body>
</html>