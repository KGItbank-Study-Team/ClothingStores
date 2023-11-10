<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
request.setAttribute("username", "페이커");  
request.setAttribute("grade", "member[멤버]");  
request.setAttribute("userid", "faker"); 
request.setAttribute("postcode", "13551"); 
request.setAttribute("defaultaddr", "서울 서초구 방배천로 18길 11 롯데캐슬"); 
request.setAttribute("remainaddr", "102동 3405호"); 
request.setAttribute("phonef", "3469"); 
request.setAttribute("phonel", "5674"); 
request.setAttribute("mobilef", "1298"); 
request.setAttribute("mobilel", "6742"); 
request.setAttribute("email", "yeon94@naver.con"); 
request.setAttribute("useryear", "1994"); 
request.setAttribute("usermonth", "9"); 
request.setAttribute("userday", "11"); 
request.setAttribute("refundAccount", "[산적은행] 123-4567-890 / 예금주: 연해적"); 
%>

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
                    <ul>
                        <h2>프로필</h2>
                        <p>회원정보를 최신 정보로 유지하시면 편리한 쇼핑을 즐기실 수 있습니다</p>
                    </ul>
                </div>
                <div class="xans-element- xans-myshop xans-myshop-asyncbenefit">
                    <div class="ec-base-box typeMember gMessage ">
                        <div class="information">
                            <p class="thumbnail"><img src="/resources/images/member.jpg" alt=""
                                    onerror="this.src='images/member.jpg';" class="myshop_benefit_group_image_tag"></p>
                            <div class="description">
                                <p>저희 쇼핑몰을 이용해 주셔서 감사합니다. <strong class="txtEm"><span><span
                                                class="xans-member-var-name">${username}</span></span></strong> 님은
                                    <strong>[<span class="xans-member-var-group_name">${grade}</span><span
                                            class="myshop_benefit_ship_free_message"></span>]</strong> 회원이십니다.
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
                                                readonly="readonly" value="${userID}" type="text"> (영문소문자/숫자, 4~16자)
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
                                                readonly="readonly" value="${username}" type="text"></td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row">주소 <img src="/resources/images/ico_required_blue.gif" class="displaynone"
                                                alt="필수"></th>
                                        <td>
                                            <ul class="ec-address">
                                                <li id="fmodify_zipcode_wrap" class="ec-address-zipcode">
                                                    <input id="postcode1" name="postcode1" placeholder="우편번호"
                                                        fw-filter="" class="inputTypeText" type="text" maxlength="14"
                                                        readonly="" fw-label="우편번호" value="${postcode}"> <button id="postBtn"
                                                        class="btnBasic" type="button"
                                                        style="cursor: pointer;">주소검색</button><span
                                                        class="ec-base-label">
                                                </li>
                                                <li id="fmodify_baseAddr_wrap" class="">
                                                    <input id="addr1" name="addr1" placeholder="기본주소" fw-filter=""
                                                        class="inputTypeText" type="text" size="60" maxlength="100"
                                                        readonly="" fw-label="기본주소" value="${defaultAddr}">
                                                </li>
                                                <li id="fmodify_detailAddr_wrap" class="">
                                                    <input id="addr2" name="addr2" placeholder="나머지 주소(선택 입력 가능)"
                                                        fw-filter="" class="inputTypeText" vaule="${remainAddr}" type="text" size="60"
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
                                                value="${phoneF}" type="text">-<input id="phone3" name="phone[]" maxlength="4"
                                                fw-filter="isNumber&amp;isNumber" fw-label="일반전화" fw-alone="N" fw-msg=""
                                                value="${phoneL}" type="text"></td>
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
                                                placeholder="" value="${mobileF}" type="text">-<input id="mobile3" name="mobile[]"
                                                maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="휴대전화"
                                                fw-alone="N" fw-msg="" placeholder="" value="${mobileL}" type="text">
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
                                                fw-label="이메일" fw-alone="N" fw-msg="" placeholder="" value="${email}"
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
                        <h3 class=" ">추가정보</h3>
                        <div class="ec-base-table typeWrite ">
                            <table border="1" summary="">
                                <caption>회원 추가정보</caption>
                                <colgroup>
                                    <col style="width:150px;">
                                    <col style="width:auto;">
                                </colgroup>
                                <tbody>
                                    <tr class="">
                                        <th scope="row">생년월일</th>
                                        <td><input id="birth_year" name="birth_year" fw-filter="" fw-label="생년월일"
                                                fw-msg="" class="inputTypeText" placeholder="" maxlength="4"
                                                value="${userYear}" type="text"> 년 <input id="birth_month" name="birth_month"
                                                fw-filter="" fw-label="생년월일" fw-msg="" class="inputTypeText"
                                                placeholder="" maxlength="2" value="${userMonth}" type="text"> 월 <input
                                                id="birth_day" name="birth_day" fw-filter="" fw-label="생년월일" fw-msg=""
                                                class="inputTypeText" placeholder="" maxlength="2" value="${userDay}"
                                                type="text">
                                            일 <span class="gIndent20 "><input id="is_solar_calendar0"
                                                    name="is_solar_calendar" fw-filter="" fw-label="생년월일" fw-msg=""
                                                    value="T" type="radio" checked="checked"><label
                                                    for="is_solar_calendar0">양력</label>
                                                <input id="is_solar_calendar1" name="is_solar_calendar" fw-filter=""
                                                    fw-label="생년월일" fw-msg="" value="F" type="radio"><label
                                                    for="is_solar_calendar1">음력</label></span>
                                        </td>
                                    </tr>
                                    <tr class="">
                                        <th scope="row">환불계좌 <img src="/resources/images/ico_required_blue.gif" class="" alt="필수">
                                        </th>
                                        <td>
                                            <span id="id_bank_info">${refundAccount}</span> <a
                                                href="#none" class="btnNormal gIndent10"
                                                onclick="window.open('/app/member/myPage/mileage/refund','bank_account','width=700,height=500');return false;"><span
                                                    id="id_has_bank_img" class="">환불계좌변경</span></a>
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