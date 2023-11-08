<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header/header.jsp" %>
<!DOCTYPE html>

<%
request.setAttribute("username", "페이커");  
request.setAttribute("grade", "member[멤버]");  
request.setAttribute("upgrade", "family[패밀리]");  
request.setAttribute("upgrademoney", "300,000");  
request.setAttribute("yearmoney", "0");  

request.setAttribute("reserve", "1000");  
request.setAttribute("totalreserve", "3000");  
request.setAttribute("usereserve", "2000");  
request.setAttribute("deposit", "50000");  
request.setAttribute("totalorderm", "0원");  
request.setAttribute("totalordern", "0");  
request.setAttribute("coupon", "1");  

request.setAttribute("beforedeposit", "1");  
request.setAttribute("preparingdelivery", "2");  
request.setAttribute("transit", "3");  
request.setAttribute("delivered", "4");  
request.setAttribute("cancel", "5");  
request.setAttribute("exchange", "6");  
request.setAttribute("turn", "7");  
%>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/index.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>마이페이지</title>
</head>

<body class="">
    <div id="skipNavigation">
        <p><a href="#category">전체상품목록 바로가기</a></p>
        <p><a href="#contents">본문 바로가기</a></p>
    </div>

    <div id="wrap">
        <div id="container">
            <div id="contents">
                <div id="myMenu" class="xans-element- xans-myshop xans-myshop-main ">
                    <ul>
                        <li class="order">
                            <a href="http://localhost:9090/views/app/list.jsp"><span>주문내역</span></a>
                        </li>
                        <li class="wishlist">
                            <a href="http://localhost:9090/views/app/modify.jsp"><span>프로필</span></a>
                        </li>
                        <li class="mileage">
                            <a href="http://localhost:9090/views/app/mileage.jsp"><span>적립금</span></a>
                        </li>
                        <li class="deposits ">
                            <a href="http://localhost:9090/views/app/deposits.jsp"><span>예치금</span></a>
                        </li>
                        <li class="coupon ">
                            <a href="http://localhost:9090/views/app/coupon.jsp"><span>쿠폰</span></a>
                        </li>
                        <li class="wishlist">
                            <a href="http://localhost:9090/views/app/wish_list.jsp"><span>위시리스트</span></a>
                        </li>
                        <li class="board">
                            <a href="http://localhost:9090/views/app/board_list.jsp"><span>게시글 관리</span></a>
                        </li>
                        <li class="board">
                            <a href="http://localhost:9090/views/app/addr.jsp"><span>배송지 관리</span></a>
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
                                                class="xans-member-var-sGradeIncreasePrice">${upgrademoney}원</span></strong>
                                        입니다. (최근 <span class="xans-member-var-sGradePeriod">12개월 동안</span> 구매금액 : <span
                                            class="xans-member-var-sPeriodOrderPrice">${yearmoney}</span>)
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
                            <a href="http://localhost:9090/views/app/mileage.jsp" class="btnNormal">조회</a>
                        </li>
                        <li class="">
                            <strong class="title">총적립금</strong>
                            <strong class="data"><span id="xans_myshop_bankbook_total_mileage">${totalreserve}원</span></strong>
                        </li>
                        <li class="">
                            <strong class="title">사용적립금</strong>
                            <strong class="data"><span id="xans_myshop_bankbook_used_mileage">${usereserve}원</span></strong>
                        </li>
                        <li class="">
                            <strong class="title">예치금</strong>
                            <strong class="data use">&nbsp;<span id="xans_myshop_bankbook_deposit">${deposit}원</span></strong>
                            <a href="http://localhost:9090/views/app/deposits.jsp" class="btnNormal">조회</a>
                        </li>
                        <li>
                            <strong class="title">총주문</strong>
                            <strong class="data"><span id="xans_myshop_bankbook_order_price">${totalorderm}</span>(<span
                                    id="xans_myshop_bankbook_order_count">${totalordern}</span>회)</strong>
                        </li>
                        <li class="">
                            <strong class="title">쿠폰</strong>
                            <strong class="data"><span
                                    id="xans_myshop_bankbook_coupon_cnt">${coupon}</span><span>개</span></strong>
                            <a href="http://localhost:9090/views/app/coupon.jsp" class="btnNormal">조회</a>
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
                                <a href="http://localhost:9090/views/app/list.jsp" class="count"><span
                                        id="xans_myshop_orderstate_shppied_before_count">${beforedeposit}</span></a>
                            </li>
                            <li>
                                <strong>배송준비중</strong>
                                <a href="http://localhost:9090/views/app/list.jsp" class="count"><span
                                        id="xans_myshop_orderstate_shppied_standby_count">${preparingdelivery}</span></a>
                            </li>
                            <li>
                                <strong>배송중</strong>
                                <a href="http://localhost:9090/views/app/list.jsp" class="count"><span
                                        id="xans_myshop_orderstate_shppied_begin_count">${transit}</span></a>
                            </li>
                            <li>
                                <strong>배송완료</strong>
                                <a href="http://localhost:9090/views/app/list.jsp" class="count"><span
                                        id="xans_myshop_orderstate_shppied_complate_count">${delivered}</span></a>
                            </li>
                        </ul>
                        <ul class="cs">
                            <li>
                                <span class="icoDot"></span>
                                <strong>취소 : </strong>
                                <a href="http://localhost:9090/views/app/list.jsp" class="count"><span
                                        id="xans_myshop_orderstate_order_cancel_count">${cancel}</span></a>
                            </li>
                            <li>
                                <span class="icoDot"></span>
                                <strong>교환 : </strong>
                                <a href="http://localhost:9090/views/app/list.jsp" class="count"><span
                                        id="xans_myshop_orderstate_order_exchange_count">${exchange}</span></a>
                            </li>
                            <li>
                                <span class="icoDot"></span>
                                <strong>반품 : </strong>
                                <a href="http://localhost:9090/views/app/list.jsp" class="count"><span
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