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
<title>주문내역</title>
</head>

<body>
	<div id="wrap">
		<div id="container">
			<div id="contents">
				<div id="myMenu" class="xans-element- xans-myshop xans-myshop-main ">
					<ul>
						<li class="order">
                            <a href="/app/member/myPage/orderList"><span>주문내역</span></a>
                        </li>
                        <li class="wishlist">
                            <a href="/app/member/myPage/modify"><span>프로필</span></a>
                        </li>
                        <li class="mileage">
                            <a href="/app/member/myPage/mileage"><span>적립금</span></a>
                        </li>
                        <li class="coupon ">
                            <a href="/app/member/myPage/coupon"><span>쿠폰</span></a>
                        </li>
                        <li class="wishlist">
                            <a href="/app/member/myPage/wishList"><span>위시리스트</span></a>
                        </li>
                        <li class="board">
                            <a href="/app/member/myPage/boardList"><span>문의 관리</span></a>
                        </li>
                        <li class="board">
                            <a href="/app/member/myPage/reviewList"><span>리뷰 관리</span></a>
                        </li>
                        <li class="board">
                            <a href="/app/member/myPage/addr"><span>배송지 관리</span></a>
                        </li>
					</ul>
				</div>

				<div class="one_tab mypage">
					<ul></ul>
				</div>

				<div class="titleArea">
					<h2>주문내역</h2>
					<p>주문상세보기를 클릭 시 상품 상세내역을 확인하실 수 있습니다.</p>
				</div>

				<div
					class="xans-element- xans-myshop xans-myshop-orderhistoryhead tyt">
					<fieldset class="ec-base-box">
						<legend>검색기간설정</legend>
						<div class="stateSelect ">
							<select id="order_status" name="order_status" class="fSelect">
								<option value="all">전체 주문처리상태</option>
								<option value="shipped_standby">배송준비중</option>
								<option value="shipped_begin">배송중</option>
								<option value="shipped_complate">배송완료</option>
								<option value="order_cancel">취소</option>
								<option value="order_return">반품</option>
							</select>
						</div>
						<span class="period"> <a href="#none" class="btnNormal"
							days="00"><img src="/resources/images/btn_date1.gif"></a> <a
							href="#none" class="btnNormal" days="07"><img
								src="/resources/images/btn_date2.gif"></a> <a href="#none"
							class="btnNormal" days="30"><img
								src="/resources/images/btn_date3.gif"></a> <a href="#none"
							class="btnNormal" days="90"><img
								src="/resources/images/btn_date4.gif"></a> <a href="#none"
							class="btnNormal" days="180"><img
								src="/resources/images/btn_date5.gif"></a>
						</span> <input id="history_start_date" name="history_start_date"
							class="fText hasDatepicker" readonly="readonly" size="10"
							value="2023-08-02" type="text">
						<button type="button" class="ui-datepicker-trigger">
							<img src="/resources/images/ico_cal.gif" alt="..." title="...">
						</button>
						~ <input id="history_end_date" name="history_end_date"
							class="fText hasDatepicker" readonly="readonly" size="10"
							value="2023-10-31" type="text">
						<button type="button" class="ui-datepicker-trigger">
							<img src="/resources/images/ico_cal.gif" alt="..." title="...">
						</button>
						<input alt="조회" id="order_search_btn" type="image"
							src="/resources/images/btn_search.gif">
					</fieldset>
					<ul>
						<li>주문상세보기를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
						<li class="">취소/반품 신청은 배송완료일 기준 7일까지 가능합니다.</li>
					</ul>
				</div>

				<br> <br>






				<c:forEach var="item" items="${orderList}">
					<div class="gKYVxm">
						<div class="kcHmyx">
							<div class="kSZYgn">${item.orderDate}주문</div>
							<div class="kcHmyx">
								<button
									onclick="window.open('/app/member/myPage/orderList/cancel','bank_account','width=700,height=500');"
									class="fTrGbC kiiuoA">취소 신청</button>
								<button
									onclick="window.open('/app/member/myPage/orderList/return','bank_account','width=700,height=500');"
									class="fTrGbC kiiuoA">반품 신청</button>
							</div>
							<div class="kThsCL">
								<a href="/app/member/myPage/orderList/detail" class="gSIruC">주문
									상세보기</a>
								<svg width="16" height="16" focusable="false"
									viewBox="0 0 16 16" aria-hidden="true" role="presentation"
									style="fill: rgb(0, 0, 0); vertical-align: middle; height: 100%;">
        					<path fill="#346aff" fill-rule="nonzero"
										d="M11.057 8L5.53 13.529c-.26.26-.26.682 0 .942.26.26.682.26.942 0l6-6c.26-.26.26-.682 0-.942l-6-6c-.26-.26-.682-.26-.942 0-.26.26-.26.682 0 .942L11.057 8z"></path>
      						</svg>
							</div>
						</div>

						<c:forEach var="item2" items="${orderList}">
							<div class="hCVtNj">
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
															style="font-size: 1.25rem;">${item2.orderStatus}</span>
													</div>
												</div>

												<div class="sc-1jiyjbz-0 dGiGeF">
													<div class="kCcQTc">
														<div class="gLgexz">
															<div class="cNiGzR">
																<div class="eEDOvs">
																	<a href="#" target="_blank"><img loading="lazy"
																		width="64" height="64" src="${item2.orderImage}"
																		alt="오류발생 쵸비상"></a>
																</div>
																<div class="bmwSdh">
																	<div class="jBCCpd">
																		<a href="상품링크" target="_blank" class="yma-DD hPjYZj">
																			<span color="#111111" class="ifMZxv">${item2.orderName}</span>
																		</a> <a class="yma-DD iDQVMP">
																			<div class="sc-8q24ha-3 gFbjJh">
																				<div class="jxRaeI">
																					<span font-weight="normal" color="#555555"
																						class="eDgzyT">${item2.orderAmount} 원</span> <span
																						class="kYtEGM"> <span class="joIhoV"></span>
																					</span> <span class="jtWNEg">${item2.orderCount} 개
																					</span>
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
						</c:forEach>

					</div>
				</c:forEach>












				<!-- 요부터 수정전 확인하려고 넣어둔부분-->
				<div class="gKYVxm">
					<div class="kcHmyx">
						<div class="kSZYgn">2023. 10. 11 주문</div>
						<div class="kcHmyx">
							<button
								onclick="window.open('/app/member/myPage/orderList/cancel','bank_account','width=700,height=500');"
								class="fTrGbC kiiuoA">취소 신청</button>
							<button
								onclick="window.open('/app/member/myPage/orderList/return','bank_account','width=700,height=500');"
								class="fTrGbC kiiuoA">반품 신청</button>
						</div>
						<div class="kThsCL">
							<span class="gSIruC">주문 상세보기</span>
							<svg width="16" height="16" focusable="false" viewBox="0 0 16 16"
								aria-hidden="true" role="presentation"
								style="fill: rgb(52, 106, 255); vertical-align: middle; height: 100%;">
        					<path fill="#346aff" fill-rule="nonzero"
									d="M11.057 8L5.53 13.529c-.26.26-.26.682 0 .942.26.26.682.26.942 0l6-6c.26-.26.26-.682 0-.942l-6-6c-.26-.26-.682-.26-.942 0-.26.26-.26.682 0 .942L11.057 8z"></path>
      						</svg>
						</div>
					</div>
					<div class="hCVtNj">
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
				</div>
				<!-- 요까지 -->

				<div
					class="xans-element- xans-myshop xans-myshop-orderhistorypaging ec-base-paginate">
					<a
						href="?page=1&amp;history_start_date=2023-08-02&amp;history_end_date=2023-10-31&amp;past_year=2022"><img
						src="/resources/images/icon_prev2.png"></a>
					<ol>
						<li class="xans-record-"><a
							href="?page=1&amp;history_start_date=2023-08-02&amp;history_end_date=2023-10-31&amp;past_year=2022"
							class="this" style="padding-right: 0px;">1</a></li>
					</ol>
					<a
						href="?page=1&amp;history_start_date=2023-08-02&amp;history_end_date=2023-10-31&amp;past_year=2022">
						<img src="/resources/images/icon_next2.png">
					</a>
				</div>
			</div>
		</div>
	</div>




	<%@ include file="footer/footer.jsp"%>
</body>

</html>