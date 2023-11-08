<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header/header2.jsp" %>
<%
/* 확인용 임시데이터 */
request.setAttribute("orderdate","2023-11-11");
request.setAttribute("ordernum","37859");
request.setAttribute("productimage","이미지");  
request.setAttribute("productname","손오공이입은 개쩌는 옷");  
request.setAttribute("productoption","특별 손오공 에디션");  
request.setAttribute("ordercount","1");  
request.setAttribute("orderamount","15000");
request.setAttribute("orderstatus","배송중");
request.setAttribute("fluctuation","반품신청");
%>

<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/list.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>주문내역</title>
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

                <div class="one_tab mypage">
                    <ul></ul>
                </div>

                <div class="titleArea">
                    <h2>주문내역</h2>
                    <p>주문번호를 클릭 시 상품 상세내역을 확인하실 수 있습니다.</p>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-orderhistorytab ec-base-tab ">
                    <ul class="menu">
                        <li class="tab_class selected"><a
                                href="http://localhost:9090/views/app/list.jsp">주문내역조회
                                (<span id="xans_myshop_total_orders">0</span>)</a></li>
                                <!-- 취소, 교환, 반품내역 -->
                        <li class="tab_class_cs"><a
                                href="http://localhost:9090/views/app/list.jsp">취소/반품/교환
                                내역 (<span id="xans_myshop_total_orders_cs">0</span>)</a></li>
                                <!-- 과겨내역 -->
                        <li class="tab_class_past"><a
                                href="http://localhost:9090/views/app/pastlist.jsp">과거주문내역
                                (<span id="xans_myshop_total_orders_past">0</span>)</a></li> 
                    </ul>
                </div>

                <form method="GET" id="OrderHistoryForm" name="OrderHistoryForm">
                    <div class="xans-element- xans-myshop xans-myshop-orderhistoryhead">
                        <fieldset class="ec-base-box">
                            <legend>검색기간설정</legend>
                            <div class="stateSelect ">
                                <select id="order_status" name="order_status" class="fSelect">
                                    <option value="all">전체 주문처리상태</option>
                                    <option value="shipped_before">입금전</option>
                                    <option value="shipped_standby">배송준비중</option>
                                    <option value="shipped_begin">배송중</option>
                                    <option value="shipped_complate">배송완료</option>
                                    <option value="order_cancel">취소</option>
                                    <option value="order_exchange">교환</option>
                                    <option value="order_return">반품</option>
                                </select>
                            </div>
                            <span class="period">
                                <a href="#none" class="btnNormal" days="00"><img src="/resources/images/btn_date1.gif"></a>
                                <a href="#none" class="btnNormal" days="07"><img src="/resources/images/btn_date2.gif"></a>
                                <a href="#none" class="btnNormal" days="30"><img src="/resources/images/btn_date3.gif"></a>
                                <a href="#none" class="btnNormal" days="90"><img src="/resources/images/btn_date4.gif"></a>
                                <a href="#none" class="btnNormal" days="180"><img src="/resources/images/btn_date5.gif"></a>
                            </span>
                            <input id="history_start_date" name="history_start_date" class="fText hasDatepicker"
                                readonly="readonly" size="10" value="2023-08-02" type="text"><button type="button"
                                class="ui-datepicker-trigger"><img
                                    src="/resources/images/ico_cal.gif" alt="..."
                                    title="..."></button> ~ <input id="history_end_date" name="history_end_date"
                                class="fText hasDatepicker" readonly="readonly" size="10" value="2023-10-31"
                                type="text"><button type="button" class="ui-datepicker-trigger"><img
                                    src="/resources/images/ico_cal.gif" alt="..."
                                    title="..."></button> <input alt="조회" id="order_search_btn" type="image"
                                src="/resources/images/btn_search.gif">
                        </fieldset>
                        <ul>
                            <li class=" ">기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 주문처리완료 후 36개월 이내의 주문내역을 조회하실 수 있습니다.</li>
                            <li class=" ">완료 후 36개월 이상 경과한 주문은 <a
                                    href="http://localhost:9090/views/app/pastlist.jsp">[과거주문내역]</a>에서 확인할 수 있습니다.</li>
                            <li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
                            <li class="">취소/교환/반품 신청은 배송완료일 기준 7일까지 가능합니다.</li>
                        </ul>
                    </div>
                    <input id="mode" name="mode" value="" type="hidden">
                    <input id="term" name="term" value="" type="hidden">
                </form>
                <div class="xans-element- xans-myshop xans-myshop-orderhistorylistitem ec-base-table typeList">
                    <div class="title">
                        <h3>주문 상품 정보</h3>
                    </div>
                    <table border="1" summary="">
                        <caption>주문 상품 정보</caption>
                        <colgroup>
                            <col style="width:160px;">
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
                                <th scope="col">취소/교환/반품</th>
                            </tr>
                        </thead>
                        <tbody class="center">
                        
                        	<%-- <c:forEach var="item" items="${orderList}">
                            <tr class="">
                                <td class="number ">
                                    <p>${item.orderdate}</p>
                                    <p><a href="detail.html" class="line">[${item.ordernum}]</a></p><br>
                                    <a href="#none" class="btnNormal " onclick="">주문취소</a>
                                    <a href="cancel.html" class="btnNormal ">취소신청</a>
                                    <a href="exchange.html" class="btnNormal ">교환신청</a>
                                    <a href="return.html" class="btnNormal ">반품신청</a>
                                </td>
                                <td class="thumb"><a href="/product/detail.html"><img
                                            src="/resources/images/${item.productimage}"
                                            onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
                                            alt=""></a></td>
                                <td class="product ">
                                    <strong class="name">${item.productname}</strong>
                                    <div class="option  ">${item.productoption}</div>
                                </td>
                                <td>${item.ordercount}</td>
                                <td class="">
                                    <strong>${item.orderamount}원</strong>
                                </td>
                                <td class="state">
                                    <p class="txtEm"></p>
                                    <p class=" "><a href="" target=""></a></p>
                                    <p class=" "><a href="#none" class="line" onclick="">${item.orderstatus}</a></p>
                                    <a href="/board/product/write.html" class="btnNormal   ">구매후기</a>
                                    <a href="#none" class="btnNormal  " onclick="">취소철회</a>
                                    <a href="#none" class="btnNormal  " onclick="">교환철회</a>
                                    <a href="#none" class="btnNormal  " onclick="">반품철회</a>
                                </td>
                                <td>
                                    <p class=" ">${item.fluctuations}</p><br>
                                    <p class=" "><a href="#none" class="btnNormal" onclick="">상세정보</a></p>
                                </td>
                            </tr>
                            </c:forEach> --%>
                            
                            <tr class="">
                                <td class="number ">
                                    <p>${orderdate}</p>
                                    <p><a href="detail.html" class="line">[${ordernum}]</a></p><br>
                                    <a href="#none" class="btnNormal " onclick="">주문취소</a>
                                    <a href="cancel.html" class="btnNormal ">취소신청</a>
                                    <a href="exchange.html" class="btnNormal ">교환신청</a>
                                    <a href="return.html" class="btnNormal ">반품신청</a>
                                </td>
                                <td class="thumb"><a href="/product/detail.html"><img
                                            src="/resources/images/Best_product02.webp"
                                            onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';"
                                            alt=""></a></td>
                                <td class="product ">
                                    <strong class="name">${productname}</strong>
                                    <div class="option  ">${productoption}</div>
                                </td>
                                <td>${ordercount}</td>
                                <td class="">
                                    <strong>${orderamount}원</strong>
                                </td>
                                <td class="state">
                                    <p class=" "><a href="#none" class="line" onclick="">${orderstatus}</a></p>
                                    <a href="/board/product/write.html" class="btnNormal   ">구매후기</a>
                                    <a href="#none" class="btnNormal  " onclick="">취소철회</a>
                                    <a href="#none" class="btnNormal  " onclick="">교환철회</a>
                                    <a href="#none" class="btnNormal  " onclick="">반품철회</a>
                                </td>
                                <td>
                                    <p class=" ">${fluctuation}</p><br>
                                    <p class=" "><a href="#none" class="btnNormal" onclick="">상세정보</a></p>
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                    <p class="message displaynone">주문 내역이 없습니다.</p>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-orderhistorypaging ec-base-paginate"><a
                        href="?page=1&amp;history_start_date=2023-08-02&amp;history_end_date=2023-10-31&amp;past_year=2022"><img
                            src="/resources/images/icon_prev2.png"></a>
                    <ol>
                        <li class="xans-record-"><a
                                href="?page=1&amp;history_start_date=2023-08-02&amp;history_end_date=2023-10-31&amp;past_year=2022"
                                class="this" style="padding-right: 0px;">1</a></li>
                    </ol>
                    <a
                        href="?page=1&amp;history_start_date=2023-08-02&amp;history_end_date=2023-10-31&amp;past_year=2022"><img
                            src="/resources/images/icon_next2.png"></a>
                </div>
            </div>
        </div>
    </div>




<%@ include file="footer/footer2.jsp" %>

</body>

</html>