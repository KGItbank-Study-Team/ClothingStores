<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제 페이지</title>

<script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/order.js"></script>



<script src="/resources/js/slimbear-payment-imp.js"></script>

<link rel="stylesheet" href="/resources/css/orderr.css">
<link href="/resources/css/cart.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">

</head>
<body>
	<c:if test="${not empty error}">
		<script>
			alert('${error}');
			location = "/app/member/myPage/modify";
		</script>
	</c:if>
	<form>
		<div class="member">
			<!-- 1. 로고 -->
			<img class="logo" src="/resources/images/SlimBear-Logo01.png">
			<div style="border: 1px solid;padding:5px">
				<h1>구매자 정보</h1>
				<div class="delivery">
					<!-- 2. 필드 -->
					<div class="field">
						<b>주문자</b><input class="payment-buyer-name"type="text" value="${order.name}" readonly>
					</div>
					<div class="field">
						<b>이메일</b> <input class="payment-buyer-email" type="text" value="${order.email}" readonly>
						<!-- type이 password로 되어있어서 text로 바꿈 -->
					</div>
					<div class="field birth">
						<b>휴대전화</b>
						<input class="payment-buyer-tel" type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" value="${order.phone}" readonly>
					</div>
				</div>
			</div>

			<!-- 주문자 정보 끝-->
			<!-- 6. 가입하기 버튼 -->
			<br>

			<div style="border: 1px solid; padding: 5px">
				<h1>수령인 정보</h1>
				<div class="radioo">
					<p>
						<select id="select-address" onchange="reloadRecipient(${order.uid})">
							<option value="0" selected>구매자와 동일</option>
							<c:forEach var="item" items="${order.addressInfo}">
							 	<option value="${item.addr_uid}">${item.addrName}</option>
							</c:forEach>
						</select>
					</p>
				</div>
				<div class="field">
					<b>받는사람</b> <span class="placehold-textt"><input class="recipient-name" type="text" ></span>
				</div>
				<div class="field tel-number">
					<b>주소</b>
					<div>
						<input class='recipient-postcode payment-buyer-postcode' type="text" id="sample6_postcode" placeholder="우편번호" readonly>
						 <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</div>
					<input type="text" class='recipient-addr1 payment-buyer-addr1' placeholder="기본 주소" id="sample6_address"
						value="" readonly> <input class="recipient-addr2 payment-buyer-addr2" type="text" placeholder="상세 주소"
						id="sample6_detailAddress" > <input type="hidden" id="sample6_extraAddress" placeholder="참고항목" value="">
				</div>
				<!--휴대전화-->
				<div class="field birth">
						<b>휴대전화</b>
						<input class='recipient-phone' type="tel" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" >
				</div>
				
				<div class="field birth">
					<b>요청 사항</b>
					<div>
					<select class="payment-order-request" >
						 <option value="부재시 문앞에 놔주세요" selected>부재시 문앞에 놔주세요.</option>
						 <option value="부재시 경비실에 맡겨주세요">부재시 경비실에 맡겨주세요.</option>
						 <option value="부재시 연락바랍니다.">부재시 연락바랍니다.</option>
					</select>
					</div>
				</div>
			</div>
			
			
			<br>
			
			<!-- 주문상품 -->
			<div style="border: 1px solid; padding: 5px;">
			<h1>주문 상품</h1>
			<b class="payment-product-name">${order.productName}</b>
			<table class="cart__list">
				<thead>
					<tr>
						<td colspan="2" >상품</td>
						<td>옵션</td>
						<td>수량</td>
						<td>적립금</td>
						<td>상품금액</td>
						<td>할인금액</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="product" items="${order.productList}">
					<tr class="cart__list__detail">
							<td><img width="100" src="/resources/images/${product.main_image}"></td>
							<td >${product.name}</td>
							<td >${product.color}/${product.size}</td>
							<td >${product.cnt}</td>
							<td >${product.mileage}</td>
							<td class="value-product-price">${product.price}</td>
							<td >${product.maybeprice}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			
			<br>
			<!-- 결제정보/ 적립금 사용/ 쿠폰사용-->
			<div style="border: 1px solid; padding: 5px">
				<h1>결제 정보</h1>
				<table style="text-align: center;">
					<thead>
						<tr>
							<td >총 상품금액</td>
							<td>총 배송비</td>
							<td >결제예정금액</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="payment-amount-prodtotal" >${order.totalProduct}</td>
							<td class="payment-amount-delivery" >${order.deliveryPrice}</td>
							<td class="payment-pay-amount">${order.paymonetAmount}</td>
						</tr>
					</tbody>
				</table>
				<br>
				<article class="discount">
					
					<div>
						<h2>적립금</h2>
						<p>현재 포인트 : <span>${order.mileage}</span>점</p>
						<label> <input class="mileage-apply" type="text" name="point"
							placeholder="00,000점" value="0"> <input class="btn-mileage-apply"
							type="button" value="적용">
						</label>
					</div>
					
					<div>
						<h2>쿠폰</h2>
						<select class="select_coupon">
							<option value="0" selected>쿠폰</option>
						<c:forEach var="coupon" items="${order.couponeList}">
							<option value="${coupon.coup_uid}">${coupon.couponName}</option>
						</c:forEach>
						</select>
					</div>
					
				</article>
			</div>

			<br>
			<!-- 결제 방법 선택-->
			<div style="border: 1px solid; padding: 5px">
			
				<article class="d">
				<h3>결제방법</h3>
				<div>
					<label> <input class="btn-payment-select-html5_inicis" type="radio" name="payment" ><img  width=100 src="https://developers.portone.io/gitbook-assets/ko/7043_14679_1310.jpeg"></label>
					<label> <input class="btn-payment-select-danal" type="radio" name="payment" ><img  width=100 src="https://developers.portone.io/gitbook-assets/ko/screenshot%202022-05-30%205.30.00.png"></label>
					<label> <input class="btn-payment-select-tosspay" type="radio" name="payment" ><img  width=100 src="https://developers.portone.io/_astro/tosspayments1.425ef7e3.webp"></label>
					<label> <input class="btn-payment-select-kakaopay" type="radio" name="payment" ><img  width=100 src="https://developers.portone.io/gitbook-assets/ko/screenshot%202022-05-29%208.08.40.png"></label>
				</div>
		
			</article>


			<article class="alert">
				<ul>
					<li><span>슬림베어의 모든 판매자는 안전거래를 위해 구매금액, 결제수단에 상관없이 모든거래에 대하여 슬림베어 유한책임회사의 구매안전서비스(에스크로)를 제공하고 있습니다. </span></li>
					<li><span>슬림베어 유한책임회사의 전자금융거래법에 의해 결제대금예치업 등록번호는 02-006-00008 입니다. </span></li>
					<li><span>등록여부는 금융감독원 홈페이지(www.fss.or.kr)의 업무자료>인허가업무안내>전자금융업등록현황에서 확인하실수 있습니다. </span></li>
				</ul>
			</article>

			</div>
			
			<hr><br>
			<input class="btn-payment" type="button" value="주문하기">

		</div>
	</form>

	<%@ include file="footer/footer.jsp"%>

</body>


<!-- 다른 css 무시하기 -->
<style>
h2 {
	font-size: medium !important;
	padding-bottom: 0px;
}

.cart__list__detail :nth-child(3) {
	vertical-align: middle;
	border-left: 2px solid whitesmoke;
	text-align: center;
}

.cart__list__detail :nth-child(1){
	text-align: left;
}
</style>
</html>
