<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<li class="mileage"><a href="/app/member/myPage/mileage"><span>적립금</span></a>
						</li>
						<li class="deposits "><a href="/app/member/myPage/deposits"><span>예치금</span></a>
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




				<!-- 주문상세! -->
				<div class="cpmwZc">
					<div class="hEqipt">
						<span class="dslKAU"><strong>2023. 10.
								11 주문 </strong></span><span style="color: #555555" class="jtryGp">주문번호
							16100015059001 </span>
					</div>
					<div class="fROrYB"></div>
				</div><br>



				<input id="mode" name="mode" value="" type="hidden"> <input
					id="term" name="term" value="" type="hidden">


				<div class="hunn">
					<table class="sc-gnmni8-1 eSpcfO">
						<colgroup>
							<col width="600">
							<col width="">
						</colgroup>
						<tbody class="sc-gnmni8-2 hryMPB">
							<tr class="sc-gnmni8-3 gmGnuU">
								<td class="hUzAOG">
									<div class="bQVZKC">
										<div class="sc-ki5ja7-1 krPkOP">
											<span font-weight="bold" color="#111111" class="hullgd"
												style="font-size: 1.25rem;">배송완료</span>
										</div>
									</div>

									<div class="sc-1jiyjbz-0 dGiGeF">
										<div class="kCcQTc">
											<div class="gLgexz">
												<div class="cNiGzR">
													<div class="eEDOvs">
														<a href="#" target="_blank"><img loading="lazy"
															width="64" height="64"
															src="https://thumbnail8.coupangcdn.com/thumbnails/remote/96x96ex/image/rs_quotation_api/zr1iuqbi/2e642eaa756a4073bdc985cccafa806c.png"
															alt="오류발생 쵸비상"></a>
													</div>
													<div class="bmwSdh">
														<div class="jBCCpd">
															<a href="상품링크" target="_blank" class="yma-DD hPjYZj">
																<span color="#111111" class="ifMZxv">네이처타임즈 모찌
																	고양이 롱쿠션 인형 바디필로우, 블랙, 110cm</span>
															</a> <a class="yma-DD iDQVMP">
																<div class="sc-8q24ha-3 gFbjJh">
																	<div class="jxRaeI">
																		<span font-weight="normal" color="#555555"
																			class="eDgzyT">26,600 원</span> <span class="kYtEGM">
																			<span class="joIhoV"></span>
																		</span> <span class="jtWNEg">1 개 </span>
																	</div>
																</div>
															</a>
															<div class="igPkOG"></div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</td>
								<td class="gbTJl">
									<div class="bCQoer">
										<button class="fUUUKW iiEWkt">배송조회</button>
										<button class="fTrGbC kiiuoA">리뷰 작성하기</button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<p class="message displaynone">주문 내역이 없습니다.</p>
			</div>
		</div>
	</div>




	<!-- 받는사람정보 -->
	<div class="khiofo">
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
					<td class="jRUPB">홍길동</td>
					<td class="gIRWDV"></td>
				</tr>
				<tr>
					<th style="color: #555" class="hYQyEN">연락처</th>
					<td class="jRUPB">010-1111-1111</td>
					<td class="gIRWDV"></td>
				</tr>
				<tr>
					<th style="color: #555" class="hYQyEN">받는주소</th>
					<td class="jRUPB">(13355) 경기도 광명시 광명동구 광명로13길 광명아파트701동 1102호
						( 광명동, 광명아파트 )</td>
					<td class="gIRWDV"></td>
				</tr>
				<tr>
					<th style="color: #555" class="hYQyEN">배송요청사항</th>
					<td class="jRUPB">
						<div class="jSLuUU">
							<span>문 앞</span>
						</div>
					</td>
					<td class="gIRWDV"></td>
				</tr>
			</tbody>
		</table>
	</div>






	<!-- 결제정보 -->
	<div class="sc-1m6uvm7-0 khiofo">
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
								<strong>9,945,500 원</strong>
							</div>
						</div> <br>
						<div class="sc-1w2sdij-0 kpjNvu">
							<div class="sc-1w2sdij-4 drZUIm">배송비</div>
							<div color="#111" class="sc-1w2sdij-5 asdf">
								<span>0 원</span>
							</div>
						</div>
					</th>
				</tr>
				<tr class="sc-189zx6p-2 dmEQfU">
					<th font-size="0.875rem" class="sc-189zx6p-3 bSRolI">
						<div style="font-size: 1rem; color: #111"
							class="sc-18ce9cx-0 jGrmQY">국민카드 / 일시불</div>
					</th>
				</tr>
			</tbody>
			<tbody class="sc-189zx6p-1 dYVCWG">
				<tr class="sc-189zx6p-2 dmEQfU">
					<td font-size="0.875rem" class="sc-189zx6p-4 jpZvwL"></td>
					<td font-size="0.875rem" class="sc-189zx6p-4 gzBVg">
						<div class="sc-cqdfxt-0 cVwNyN">
							<div class="NYtvr">국민카드 / 일시불</div>
							<div class="fTOSfp">
								<strong>45,500 원</strong>
							</div>
						</div> <br>
						<div class="iUCDca">
							<div style="color: #111" class="NYtvr">
								<strong>총 결제금액 </strong>
							</div>
							<div class="fTOSfp eiVXJZ">
								<strong>45,500 원</strong>
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>










	<%@ include file="footer/footer.jsp"%>

</body>

</html>