<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setAttribute("title", "[필독]공지사항");
	request.setAttribute("name", "슬림베어_CR");
// 	request.setAttribute("regDate", "9999-99-99");
	request.setAttribute("boardContent", "공지사항");
%>
<%
	// 게시물의 작성자 정보를 어딘가에서 가져오고, 현재 로그인한 사용자 정보를 세션에서 가져옵니다
	String postAuthor = "작성자_정보_얻어오기"; // 예: 게시물의 작성자 이름
	String loggedInUser = (String) session.getAttribute("loggedInUser"); // 세션에서 로그인한 사용자 정보 가져오기
	
	// 작성자와 로그인한 사용자를 비교하여, 둘이 일치하는 경우에만 링크를 표시합니다
	boolean isAuthor = postAuthor.equals(loggedInUser);
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/notice.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script defer src="js/main.js"></script>
<script src="https://kit.fontawesome.com/09decccad8.js" crossorigin="anonymous"></script>
<title>BOARD NOTICE</title>
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
                                    <td>${title}</td>
                                </tr>
                                <tr>
                                    <th scope="row">NAME</th>
                                    <td>${name}<span class="displaynone">(ip:)</span> </td>
                                </tr>
                                <tr class="displaynone">
                                    <th scope="row">POINT</th>
                                    <td><img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점" />
                                    </td>
                                </tr>
                                <tr class="displaynone">
                                    <th scope="row">DATE</th>
                                    <td>${board.reg_date}</td>
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
                                <tr class="displaynone">
                                    <th scope="row">HIT</th>
                                    <td>2852</td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="bon">
                                        <div class="detail">
                                            <div class="fr-view fr-view-article">
                                                <p><br></p>
                                                <p style="margin: 0px; padding: 0px; display: block; line-height: 2.2 !important; text-align: center;">
                                                	<strong style="font-weight: bolder;">${board.Content}</strong>
                                                </p>
                                                <p style="margin: 0px; padding: 0px; display: block; line-height: 2.2 !important; text-align: center;">
                                                	공지사항 없습니다.
                                                </p>
                                                
                                                <p><br></p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="attach displaynone">
                                    <th scope="row">FILE</th>
                                    <td></td>
                                </tr>
                                <tr class="displaynone ">
                                    <th scope="row">PASSWORD</th>
                                    <td><input id="password" name="password" fw-filter="" fw-label="비밀번호" fw-msg=""
                                            onkeydown="if (event.keyCode == 13 || event.which == 13) { return false; }"
                                            value="" type="password" /> 
                                        <span class="ec-base-help txtInfo">수정 및 삭제하려면 비밀번호를 입력하세요.</span>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="ec-base-button ">
                        <span class="gLeft">
                            <span class="displaynone">
                                <a href="#none" onclick="" class="btnNormalFix sizeS admin displaynone"></a>
                                <a href="#none" onclick="" class="btnNormalFix sizeS admin displaynone"></a>
                                <a href="#none" onclick="" class="btnNormalFix sizeS ">스팸신고</a>
                                <a href="#none" onclick="" class="btnNormalFix sizeS ">스팸해제</a>
                            </span>
                            <a href="/app/board/notice" class="btnNormalFix sizeS">LIST</a>
                        </span>
                        
                        <span class="gRight">
                        <c:set var="isAuthor" value="true" /> <!-- 임시로 delete, edit 을 보이게 함 -->
						    <c:choose>
						        <c:when test="${isAuthor}">
						            <a href="#none" onclick="BOARD_READ.article_delete('BoardDelForm','1');" class="btnNormalFix sizeS">DELETE</a>
						            <a href="/board/free/modify.html?board_act=edit&no=1724624&board_no=1" class="btnEmFix sizeS">EDIT</a>
						        </c:when>
						        <c:otherwise>
						            <!-- 작성자가 아니면 표시하지 않음 -->
						        </c:otherwise>
						    </c:choose>
						</span>
                      <!-- <span class="gRight">
                            <a href="#none" onclick="BOARD_READ.article_delete('BoardDelForm','1');"
                                class="btnNormalFix sizeS displaynone">DELETE</a>
                            <a href="/board/free/modify.html?board_act=edit&no=1724624&board_no=1"
                                class="btnEmFix sizeS displaynone">EDIT</a>
                            <a href="/board/free/reply.html" class="btnSubmitFix sizeS displaynone">REPLY</a>
                        </span> -->
                    </div>
               	</div>
              </form>
           </div>
           
           <div class="xans-element- xans-board xans-board-commentpackage-1002 xans-board-commentpackage xans-board-1002">
               <form id="commentForm" name="" action="/exec/front/Board/CommentUpdate/1" method="post" target="_self"
                   enctype="multipart/form-data" style="display:none">
	               <input id="board_no" name="board_no" value="1" type="hidden" />
	               <input id="no" name="no" value="1724624" type="hidden" />
	               <input id="comment_no" name="comment_no" value="" type="hidden" />
	               <input id="member_id" name="member_id" value="" type="hidden" />
                   
                   <div class="xans-element- xans-board xans-board-commentform-1002 xans-board-commentform xans-board-1002">
                       <fieldset>
                        <legend>댓글 수정</legend>
                        <p>비밀번호 : <input id="comment_password" name="comment_password" fw-filter="isFill"
                                fw-label="댓글비밀번호" fw-msg="" value="" type="password" />
                                <span class="secret displaynone"><label>비밀댓글</label></span></p>
                        <div class="view">
                            <textarea id="comment_modify" name="comment_modify" fw-filter="isFill" fw-label="댓글내용"
                            		fw-msg=""></textarea>
                            <span class="submit">
                                <a href="#none" class="btnEm sizeL"
                                    onclick="BOARD_COMMENT.comment_update_ok('commentForm');">EDIT</a>
                                <a href="#none" class="btnNormal sizeL"
                                    onclick="BOARD_COMMENT.comment_cancel_ok('commentForm');">CANCEL</a>
                            </span>
                        </div>
                        <p class="displaynone"> / byte</p>
                   	</fieldset>
                   </div>
               </form>
               <form id="commentSecretForm" name="" action="/exec/front/Board/CommentSecret/1" method="post" target="_self"
                   enctype="multipart/form-data" style="display:none">
                   <input id="board_no" name="board_no" value="1" type="hidden" />
                   <!-- Add more input fields here if needed -->
                   <input id="comment_no" name="comment_no" value="" type="hidden" />
               	<input id="pass_check" name="pass_check" value="F" type="hidden" />
                   
                   <div class="xans-element- xans-board xans-board-commentformsecret-1002 xans-board-commentformsecret xans-board-1002">
                       <p>비밀번호 : <input id="secure_password" name="secure_password" fw-filter="isFill" fw-label="댓글비밀번호"
                           fw-msg="" value="" type="password" /> <a href="#none" class="btnNormal"
                           onclick="BOARD_COMMENT.show_secret_comment('commentSecretForm');">OK</a>
                       <a href="#none" class="btnNormal"
                           onclick="BOARD_COMMENT.hide_secret_comment_form('commentSecretForm');">CANCEL</a>
                   		</p>
                   </div>
               </form>
           </div>
           
           <div class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002">
               <ul>
                   <li class="prev displaynone">
                       <strong>이전글</strong><a href="/article/notice/1/$3/"></a>
                   </li>
                   <li class="next">
                       <strong>다음글</strong><a href="/article/notice/1/1711077/">[하우스앤드] 11월의 쇼룸리스트</a>
                   </li>
               </ul>
           </div>
       </div>
       <jsp:include page="footer/footer.jsp" />
   </div>
</div>
</body>
</html>
