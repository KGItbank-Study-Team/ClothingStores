<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header/header.jsp" %>
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/addr.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>배송지수정</title>
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


                <div class="titleArea">
                    <h2>ADDRESS</h2>
                    <p>자주 쓰는 배송지를 등록 관리하실 수 있습니다.</p>
                </div>


                <div class="xans-element- xans-myshop xans-myshop-addrmodify ">
                    <div class="ec-base-table typeWrite">
                        <table border="1" summary="">
                            <caption>배송 주소록 입력</caption>
                            <colgroup>
                                <col style="width:120px">
                                <col style="width:auto">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">배송지명 <img
                                            src="/resources/images/ico_required_blue.gif"
                                            alt="필수"></th>
                                    <td><input id="ma_rcv_title" name="ma_rcv_title"
                                            fw-filter="isFill&amp;isMaxByte[90]" fw-label="배송지명" fw-msg=""
                                            class="inputTypeText" placeholder="" value="회사 라고할뻔" type="text"></td>
                                </tr>
                                <tr>
                                    <th scope="row">성명 <img
                                            src="/resources/images/ico_required_blue.gif"
                                            alt="필수"></th>
                                    <td><input id="ma_rcv_name" name="ma_rcv_name" fw-filter="isFill&amp;isMaxByte[90]"
                                            fw-label="성명" fw-msg="" class="ec-member-name" placeholder="" value="유철훈"
                                            type="text"></td>
                                </tr>
                                <tr>
                                    <th scope="row">주소 <img
                                            src="/resources/images/ico_required_blue.gif"
                                            alt="필수"></th>
                                    <td>
                                        <ul class="ec-address">
                                            <li id="shippingUpdate_zipcode_wrap" class="ec-address-zipcode">
                                                <input id="address_zip1" name="address_zip1" placeholder="우편번호"
                                                    fw-filter="" class="inputTypeText" type="text" maxlength="14"
                                                     readonly="" fw-label="우편번호"> <button id="SearchAddress"
                                                    class="btnBasic" type="button"
                                                    style="cursor: pointer;">주소검색</button><span class="ec-base-label">
                                                    <input id="nozip" name="nozip" class="displaynone" type="checkbox"
                                                        disabled="" style="display: none; cursor: unset;" fw-filter="">
                                            </li>
                                            <li id="shippingUpdate_baseAddr_wrap" class="">
                                                <input id="address_addr1" name="address_addr1" placeholder="기본주소"
                                                    fw-filter="" class="inputTypeText" type="text" size="60"
                                                    maxlength="100" readonly="" fw-label="기본주소">
                                            </li>
                                            <li id="shippingUpdate_detailAddr_wrap" class="">
                                                <input id="address_addr2" name="address_addr2"
                                                    placeholder="나머지 주소(선택 입력 가능)" fw-filter="" class="inputTypeText"
                                                    type="text" size="60" maxlength="255" fw-label="나머지 주소(선택 입력 가능)">
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">일반전화 <span class="displaynone"><img
                                                src="/resources/images/ico_required_blue.gif"
                                                alt="필수"></span>
                                    </th>
                                    <td><select id="ma_rcv_phone1" name="ma_rcv_phone[]" fw-filter="isNumber"
                                            fw-label="유선전화" fw-alone="N" fw-msg="">
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
                                        </select>-<input id="ma_rcv_phone2" name="ma_rcv_phone[]" maxlength="4"
                                            fw-filter="isNumber" fw-label="유선전화" fw-alone="N" fw-msg="" value=""
                                            type="text">-<input id="ma_rcv_phone3" name="ma_rcv_phone[]" maxlength="4"
                                            fw-filter="isNumber" fw-label="유선전화" fw-alone="N" fw-msg="" value=""
                                            type="text"></td>
                                </tr>
                                <tr>
                                    <th scope="row">휴대전화 <span class=""><img
                                                src="/resources/images/ico_required_blue.gif"
                                                alt="필수"></span>
                                    </th>
                                    <td><select id="ma_rcv_mobile_no1" name="ma_rcv_mobile_no[]"
                                            fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg="">
                                            <option value="010">010</option>
                                            <option value="011">011</option>
                                            <option value="016">016</option>
                                            <option value="017">017</option>
                                            <option value="018">018</option>
                                            <option value="019">019</option>
                                        </select>-<input id="ma_rcv_mobile_no2" name="ma_rcv_mobile_no[]" maxlength="4"
                                            fw-filter="isNumber&amp;isFill" fw-label="휴대전화" fw-alone="N" fw-msg=""
                                            placeholder="" value="" type="text">-<input id="ma_rcv_mobile_no3"
                                            name="ma_rcv_mobile_no[]" maxlength="4" fw-filter="isNumber&amp;isFill"
                                            fw-label="휴대전화" fw-alone="N" fw-msg="" placeholder="" value="" type="text">
                                    </td>
                                </tr>
                                <tr class="right">
                                    <td colspan="2"><input id="ma_main_flag0" name="ma_main_flag" fw-filter=""
                                            fw-label="기본 배송지로 저장" fw-msg="" value="T" type="checkbox"
                                            checked="checked"><label for="ma_main_flag0">기본 배송지로 저장</label></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="ec-base-button">
                        <span class="gRight">
                            <a href="#none" class="btnSubmitFix sizeS" onclick="myshopAddr.formCheck();">수정</a>
                            <a href="http://localhost:9090/views/app/addr.jsp" class="btnNormalFix sizeS">취소</a>
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