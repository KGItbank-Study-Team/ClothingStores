<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
request.setAttribute("boardTitle", "언제오나요");
request.setAttribute("boardWriter", "성격급한사람");
request.setAttribute("boardDate", "2023-11-11 09:01:50");
request.setAttribute("boardSubstance", "잠깐 눈감으면 1시간이 지나간다...");
%>

<html lang="ko">
<%@ include file="header/header.jsp" %>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/board_list.css">
    <script type="text/javascript" src="/resources/js/mypage.js" charset="utf-8"></script>
    <title>문의상세</title>
</head>

<body class="">
    <div id="wrap">
        <div id="container">
            <div id="contents">
                <div class="xans-element- xans-board xans-board-readpackage-4 xans-board-readpackage xans-board-4 ">
                    <div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">

                        <div class="titleArea">
                            <h2>
                                <font color="333333">상품문의</font>
                            </h2>
                            <p>　</p>
                        </div>
                    </div>


                    <div class="ec-base-table typeWrite ">
                        <table border="1" summary="">
                            <caption>상품 게시판 상세</caption>
                            <colgroup>
                                <col style="width:130px;">
                                <col style="width:auto;">
                            </colgroup>
                            
                            <tbody>
                                <tr>
                                    <th scope="row">TITLE</th>
                                    <td>${boardTitle}</td>
                                </tr>
                                <tr>
                                    <th scope="row">NAME</th>
                                    <td><img
                                            src="/resources/images/member_small.jpg">
                                        ${boardWriter} <span class="displaynone">(ip:)</span> </td>
                                </tr>
                                <tr class="">
                                    <th scope="row">DATE</th>
                                    <td>${boardDate}</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="bon">
                                        <div class="detail">
                                            <div class="fr-view fr-view-article">
                                                <br>
                                                ${boardSubstance}
                                                
                                                <tr>
                                                    <td colspan="2"><label for="ma_main_flag0"></td>
                                                </tr>
                                                
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                            
                        </table>
                    </div>
                    <div class="ec-base-button ">
                        <span class="gLeft">
                            <a href="/app/member/myPage/board_list" class="btnNormalFix sizeS">LIST</a>
                        </span>
                        <span class="gRight">
                            <a href="#none" onclick="BOARD_READ.article_delete('BoardDelForm','6');"
                                class="btnNormalFix sizeS ">DELETE</a>
                            <a href="/board/product/modify.html?board_act=edit&amp;no=1728493&amp;board_no=6"
                                class="btnEmFix sizeS ">EDIT</a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<%@ include file="footer/footer.jsp" %>
    
</body>

</html>


