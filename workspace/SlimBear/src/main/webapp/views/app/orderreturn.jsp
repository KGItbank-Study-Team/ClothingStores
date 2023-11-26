<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/modify.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>주문반품사유</title>
</head>

<body id="popup">
    <form id="accountForm" name="accountForm" method="POST" enctype="multipart/form-data">
        <div class="xans-element- xans-myshop xans-myshop-orderhistoryaccount ec-base-layer xans-record-">
            <div class="header">
                <h1>주문반품사유</h1>
            </div>
            <div class="content">
                <div class="ec-base-table typeWrite">
                    <table border="1" summary="">
                        <caption>
                        		주문반품
                        </caption>
                        <colgroup>
                            <col style="width:140px">
                            <col style="width:auto">
                        </colgroup>
                        <tbody>
                        	<tr>
                                <th scope="row">반품사유</th>
                                <td><select id="acc_no" name="acc_no">
                                        <option value="">-선택하세요-</option>
                                        <option value="cancel1">단순변심</option>
                                        <option value="cancel2">배송누락</option>
                                        <option value="cancel3">상품파손</option>
                                        <option value="cancel4">오배송</option>
                                        <option value="cancel4">서비스불만</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <th scope="row">상세사유</th>
                                <td>
                                    <input id="acc_no" name="acc_no" class="inputTypeText" placeholder="" value="맘에안듬" type="text">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="ec-base-button">
                    <a href="#none" class="btnSubmitFix sizeS " onclick="window.close()">신청</a>
                    <a href="#none" class="btnNormalFix sizeS" onclick="window.close()">취소</a>
                </div>
            </div>
        </div>
    </form>

</body>

</html>