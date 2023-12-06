<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/modify.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>주문반품사유</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
                                        <option value="단순변심">단순변심</option>
                                        <option value="배송누락">배송누락</option>
                                        <option value="상품파손">상품파손</option>
                                        <option value="오배송">오배송</option>
                                        <option value="서비스불만">서비스불만</option>
                                    </select></td>
                            </tr>
                            <tr>
                                <th scope="row">상세사유</th>
                                <td>
                                    <input id="acc_no_desc" name="acc_no" class="inputTypeText" placeholder="" type="text">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="ec-base-button">
                    <a href="#none" class="btnSubmitFix sizeS " onclick="doCancel()">신청</a>
                    <a href="#none" class="btnNormalFix sizeS" onclick="window.close()">취소</a>
                </div>
            </div>
        </div>
    </form>
	<script>
		function doCancel(){
			var reasonSelector = $('#acc_no').val();
			var reason = $('#acc_no_desc').val();
			
			if(reasonSelector != "" && reason != ""){
				opener.parent.orderReturn(1,reasonSelector + '[' + reason + ']');
				window.close();
			}
			else{
				alert("사유를 적어주세요");
			}
		}
	</script>
</body>

</html>