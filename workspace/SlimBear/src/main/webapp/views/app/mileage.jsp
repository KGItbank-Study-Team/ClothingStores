<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>


<html lang="ko">
<%@ include file="header/header.jsp" %>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/mileage.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>적립금</title>
</head>

<body>
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

                <div class="xans-element- xans-myshop xans-myshop-mileagehistorypackage ">
                    <div class="xans-element- xans-myshop xans-myshop-head titleArea ">
                        <h2>적립금</h2>
                        <p>고객님의 사용가능 적립금 금액 입니다.</p>
                    </div>
                    <div class="xans-element- xans-myshop xans-myshop-summary ec-base-box gHalf">
                        <ul>
                            <li class="">
                                <strong class="title">총 적립금</strong> <span class="data"><span
                                        id="xans_myshop_summary_total_mileage">${mile.totalReserve}</span>&nbsp;</span>
                            </li>
                            <li class="">
                                <strong class="title">사용가능 적립금</strong> <span class="data"><span
                                        id="xans_myshop_summary_avail_mileage">${mile.reserve}</span>&nbsp;</span>
                            </li>
                            <li class="">
                                <strong class="title">사용된 적립금</strong> <span class="data"><span
                                        id="xans_myshop_summary_used_mileage">${mile.useReserve}</span>&nbsp;</span>
                            </li>
                        </ul>
                    </div>
                    <div class="xans-element- xans-myshop xans-myshop-historylist">
                        <div class="ec-base-table typeList">
                            <table border="1" summary="">
                                <caption>적립금 내역</caption>
                                <colgroup>
                                    <col style="width:15%">
                                    <col style="width:15%">
                                    <col style="width:25%">
                                    <col style="width:auto">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">주문날짜</th>
                                        <th scope="col">적립금</th>
                                        <th scope="col">관련 주문</th>
                                        <th scope="col">내용</th>
                                    </tr>
                                </thead>
                                <tbody class="center">
                                
                                	<c:forEach var="item" items="${reserveList}">
                                    <tr class="xans-record-">
                                        <td>${item.orderDate}</td>
                                        <td class="right">${item.addReserve}</td>
                                        <td>${item.relatedOrder}</td>
                                        <td class="left">${item.substance}</td>
                                    </tr>
                                    </c:forEach>
                                    
                                </tbody>
                            </table>
                            <p class="message displaynone">적립금 내역이 없습니다.</p>
                        </div>
                    </div>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-historypaging ec-base-paginate"><a
                        href="#none"><img src="/resources/images/icon_prev2.png"></a>
                    <ol>
                        <li class="xans-record-"><a href="?page=1" class="this" style="padding-right: 0px;">1</a></li>
                    </ol>
                    <a href="#nope"><img src="/resources/images/icon_next2.png"></a>
                </div>

                
            </div>
        </div>
    </div>
    
<%@ include file="footer/footer.jsp" %>

</body>

</html>