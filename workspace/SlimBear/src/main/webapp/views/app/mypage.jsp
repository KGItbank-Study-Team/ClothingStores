<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
request.setAttribute("username", "페이커");  
request.setAttribute("grade", "member[멤버]");  
request.setAttribute("upgrade", "family[패밀리]");  
request.setAttribute("upgradeMoney", "300,000");  
request.setAttribute("yearMoney", "0");  

request.setAttribute("reserve", "1000");  
request.setAttribute("totalReserve", "3000");  
request.setAttribute("useReserve", "2000");  
request.setAttribute("deposit", "50000");  
request.setAttribute("totalOrderm", "0원");  
request.setAttribute("totalOrdern", "0");  
request.setAttribute("coupon", "1");  

request.setAttribute("beforeDeposit", "1");  
request.setAttribute("preparingDelivery", "2");  
request.setAttribute("transit", "3");  
request.setAttribute("delivered", "4");  
request.setAttribute("cancel", "5");  
request.setAttribute("exchange", "6");  
request.setAttribute("turn", "7");  
%>

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
                        <li class="mileage">
                            <a href="/app/member/myPage/mileage"><span>적립금</span></a>
                        </li>
                        <li class="deposits ">
                            <a href="/app/member/myPage/deposits"><span>예치금</span></a>
                        </li>
                        <li class="coupon ">
                            <a href="/app/member/myPage/coupon"><span>쿠폰</span></a>
                        </li>
                        <li class="wishlist">
                            <a href="/app/member/myPage/wishList"><span>위시리스트</span></a>
                        </li>
                        <li class="board">
                            <a href="/app/member/myPage/boardList"><span>게시글 관리</span></a>
                        </li>
                        <li class="board">
                            <a href="/app/member/myPage/addr"><span>배송지 관리</span></a>
                        </li>
                    </ul>
                </div>

                <div class="titleArea">
                    <h2>MY PAGE</h2>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-asyncbenefit">
                    <div class="ec-base-box typeMember gMessage ">
                        <div class="information">
                            <p class="thumbnail"><img
                                    src="/resources/images/member.jpg" alt=""
                                    onerror="this.src='images/member.jpg';"
                                    class="myshop_benefit_group_image_tag"></p>
                            <div class="description">
                                <span><strong class="txtEm"><span><span
                                                class="xans-member-var-name">${username}</span></span></strong> 님은
                                    <strong>[<span class=""><img
                                                src="/resources/images/member_small.jpg"
                                                alt="" class="myshop_benefit_group_icon_tag"></span><span
                                            class="xans-member-var-group_name">${grade}</span><span
                                            class="myshop_benefit_ship_free_message"></span>]</strong> 회원이십니다.</span>


                                <div class=" gBlank5" id="sGradeAutoDisplayArea">
                                    <p class=" sAutoGradeDisplay "><strong>[<span class="sNextGroupIconArea"><img
                                                    src="/resources/images/family.jpg"
                                                    alt="family[패밀리]"
                                                    class="myshop_benefit_next_group_icon_tag"></span><span
                                                class="xans-member-var-sNextGrade">${upgrade}</span>]</strong> 까지 남은
                                        구매금액은 <strong><span
                                                class="xans-member-var-sGradeIncreasePrice">${upgradeMoney}원</span></strong>
                                        입니다. (최근 <span class="xans-member-var-sGradePeriod">12개월 동안</span> 구매금액 : <span
                                            class="xans-member-var-sPeriodOrderPrice">${yearMoney}</span>)
                                    </p>
                                    <p class="txtInfo txt11">승급 기준에 따른 예상 금액이므로 총주문 금액과 다를 수 있습니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-asyncbankbook ec-base-box gHalf">
                    <ul>
                        <li class=" ">
                            <strong class="title">가용적립금</strong>
                            <strong class="data use">&nbsp;<span
                                    id="xans_myshop_bankbook_avail_mileage">${reserve}원</span></strong>
                            <a href="/app/member/myPage/mileage" class="btnNormal">조회</a>
                        </li>
                        <li class="">
                            <strong class="title">총적립금</strong>
                            <strong class="data"><span id="xans_myshop_bankbook_total_mileage">${totalReserve}원</span></strong>
                        </li>
                        <li class="">
                            <strong class="title">사용적립금</strong>
                            <strong class="data"><span id="xans_myshop_bankbook_used_mileage">${useReserve}원</span></strong>
                        </li>
                        <li class="">
                            <strong class="title">예치금</strong>
                            <strong class="data use">&nbsp;<span id="xans_myshop_bankbook_deposit">${deposit}원</span></strong>
                            <a href="/app/member/myPage/deposits" class="btnNormal">조회</a>
                        </li>
                        <li>
                            <strong class="title">총주문</strong>
                            <strong class="data"><span id="xans_myshop_bankbook_order_price">${totalOrderM}</span>(<span
                                    id="xans_myshop_bankbook_order_count">${totalOrderN}</span>회)</strong>
                        </li>
                        <li class="">
                            <strong class="title">쿠폰</strong>
                            <strong class="data"><span
                                    id="xans_myshop_bankbook_coupon_cnt">${coupon}</span><span>개</span></strong>
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
                                        id="xans_myshop_orderstate_shppied_before_count">${beforeDeposit}</span></a>
                            </li>
                            <li>
                                <strong>배송준비중</strong>
                                <a href="/app/member/myPage/orderList" class="count"><span
                                        id="xans_myshop_orderstate_shppied_standby_count">${preparingDelivery}</span></a>
                            </li>
                            <li>
                                <strong>배송중</strong>
                                <a href="/app/member/myPage/orderList" class="count"><span
                                        id="xans_myshop_orderstate_shppied_begin_count">${transit}</span></a>
                            </li>
                            <li>
                                <strong>배송완료</strong>
                                <a href="/app/member/myPage/orderList" class="count"><span
                                        id="xans_myshop_orderstate_shppied_complate_count">${delivered}</span></a>
                            </li>
                        </ul>
                        <ul class="cs">
                            <li>
                                <span class="icoDot"></span>
                                <strong>취소 : </strong>
                                <a href="/app/member/myPage/orderList" class="count"><span
                                        id="xans_myshop_orderstate_order_cancel_count">${cancel}</span></a>
                            </li>
                            <li>
                                <span class="icoDot"></span>
                                <strong>교환 : </strong>
                                <a href="/app/member/myPage/orderList" class="count"><span
                                        id="xans_myshop_orderstate_order_exchange_count">${exchange}</span></a>
                            </li>
                            <li>
                                <span class="icoDot"></span>
                                <strong>반품 : </strong>
                                <a href="/app/member/myPage/orderList" class="count"><span
                                        id="xans_myshop_orderstate_order_return_count">${turn}</span></a>
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