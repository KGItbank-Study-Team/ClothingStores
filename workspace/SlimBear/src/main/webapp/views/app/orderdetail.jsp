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
<link rel="stylesheet" type="text/css" href="/resources/css/list.css">
<script type="text/javascript" src="/resources/js/mypage.js"
	charset="utf-8"></script>
<title>주문상세</title>
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
						<li class="board"><a href="/app/member/myPage/boardList"><span>게시글
									관리</span></a></li>
						<li class="board"><a href="/app/member/myPage/addr"><span>배송지
									관리</span></a></li>
					</ul>
				</div>

				<div class="one_tab mypage">
					<ul></ul>
				</div>

				<div class="titleArea">
					<h2>주문상세내역</h2>
				</div>

				<div class="cpmwZc">
					<div class="hEqipt">
						<span class="dslKAU"><strong><fmt:formatDate
									value="${order.orderDate}" pattern="yyyy-MM-dd hh:mm:ss" /></strong></span><span
							style="color: #555555" class="jtryGp">주문번호 ${order.code} </span>
					</div>
					<div class="fROrYB"></div>
				</div>
				<br>

				<h1 class="berHYP">
					<span>받는사람 정보</span>
				</h1>
				<table class="jqnXTj">
					<caption class="dSygCD">받는사람 정보</caption>
					<colgroup>
						<col width="105">
						<col>
						<col width="100">
					</colgroup>
					<tbody class="dMXLkO">
						<tr>
							<th style="color: #555" class="hYQyEN">받는사람</th>
							<td class="jRUPB">${order.recipient}</td>
							<td class="gIRWDV"></td>
						</tr>
						<tr>
							<th style="color: #555" class="hYQyEN">연락처</th>
							<td class="jRUPB">${order.recipient_tel}</td>
							<td class="gIRWDV"></td>
						</tr>
						<tr>
							<th style="color: #555" class="hYQyEN">받는주소</th>
							<td class="jRUPB">${order.recipient_address}</td>
							<td class="gIRWDV"></td>
						</tr>
						<tr>
							<th style="color: #555" class="hYQyEN">배송요청사항</th>
							<td class="jRUPB">
								<div class="jSLuUU">
									<span>${order.order_request}</span>
								</div>
							</td>
							<td class="gIRWDV"></td>
						</tr>
					</tbody>
				</table>
				
			<br>
		<h1 class="sc-1m6uvm7-2 berHYP">
			<span>결제 정보</span>
		</h1>
		<table class="sc-1m6uvm7-3 jqnXTj">
			<caption class="sc-1m6uvm7-1 dSygCD">결제 정보</caption>
			<colgroup>
				<col>
				<col width="340">
			</colgroup>
			<tbody class="asd">
				<tr class="sc-189zx6p-2 dmEQfU">
					<th font-size="0.875rem" color="#555555"
						class="sc-189zx6p-3 ihLHiS">결제수단</th>
					<th font-size="0.875rem" rowspan="2" class="sc-189zx6p-3 bDjgVA">
						<div class="sc-1w2sdij-0 kpjNvu">
							<div class="sc-1w2sdij-4 drZUIm">총 상품가격</div>
							<div color="#111111" class="sc-1w2sdij-5 asdf">
								<strong>${order.totalProduct}원</strong>
							</div>
						</div> <br>
						<div class="sc-1w2sdij-0 kpjNvu">
							<div class="sc-1w2sdij-4 drZUIm">배송비</div>
							<div color="#111" class="sc-1w2sdij-5 asdf">
								<span>${order.deliveryPrice}원</span>
							</div>
						</div>
					</th>
				</tr>
				<tr class="sc-189zx6p-2 dmEQfU">
					<th font-size="0.875rem" class="sc-189zx6p-3 bSRolI">
						<div style="font-size: 1rem; color: #111"
							class="sc-18ce9cx-0 jGrmQY">${order.payment_info}</div>
					</th>
				</tr>
			</tbody>
			<tbody class="sc-189zx6p-1 dYVCWG">
				<tr class="sc-189zx6p-2 dmEQfU">
					<td font-size="0.875rem" class="sc-189zx6p-4 jpZvwL"></td>
					<td font-size="0.875rem" class="sc-189zx6p-4 gzBVg">
						<div class="sc-cqdfxt-0 cVwNyN">
							<div class="NYtvr">${order.payment_info}</div>
							<div class="fTOSfp">
								<strong>${order.paymonetAmount} 원</strong>
							</div>
						</div> <br>
						<div class="iUCDca">
							<div style="color: #111" class="NYtvr">
								<strong>총 결제금액 </strong>
							</div>
							<div class="fTOSfp eiVXJZ">
								<strong>${order.paymonetAmount} 원</strong>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	<br><br>
				<div class="gKYVxm">
					<div class="kcHmyx">
						<div class="kSZYgn">상품 목록</div>

						<div class="kThsCL">
							<svg width="16" height="16" focusable="false" viewBox="0 0 16 16"
								aria-hidden="true" role="presentation"
								style="fill: rgb(0, 0, 0); vertical-align: middle; height: 100%;">
            	</svg>
						</div>
					</div>

					<c:forEach var="product" items="${order.productList}">
						<div class="hCVtNj">
							<table class="sc-gnmni8-1 eSpcfO">
								<colgroup>
									<col width="600">
									<col width="">
								</colgroup>
								<tbody class="sc-gnmni8-2 hryMPB">
									<tr class="sc-gnmni8-3 gmGnuU">
										<td class="hUzAOG"><div class="bQVZKC">
												<div class="sc-ki5ja7-1 krPkOP"></div>
											</div>
											<div class="sc-1jiyjbz-0 dGiGeF">
												<div class="kCcQTc">
													<div class="gLgexz">
														<div class="cNiGzR">
															<div class="eEDOvs">
																<a href="/app/product?p=' + ${product.productUid} + '"><img
																	loading="lazy" width="64" height="64"
																	src="https://slimbearbucket.s3.ap-northeast-2.amazonaws.com/images/${product.main_image}"></a>
															</div>
															<div class="bmwSdh">
																<div class="jBCCpd">
																	<a href="/app/product?p=${product.productUid}"
																		class="yma-DD hPjYZj"><span color="#111111"
																		class="ifMZxv">${product.name}</span></a> <a
																		href="/app/product?p=${product.productUid}"
																		class="yma-DD hPjYZj"><span color="#111111"
																		class="ifMZxv">${product.desc}</span></a> <a
																		class="yma-DD iDQVMP"><div class="sc-8q24ha-3 gFbjJh">
																			<div class="jxRaeI">
																				<span font-weight="normal" color="#555555"
																					class="eDgzyT">${product.price}원</span> <span
																					class="kYtEGM"> <span class="joIhoV"></span>
																				</span> <span class="jtWNEg">${product.cnt}개</span>
																			</div>
																		</div></a>
																	<div class="igPkOG"></div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div></td>
										<td class="gbTJl"><div class="bCQoer">
												<button class="fUUUKW iiEWkt"
													onclick="location='/app/order/delivery'">배송조회</button>

												<c:if test="${order.status eq 'DONE'}">
													<c:if test="${empty product.reviewUID}">
														<button class="fTrGbC kiiuoA" id="openWriteForm"
															onclick="openReviewWrite()">리뷰 작성하기</button>
													</c:if>
													<c:if test="${not empty product.reviewUID}">
														<button class="fTrGbC kiiuoA" id="openWriteForm">리뷰
															작성완료</button>
													</c:if>
												</c:if>
												<c:if test="${order.status ne 'DONE'}">
													<button class="fTrGbC kiiuoA" id="openWriteForm">배송
														미완료</button>
												</c:if>

											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</c:forEach>
				</div>

			

			</div>
		</div>
	</div>



	<br><br>

	<%@ include file="footer/footer.jsp"%>

</body>

</html>