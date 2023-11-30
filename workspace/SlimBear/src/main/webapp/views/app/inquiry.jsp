<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
					
					<div class="titleArea">
                        <h2 id="inquiryH2">
                            <font color="333333">문의사항</font>
                        </h2>
                        <p id="inquiryP"></p>
                    </div>
					
					<p class="imgArea"></p>
				</div>
				
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
				<div class="boardnavi">
					<a href="/app/board/notice" class="navi01"><span>공지사항</span></a> 
					<a href="/app/board/inquiry" class="navi02"><span>문의게시판</span></a>
					<a href="/app/board/faq" class="navi05"><span>자주묻는질문</span></a>
				</div>
				
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
				<div class="subnavi" style="display: block;">
					<a href="/app/board/inquiry" class="qna01">
						<span>상품문의</span></a> 
					<a href="/app/board/inquiry?board_no=3&amp;category_no=1" class="qna02">
						<span>배송문의</span></a>
					<a href="/app/board/inquiry?board_no=3&amp;category_no=2" class="qna03">
						<span>기타문의</span></a>
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
						
						
						<!-- 문의게시글 목록 -->
						<tbody class="xans-element- xans-board xans-board-notice-4 xans-board-notice xans-board-4 center">
						    <c:forEach items="${inquiries}" var="board" varStatus="loop">
						        <tr style="background-color: #FFFFFF; color: #555555;" class="xans-record-">
						            <td>${inquiries.size() - loop.index}</td>
						            <td class="displaynone"></td>
						            <td class="subject left txtBreak">
						                <strong>
						                    <a href="/app/board/inquiry/detail/${board.uid}" style="color: #555555;">${board.title}</a>
						                    <!-- 비밀글인 경우에만 아이콘 표시 -->
						                    <c:if test="${board.secure eq '1'}">
						                        <img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image"/>
						                    </c:if>
						                    <span class="txtEm"></span>
						                </strong>
						            </td>
						            <td>${board.writer_id}</td>
						            <td><fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd"/></td>
						        </tr>
						        <!-- 답변 목록 출력 -->
						        <c:if test="${not empty board.answers}">
						            <c:forEach items="${board.answers}" var="answer">
						                <tr style="background-color: #FFFFFF; color: #555555;" class="xans-record-">
						                    <td></td>
						                    <td class="displaynone"></td>
						                    <td class="subject left txtBreak">
						                        <strong>
						                            <!-- 답변의 링크는 원래의 문의게시글 링크로 -->
						                            <a href="/app/board/inquiry/detail/${board.uid}" style="color: #555555;">${answer.title}</a>
						                            <c:if test="${board.secure eq '1'}">
								                        <img src="/resources/images/icon_secret.png" alt="비밀글" class="ec-common-rwd-image"/>
								                    </c:if>
						                            <span class="txtEm"></span>
						                        </strong>
						                    </td>
						                    <td>${answer.mem_id}</td>
						                    <td><fmt:formatDate value="${answer.reg_date}" pattern="yyyy-MM-dd"/></td>
						                </tr>
						            </c:forEach>
						        </c:if>
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
			
			
			<!-- 페이지 수 계산 -->
			<c:set var="totalPosts" value="${inquiries.size()}" />
		    <c:set var="postsPerPage" value="5" />
		    <c:set var="currentPage" value="${param.page eq null ? 1 : param.page}" />
			<c:set var="totalPages" value="${(totalPosts / postsPerPage) + (totalPosts % postsPerPage > 0 ? 1 : 0)}" />
			
			<!-- 페이징 -->
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
			
			
			<!-- 검색기능 -->
			<form id="boardSearchForm" name="" action="/app/board/inquiryS" method="get" target="_top" enctype="multipart/form-data">
				<div class="xans-element- xans-board xans-board-search-4 xans-board-search xans-board-4 ">
					<fieldset class="boardSearch">
						<legend>게시물 검색</legend>
						<p class="category displaynone"></p>
						<p>
							<select id="search_key" name="search_key" fw-filter="" fw-label="" fw-msg="">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer_id">글쓴이</option>
								<option value="prod_uid">상품정보</option>
							</select>
							<input id="searchs" name="searchs" fw-filter="" fw-label="" fw-msg="" class="searchs" placeholder="" value="" type="text" /> 
							<button type="submit" class="btnEmFix">FIND</button>
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