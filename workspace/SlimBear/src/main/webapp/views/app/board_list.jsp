<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
<%@ include file="header/header.jsp" %>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/board_list.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>게시글관리</title>
</head>

<body class="scroll">
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
                    <h2>게시글 관리</h2>
                </div>

                <div class="xans-element- xans-myshop xans-myshop-boardpackage ">
                    <div class="xans-element- xans-myshop xans-myshop-boardlisthead ">
                        <p>분류 선택 <select id="board_sort" name="board_sort" fw-filter="" fw-label="" fw-msg=""
                                onchange="BOARD.change_sort('boardSearchForm', this);">
                                <option value="D">작성 일자별</option>
                                <option value="C">분류별</option>
                            </select></p>
                    </div>
                    <div
                        class="xans-element- xans-myshop xans-myshop-boardlist ec-base-table typeList gBorder gBlank10">
                        <table border="1" summary="">
                            <caption>게시물 관리 목록</caption>
                            <colgroup
                                class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
                                <col style="width:100px;">
                                <col style="width:135px;">
                                <col style="width:auto;">
                                <col style="width:100px;">
                                <col style="width:100px;">
                                <col style="width:80px;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col">번호</th>
                                    <th scope="col">분류</th>
                                    <th scope="col">제목</th>
                                    <th scope="col">작성자</th>
                                    <th scope="col">작성일</th>
                                    <th scope="col">조회</th>
                                </tr>
                            </thead>
                            <tbody class="center">
                            
                            	<c:forEach var="item" items="${boardList}">
                                <tr class="xans-record-">
                                    <td>${item.boardNumber}</td>
                                    <td><a href="" class="txtEm"></a>${item.boardGroup}</td>
                                    <!-- class ="left subject" -->
                                    <td class="subject"><img src="/resources/images/icon_lock.png"
                                        alt="비밀글" class="ec-common-rwd-image"> <a
                                        href="http://localhost:9090/views/app/read.jsp">${item.boardTitle}</a>
                                    <img src="/resources/images/icon_lednew.gif" alt="NEW"
                                        class="ec-common-rwd-image"></td>
                                    <td>${item.boardWriter}</td>
                                    <td><span class="txtNum"></span>${item.boardDate}</td>
                                    <td><span class="txtNum"></span>${item.boardHits}</td>
                                </tr>
                                </c:forEach>
                               
                            </tbody>
                        </table>
                        <!-- 게시물이 없을경우 -->
                        <p class="message displaynone">게시물이 없습니다.</p>
                    </div>
                </div>

				<div class="xans-element- xans-myshop xans-myshop-boardlistpaging ec-base-paginate">
                    <a href="#none"><img src="/resources/images/icon_prev2.png"></a>
                    <ol>
                        <li class="xans-record-"><a href="#none" class="this" style="padding-right: 0px;">1</a></li>
                    </ol>
                    <a href="#none"><img src="/resources/images/icon_next2.png"></a>
                </div>

                <form id="boardSearchForm" name="" action="/myshop/board_list.html" method="get" target=""
                    enctype="multipart/form-data">
                    <input id="board_no" name="board_no" value="" type="hidden">
                    <input id="page" name="page" value="1" type="hidden">
                    <input id="board_sort" name="board_sort" value="" type="hidden">
                    <div class="xans-element- xans-myshop xans-myshop-boardlistsearch ">
                        <fieldset class="boardSearch">
                            <legend>게시물 검색</legend>
                            <p><select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="">
                                    <option value="subject">제목</option>
                                    <option value="content">내용</option>
                                    <option value="writer_name">글쓴이</option>
                                    <option value="member_id">아이디</option>
                                    <option value="nick_name">별명</option>
                                </select> <input id="search" name="search" fw-filter="" fw-label="" fw-msg=""
                                    class="inputTypeText" placeholder="" value="" type="text"> <a href="#none"
                                    class="btnEmFix" onclick="BOARD.form_submit('boardSearchForm');">찾기</a></p>
                        </fieldset>
                    </div>
                </form>
                <!-- 리뷰 작성 목록 -->
                <!-- <div class="crema-reviews crema-applied" data-widget-id="27" data-installation-id="9"
                    data-type="managing-reviews" style="margin-left: 31px;"><iframe id="crema-my-reviews-1" height="0"
                        src="https://review5.cre.ma/slowand.com/my/managing_reviews?iframe_id=crema-my-reviews-1&amp;app=0&amp;parent_url=https%3A%2F%2Fwww.slowand.com%2Fmyshop%2Fboard_list.html&amp;secure_username=V21b7961f44d891c02b7f7866f3609a62b&amp;secure_user_name=V29c512a84ee01a08fd1698da2353e4c7b&amp;secure_device_token=V27bcab9a5e5d22ec767027c71e2de2d08adc38a7df127f4c254e3cf9653f09780f85e128143042c0a7cadb96a8f5fd9f0&amp;iframe=1"
                        width="100%" scrolling="no" allowtransparency="true" frameborder="0"
                        name="crema-my-reviews-1-1698727196713"
                        style="display: block; visibility: visible; height: 158px;"></iframe>
                </div> -->
            </div>
        </div>
    </div>
    
<%@ include file="footer/footer.jsp" %>

</body>

</html>