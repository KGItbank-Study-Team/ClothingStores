<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/cart.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script defer src="/resources/js/cart.js"></script>

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
			<!-- <form id="myForm" action="/app/deleteSelectedItems" method="post"> -->

			<h1>C A R T</h1>
			<thead>
				<tr>
					<td><input type="checkbox" id="selectAll"></td>
					<td colspan="2">상품정보</td>
					<td>옵션</td>
					<td>수량</td>
					<td>적립금</td>
					<td>상품금액</td>
					<td>배송비</td>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="cart" items="${cartList}" varStatus="status">
					<tr class="cart__list__detail">
						<td><input type="checkbox" name="selectedItems"
							value="${cart.uid }"></td>
						<td class="yout"><img
							src="/resources/images/${cart.main_image}" alt="${cart.desc}"></td>
						<td><a href="#">${cart.maker}</a> <span
							class="cart__list__smartstore">${cart.maker}</span>
							<p>${cart.name }</p></td>
						<td class="cart__list__option">
							<p>
   ${cart.name}
   <c:forEach var="color" items="${cart.colorOptions}">
      <c:if test="${color eq cart.color}">
         <c:out value="${color}" />
      </c:if>
   </c:forEach>
   , 
   
   <c:forEach var="size" items="${cart.sizeOptions}">
      <c:if test="${size eq cart.size}">
         <c:out value="${size}" />

      </c:if>
     
   </c:forEach>
</p>
	<div class="btn"
								onclick="toggleHiddenContent(this, ${status.index});">주문
								추가/변경▽</div>
							<div class="hiddenContent04">
								<div class="option hidden"></div>
								<table class="change hidden">
									<tbody class="cchange">
										<tr class="nammme">
											<td colspan="3">${cart.name}</td>

										</tr>
										<tr class="">
											<td class="pcolor">
												<p class="colooo">COLOR</p>
											</td>
											<td colspan="2" class="colorrr"><select class="colorr"
												id="color_${status.index}_${cart.uid}">
													<c:forEach var="color" items="${cart.colorOptions}">
														<option value="${color}"
															<c:if test="${color eq cart.color}">selected</c:if>>${color}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr class="">
											<td>
												<p>SIZE</p>
											</td>
											<td colspan="2" class="colorrr"><select class="colorr"
												id="size_${status.index}_${cart.uid}">
													<c:forEach var="size" items="${cart.sizeOptions}">
														<!-- sizeOptionList 변수가 있어야 합니다. -->
														<option value="${size}"
															<c:if test="${size eq cart.size}">selected</c:if>>${size}</option>
													</c:forEach>
											</select></td>
										</tr>
										<tr>
											<td colspan="3">
												<div class="cart__mainbtns">
													<button class="cart__bigorderbtn left"
														onclick="location.href ='/'">자세히 보러가기</button>
													<button class="cart__bigorderbtn right"
														onclick="submitForm('/app/checkout')">변경하기</button>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</td>

						<td><span class="quantity"> <input type="text"
								class="inputBox" id="quantity_${cart.uid}" value="${cart.cnt}">
								<button type="button"
									onclick="updateQuantity(${cart.uid}, 'increase')">수량증가</button>
								<button type="button"
									onclick="updateQuantity(${cart.uid}, 'decrease')">수량감소</button>
						</span></td>
						<td><p id="addPrice_${cart.uid }">
								100
								<%-- ${cart.addprice} --%>
							</p></td>
						<td><span class="price" id="price_${cart.uid }">${cart.price}</span>
						</td>
						<td>무료<%-- ${cart.baedalprice } --%></td>
					</tr>

				</c:forEach>
			</tbody>


			<tfoot>
				<tr>
					<td colspan="3">

						<button class="cart__list__optionbtn"
							onclick="deleteSelectedItems()">선택상품 삭제</button>

						<button class="cart__list__optionbtn">선택상품 찜</button> <!--   </form> -->
					</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tfoot>

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
				<td colspan="2">${totalprice }</td>
				<td></td>
				<td>무료</td>
				<td>${cart.maybeprice}</td>
			</tr>
		</table>
		<div class="cart__mainbtns">
			<button class="cart__bigorderbtn left" onclick="location.href ='/'">쇼핑
				계속하기</button>
			<button class="cart__bigorderbtn right"
				onclick="submitForm('/app/checkout')">주문하기</button>
		</div>
		</form>
		<form>
			<input type="hidden" value="선택상품 삭제" id="deleteSelectedBtn"
				class="cart__list__optionbtn">
		</form>
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
