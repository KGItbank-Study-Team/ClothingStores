<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- VO, DAO import -->
<!-- 세션에 저장한 게시글 정보를 추출 ex) BoardVO board = (BoardVO) session.getAttribute("board"); -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/notice.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/xeicon.min.css"> -->
<title>NOTICE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script defer src="/resources/js/notice.js"></script>
</head>

<body>
<%@ include file="header/header.jsp"%>
<div id="wrap">
	<div id="container">
		<div id="contents">
			<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002">
				<!-- 현재 위치 -->
				<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002">
					<div class="path">
						<span>현재 위치</span>
						<ol>
							<li><a href="#">홈</a></li>
							<li><a href="/board/index.html">게시판</a></li>
							<li title="현재 위치"><strong>NOTICE</strong></li>
						</ol>
					</div>
					<div class="titleArea">
						<h2><font color="#555555">NOTICE</font></h2>
						<p><!-- 부제목 --></p>
					</div>
					<p class="imgArea"></p>
				</div>
				<div class="boardSort">
					<span class="xans-element- xans-board xans-board-replysort-1002 xans-board-replysort xans-board-1002"></span>
				</div>
				
				<div class="boardnavi">
					<!-- <a href="/_onedesign/html/company.html" class="navi00"><span>ABOUT</span></a> -->
					<a href="/app/board/notice" class="navi01"><span>공지사항</span></a> 
					<a href="/app/board/inquiry" class="navi02"><span>문의게시판</span></a>
					<a href="/app/board/faq" class="navi05"><span>자주묻는질문</span></a>
				</div>
				
				<div class="ec-base-table typeList gBorder">
					<table border="1" summary="">
						<caption>게시판 목록</caption>
						<colgroup
							class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
							<col style="width: 100px;" />
							<col style="width: 100px;" class="displaynone" />
							<col style="width: auto;" />
							<col style="width: 130px;" />
							<col style="width: 100px;" class="" />
							<col style="width: 80px;" class="displaynone" />
							<col style="width: 55px;" class="displaynone" />
							<col style="width: 80px;" class="displaynone" />
						</colgroup>
						<thead
							class="xans-element- xans-board xans-board-listheader-1002 xans-board-listheader xans-board-1002 ">
							<tr style="">
								<th scope="col">NO</th>
								<th scope="col" class="displaynone">CATE</th>
								<th scope="col">TITLE</th>
								<th scope="col">NAME</th>
								<th scope="col">VIEW</th>
								<th scope="col" class="">DATE</th>
								<th scope="col" class="displaynone">HIT</th>
								<th scope="col" class="displaynone">POINT</th>
							</tr>
						</thead>
						
						
						<!-- 1번째 tbody for문  -->
						<c:set var="sequenceNumber" value="0" />
						<tbody class="xans-element- xans-board xans-board-notice-1002 xans-board-notice xans-board-1002 center">
						    <c:forEach var="board" items="${notices}" varStatus="loop">
						        <tr style="background-color: #FFFFFF; color: #555555;" class="xans-record-">
						            <td>
						                <c:choose>
						                    <c:when test="${board.priority eq 1}">
						                        <i class="xi-check"></i>
						                    </c:when>
						                    <c:when test="${board.priority eq 2}">
						                        <c:if test="${sequenceNumber eq 0}">
						                            <c:set var="sequenceNumber" value="${fn:length(notices)}" />
						                        </c:if>
						                        ${sequenceNumber - loop.index}
						                    </c:when>
						                    <c:otherwise>
						                        <!-- 필요한 경우 다른 처리를 수행합니다. -->
						                    </c:otherwise>
						                </c:choose>
						            </td>
						            <td class="displaynone"></td>
						            <td class="subject left txtBreak">
						                <strong>
						                    <a href="/app/board/notice/detail/${board.uid}" 
							                   style="color: #555555; ${board.priority eq 1 ? 'font-weight: 700;' : ''}${board.priority eq 2 ? 'font-weight: normal !important;' : ''}">
							                    ${board.title}
							                </a>
						                    <img src="/resources/images/icon_new.gif" alt="NEW" class="ec-common-rwd-image new-image" id="newImage${loop.index}" />
						                    <span class="txtEm"></span>
						                </strong>
						            </td>
						            <td>${board.writer}</td>
						            <td>${board.view_cnt}</td>
<%-- 						            <td>${board.reg_date}</td> --%>
						            <td><fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd"/></td>
						        </tr>
						        
						         <script>
								     var regDateMillis = ${board.reg_date.time}; // reg_date가 Date 객체인 경우
								     var currentDateMillis = new Date().getTime();
								     var oneWeekInMillis = 7 * 24 * 60 * 60 * 1000;
								     var imageId = "newImage${loop.index}";
								
								     if (currentDateMillis - regDateMillis > oneWeekInMillis) {
								         document.getElementById(imageId).style.display = 'none';
								     }
							    </script>
						        
						    </c:forEach>
						</tbody>
						
					</table>
					<p class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone "></p>
				</div>
				
				<sec:authorize access="isAuthenticated()">
					<div class="xans-element- xans-board xans-board-buttonlist-4 xans-board-buttonlist xans-board-4  ec-base-button typeBG ">
						<span class="gRight"> 
<!-- 							<a href="/app/board/write" class="btnSubmitFix sizeS ">WRITE</a> -->
						</span>
					</div>
				</sec:authorize>
			</div>
				
			<div class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
				<a href="#"><img src="/resources/images/icon_prev2.png" /></a>
				<ol>
					<li class="xans-record-">
						<a href="#" class="this">1</a></li>
					<!-- <li class="xans-record-">
						<a href="#" class="other">2</a></li> -->
				</ol>
				<a href="?board_no=1&page=2"><img src="/resources/images/icon_next2.png" /></a>
			</div>
			
			
			<!-- <form id="boardSearchForm" name="" action="/board/notice/1"
				method="get" target="_top" enctype="multipart/form-data">
				<input id="board_no" name="board_no" value="1" type="hidden" />
				<input id="page" name="page" value="1" type="hidden" />
				<input id="board_sort" name="board_sort" value="" type="hidden" />
				<div class="xans-element- xans-board xans-board-search-1002 xans-board-search xans-board-1002 ">
					<fieldset class="boardSearch">
						<legend>게시물 검색</legend>
						<p>
						<select id="search_key" name="search_key">
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<option value="writer_name">글쓴이</option>
							<option value="member_id">아이디</option>
							<option value="nick_name">별명</option>
						</select>
						<input id="searchs" name="searchs" class="searchs" placeholder="" 
								value="" type="text" />
						<a href="#" class="btnEmFix"
							onclick="BOARD.form_submit('boardSearchForm');">FIND</a>
						</p>
					</fieldset>
				</div>
			</form> -->
			
		</div>
		<jsp:include page="footer/footer.jsp" />
	</div>
</div>

</body>
</html>
