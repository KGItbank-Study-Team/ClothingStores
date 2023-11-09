<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
request.setAttribute("totalreserve", "3000");  
request.setAttribute("reserve", "1000");  
request.setAttribute("usereserve", "2000"); 
request.setAttribute("unreserve", "0"); 

/* 확인용 임시데이터 */
request.setAttribute("orderdate", "2023-11-05"); 
request.setAttribute("addreserve", "1000"); 
request.setAttribute("relatedorder", ""); 
request.setAttribute("substance", "신규회원 적립금"); 
%>

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

                <div class="xans-element- xans-myshop xans-myshop-mileagehistorypackage ">
                    <div class="xans-element- xans-myshop xans-myshop-head titleArea ">
                        <h2>적립금</h2>
                        <p>고객님의 사용가능 적립금 금액 입니다.</p>
                    </div>
                    <div class="xans-element- xans-myshop xans-myshop-summary ec-base-box gHalf">
                        <ul>
                            <li class="">
                                <strong class="title">총 적립금</strong> <span class="data"><span
                                        id="xans_myshop_summary_total_mileage">${totalreserve}</span>&nbsp;</span>
                            </li>
                            <li class="">
                                <strong class="title">사용가능 적립금</strong> <span class="data"><span
                                        id="xans_myshop_summary_avail_mileage">${reserve}</span>&nbsp;</span>
                            </li>
                            <li class="">
                                <strong class="title">사용된 적립금</strong> <span class="data"><span
                                        id="xans_myshop_summary_used_mileage">${usereserve}</span>&nbsp;</span>
                            </li>
                            <li class="">
                                <strong class="title">미가용 적립금</strong> <span class="data"><span
                                        id="xans_myshop_summary_unavail_mileage">${unreserve}</span>&nbsp;</span>
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
                                
                                	<%-- <c:forEach var="item" var="" items="${reserveList}">
                                    <tr class="xans-record-">
                                        <td>${item.orderdate}</td>
                                        <td class="right">${item.addreserve}</td>
                                        <td>${item.reletedorder}</td>
                                        <td class="left">${item.substance}</td>
                                    </tr>
                                    </c:forEach> --%>
                                    
                                    <tr class="xans-record-">
                                        <td>${orderdate}</td>
                                        <td class="right">${addreserve}</td>
                                        <td>${reletedorder}</td>
                                        <td class="left">${substance}</td>
                                    </tr>
                                    
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

                <div class="xans-element- xans-myshop xans-myshop-head ec-base-help ">
                    <h3>적립금 안내</h3>
                    <div class="inner">
                        <ol class="xans-element- xans-myshop xans-myshop-historyinfo">
                            <li class="item1 ">주문으로 발생한 적립금은 배송완료 후 14일 부터 실제 사용 가능한 적립금으로 전환됩니다. 배송완료 시점으로부터 14일 동안은
                                미가용 적립금으로 분류됩니다. </li>
                            <li class="item2 ">미가용 적립금은 반품, 구매취소 등을 대비한 임시 적립금으로 사용가능 적립금으로 전환되기까지 상품구매에 사용하실 수 없습니다.
                            </li>
                            <li class="item3 ">사용가능 적립금(총적립금 - 사용된적립금 - 미가용적립금)은 상품구매 시 바로 사용가능합니다.</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<%@ include file="footer/footer.jsp" %>

</body>

</html>