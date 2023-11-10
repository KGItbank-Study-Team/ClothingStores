<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
/* 확인용 임시데이터 */
request.setAttribute("orderdate","2023-11-11");
request.setAttribute("ordernum","37859");  
request.setAttribute("productimage","이미지");  
request.setAttribute("productname","손오공이입은 개쩌는 옷");  
request.setAttribute("productoption","특별 손오공 에디션");  
request.setAttribute("ordercount","1");
request.setAttribute("orderamount","15000");
request.setAttribute("orderstatus","배송완료");
request.setAttribute("finalmoney","12000");
%>

<html lang="ko">
<%@ include file="header/header.jsp" %>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/pastlist.css">
    <title>배송지관리</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                    <h2>주문내역</h2>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab ">
                    <ul class="menu">
                        <li class="tab_class"><a
                                href="/app/member/myPage/orderList">주문내역조회
                                (<span id="xans_myshop_total_orders">0</span>)</a></li>
                        <li class="tab_class_cs"><a
                                href="/app/member/myPage/orderList">취소/반품/교환
                                내역 (<span id="xans_myshop_total_orders_cs">0</span>)</a></li>
                        <li class="tab_class_past selected"><a
                                href="/app/member/myPage/orderList/pastList">과거주문내역
                                (<span id="xans_myshop_total_orders_past">0</span>)</a></li>
                    </ul>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-orderhistoryhead ">
                    <fieldset class="ec-base-box">
                        <legend>검색기간설정</legend>

                        <div class="periodSelect">

                            <select id="search_year" class="fSelect">
                                <option value="2022" selected="selected">2022</option>
                                <option value="2021">2021</option>
                                <option value="2020">2020</option>
                                <option value="2019">2019</option>
                                <option value="2018">2018</option>
                            </select>
                        </div>
                        <input alt="조회" id="order_search_btn" type="image"
                            src="/resources/images/btn_search.gif"
                            onclick="OrderHistory.searchPast(true)">
                        &nbsp;
                    </fieldset>
                    <ul>
                        <li>주문처리완료 후 36개월 이내의 최근 주문건은 주문내역조회 탭에서 확인할 수 있습니다.</li>
                        <li>상품구매금액은 주문 당시의 판매가와 옵션추가금액의 합(부가세 포함)에 수량이 반영된 값입니다.</li>
                    </ul>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-orderhistorylistpast ec-base-table typeList"><!--
        $login_url = /member/login.html
    -->
                    <div class="title">
                        <h3>주문내역</h3>
                    </div>
                    <table border="1" summary="">
                        <caption></caption>
                        <colgroup>
                            <col style="width:135px;">
                            <col style="width:93px;">
                            <col style="width:auto;">
                            <col style="width:61px;">
                            <col style="width:111px;">
                            <col style="width:111px;">
                            <col style="width:111px;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">주문일자<br>[주문번호]</th>
                                <th scope="col">이미지</th>
                                <th scope="col">상품정보</th>
                                <th scope="col">수량</th>
                                <th scope="col">상품구매금액</th>
                                <th scope="col">주문처리상태</th>
                                <th scope="col">최종 실결제금액</th>
                            </tr>
                        </thead>
                        <tbody class="center ">
                        
                      	    <%-- <c:forEach var="item" items="${pastorderList}">
                            <tr class="">
                                <td class="number ">
                                	<p>${item.orderDate}</p>
                                    <p>[${item.orderNum}]</p>
                                </td>
                                <td class="thumb"><a href="/product/detail.html"><img
                                            src="/resources/images/${item.productImage}"
                                            onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
                                            alt=""></a></td>
                                <td class="product">
                                    <strong class="name">${item.productName}</strong>
                                    <div class="option ">${item.productOption}</div>
                                </td>
                                <td>${item.orderCount}</td>
                                <td class="">
                                    <div class="">${item.orderAmount}원</div>
                                </td>
                                <td class="state">
                                    <p class="txtEm">${item.orderStatus}</p>
                                </td>
                                <td class=" ">
                                    <p><strong>${item.finalMoney}원</strong></p>
                                </td>
                            </tr>
                            </c:forEach> --%>
                            
                            <tr class="">
                                <td class="number ">
                                	<p>${orderdate}</p>
                                    <p>[${ordernum}]</p>
                                </td>
                                <td class="thumb"><a href="/product/detail.html"><img
                                            src="/resources/images/Best_product02.webp"
                                            onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
                                            alt=""></a></td>
                                <td class="product">
                                    <strong class="name">${productname}</strong>
                                    <div class="option ">${productoption}</div>
                                </td>
                                <td>${ordercount}</td>
                                <td class="">
                                    <div class="">${orderamount}원</div>
                                </td>
                                <td class="state">
                                    <p class="txtEm">${orderstatus}</p>
                                </td>
                                <td class="">
                                    <p><strong>${finalmoney}원</strong></p>
                                </td>
                            </tr>
                           
                        </tbody>
                    </table>
                    <p class="message displaynone">주문 내역이 없습니다.</p>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-orderhistorypaging ec-base-paginate"><a
                        href="?page=1&amp;history_start_date=2023-08-09&amp;history_end_date=2023-11-07&amp;past_year=2022"><img
                            src="/resources/images/icon_prev2.png"></a>
                    <ol>
                        <li class="xans-record-"><a
                                href="?page=1&amp;history_start_date=2023-08-09&amp;history_end_date=2023-11-07&amp;past_year=2022"
                                class="this" style="padding-right: 0px;">1</a></li>
                    </ol>
                    <a
                        href="?page=1&amp;history_start_date=2023-08-09&amp;history_end_date=2023-11-07&amp;past_year=2022"><img
                            src="/resources/images/icon_next2.png"></a>
                </div>
            </div>
        </div>
    </div>

<%@ include file="footer/footer.jsp" %>

</body>

</html>