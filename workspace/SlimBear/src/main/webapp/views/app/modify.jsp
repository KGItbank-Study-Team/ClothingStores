<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<%@ include file="header/header.jsp" %>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/modify.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>프로필</title>
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
                    <ul>
                        <h2>프로필</h2>
                        <p>회원정보를 최신 정보로 유지하시면 편리한 쇼핑을 즐기실 수 있습니다</p>
                    </ul>
                </div>
                <div class="xans-element- xans-myshop xans-myshop-asyncbenefit">
                    <div class="ec-base-box typeMember gMessage ">
                        <div class="information">
                            <div class="description">
                                <p>저희 쇼핑몰을 이용해 주셔서 감사합니다. <strong class="txtEm"><span><span
                                                class="xans-member-var-name">${modi.username} 회원님</span></span></strong>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <form id="editForm" name="editForm" action="/exec/front/Member/edit/" method="post" target="_self"
                    enctype="multipart/form-data">

                    <div class="xans-element- xans-member xans-member-edit">


                        <h3 class=" ">기본정보</h3>
                        <p class="required "><img src="/resources/images/ico_required_blue.gif" alt="필수"> 필수입력사항
                        </p>
                        <div class="ec-base-table typeWrite">
                            <table border="1" summary="">
                                <caption>회원 기본정보</caption>
                                <colgroup>
                                    <col style="width:150px;">
                                    <col style="width:auto;">
                                </colgroup>
                                <tbody>
                                    <tr class="">
                                        <th scope="row">아이디 <img src="/resources/images/ico_required_blue.gif" alt="필수"></th>
                                        <td>
                                            <input id="member_id" name="member_id"
                                                fw-filter="isFill&amp;isFill&amp;isMin[4]&amp;isMax[16]&amp;isIdentity"
                                                fw-label="아이디" fw-msg="" class="inputTypeText" placeholder=""
                                                readonly="readonly" value="${modi.userID}" type="text"> (영문소문자/숫자, 4~16자)
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">비밀번호 <img src="/resources/images/ico_required_blue.gif" class="" alt="필수">
                                        </th>
                                        <td>
                                            <input id="passwd" name="passwd"
                                                fw-filter="isFill&amp;isMin[4]&amp;isMax[16]" fw-label="비밀번호" fw-msg=""
                                                autocomplete="off" maxlength="16" 0="disabled" value="" type="password">
                                            (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row">비밀번호 확인 <img src="/resources/images/ico_required_blue.gif" alt="필수"></th>
                                        <td>
                                            <input id="user_passwd_confirm" name="user_passwd_confirm"
                                                fw-filter="isFill&amp;isMatch[passwd]" fw-label="비밀번호 확인"
                                                fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16" 0="disabled"
                                                value="" type="password"> <span id="pwConfirmMsg"></span>
                                        </td>
                                    </tr>
                                    <tr class="displaynone">
                                        <th scope="row">비밀번호 확인 답변 <img src="/resources/images/ico_required_blue.gif" alt="필수">
                                        </th>
                                        <td><input id="hint_answer" name="hint_answer" fw-filter=""
                                                fw-label="비밀번호 확인시 답변" fw-msg="" class="inputTypeText" placeholder=""
                                                value="" type="text"></td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row" id="">이름 <img src="/resources/images/ico_required_blue.gif" alt="필수"></th>
                                        <td><input id="name" name="name" fw-filter="isFill&amp;isMax[30]" fw-label="이름"
                                                fw-msg="" class="ec-member-name" placeholder="" maxlength="30"
                                                readonly="readonly" value="${modi.username}" type="text"></td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row">주소 <img src="/resources/images/ico_required_blue.gif" class="displaynone"
                                                alt="필수"></th>
                                        <td>
                                            <ul class="ec-address">
                                                <li id="fmodify_zipcode_wrap" class="ec-address-zipcode">
                                                    <input id="postcode1" name="postcode1" placeholder="우편번호"
                                                        fw-filter="" class="inputTypeText" type="text" maxlength="14"
                                                        readonly="" fw-label="우편번호" value="${modi.postcode}"> <button id="postBtn"
                                                        class="btnBasic" type="button"
                                                        style="cursor: pointer;">주소검색</button><span
                                                        class="ec-base-label">
                                                </li>
                                                <li id="fmodify_baseAddr_wrap" class="">
                                                    <input id="addr1" name="addr1" placeholder="기본주소" fw-filter=""
                                                        class="inputTypeText" type="text" size="60" maxlength="100"
                                                        readonly="" fw-label="기본주소" value="${modi.defaultAddr}">
                                                </li>
                                                <li id="fmodify_detailAddr_wrap" class="">
                                                    <input id="addr2" name="addr2" placeholder="나머지 주소(선택 입력 가능)"
                                                        fw-filter="" class="inputTypeText" value="${modi.remainAddr}" type="text" size="60"
                                                        maxlength="255" fw-label="나머지 주소(선택 입력 가능)">
                                                </li>
                                            </ul>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row">일반전화</th>
                                        <td><select id="phone1" name="phone[]" fw-filter="isNumber&amp;isNumber"
                                                fw-label="일반전화" fw-alone="N" fw-msg="">
                                                <option value="02">02</option>
                                                <option value="031">031</option>
                                                <option value="032">032</option>
                                                <option value="033">033</option>
                                                <option value="041">041</option>
                                                <option value="042">042</option>
                                                <option value="043">043</option>
                                                <option value="044">044</option>
                                                <option value="051">051</option>
                                                <option value="052">052</option>
                                                <option value="053">053</option>
                                                <option value="054">054</option>
                                                <option value="055">055</option>
                                                <option value="061">061</option>
                                                <option value="062">062</option>
                                                <option value="063">063</option>
                                                <option value="064">064</option>
                                                <option value="0502">0502</option>
                                                <option value="0503">0503</option>
                                                <option value="0504">0504</option>
                                                <option value="0505">0505</option>
                                                <option value="0506">0506</option>
                                                <option value="0507">0507</option>
                                                <option value="070">070</option>
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                                <option value="0508">0508</option>
                                            </select>-<input id="phone2" name="phone[]" maxlength="4"
                                                fw-filter="isNumber&amp;isNumber" fw-label="일반전화" fw-alone="N" fw-msg=""
                                                value="${modi.phone1}" type="text">-<input id="phone3" name="phone[]" maxlength="4"
                                                fw-filter="isNumber&amp;isNumber" fw-label="일반전화" fw-alone="N" fw-msg=""
                                                value="${modi.phone2}" type="text"></td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row">휴대전화 <img src="/resources/images/ico_required_blue.gif" class="" alt="필수">
                                        </th>
                                        <td>
                                            <select id="mobile1" name="mobile[]" fw-filter="isNumber&amp;isFill"
                                                fw-label="휴대전화" fw-alone="N" fw-msg="">
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                            </select>-
                                            <input id="mobile2" name="mobile[]" maxlength="4"
                                                fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg=""
                                                placeholder="" value="${modi.mobile1}" type="text">-<input id="mobile3" name="mobile[]"
                                                maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화"
                                                fw-alone="N" fw-msg="" placeholder="" value="${modi.mobile2}" type="text">
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row">SMS 수신여부 <img src="/resources/images/ico_required_blue.gif" alt="필수"></th>
                                        <td><input id="is_sms0" name="is_sms" fw-filter="isFill" fw-label="is_sms"
                                                fw-msg="" value="T" type="radio"><label for="is_sms0">수신함</label>
                                            <input id="is_sms1" name="is_sms" fw-filter="isFill" fw-label="is_sms"
                                                fw-msg="" value="F" type="radio" checked="checked"><label
                                                for="is_sms1">수신안함</label>
                                            <p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">이메일 <img src="/resources/images/ico_required_blue.gif" alt="필수"></th>
                                        <td>
                                            <input id="email1" name="email1" fw-filter="isFill&amp;isEmail"
                                                fw-label="이메일" fw-alone="N" fw-msg="" placeholder="" value="${modi.email}"
                                                type="text">
                                    </tr>
                                    <tr class="">
                                        <th scope="row">이메일 수신여부 <img src="/resources/images/ico_required_blue.gif" alt="필수"></th>
                                        <td><input id="is_news_mail0" name="is_news_mail" fw-filter="isFill"
                                                fw-label="is_news_mail" fw-msg="" value="T" type="radio"><label
                                                for="is_news_mail0">수신함</label>
                                            <input id="is_news_mail1" name="is_news_mail" fw-filter="isFill"
                                                fw-label="is_news_mail" fw-msg="" value="F" type="radio"
                                                checked="checked"><label for="is_news_mail1">수신안함</label>
                                            <p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="ec-base-button justify">
                            <a href="/app/member/myPage/modify" class="btnSubmitFix sizeM" onclick="memberEditAction()">회원정보수정</a>
                            <a href="/app/member/myPage" class="btnEmFix sizeM">취소</a>
                            <span class="gRight">
                            <!-- 아직 어찌할지 고민중 -->
                                <a href="#none" class="btnNormal sizeS" onclick="window.open('/app/member/myPage/modify/quit','quit','width=900,height=500');return false;">회원탈퇴</a>
                            </span>
                        </div>
                        
                    </div>
                </form>
            </div>
        </div>
    </div>

</body>
<%@ include file="footer/footer.jsp" %>

</html>