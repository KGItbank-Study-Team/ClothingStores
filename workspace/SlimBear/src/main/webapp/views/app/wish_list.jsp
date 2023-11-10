<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
/* 확인용 임시데이터 */
request.setAttribute("producturl", "링크링크링크링크");
request.setAttribute("productimage", "이미지");
request.setAttribute("productname", "이거완전 개쩌는옷이야");
request.setAttribute("orderamount", "110000");
request.setAttribute("orderdiscount", "99000");
%>

<html lang="ko">
<%@ include file="header/header.jsp" %>
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
                        
                        	<%-- <c:forEach var="item" items="${wishList}">
                            <tr class="xans-record-">
                                <!-- 체크박스 -->
                                <td><input name="wish_idx" id="wish_idx_0" enable-order="" reserve-order="N"
                                        enable-purchase="1" class="" is-set-product="F" value="1771675" type="checkbox">
                                </td>
                                <!-- 이미지 -->
                                <td class="thumb"><a
                                        href="${item.productURL}"><img
                                            src="/resources/images/${item.productImage}"
                                            alt=""></a>
                                </td>
                                <!-- 상품정보 -->
                                <td class="left">
                                    <strong class="name"><a
                                            href="${item.productURL}"
                                            class="ec-product-name">${item.productName}</a></strong>
                                </td>
                                <!-- 판매가 -->
                                <td class="price">
                                    <strong class="strike">${item.orderAmount}원<br></strong><br><strong class="">${item.orderDiscount}원</strong>
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
                            </c:forEach> --%>
                            
                            <tr class="xans-record-">
                                <!-- 체크박스 -->
                                <td><input name="wish_idx" id="wish_idx_0" enable-order="" reserve-order="N"
                                        enable-purchase="1" class="" is-set-product="F" value="1771675" type="checkbox">
                                </td>
                                <!-- 이미지 -->
                                <td class="thumb"><a
                                        href="${producturl}"><img
                                            src="/resources/images/${productimage}"
                                            alt=""></a>
                                </td>
                                <!-- 상품정보 -->
                                <td class="">
                                    <strong class="name"><a
                                            href="${producturl}"
                                            class="ec-product-name">${productname}</a></strong>
                                </td>
                                <!-- 판매가 -->
                                <td class="price">
                                    <strong class="strike">${orderamount}원<br></strong><br><strong class="">${orderdiscount}원</strong>
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