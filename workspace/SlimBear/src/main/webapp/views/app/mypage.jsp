<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<%@ include file="header/header.jsp" %>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/index.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>마이페이지</title>
</head>

<body class="">
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

                <div class="titleArea">
                    <h2>MY PAGE</h2>
                </div>


                            <div class="description">
                            	<strong>${info.username} 회원님</strong>
                           	</div><br>
                                    

                <div class="xans-element- xans-myshop xans-myshop-asyncbankbook ec-base-box gHalf">
                    <ul>
                        <li class=" ">
                            <strong class="title">내 적립금</strong>
                            <strong class="data use">&nbsp;<span
                                    id="xans_myshop_bankbook_avail_mileage">${info.reserve}원</span></strong>
                        </li>
                        <li class="">
                            <strong class="title">쿠폰</strong>
                            <strong class="data"><span
                                    id="xans_myshop_bankbook_coupon_cnt">${info.coupon}</span><span>개</span></strong>
                            <a href="/app/member/myPage/coupon" class="btnNormal">조회</a>
                        </li>
                    </ul>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-orderstate ">
                    <div class="title">
                        <h3>나의 주문처리 현황 <span class="desc">(최근 <em>3개월</em> 기준)</span>
                        </h3>
                    </div>
                    <div class="state">
                        <ul class="order">
                            <li>
                                <strong>입금전</strong>
                                <a href="/app/member/myPage/orderList" class="count"><span
                                        id="xans_myshop_orderstate_shppied_before_count">${info.beforeDeposit}</span></a>
                            </li>
                            <li>
                                <strong>배송준비중</strong>
                                <a href="/app/member/myPage/orderList" class="count"><span
                                        id="xans_myshop_orderstate_shppied_standby_count">${info.preparingDelivery}</span></a>
                            </li>
                            <li>
                                <strong>배송중</strong>
                                <a href="/app/member/myPage/orderList" class="count"><span
                                        id="xans_myshop_orderstate_shppied_begin_count">${info.transit}</span></a>
                            </li>
                            <li>
                                <strong>배송완료</strong>
                                <a href="/app/member/myPage/orderList" class="count"><span
                                        id="xans_myshop_orderstate_shppied_complate_count">${info.delivered}</span></a>
                            </li>
                        </ul>
                        <ul class="cs">
                            <li>
                                <span class="icoDot"></span>
                                <strong>취소 : </strong>
                                <a href="/app/member/myPage/orderList" class="count"><span
                                        id="xans_myshop_orderstate_order_cancel_count">${info.cancel}</span></a>
                            </li>
                            <li>
                                <span class="icoDot"></span>
                                <strong>반품 : </strong>
                                <a href="/app/member/myPage/orderList" class="count"><span
                                        id="xans_myshop_orderstate_order_return_count">${info.turn}</span></a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>
<%@ include file="footer/footer.jsp" %>
</html>