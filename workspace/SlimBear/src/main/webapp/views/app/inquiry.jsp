<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/notice.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xicons@2.0.2/xicons.min.css">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/xeicon.min.css"> -->
<title>INQUIRY</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script defer src="/resources/js/inquiry.js"></script>
</head>
<body>
<jsp:include page="header/header.jsp" />
<div id="wrap">
	<div id="container">
		<div id="contents">
			<div class="xans-element- xans-board xans-board-listpackage-4 xans-board-listpackage xans-board-4 ">
				<div class="xans-element- xans-board xans-board-title-4 xans-board-title xans-board-4 ">
					<div class="path">
						<span>현재 위치</span>
						<ol>
							<li><a href="/">홈</a></li>
							<li><a href="/board/index.html">게시판</a></li>
							<li title="현재 위치"><strong>상품문의</strong></li>
						</ol>
					</div>
					<c:if test="${not empty boards}">
					    <div class="titleArea">
					        <h2>
					            <font color="333333">${boards[0].inquiry_title}</font>
					        </h2>
					        <p>${boards[0].title_ment}</p>
					    </div>
					</c:if>
					<p class="imgArea"></p>
				</div>
				
				 <c:if test="${not empty errorMessage}">
			        <div class="error-message">
			            <strong>Error:</strong> ${errorMessage}
			        </div>
			    </c:if>
				
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
				<div class="boardnavi">
					<a href="/app/board/notice" class="navi01"><span>공지사항</span></a> 
					<a href="/app/board/inquiry" class="navi02"><span>문의게시판</span></a>
					<a href="/views/app/review_page.jsp" class="navi04"><span>사용후기</span></a> 
					<a href="/app/board/faq" class="navi05"><span>자주묻는질문</span></a>
				</div>
				
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
				<div class="subnavi" style="display: block;">
					<a href="/app/board/inquiry" class="qna01">
						<span>상품문의</span></a> 
					<a href="/app/board/inquiry?board_no=3&amp;category_no=1" class="qna02">
						<span>배송문의</span></a>
					<a href="/app/board/inquiry?board_no=3&amp;category_no=2" class="qna03">
						<span>배송 전 변경/취소</span></a>
					<!-- <a href="/board/배송-후-교환반품/5/" class="qna04"><span>배송 후 교환/반품</span></a> -->
					<!-- <a href="/board/입금결제-확인/14/" class="qna05"><span>입금/결제 확인</span></a> -->
				</div>
				
				<div class="boardSort">
					<span class="xans-element- xans-board xans-board-replysort-4 xans-board-replysort xans-board-4 "></span>
				</div>
				<div class="ec-base-table typeList gBorder">
					<table border="1" summary="">
						<caption>상품 게시판 목록</caption>
						<colgroup class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
							<col style="width: 80px;" />
							<col style="width: 130px;" class="displaynone" />
							<col style="width: auto;" />
							<col style="width: 120px;" />
							<col style="width: 100px;" class="" />
							<col style="width: 80px;" class="displaynone" />
							<col style="width: 55px;" class="displaynone" />
							<col style="width: 80px;" class="displaynone" />
						</colgroup>
						<thead class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
							<tr style="">
								<th scope="col">NO</th>
								<th scope="col" class="displaynone">CATE</th>
								<th scope="col">TITLE</th>
								<th scope="col">NAME</th>
								<th scope="col" class="">DATE</th>
								<th scope="col" class="displaynone">HIT</th>
								<th scope="col" class="displaynone">VOTE</th>
								<th scope="col" class="displaynone">POINT</th>
							</tr>
						</thead>
						
						<!-- 1번째 tbody for문 -->			
						<tbody class="xans-element- xans-board xans-board-notice-4 xans-board-notice xans-board-4 center">
						    <c:forEach var="inquiry" items="${inquiries}" varStatus="loop">
						        <tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
						            <td><i class="xi-check"></td>
						            <td class="displaynone">${inquiry}</td>
						            <td class="subject left txtBreak">
						                <span class="displaynone">
						                    <a href="#none" onclick="BOARD.viewTarget('${inquiry}', '6', this);">
						                        <img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기"/>
						                    </a>
						                </span>
						                <strong>
						                    <a href="/article/상품문의/6/${inquiry.no}" style="color:#555555;">${inquiry.title}</a>
						                    <img src="/resources/images/icon_hit.gif" alt="HIT" class="ec-common-rwd-image"/>
						                    <span class="txtEm"></span>
						                </strong>
						            </td>
						            <td>${inquiry.writer_id}</td>
						            <td class=""><span class="txtNum">${inquiry.reg_date}</span></td>
						            <td class="displaynone"><span class="txtNum">${inquiry}</span></td>
						            <td class="displaynone"><span class="txtNum">${inquiry}</span></td>
						            <td class="displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점"/></td>
						        </tr>
						    </c:forEach>
						</tbody>
						
						<!-- 2번째 tbody for문  -->
						<tbody class="xans-element- xans-board xans-board-list-4 xans-board-list xans-board-4 center">
						    <c:forEach var="boardUser" items="${boardUsers}" varStatus="loop">
						        <tr style="background-color:#FFFFFF; color:#555555;" class="xans-record-">
						            <td>${boardUser.no}</td>
						            <td class="displaynone">${boardUser}</td>
						            <td class="subject left txtBreak">
						                <span class="displaynone">
						                    <a href="#none" onclick="BOARD.viewTarget('${boardUser}', '6', this);">
						                        <img src="//img.echosting.cafe24.com/skin/base/board/btn_unfold.gif" alt="내용 보기"/>
						                    </a>
						                </span>
						                <a href="/article/상품문의/6/${boardUser.no}" style="color:#555555;">${boardUser.title}</a>
						                <img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image"/>
						                <img src="/resources/images/icon_new.gif" alt="NEW" class="ec-common-rwd-image"/>
						                <span class="txtEm"></span>
						            </td>
						            <td>${boardUser.writer_id}</td>
						            <td class=""><span class="txtNum">${boardUser.reg_date}</span></td>
						            <td class="displaynone"><span class="txtNum">${boardUser}</span></td>
						            <td class="displaynone"><span class="txtNum">${boardUser}</span></td>
						            <td class="displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point0.gif" alt="0점"/></td>
						        </tr>
						    </c:forEach>
						</tbody>
						
					</table>
					<p class="xans-element- xans-board xans-board-empty-4 xans-board-empty xans-board-4 message displaynone "></p>
				</div>
				
				<sec:authorize access="isAuthenticated()">
					<div class="xans-element- xans-board xans-board-buttonlist-4 xans-board-buttonlist xans-board-4  ec-base-button typeBG ">
						<span class="gRight"> 
							<a href="/app/board/write" class="btnSubmitFix sizeS ">WRITE</a>
						</span>
					</div>
				</sec:authorize>
			</div>
			
			<!-- 게시글 개수와 현재 페이지 설정 -->
			<c:set var="totalPosts" value="50" />
			<c:set var="postsPerPage" value="10" />
			<c:set var="currentPage" value="1" />
			
			<!-- 페이지 수 계산 -->
			<c:set var="totalPages" value="${totalPosts / postsPerPage + (totalPosts % postsPerPage > 0 ? 1 : 0)}" />
			
			<div class="xans-element- xans-board xans-board-paging-4 xans-board-paging xans-board-4 ec-base-paginate">
			    <a href="?board_no=6&page=1"><img src="/resources/images/icon_prev2.png" /></a>
			    <ol>
			        <c:forEach begin="1" end="${totalPages}" var="page">
			            <c:choose>
			                <c:when test="${page == currentPage}">
			                    <li class="xans-record-"><a href="?board_no=6&page=${page}" class="this">${page}</a></li>
			                </c:when>
			                <c:otherwise>
			                    <li class="xans-record-"><a href="?board_no=6&page=${page}" class="other">${page}</a></li>
			                </c:otherwise>
			            </c:choose>
			        </c:forEach>
			    </ol>
			    <a href="?board_no=6&page=${currentPage + 1}"><img src="/resources/images/icon_next2.png" /></a>
			</div>
			
			
			<form id="boardSearchForm" name="" action="/board/qa/6" method="get"
				target="_top" enctype="multipart/form-data">
				<input id="board_no" name="board_no" value="6" type="hidden" />
				<input id="page" name="page" value="1" type="hidden" />
				<input id="board_sort" name="board_sort" value="" type="hidden" />
				<div class="xans-element- xans-board xans-board-search-4 xans-board-search xans-board-4 ">
					<fieldset class="boardSearch">
						<legend>게시물 검색</legend>
						<p class="category displaynone"></p>
						<p><select id="search_date" name="search_date" fw-filter=""
								fw-label="" fw-msg="">
								<option value="week">일주일</option>
								<option value="month">한달</option>
								<option value="month3">세달</option>
								<option value="all">전체</option>
							</select> 
							<select id="search_key" name="search_key" fw-filter=""
								fw-label="" fw-msg="">
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="writer_name">글쓴이</option>
								<option value="member_id">아이디</option>
								<option value="nick_name">별명</option>
								<option value="product">상품정보</option>
							</select>
							<input id="searchs" name="searchs" fw-filter="" fw-label=""
								fw-msg="" class="searchs" placeholder="" value=""
								type="text" /> <a href="#none" class="btnEmFix"
								onclick="BOARD.form_submit('boardSearchForm');">FIND</a>
						</p>
					</fieldset>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="footer/footer.jsp" />
</div>
</body>
</html>