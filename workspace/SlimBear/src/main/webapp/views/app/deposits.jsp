<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
request.setAttribute("accruedeposit", "70000");
request.setAttribute("usedeposit", "20000");
request.setAttribute("deposit", "50000");
request.setAttribute("refunddeposit", "0");

/* 확인용 임시데이터 */
request.setAttribute("orderdate", "2023-11-11");
request.setAttribute("minusdeposit", "20000");
request.setAttribute("relatedorder", "관련주무운");
request.setAttribute("substance", "내요옹");
%>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/deposits.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>예치금</title>
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

                <div class="xans-element- xans-myshop xans-myshop-deposithistorypackage ">
                    <div class="xans-element- xans-myshop xans-myshop-deposithead titleArea ">
                        <h2>예치금</h2>
                        <p>고객님의 사용가능 예치금 금액 입니다.</p>
                    </div>
                    <div class="xans-element- xans-myshop xans-myshop-depositsummary ec-base-box gHalf">
                        <ul>
                            <li class="">
                                <strong class="title">누적 예치금</strong> <span class="data"><span
                                        id="xans_myshop_summary_all_deposit">${accruedeposit}</span>&nbsp;</span>
                            </li>
                            <li class="">
                                <strong class="title">사용된 예치금</strong> <span class="data"><span
                                        id="xans_myshop_summary_used_deposit">${usedeposit}</span>&nbsp;</span>
                            </li>
                            <li class="">
                                <strong class="title">사용가능 예치금</strong> <span class="data"><span
                                        id="xans_myshop_summary_deposit">${deposit}</span>&nbsp;</span>
                            </li>
                            <li class="">
                                <strong class="title">현금환불요청 예치금</strong> <span class="data"><span
                                        id="xans_myshop_summary_refund_wait_deposit">${refunddeposit}</span>&nbsp;</span>
                            </li>
                        </ul>
                    </div>
                    <div class="xans-element- xans-myshop xans-myshop-deposithistorylist">
                        <div class="ec-base-table typeList">
                            <table border="1" summary="">
                                <caption>예치금 내역</caption>
                                <colgroup>
                                    <col style="width:20%">
                                    <col style="width:15%">
                                    <col style="width:20%">
                                    <col style="width:auto">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">주문날짜</th>
                                        <th scope="col">예치금</th>
                                        <th scope="col">관련 주문</th>
                                        <th scope="col">내용</th>
                                    </tr>
                                </thead>
                                <tbody class="center">
                                
                              	    <%-- <c:forEach var="item" items="${depositList}">
                                    <tr class="">
                                        <td>${item.orderdate}</td>
                                        <td>${item.minusdeposit}</td>
                                        <td>${item.relatedorder}</td>
                                        <td>${item.substance}</td>
                                    </tr>
                                    </c:forEach> --%>

									<tr>
										<td>${orderdate}</td>
                                        <td>${minusdeposit}</td>
                                        <td>${relatedorder}</td>
                                        <td>${substance}</td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                            <p class="displaynone message ">예치금 내역이 없습니다.</p>
                        </div>
                    </div>
                    <div class="xans-element- xans-myshop xans-myshop-deposithistorypaging ec-base-paginate"><a
                            href="#none"><img src="/resources/images/icon_prev2.png"></a>
                        <ol>
                            <li class="xans-record-"><a href="?page=1" class="this" style="padding-right: 0px;">1</a>
                            </li>
                        </ol>
                        <a href="#nope"><img src="/resources/images/icon_next2.png"></a>
                    </div>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-deposithead ec-base-help ">
                    <h3>예치금 안내</h3>
                    <div class="inner">
                        <ol>
                            <li class="item1">예치금은 주문취소 등의 결제대금 환불, 초과 입금차액 환불 등으로 발생한 금액입니다.</li>
                            <li class="item2">사용가능 예치금(누적 예치금-사용된 예치금-현금환불요청 예치금)은 상품 구매 시 현금과 동일하게 언제든지 사용 가능합니다.</li>
                            <li class="item3">현금으로 환불을 원하실 경우, 본인 명의의 은행 계좌로 환불 신청을 할 수 있습니다.</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<%@ include file="footer/footer.jsp" %>

</body>

</html>