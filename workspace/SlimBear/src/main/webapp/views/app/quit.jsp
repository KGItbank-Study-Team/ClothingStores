<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/modify.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>회원탈퇴</title>
</head>

<body>
    <div class="header">
        <h3>회원탈퇴</h3>
    </div>
    <div class="content">
        <div class="ec-base-box typeMember">
            <div class="information">
                <strong class="title">혜택 내역</strong>
                <div class="description">
                    <ul>
                        <li id="eLeaveLayerMileageText">탈퇴시 보유하고 있는 적립금은 모두 삭제됩니다.</li>
                        <li>현재 적립금 : <strong id="eLeaveLayerMileage" class="txtEm">숫자가 들어가야겠죠?</strong>
                        </li>
                        <li id="eLeaveLayerDepositTextarea">현재 예치금 : <strong id="eLeaveLayerDeposit" class="txtEm">여기도
                                숫자가들어가야겠죠?</strong>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <h4>회원탈퇴 사유</h4>
        <div class="ec-base-table typeWrite">
            <table border="1" summary="">
                <caption>회원탈퇴 사유</caption>
                <colgroup>
                    <col style="width:140px;">
                    <col style="width:auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th scope="row">선택</th>
                        <td><select id="leave_reason" name="leave_reason" fw-filter="isFill" fw-label="회원탈퇴 사유"
                                fw-msg="">
                                <option value="" selected="selected">-선택하세요-</option>
                                <option value="상품종류가 부족하다">상품종류가 부족하다</option>
                                <option value="상품가격이 비싸다">상품가격이 비싸다</option>
                                <option value="상품가격에 비해 품질이 떨어진다">상품가격에 비해 품질이 떨어진다</option>
                                <option value="배송이 느리다">배송이 느리다</option>
                                <option value="반품/교환이 불만이다">반품/교환이 불만이다</option>
                                <option value="상담원 고객응대 서비스가 불만이다">상담원 고객응대 서비스가 불만이다</option>
                                <option value="쇼핑몰 혜택이 부족하다 (쿠폰, 적립금,할인 등)">쇼핑몰 혜택이 부족하다 (쿠폰, 적립금,할인 등)</option>
                                <option value="이용빈도가 낮다">이용빈도가 낮다</option>
                                <option value="개인정보 유출이 염려된다">개인정보 유출이 염려된다</option>
                                <option value="기타">기타</option>
                            </select></td>
                    </tr>
                    <tr id="eLeaveLayerEtcTextarea">
                        <th scope="row">기타</th>
                        <td><textarea id="subjective_leave_reason" name="subjective_leave_reason" fw-filter=""
                                fw-label="subjective_leave_reason" fw-msg="" rows="3" cols="60"></textarea></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="ec-base-button">
        <a href="#none" class="btnSubmitFix sizeS" id="eLeaveLayerBtn">탈퇴</a>
        <a href="#none" class="btnNormalFix sizeS" onclick="window.close()">취소</a>
    </div>
</body>

</html>