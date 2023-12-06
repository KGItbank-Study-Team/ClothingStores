<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/notice.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script defer src="js/main.js"></script>
<script src="https://kit.fontawesome.com/09decccad8.js" crossorigin="anonymous"></script>
<title>슬림베어</title>
</head>

<body>
<jsp:include page="header/header.jsp" />
<div id="wrap">
    <div id="container">
        <div id="contents">
            <div class="xans-element- xans-board xans-board-readpackage-1002 xans-board-readpackage xans-board-1002 ">
                <div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
                    <div class="path">
                        <span>현재 위치</span>
                        <ol>
                            <li><a href="/">홈</a></li>
                            <li><a href="/board/index.html">게시판</a></li>
                            <li title="현재 위치"><strong>NOTICE</strong></li>
                        </ol>
                    </div>
                    <div class="titleArea">
                        <h2>
                            <font color="#555555">NOTICE</font>
                        </h2>
                        <p></p>
                    </div>
                </div>
                <form id="BoardDelForm" name="" action="/exec/front/Board/del/1" method="post" target="_self"
                    enctype="multipart/form-data">
                    <input id="no" name="no" value="1724624" type="hidden" />
                    <!-- Add more input fields here if needed -->
                    <input id="bulletin_no" name="bulletin_no" value="900281" type="hidden" />
	                <input id="board_no" name="board_no" value="1" type="hidden" />
	                <input id="member_id" name="member_id" value="slowmastercr" type="hidden" />
	                <input id="list_url" name="list_url" value="/board/free/list.html?board_no=1" type="hidden" />
	                <input id="bdf_modify_url" name="bdf_modify_url"
	                	value="/board/free/modify.html?board_act=edit&amp;no=1724624&amp;board_no=1" type="hidden" />
	                <input id="bdf_del_url" name="bdf_del_url" value="/exec/front/Board/del/1" type="hidden" />
	                <input id="bdf_action_type" name="bdf_action_type" value="" type="hidden" />
                    
                    <div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">
                        <!-- Your content goes here -->
                        <div class="ec-base-table typeWrite ">
                        <table border="1" summary="">
                            <caption>게시판 상세</caption>
                            <colgroup>
                                <col style="width:130px;" />
                                <col style="width:auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th scope="row">TITLE</th>
                                    <td>${notices.title}</td>
                                </tr>
                                <tr>
                                    <th scope="row">NAME</th>
                                    <td>${notices.writer}<span class="displaynone">(ip:)</span> </td>
                                </tr>
                                <tr class="displaynone">
                                    <th scope="row">POINT</th>
                                    <td><img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점" />
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">DATE</th>
                                    <td><fmt:formatDate value="${notices.reg_date}" pattern="yyyy-MM-dd"/></td>
                                </tr>
                                <tr class="displaynone">
                                    <th scope="row">VOTE</th>
                                    <td><span class="txtNum"> 
                                    		<a href="#none" class="btnNormal"
                                    			onclick="BOARD_READ.article_vote('/exec/front/Board/vote/1?no=1724624&return_url=%2Farticle%2Fnotice%2F1%2F1724624%2F&f8448=afdaf2cdb1914f0c7068e19fcf16178d&board_no=1');">
                                    			<img src="//img.echosting.cafe24.com/skin/base/common/btn_icon_recommend.gif" 
                                    				alt="" /> 추천하기</a>
                                    	</span>
                                    </td>
                                </tr>
                                <tr>
                                    <th scope="row">VIEW</th>
                                    <td>${notices.view_cnt}</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="bon">
                                        <div class="detail">
                                            <div class="fr-view fr-view-article">
                                                <p><br></p>
                                                <p style="margin: 0px; padding: 0px; display: block; line-height: 2.2 !important; text-align: center;">
												<c:if test="${not empty notices.main_image}">
                                                	<img alt="상품01" src="https://slimbearbucket.s3.ap-northeast-2.amazonaws.com/images/${notices.main_image}">
                                                </c:if>
                                                </p>
                                                <p><br></p>
                                                <p style="margin: 0px; padding: 0px; display: block; line-height: 2.2 !important; text-align: left;">
                                                	${notices.content}
                                                </p>
<!--                                                 <p style="margin: 0px; padding: 0px; display: block; line-height: 2.2 !important; text-align: center;"> -->
<%--                                                 	${notices.content} --%>
<!--                                                 </p> -->
                                                
                                                <p><br></p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                
                            </tbody>
                        </table>
                    </div>
                    <div class="ec-base-button ">
                    <span class="gLeft">
                        <a href="/app/board/notice" class="btnNormalFix sizeS">LIST</a>
                    </span>
                        
                    <span class="gRight">
                    <c:set var="isAuthor" value="true" /> <!-- when에 a태그를 옮기면 delete, edit 보임 -->
					<c:choose>
						<c:when test="${isAuthor}">
						</c:when>
						<c:otherwise>
							<!-- 작성자가 아니면 표시하지 않음 -->
						    <a href="#none" onclick="BOARD_READ.article_delete('BoardDelForm','1');" class="btnNormalFix sizeS">DELETE</a>
						    <a href="/board/free/modify.html?board_act=edit&no=1724624&board_no=1" class="btnEmFix sizeS">EDIT</a>
					    </c:otherwise>
					</c:choose>
					</span>
                    </div>
                </div>
            </form>
        </div>
    </div>
	<jsp:include page="footer/footer.jsp" />
</div>
</div>
</body>
</html>
