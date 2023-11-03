<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../resources/css/index.css">
    <title>마이페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body class="">

<!-- header -->
<header>
        
    <div id="top_sentence">
        <div id="oneTop">
            <ul class="text-slide">
                <li class="slide-sentence"><a href="#none">♥핸드메이드 코트 10% SALE♥ ~2023.10.31 23:59PM</a></li></br>
                <li class="slide-sentence"><a href="#none">쌀쌀해진 날씨, 슬로우앤드와 함께 준비하기</a></li></br>
                <li class="slide-sentence"><a href="#none">로그인 후 슬로우앤드의 다양한 혜택을 만나보세요</a></li>
            </ul>
        </div>
    </div>
            <div id="users-container"> <!-- "menu clearfix" -->
                <ul class="mainMenu">
                    <div class="logo">
                        <a href=""><img src="../resources/images/SlimBear-Logo01.png " alt=""></a>
                    </div>
                    <div class="menu-list">
                        <li class="menu-item"><a href="">BEST🔥</a>
                            <ul class="dropdown-content">
                                <li><a href="">TOP</a></li>
                                <li><a href="">BOTTOM</a></li>
                                <li><a href="">OUTER</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">NEW</a></li>
                        <li class="menu-item"><a href="">TOP</a>
                            <ul class="dropdown-content">
                                <li><a href="">맨투맨</a></li>
                                <li><a href="">후드</a></li>
                                <li><a href="">셔츠</a></li>
                                <li><a href="">니트</a></li>
                                <li><a href="">반발티</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">BOTTOM</a>
                            <ul class="dropdown-content">
                                <li><a href="">팬츠</a></li>
                                <li><a href="">슬랙스</a></li>
                                <li><a href="">데님</a></li>
                                <li><a href="">반바지</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">OUTER</a>
                            <ul class="dropdown-content">
                                <li><a href="">코트</a></li>
                                <li><a href="">패딩</a></li>
                                <li><a href="">블레이저</a></li>
                                <li><a href="">레더</a></li>
                                <li><a href="">무스탕</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">UNDERWEAR</a>
                            <ul class="dropdown-content">
                                <li><a href="">상의</a></li>
                                <li><a href="">하의</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">SPORTS</a>
                            <ul class="dropdown-content">
                                <li><a href="">상의</a></li>
                                <li><a href="">하의</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">ACC</a>
                            <ul class="dropdown-content">
                                <li><a href="">벨트</a></li>
                                <li><a href="">양말</a></li>
                                <li><a href="">목도리</a></li>
                                <li><a href="">장갑</a></li>
                            </ul>
                        </li>
                        <li class="menu-item"><a href="">COMMUNITY</a>
                            <ul class="dropdown-content">
                                <li><a href="">공지사항</a></li>
                                <li><a href="">REVIEW</a></li>
                                <li><a href="">상품문의</a></li>
                                <li><a href="">FAQ</a></li>
                            </ul>
                        </li>
                    </div>
                    <div class="userArea">
                        <ul>
                            <li>
                                <div class="search">
                                    <input type="text" value="search" style="color: rgb(0, 0, 0);">
                                    <i class="fas fa-search"></i>
                                </div>
                            </li>
                            <li class="menu-item">
                                <a href="#"><img src="../resources/images/icon_user.png" alt="user"></a>
                                <ul class="dropdown-content">
                                    <li><a href="">로그인</a></li>
                                    <li><a href="">회원가입</a></li>
                                    <li><a href="">주문조회</a></li>
                                </ul>
                            </li>
                            <li><a href="#"><img class="fuck" src="../resources/images/icon_cart.png" alt="cart"></a></li>
                        </ul>
                    </div>
                </ul>
            </div><!-- 메인메뉴 끝-->
        </div>
    </header>

