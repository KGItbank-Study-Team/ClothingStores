<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/baguni.css" rel="stylesheet" />
<script defer src="/resources/js/baguni.js"></script>
<title>장 바 구 니</title>
</head>
<body>
<%@ include file="header/header.jsp"%>
	<section class="cart">
		<div class="cart__information">
			<ul>
				<li>장바구니 상품은 최대 30일간 저장됩니다.</li>
				<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
				<li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기
					바랍니다.</li>
			</ul>
		</div>
		<table class="cart__list">
			<form>
				<h1>C A R T</h1>
				<thead>
					<tr>
						<td><input type="checkbox"></td>
						<td colspan="2">상품정보</td>
						<td>옵션</td>
						<td>수량</td>
						<td>적립금</td>
						<td>상품금액</td>
						<td>배송비</td>

					</tr>
				</thead>
				<c:forEach var="cart" items="${cartList}">
				<tbody>
					<tr class="cart__list__detail">
						<td><input type="checkbox"></td>
						<td class="yout"><img src="/resources/images/유해커.jpg" alt="magic keyboard"></td>
						<td>
							<a href="#">${"cart.desc"}</a>
							<span class="cart__list__smartstore"> 스마트스토어</span>
							<p>${"cart.desc2" }</p> 
							<span class="price">${"cart.price"}</span>
							<span style="text-decoration: line-through; color: lightgray;">${"price1"}</span>
						</td>
						<td class="cart__list__option">
							<p>유해커의 검정후드티 / 1개</p>
							<div class="btn" onclick="toggleHiddenContent(this);">주문 추가/변경▽</div>	
							<!-- 옵션 변경 -->
							<!-- <div id="hiddenContent02" class="hiddenContent04"> -->
							<div class="hiddenContent02 hiddenContent04">
								<div class="option hidden"></div>
								<table class="change hidden">
									<tbody class="cchange">
										<tr class="nammme">
											<td colspan="3">${productName}</td>
										</tr>
										<tr class="">
											<td class="pcolor">
												<p class="colooo">COLOR</p>
											</td>
											<td colspan="2" class="colorrr">
												<select class="colorr">
														<option value="${red}">빨강</option>
														<option value="${blue}">파랑</option>
														<option value="${gray}">회색</option>
												</select>
											</td>
										</tr>
										<tr class="">
											<td>
												<p>SIZE</p>
											</td>
											<td colspan="2" class="colorrr"><select class="colorr">
													<option value="${L}">L</option>
													<option value="${XL}">XL</option>
													<option value="${XXL}">XXL</option>
													<option value="${XXXL}">XXXL</option>
													<option value="${XXXXL}">XXXXL</option>
											</select></td>
										</tr>
									</tbody>
								</table>
							</div> 
						</td>
						<td>
					 	
							<span class="quantity">
									<input type="text" value="1" class="inputBox">
									<a href="#none" class="">
										<img alt="수량증가" class="countUp" src="/resources/images/btn_count_up.gif">
									</a>
									<a href="#none">
										<img alt="수량감소" class="countDown" src="/resources/images/btn_count_down.gif">
									</a>
							</span>
						</td>
						<td><p>${freemoney}</p></td>
						<td><span class="price" id="price_">${discountPrice}</span>
						</td>
						<td>${baedal }</td>
					</tr>
					
				</tbody>
				</c:forEach>
				<tfoot>
					<tr>
						<td colspan="3"><input type="checkbox">
							<button class="cart__list__optionbtn">선택상품 삭제</button>
							<button class="cart__list__optionbtn">선택상품 찜</button></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tfoot>

			</form>
		</table>
		<table class="cart__list__detail">
			<thead>
				<tr>
					<td></td>
					<td colspan="2">총 상품금액</td>
					<td></td>
					<td>총 배송비</td>
					<td>결제예정금액</td>
				</tr>
			</thead>
			<tr>
				<td></td>
				<td colspan="2">${chongprice }</td>
				<td></td>
				<td>${chongbaedal}</td>
				<td>${maybeprice }</td>
			</tr>

		</table>
		<div class="cart__mainbtns">
			<button class="cart__bigorderbtn left"
				onclick="window.location.href='https://www.slowand.com/'">쇼핑
				계속하기</button>
			<button class="cart__bigorderbtn right">주문하기</button>

		</div>
		<div>
			<h4>이용안내</h4>
			<div class="cart__list__optionb">
				<h4>장바구니 이용안내</h4>
				<ol>
					<li>선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
					<li>[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
				</ol>
				<h4>무이자할부 이용안내</h4>
				<ol>
					<li>상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문] 버튼을 눌러 주문/결제 하시면
						됩니다.</li>
					<li>[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가
						이루어집니다.</li>
					<li>단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
					<li>무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가
						표시됩니다.<br />실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기
						바랍니다.
					</li>
				</ol>
			</div>
		</div>
	</section>
</body>
<%@ include file="footer/footer.jsp"%>
</html>
