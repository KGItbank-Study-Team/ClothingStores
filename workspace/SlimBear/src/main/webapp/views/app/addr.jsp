<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/addr.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>배송지관리</title>
</head>

<%@ include file="header/header.jsp" %>

<body class="">
    <div id="wrap">
        <div id="container">
            <div id="contents">
            <form id="deleteAddressForm" action="/app/member/myPage/addr" method="post">
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

                <div class="titleArea">
                    <h2>배송지 관리</h2>
                    <p>자주 쓰는 배송지를 등록 관리하실 수 있습니다.</p>
                </div>
                
                    <div class="xans-element- xans-myshop xans-myshop-addrlist">
                        <div class="ec-base-table typeList">
                            <table border="1" summary="">
                                <caption>배송 주소록 목록</caption>
                                <colgroup>
                                    <col style="width:30px">
                                    <col style="width:110px">
                                    <col style="width:110px">
                                    <col style="width:130px">
                                    <col style="width:130px">
                                    <col style="width:auto">
                                    <col style="width:76px">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <!-- 체크박스 -->
                                        <th scope="col"><input type="checkbox" onclick='selectAll(this)'></th>
                                        <th scope="col">배송지명</th>
                                        <th scope="col">수령인</th>
                                        <th scope="col">일반전화</th>
                                        <th scope="col">휴대전화</th>
                                        <th scope="col">주소</th>
                                        <th scope="col">수정</th>
                                    </tr>
                                </thead>
                                <tbody class=" center">
                                	
                                	<c:forEach var="item" items="${addrList}">
                                    <tr class="xans-record-">
                                        <!-- 체크박스 -->
                                        <td><input name="wish_idx" id="wish_idx_0" enable-order="" reserve-order="N"
                                        	enable-purchase="1" class="" is-set-product="F" value="${item.addr_uid}" type="checkbox">
                                        </td>
                                        
                                        <td>
                                                <span>${item.addrName}</span>
                                        </td>
                                        <td><span>${item.recipient}</span></td>
                                        <td><span>${item.phone}</span></td>
                                        <td><span>${item.mobile}</span></td>
                                        <!-- class="left" -->
                                        <td class="">(<span>${item.postcode}</span>)<span>${item.defaultAddr}</span>
                                            <span>${item.remainAddr}</span>
                                        </td>
                                        <td><a href="/app/member/myPage/addr/fix?addrUID=${item.addr_uid}" class="btnNormal">수정</a></td>
                                    </tr>
                                    </c:forEach>
                                    
                                </tbody>
                                <tbody class="displaynone">
                                    <tr>
                                        <td colspan="8" class="message">등록된 주소가 없습니다.</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="ec-base-button">
                            <span class="gLeft ">
                                <a href="#none" class="btnNormal sizeS"
                                    onclick="deleteSelectedAddresses(); return false;">선택 주소록 삭제</a>
                            </span>
                            <span class="gRight">
                                <a href="/app/member/myPage/addr/register" class="btnSubmitFix sizeS">배송지등록</a>
                            </span>
                        </div>
                    </div>
                
                <div class="ec-base-help">
                    <h3>배송주소록 유의사항</h3>
                    <div class="inner">
                        <ol>
                            <li class="item1">배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.
                            </li>
                            <li class="item2">자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</li>
                            <li class="item3">기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
                        </ol>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    
<%@ include file="footer/footer.jsp" %>

</body>

</html>