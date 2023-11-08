<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header/header.jsp" %>
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/wish_list.css">
    <script type="text/javascript" src="/resources/js/mypage.js"></script>
    <title>위시리스트</title>
</head>

<body class="">
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
                    <ul>
                        <h2>위시리스트</h2>
                        <p>관심상품 내역입니다. </p>
                    </ul>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-wishlist ec-base-table typeList xans-record-">
                    <table border="1" summary="" class="">
                        <caption>관심상품 목록</caption>
                        <colgroup>
                            <col style="width:38px;">
                            <col style="width:92px">
                            <col style="width:auto">
                            <col style="width:120px">
                            <col style="width:120px">
                        </colgroup>
                        <thead>
                            <tr>
                                <!-- 클릭하면 밑에 모든 체크박스 체크되는 기능 -->
                                <th scope="col"><input type="checkbox" onclick='selectAll(this)'></th>
                                <th scope="col">이미지</th>
                                <th scope="col">상품정보</th>
                                <th scope="col">판매가</th>
                                <th scope="col">선택</th>
                            </tr>
                        </thead>
                        <tbody class="xans-element- xans-myshop xans-myshop-wishlistitem center">
                            <tr class="xans-record-">
                                <!-- 체크박스 -->
                                <td><input name="wish_idx" id="wish_idx_0" enable-order="" reserve-order="N"
                                        enable-purchase="1" class="" is-set-product="F" value="1771675" type="checkbox">
                                </td>
                                <!-- 이미지 -->
                                <td class="thumb"><a
                                        href="/product/오픈-10할인-slowmade-어반시티-프리미엄-덕다운-데일리패딩-5-color-무료배송/7910/category/24/"><img
                                            src="https://cafe24img.poxo.com/anne2173/web/product/medium/202311/07e57156d656c32edfdcc8321bbdf689.webp"
                                            alt=""></a>
                                </td>
                                <!-- 상품정보 -->
                                <td class="left">
                                    <strong class="name"><a
                                            href="/product/오픈-10할인-slowmade-어반시티-프리미엄-덕다운-데일리패딩-5-color-무료배송/7910/category/24/"
                                            class="ec-product-name">[오픈 10%할인!] #SLOWMADE. 어반시티 프리미엄 덕다운 (데일리패딩) - 5
                                            color (무료배송)</a></strong>
                                </td>
                                <!-- 판매가 -->
                                <td class="price">
                                    <strong class="strike">110,000원<br></strong><br><strong class="">99,000원</strong>
                                </td>
                                <!-- 선택 -->
                                <td class="button">
                                    <a href="#none"
                                        onclick="CAPP_SHOP_NEW_PRODUCT_OPTIONSELECT.selectOptionCommon(7910,  24, 'wishlist', '')"
                                        class="btnNormal ">주문하기</a>
                                    <a href="#none"
                                        onclick="CAPP_SHOP_NEW_PRODUCT_OPTIONSELECT.selectOptionCommon(7910,  24, 'wishlist', '')"
                                        class="btnNormal ">장바구니</a>

                                </td>
                            </tr>
                            <tr class="xans-record-">
                                <!-- 체크박스 -->
                                <td><input name="wish_idx" id="wish_idx_0" enable-order="" reserve-order="N"
                                        enable-purchase="1" class="" is-set-product="F" value="1771675" type="checkbox">
                                </td>
                                <!-- 이미지 -->
                                <td class="thumb"><a
                                        href="/product/오픈-10할인-slowmade-어반시티-프리미엄-덕다운-데일리패딩-5-color-무료배송/7910/category/24/"><img
                                            src="https://cafe24img.poxo.com/anne2173/web/product/medium/202311/07e57156d656c32edfdcc8321bbdf689.webp"
                                            alt=""></a>
                                </td>
                                <!-- 상품정보 -->
                                <td class="left">
                                    <strong class="name"><a
                                            href="/product/오픈-10할인-slowmade-어반시티-프리미엄-덕다운-데일리패딩-5-color-무료배송/7910/category/24/"
                                            class="ec-product-name">[오픈 10%할인!] #SLOWMADE. 어반시티 프리미엄 덕다운 (데일리패딩) - 5
                                            color (무료배송)</a></strong>
                                </td>
                                <!-- 판매가 -->
                                <td class="price">
                                    <strong class="strike">110,000원<br></strong><br><strong class="">99,000원</strong>
                                </td>
                                <!-- 선택 -->
                                <td class="button">
                                    <a href="#none"
                                        onclick="CAPP_SHOP_NEW_PRODUCT_OPTIONSELECT.selectOptionCommon(7910,  24, 'wishlist', '')"
                                        class="btnNormal ">주문하기</a>
                                    <a href="#none"
                                        onclick="CAPP_SHOP_NEW_PRODUCT_OPTIONSELECT.selectOptionCommon(7910,  24, 'wishlist', '')"
                                        class="btnNormal ">장바구니</a>

                                </td>
                            </tr>
                            <tr class="xans-record-">
                                <!-- 체크박스 -->
                                <td><input name="wish_idx" id="wish_idx_0" enable-order="" reserve-order="N"
                                        enable-purchase="1" class="" is-set-product="F" value="1771675" type="checkbox">
                                </td>
                                <!-- 이미지 -->
                                <td class="thumb"><a
                                        href="/product/오픈-10할인-slowmade-어반시티-프리미엄-덕다운-데일리패딩-5-color-무료배송/7910/category/24/"><img
                                            src="https://cafe24img.poxo.com/anne2173/web/product/medium/202311/07e57156d656c32edfdcc8321bbdf689.webp"
                                            alt=""></a>
                                </td>
                                <!-- 상품정보 -->
                                <td class="left">
                                    <strong class="name"><a
                                            href="/product/오픈-10할인-slowmade-어반시티-프리미엄-덕다운-데일리패딩-5-color-무료배송/7910/category/24/"
                                            class="ec-product-name">[오픈 10%할인!] #SLOWMADE. 어반시티 프리미엄 덕다운 (데일리패딩) - 5
                                            color (무료배송)</a></strong>
                                </td>
                                <!-- 판매가 -->
                                <td class="price">
                                    <strong class="strike">110,000원<br></strong><br><strong class="">99,000원</strong>
                                </td>
                                <!-- 선택 -->
                                <td class="button">
                                    <a href="#none"
                                        onclick="CAPP_SHOP_NEW_PRODUCT_OPTIONSELECT.selectOptionCommon(7910,  24, 'wishlist', '')"
                                        class="btnNormal ">주문하기</a>
                                    <a href="#none"
                                        onclick="CAPP_SHOP_NEW_PRODUCT_OPTIONSELECT.selectOptionCommon(7910,  24, 'wishlist', '')"
                                        class="btnNormal ">장바구니</a>

                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- 위시리스트 비어있을때 -->
                    <p class="message displaynone">관심상품 내역이 없습니다.</p>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-wishlistbutton ec-base-button xans-record-"><span
                        class="gLeft">
                        <strong class="text">선택상품을</strong>
                        <a href="#none" class="btnEm" onclick="NewWishlist.deleteSelect();">삭제하기</a>
                        <a href="#none" class="btnNormal" onclick="NewWishlist.basket();">장바구니 담기</a>
                    </span>
                    <span class="gRight">
                        <a href="#none" class="btnSubmit sizeM" onclick="NewWishlist.orderAll();">전체상품주문</a>
                        <a href="#none" class="btnEmFix sizeM" onclick="NewWishlist.deleteAll();">관심상품 비우기</a>
                    </span>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-wishlistpaging ec-base-paginate">
                    <a href="#none"><img src="/resources/images/icon_prev2.png"></a>
                    <ol>
                        <li class="xans-record-"><a href="?page=1" class="this" style="padding-right: 0px;">1</a></li>
                    </ol>
                    <a href="#none"><img src="/resources/images/icon_next2.png"></a>
                </div>
            </div>
        </div>
    </div>
    
<%@ include file="footer/footer.jsp" %>

</body>

</html>