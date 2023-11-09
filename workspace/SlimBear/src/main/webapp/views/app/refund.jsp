<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
request.setAttribute("username", "페이커");  
request.setAttribute("bankNumber", "94320200118927");  
%>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/modify.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>환불계좌변경</title>
</head>

<body id="popup">
    <form id="accountForm" name="accountForm" method="POST" enctype="multipart/form-data">
        <div class="xans-element- xans-myshop xans-myshop-orderhistoryaccount ec-base-layer xans-record-">
            <div class="header">
                <h1>환불계좌 <span class="displaynone">등록</span><span class="">변경</span>
                </h1>
            </div>
            <div class="content">
                <div class="ec-base-table typeWrite">
                    <table border="1" summary="">
                        <caption>환불계좌 <span class="displaynone">등록</span><span class="">변경</span>
                        </caption>
                        <colgroup>
                            <col style="width:140px">
                            <col style="width:auto">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">예금주</th>
                                <td>
                                    <input id="acc_depositor" name="acc_depositor" fw-filter="" fw-label="" fw-msg=""
                                        class="inputTypeText" placeholder="" value="${username}" type="text">
                                    <p class="txtInfo gBlank10">예금주명은 주문자명과 동일해야 합니다.</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">은행명</th>
                                <td><select id="acc_bank" name="acc_bank" fw-filter="" fw-label="" fw-msg="">
                                        <option value="">-선택하세요-</option>
                                        <option value="bank_02">산업은행</option>
                                        <option value="bank_03">기업은행</option>
                                        <option value="bank_04" selected="selected">국민은행</option>
                                        <option value="bank_05">하나(외환)은행</option>
                                        <option value="bank_07">수협중앙회</option>
                                        <option value="bank_11">농협중앙회</option>
                                        <option value="bank_12">농협개인</option>
                                        <option value="bank_13">농협</option>
                                        <option value="bank_20">우리은행</option>
                                        <option value="bank_209">유안타증권</option>
                                        <option value="bank_218">KB증권</option>
                                        <option value="bank_23">SC제일은행</option>
                                        <option value="bank_230">미래에셋증권</option>
                                        <option value="bank_238">대우증권</option>
                                        <option value="bank_240">삼성증권</option>
                                        <option value="bank_243">한국투자증권</option>
                                        <option value="bank_26">신한은행</option>
                                        <option value="bank_261">교보증권</option>
                                        <option value="bank_262">하이투자증권</option>
                                        <option value="bank_263">현대차증권</option>
                                        <option value="bank_266">SK증권</option>
                                        <option value="bank_267">대신증권</option>
                                        <option value="bank_269">한화증권</option>
                                        <option value="bank_270">하나대투증권</option>
                                        <option value="bank_278">신한금융투자</option>
                                        <option value="bank_279">동부증권</option>
                                        <option value="bank_280">유진투자증권</option>
                                        <option value="bank_287">메리츠증권</option>
                                        <option value="bank_288">카카오페이증권</option>
                                        <option value="bank_289">NH투자증권</option>
                                        <option value="bank_291">신영증권</option>
                                        <option value="bank_292">케이뱅크</option>
                                        <option value="bank_293">카카오뱅크</option>
                                        <option value="bank_294">LIG증권</option>
                                        <option value="bank_295">OK저축은행</option>
                                        <option value="bank_296">토스뱅크</option>
                                        <option value="bank_297">토스증권</option>
                                        <option value="bank_31">대구은행</option>
                                        <option value="bank_32">부산은행</option>
                                        <option value="bank_34">광주은행</option>
                                        <option value="bank_35">제주은행</option>
                                        <option value="bank_37">전북은행</option>
                                        <option value="bank_39">경남은행</option>
                                        <option value="bank_52">모건스탠리은행</option>
                                        <option value="bank_53">씨티은행</option>
                                        <option value="bank_57">유에프제이은행</option>
                                        <option value="bank_58">미즈호코퍼레이트은행</option>
                                        <option value="bank_59">미쓰비시도쿄은행</option>
                                        <option value="bank_60">뱅크오브아메리카</option>
                                        <option value="bank_71">우체국</option>
                                        <option value="bank_76">신용보증기금</option>
                                        <option value="bank_77">기술신용보증기금</option>
                                        <option value="bank_81">하나은행</option>
                                        <option value="bank_82">농협회원조합</option>
                                        <option value="bank_83">도이치은행</option>
                                        <option value="bank_84">상호저축은행</option>
                                        <option value="bank_85">새마을금고</option>
                                        <option value="bank_86">수출입은행</option>
                                        <option value="bank_87">신용협동조합</option>
                                        <option value="bank_89">홍콩상하이은행(HSBC)</option>
                                        <option value="bank_90">에이비엔암로은행</option>
                                        <option value="bank_91">산림조합</option>
                                        <option value="bank_93">한국주택금융공사</option>
                                        <option value="bank_94">서울보증보험</option>
                                        <option value="bank_95">경찰청</option>
                                        <option value="bank_99">금융결제원</option>
                                        <option value="bank_999">기타</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <th scope="row">계좌번호</th>
                                <td>
                                    <input id="acc_no" name="acc_no" fw-filter="" fw-label="" fw-msg=""
                                        class="inputTypeText" placeholder="" value="${bankNumber}" type="text">
                                    <p class="txtInfo gBlank10">'-' 없이 숫자만 입력해 주세요.</p>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">비밀번호 확인</th>
                                <td>
                                    <input id="check_password" name="check_password" fw-filter="" fw-label="" fw-msg=""
                                        value="" type="password">
                                    <p class="txtInfo gBlank10">등록된 비밀번호를 확인합니다.</p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="ec-base-button">
                    <a href="#none" class="btnSubmitFix sizeS " onclick="window.close()">변경</a>
                    <a href="#none" class="btnNormalFix sizeS" onclick="window.close()">취소</a>
                </div>
            </div>
        </div>
    </form>

</body>

</html>