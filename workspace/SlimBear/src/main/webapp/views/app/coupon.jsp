<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
/* 확인용 임시데이터 */
request.setAttribute("couponnumber", "1");
request.setAttribute("couponname", "신규회원 전용쿠폰");
request.setAttribute("couponproduct", "특가상품");
request.setAttribute("productprice", "40000");
request.setAttribute("paymethod", "카드");
request.setAttribute("couponbenefit", "10%할인");
request.setAttribute("couponperiod", "2024-02-14");
%>

<html lang="ko">
<%@ include file="header/header.jsp" %>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/coupon.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>쿠폰</title>
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
                    <h2>쿠폰</h2>
                    <p>쿠폰 내역을 확인하실 수 있습니다.</p>
                </div>
                <div class="ec-base-table typeList">
                    <table border="1" summary="">
                        <caption>마이 쿠폰 목록</caption>
                        <colgroup>
                            <col style="width:120px">
                            <col style="width:auto">
                            <col style="width:130px">
                            <col style="width:130px">
                            <col style="width:130px" class="">
                            <col style="width:130px">
                            <col style="width:170px">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">쿠폰명</th>
                                <th scope="col">쿠폰적용 상품</th>
                                <th scope="col">구매금액</th>
                                <th scope="col" class="">결제수단</th>
                                <th scope="col">쿠폰 혜택</th>
                                <th scope="col">사용가능 기간</th>
                            </tr>
                        </thead>
                        <tbody class="center">
                        
                        	<%-- <c:forEach var="item" items="${couponList}">	
                            <tr class="">
                                <td>${item.couponNumber}</td>
                                <td><strong>${item.couponName}</strong></td>
                                <td>${item.couponProduct}</td>
                                <td>${item.productPrice}</td>
                                <td>${item.payMethod}</td>
                                <td>${item.couponBenefit}</td>
                                <td>${item.couponPeriod}</td>
                            </tr>
                            </c:forEach> --%>
                            
                            <tr class="">
                                <td>${couponnumber}</td>
                                <td><strong>${couponname}</strong></td>
                                <td>${couponproduct}</td>
                                <td>${productprice}</td>
                                <td>${paymethod}</td>
                                <td>${couponbenefit}</td>
                                <td>${couponperiod}</td>
                            </tr>
                            
                        </tbody>
                        <tbody class="">
                            <tr>
                                <td colspan="7" class="displaynone message">보유하고 계신 쿠폰 내역이 없습니다</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- 여기에 useCoupon 만들기 -->
                <p class="ec-base-button"><span class="gRight"><a href="#none" class="btnSubmitFix sizeM"
                            onclick="COUPON.useCoupon()">사용하기</a></span></p>
            </div>

            <form id="frmSerialCoupon" name="" action="/exec/front/myshop/couponSerial" method="post" target="_self"
                enctype="multipart/form-data">
                <div class="xans-element- xans-myshop xans-myshop-couponserial  ">
                    <div class="ec-base-box typeThinBg couponSerial">
                        <fieldset>
                            <legend>쿠폰번호 등록</legend>
                            <!-- 여기에 Couponcode 만들기 -->
                            <input id="coupon_code" name="coupon_code" fw-filter="" fw-label="쿠폰인증번호" fw-msg=""
                                class="inputTypeText" placeholder="" maxlength="35" value="" type="text"> <a
                                href="#none" class="btnSubmit sizeM" onclick="coupon_code_submit();">쿠폰번호인증</a>
                            <p>반드시 쇼핑몰에서 발행한 쿠폰번호만 입력해주세요. (10~35자 일련번호 "-" 제외)</p>
                        </fieldset>
                    </div>
                </div>
            </form>

            <div class="xans-element- xans-myshop xans-myshop-couponlistpaging ec-base-paginate"><a href="#none"><img
                        src="/resources/images/icon_prev2.png"></a>
                <ol>
                    <li class="xans-record-"><a href="?page=1" class="this" style="padding-right: 0px;">1</a></li>
                </ol>
                <a href="#nope"><img src="/resources/images/icon_next2.png"></a>
            </div>
            
            <div class="ec-base-help">
                <h3>쿠폰 이용 안내</h3>
                <div class="inner">
                    <ol>
                        <li class="item1"><strong>쿠폰인증번호 등록하기</strong>에서 쇼핑몰에서 발행한 종이쿠폰/시리얼쿠폰/모바일쿠폰 등의 인증번호를 등록하시면
                            온라인쿠폰으로 발급되어 사용이 가능합니다.</li>
                        <li class="item2">쿠폰은 주문 시 1회에 한해 적용되며, 1회 사용 시 재 사용이 불가능합니다.</li>
                        <li class="item3">쿠폰은 적용 가능한 상품이 따로 적용되어 있는 경우 해당 상품 구매 시에만 사용이 가능합니다.</li>
                        <li class="item4">특정한 종이쿠폰/시리얼쿠폰/모바일쿠폰의 경우 단 1회만 사용이 가능할 수 있습니다.</li>
                        <li class="item5">기본 배송비 할인쿠폰은 배송구분이 '기본배송'인 상품에 부과된 배송비만 할인이 적용됩니다.</li>
                        <li class="item6">전체 배송비 할인쿠폰은 배송구분이 '기본배송', '개별배송', '공급사배송'인 상품에 부과된 배송비 할인이 적용됩니다.</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    
<%@ include file="footer/footer.jsp" %>
    
</body>

</html>