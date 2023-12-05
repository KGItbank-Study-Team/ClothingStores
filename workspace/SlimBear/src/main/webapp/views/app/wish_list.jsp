<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">
<%@ include file="header/header.jsp"%>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="/resources/css/wish_list.css">
<script type="text/javascript" src="/resources/js/mypage.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title>위시리스트</title>
</head>

<body class="">
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

				<div class="titleArea">
					<ul>
						<h2>위시리스트</h2>
						<p>관심상품 내역입니다.</p>
					</ul>
				</div>

				<div
					class="xans-element- xans-myshop xans-myshop-wishlist ec-base-table typeList xans-record-">
					<table border="1" summary="" class="">
						<caption>관심상품 목록</caption>
						<colgroup>
							<col style="width: 38px;">
							<col style="width: 92px">
							<col style="width: auto">
							<col style="width: 120px">
						</colgroup>
						<thead>
							<tr>
								<!-- 클릭하면 밑에 모든 체크박스 체크되는 기능 -->
								<th scope="col"><input type="checkbox"
									onclick='selectAll(this)'></th>
								<th scope="col">이미지</th>
								<th scope="col">상품정보</th>
								<th scope="col">판매가</th>
							</tr>
						</thead>
						<tbody
							class="xans-element- xans-myshop xans-myshop-wishlistitem center">

							<c:forEach var="item" items="${wishList}">
								<tr class="xans-record-">
									<!-- 체크박스 -->
									<td><input name="wish_idx" enable-order=""
										reserve-order="N" enable-purchase="1" class="wish-checkbox"
										value="${item.uid}" type="checkbox"></td>
									<!-- 이미지 -->
									<td class="thumb"><a href="/app/product?p=${item.productUID}"><img
											src="https://slimbearbucket.s3.ap-northeast-2.amazonaws.com/images/${item.productImage}" alt=""></a></td>
									<!-- 상품정보 -->
									<td class=""><strong class="name"><a
											href="/app/product?p=${item.productUID}" class="ec-product-name">${item.productName}</a></strong>
									</td>
									<!-- 판매가 -->
									<td class="price"><strong class="strike">${item.orderAmount}원<br></strong><br>
										<strong class="">${item.orderDiscount}원</strong></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<!-- 위시리스트 비어있을때 -->
					<p class="message displaynone">관심상품 내역이 없습니다.</p>
				</div>

				<form id="deleteWishForm" action="/app/member/myPage/wishList/delete"
					method="post">
					<div class="xans-element- xans-myshop xans-myshop-wishlistbutton ec-base-button xans-record-">
						<span class="gLeft">
							<button type="button" class="btnEm"
								onclick="deleteSelectedItems();">삭제하기</button>
						</span>
					</div>
				</form>
				<div
					class="xans-element- xans-myshop xans-myshop-wishlistpaging ec-base-paginate">
					<a href="#none"><img src="/resources/images/icon_prev2.png"></a>
					<ol>
						<li class="xans-record-"><a href="?page=1" class="this"
							style="padding-right: 0px;">1</a></li>
					</ol>
					<a href="#none"><img src="/resources/images/icon_next2.png"></a>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="footer/footer.jsp"%>

</body>

</html>