<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

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
                    <h2>쿠폰</h2>
                    <p>쿠폰 내역을 확인하실 수 있습니다.</p>
                </div>
                <div class="ec-base-table typeList">
                    <table border="1" summary="">
                        <caption>마이 쿠폰 목록</caption>
                        <colgroup>
                            <col style="width:120px">
                            <col style="width:auto">
                            <col style="width:150px">
                            <col style="width:150px">
                            <col style="width:200px">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">쿠폰명</th>
                                <th scope="col">최소 구매금액</th>
                                <th scope="col">쿠폰 혜택</th>
                                <th scope="col">사용가능 기간</th>
                            </tr>
                        </thead>
                        <tbody class="center">
                        
                       	<tbody class="center" id="couponTableBody">
                        	<c:forEach var="item" items="${couponList}">	
                            <tr class="">
                                <td>${item.couponNumber}</td>
                                <td><strong>${item.couponName}</strong></td>
                                <td>${item.minimumAmount}</td>
                                <td>${item.couponBenefit}</td>
                                <td><fmt:formatDate value="${item.couponPeriod}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                            </tr>
                            </c:forEach>
                         </tbody>
                            
                        </tbody>
                        <tbody class="">
                            <tr>
                                <td colspan="7" class="displaynone message">보유하고 계신 쿠폰 내역이 없습니다</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <form id="frmSerialCoupon" name="" action="/app/member/coupon" method="post" target="_self"
                enctype="multipart/form-data">
                <div class="xans-element- xans-myshop xans-myshop-couponserial  ">
                    <div class="ec-base-box typeThinBg couponSerial">
                        <fieldset>
                            <legend>쿠폰번호 등록</legend>
                            <!-- 여기에 Couponcode 만들기 -->
                            <input id="coupon_code" name="coupon_code" fw-filter="" fw-label="쿠폰인증번호" fw-msg=""
                                class="inputTypeText" placeholder="" maxlength="35" value="" type="text"> <a
                                class="btnSubmit sizeM" onclick="registerCoupon();">쿠폰등록</a>
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
            
            
        </div>
    </div>
    
<%@ include file="footer/footer.jsp" %>
    
</body>

</html>