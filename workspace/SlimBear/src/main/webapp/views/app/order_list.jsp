<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<html lang="ko">
<%@ include file="header/header.jsp"%>
<head>
<meta charset="utf-8">
<title>주문내역</title>
<!-- jQuery UI -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>

<link rel="stylesheet" type="text/css" href="/resources/css/list.css">
</head>

<body>
	<div id="wrap">
		<div id="container">
			<div id="contents">
				<div id="myMenu" class="xans-element- xans-myshop xans-myshop-main ">
					<ul>
						<li class="order"><a href="/app/member/myPage/orderList"><span>주문내역</span></a>
						</li>
						<li class="wishlist"><a href="/app/member/myPage/modify"><span>프로필</span></a>
						</li>
					
						<li class="coupon "><a href="/app/member/myPage/coupon"><span>쿠폰</span></a>
						</li>
						<li class="wishlist"><a href="/app/member/myPage/wishList"><span>위시리스트</span></a>
						</li>
						<li class="board"><a href="/app/member/myPage/boardList"><span>문의
									관리</span></a></li>
						<li class="board"><a href="/app/member/myPage/reviewList"><span>리뷰
									관리</span></a></li>
						<li class="board"><a href="/app/member/myPage/addr"><span>배송지
									관리</span></a></li>
					</ul>
				</div>

				<div class="one_tab mypage">
					<ul></ul>
				</div>

				<div class="titleArea">
					<h2>주문내역</h2>
					<p>주문상세보기를 클릭 시 상품 상세내역을 확인하실 수 있습니다.</p>
				</div>

				<div class="xans-element- xans-myshop xans-myshop-orderhistoryhead tyt">
					<fieldset class="ec-base-box">
						<legend>검색기간설정</legend>
						<div class="stateSelect ">
							<select id="order_status" name="order_status" class="fSelect">
								<option value="all">전체</option>
								<option value="STAY">주문대기중</option>
								<option value="PREPARING">상품준비중</option>
								<option value="STAY_DLV">배송준비중</option>
								<option value="DELIVERY">배송중</option>
								<option value="DONE">배송완료</option>
								<option value="CANCEL">취소</option>
								<option value="RETURN">반품</option>
							</select>
						</div>
						<input id="start_date" name="start_date" readonly="readonly" size="10"
							value="2023-12-06"type="text" class="huan">
						<!-- 처음날짜 버튼 -->
						<button type="button" id="start_date_button">
							<img src="/resources/images/ico_cal.gif" alt="...">
						</button>
						~ <input id="end_date" name="end_date" readonly="readonly" size="10"
							type="text" class="huan">
						<!-- 마지막날짜 버튼 -->
						<button type="button" id="end_date_button">
							<img src="/resources/images/ico_cal.gif" alt="...">
						</button>
						<!-- 조회버튼 -->
						<input alt="조회" id="order_search_btn" type="image"
							src="/resources/images/btn_search.gif" onclick="submitOrderSearch()">
					</fieldset>
					<ul>
						<li>주문상세보기를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
					</ul>
				</div>

				<br> <br>
				
				<div id="order-list"></div>
			</div>
		</div>
	</div>

	<%@ include file="footer/footer.jsp"%>
</body>

</html>