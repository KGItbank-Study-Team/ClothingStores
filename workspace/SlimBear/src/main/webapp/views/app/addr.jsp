<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
/* 확인용 임시데이터 */
request.setAttribute("addrname", "우리집");
request.setAttribute("username", "페이커");
request.setAttribute("phone", "02-1234-5667");
request.setAttribute("mobile", "010-2424-3434");
request.setAttribute("postcode", "13551");
request.setAttribute("defaultaddr", "서울 서초구 방배천로 18길 11 롯데캐슬");
request.setAttribute("remainaddr", "102동 3405호");
%>

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
                <div id="myMenu" class="xans-element- xans-myshop xans-myshop-main ">
                    <ul>
                        <li class="order">
                            <a href="/app/member/myPage/order_list"><span>주문내역</span></a>
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
                            <a href="/app/member/myPage/wish_list"><span>위시리스트</span></a>
                        </li>
                        <li class="board">
                            <a href="/app/member/myPage/board_list"><span>게시글 관리</span></a>
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
                                    <col style="width:27px">
                                    <col style="width:80px">
                                    <col style="width:95px">
                                    <col style="width:95px">
                                    <col style="width:120px">
                                    <col style="width:120px">
                                    <col style="width:auto">
                                    <col style="width:76px">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <!-- 체크박스 -->
                                        <th scope="col"><span class=""><input id="allCheck"
                                                    onclick="myshopAddr.checkAll(this)" value="" type="checkbox"></span>
                                        </th>
                                        <th scope="col">주소록 고정</th>
                                        <th scope="col">배송지명</th>
                                        <th scope="col">수령인</th>
                                        <th scope="col">일반전화</th>
                                        <th scope="col">휴대전화</th>
                                        <th scope="col">주소</th>
                                        <th scope="col">수정</th>
                                    </tr>
                                </thead>
                                <tbody class=" center">
                                
                                	<%-- <c:forEach var="item" items="${addrList}">
                                    <tr class="xans-record-">
                                        <!-- 체크박스 -->
                                        <td><input name="ma_idx[]" value="2198375" type="checkbox"></td>
                                        <td>
                                            o
                                        </td>
                                        <td>
                                            <img src="/resources/images/ico_addr_default.gif"
                                                class="" alt="기본"> 
                                                <span>${item.addrName}</span>
                                        </td>
                                        <td><span>${item.username}</span></td>
                                        <td><span>${item.phone}</span></td>
                                        <td><span>${item.mobile}</span></td>
                                        <!-- class="left" -->
                                        <td class="">(<span>${item.postcode}</span>)<span>${imte.defaultAddr}</span>
                                            <span>${item.remainAddr}</span>
                                        </td>
                                        <td><a href="/app/member/myPage/addr/addrFix" class="btnNormal ">수정</a></td>
                                    </tr>
                                    </c:forEach> --%>
                                    
                                    <tr class="xans-record-">
                                        <!-- 체크박스 -->
                                        <td><input name="ma_idx[]" value="2198375" type="checkbox"></td>
                                        <td>
                                            o
                                        </td>
                                        <td>
                                            <img src="/resources/images/ico_addr_default.gif"
                                                class="" alt="기본"> 
                                                <span>${addrname}</span>
                                        </td>
                                        <td><span>${username}</span></td>
                                        <td><span>${phone}</span></td>
                                        <td><span>${mobile}</span></td>
                                        <!-- class="left" -->
                                        <td class="">(<span>${postcode}</span>)<span>${defaultaddr}</span>
                                            <span>${remainaddr}</span>
                                        </td>
                                        <td><a href="/app/member/myPage/addr/addrFix" class="btnNormal ">수정</a></td>
                                    </tr>
                                    
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
                                    onclick="myshopAddr.deleteAddress(); return false;">선택 주소록 삭제</a>
                            </span>
                            <span class="gRight">
                                <a href="/app/member/myPage/addr/addrRegister" class="btnSubmitFix sizeS">배송지등록</a>
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
            </div>
        </div>
    </div>
    
<%@ include file="footer/footer.jsp" %>

</body>

</html>