<!-- End header -->

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
                            <a href="http://localhost:9090/slimbear/views/list.jsp"><span>주문내역</span></a>
                        </li>
                        <li class="wishlist">
                            <a href="http://localhost:9090/slimbear/views/modify.jsp"><span>프로필</span></a>
                        </li>
                        <li class="mileage">
                            <a href="http://localhost:9090/slimbear/views/mileage.jsp"><span>적립금</span></a>
                        </li>
                        <li class="deposits ">
                            <a href="http://localhost:9090/slimbear/views/deposits.jsp"><span>예치금</span></a>
                        </li>
                        <li class="coupon ">
                            <a href="http://localhost:9090/slimbear/views/coupon.jsp"><span>쿠폰</span></a>
                        </li>
                        <li class="wishlist">
                            <a href="http://localhost:9090/slimbear/views/wish_list.jsp"><span>위시리스트</span></a>
                        </li>
                        <li class="board">
                            <a href="http://localhost:9090/slimbear/views/board_list.jsp"><span>게시글 관리</span></a>
                        </li>
                        <li class="board">
                            <a href="http://localhost:9090/slimbear/views/addr.jsp"><span>배송지 관리</span></a>
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
                                    src="../resources/images/member.jpg" alt=""
                                    onerror="this.src='images/member.jpg';"
                                    class="myshop_benefit_group_image_tag"></p>
                            <div class="description">
                                <span><strong class="txtEm"><span><span
                                                class="xans-member-var-name">유철훈</span></span></strong> 님은
                                    <strong>[<span class=""><img
                                                src="../resources/images/member_small.jpg"
                                                alt="" class="myshop_benefit_group_icon_tag"></span><span
                                            class="xans-member-var-group_name">member[멤버]</span><span
                                            class="myshop_benefit_ship_free_message"></span>]</strong> 회원이십니다.</span>


                                <div class=" gBlank5" id="sGradeAutoDisplayArea">
                                    <p class=" sAutoGradeDisplay "><strong>[<span class="sNextGroupIconArea"><img
                                                    src="../resources/images/family.jpg"
                                                    alt="family[패밀리]"
                                                    class="myshop_benefit_next_group_icon_tag"></span><span
                                                class="xans-member-var-sNextGrade">family[패밀리]</span>]</strong> 까지 남은
                                        구매금액은 <strong><span
                                                class="xans-member-var-sGradeIncreasePrice">300,000원</span></strong>
                                        입니다. (최근 <span class="xans-member-var-sGradePeriod">12개월 동안</span> 구매금액 : <span
                                            class="xans-member-var-sPeriodOrderPrice">0원</span>)
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
                                    id="xans_myshop_bankbook_avail_mileage">1,000원</span></strong>
                            <a href="/myshop/mileage/historyList.html" class="btnNormal">조회</a>
                        </li>
                        <li class="">
                            <strong class="title">총적립금</strong>
                            <strong class="data"><span id="xans_myshop_bankbook_total_mileage">1,000원</span></strong>
                        </li>
                        <li class="">
                            <strong class="title">사용적립금</strong>
                            <strong class="data"><span id="xans_myshop_bankbook_used_mileage">0원</span></strong>
                        </li>
                        <li class="">
                            <strong class="title">예치금</strong>
                            <strong class="data use">&nbsp;<span id="xans_myshop_bankbook_deposit">0원</span></strong>
                            <a href="/myshop/deposits/historyList.html" class="btnNormal">조회</a>
                        </li>
                        <li>
                            <strong class="title">총주문</strong>
                            <strong class="data"><span id="xans_myshop_bankbook_order_price">0원</span>(<span
                                    id="xans_myshop_bankbook_order_count">0</span>회)</strong>
                        </li>
                        <li class="">
                            <strong class="title">쿠폰</strong>
                            <strong class="data"><span
                                    id="xans_myshop_bankbook_coupon_cnt">0</span><span>개</span></strong>
                            <a href="/myshop/coupon/coupon.html" class="btnNormal">조회</a>
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
                                <a href="/myshop/order/list.html?order_status=shipped_before" class="count"><span
                                        id="xans_myshop_orderstate_shppied_before_count">0</span></a>
                            </li>
                            <li>
                                <strong>배송준비중</strong>
                                <a href="/myshop/order/list.html?order_status=shipped_standby" class="count"><span
                                        id="xans_myshop_orderstate_shppied_standby_count">0</span></a>
                            </li>
                            <li>
                                <strong>배송중</strong>
                                <a href="/myshop/order/list.html?order_status=shipped_begin" class="count"><span
                                        id="xans_myshop_orderstate_shppied_begin_count">0</span></a>
                            </li>
                            <li>
                                <strong>배송완료</strong>
                                <a href="/myshop/order/list.html?order_status=shipped_complate" class="count"><span
                                        id="xans_myshop_orderstate_shppied_complate_count">0</span></a>
                            </li>
                        </ul>
                        <ul class="cs">
                            <li>
                                <span class="icoDot"></span>
                                <strong>취소 : </strong>
                                <a href="/myshop/order/list.html?order_status=order_cancel" class="count"><span
                                        id="xans_myshop_orderstate_order_cancel_count">0</span></a>
                            </li>
                            <li>
                                <span class="icoDot"></span>
                                <strong>교환 : </strong>
                                <a href="/myshop/order/list.html?order_status=order_exchange" class="count"><span
                                        id="xans_myshop_orderstate_order_exchange_count">0</span></a>
                            </li>
                            <li>
                                <span class="icoDot"></span>
                                <strong>반품 : </strong>
                                <a href="/myshop/order/list.html?order_status=order_return" class="count"><span
                                        id="xans_myshop_orderstate_order_return_count">0</span></a>
                            </li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- footer -->

    <footer>
        <div id="bottom_info">
            <div class="guide">
                <h2>SLIMBEAR</h2>
                <li> 
                    <a href="/shopinfo/guide.html" style="color: black">Guide</a>
                </li>
                <li>
                    <a href="/member/agreement.html" style="color: black">Agreement</a>
                </li>
                <li>
                    <a href="/member/privacy.html" style="color: black">개인정보처리방침</a>
                </li>
            </div>
            <div class="address">
                <h2>Shop Information</h2>
                상호 : (주) 슬림모어 / SLIMMORE CO.</br>
                대표자 : 오승택</br>
                <li class="hidden">
                    <span>TEL 070-7777-7777</span>
                    <a href="none" class="more">
                        <i class="xi-angle-down"></i>
                    </a>
                    <div class="cons">
                        </br>
                        주소 : [04792] 서울특별시 종로구 돈화문로 26 단성사 5층</br>
                        하우스슬림 종로</br>
                        사업자번호 : 777-77-77777</br>
                        통신판매업 번호 : 2018-서울동대문-0658</br>
                        개인정보취급책임자 김재형, slimbear@naver.com</br>
                        81, Gomisul-ro, Dongdaemun-gu, Seoul, Republic of Korea</br>
                        copyright © 슬로우앤드 all rights reserved</br>
                    </div>
                </li>
            </div>
            <div class="call">
                <h2>C/S Center</h2>
                <b>070-7705-5595</b>
                OPEN am10:00 - pm17:00</br>
                BREAK pm12:00-pm13:00</br>(sat / sun / holiday OFF)
            </div>
            <div class="bank">
                <h2>Banking Info</h2>
                기업은행 203-147356-01-014</br>
                예금주 이상혁
            </div>
            <div class="exchange">
                <h2>[교환/반품 주소]</h2>
                서울시 동대문구 천호대로5</br>
                동대문우체국 소포실 (주)슬림모어 물류창고</br>
                4, Cheonho-daero, Dongdaemun-gu, Seoul</br>
                Republic of Korea</br>
                <u>
                    반품이나 교환 물품을 보내주실 때는</br>
                    반드시 지정된 택배사를 이용해주세요 :)<br/>
                    공지사항에서 자세히 확인하실 수 있답니다.
                </u>
            </div>
            <div class="service">
                <h2>SERVICE</h2>
                <div style="margin-bottom: 40px;">
                    고객님은 안전거래를 위해 현금 등으로 결제시<br/>
                    저희 쇼핑몰에서 가입한 구매안전 서비스를<br/>
                    이용하실 수 있습니다.
                </div>
                <div id="service_logo">
                    <img src="../resources/images/escrow_02.png" alt="" />
                    <img src="../resources/images/escrow_03.png" alt="" />
                    <img src="../resources/images/escrow_04.png" alt="" />
                </div>
            </div>
        </div>
    </footer>

    <!-- End footer -->
</body>

</html>