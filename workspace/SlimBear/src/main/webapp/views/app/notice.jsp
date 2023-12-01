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
<title>슬림베어</title>
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
						<h2><font color="#555555">공지사항</font></h2>
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
								<th scope="col">TITLE</th>
								<th scope="col">NAME</th>
								<th scope="col">VIEW</th>
								<th scope="col" class="">DATE</th>
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
						            <td><fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd"/></td>
						        </tr>
						        
						        
						    </c:forEach>
						</tbody>
						
					</table>
					<p class="xans-element- xans-board xans-board-empty-1002 xans-board-empty xans-board-1002 message displaynone "></p>
				</div>
				
				<%-- <sec:authorize access="isAuthenticated()">
					<div class="xans-element- xans-board xans-board-buttonlist-4 xans-board-buttonlist xans-board-4  ec-base-button typeBG ">
						<span class="gRight"> 
							<a href="/app/board/write" class="btnSubmitFix sizeS ">WRITE</a>
						</span>
					</div>
				</sec:authorize> --%>
			</div>
			
			<!-- 페이지 수 계산 -->
			<div class="xans-element- xans-product xans-product-normalpaging ec-base-paginate">
				<ol>
					<!-- Previous Page Button -->
					<li class="page-item ${currentPage eq 1 ? 'disabled' : ''}">
						<a class="page-link"
						href="/app/board/notice?board_no=${pageNumber}&currentPage=${currentPage - 1}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a>
					</li>
					<!-- Page Number Buttons -->
					<c:forEach begin="${startPage }" end="${endPage}" var="pageNumber">
						<li class="xans-record-"><c:choose>
								<c:when test="${pageNumber eq currentPage}">
									<!-- 현재 페이지인 경우 active-page 클래스를 추가하여 스타일을 적용 -->
									<a
										href="/app/board/notice?board_no=${pageNumber}&currentPage=${pageNumber}"
										class="this">${pageNumber}</a>
								</c:when>
								<c:otherwise>
									<!-- 현재 페이지가 아닌 경우 일반적인 스타일을 적용 -->
									<a
										href="/app/board/notice?board_no=${pageNumber}&currentPage=${pageNumber}"
										class="other">${pageNumber}</a>
								</c:otherwise>
							</c:choose></li>
					</c:forEach>
					<!-- Next Page Button -->
					<li
						class="page-item ${currentPage eq totalPages ? 'disabled' : ''}">
						<a class="page-link"
						href="/app/board/notice?board_no=${pageNumber}&currentPage=${currentPage + 1}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a>
					</li>
				</ol>
				<!-- 마지막 페이지 여부 확인 후 출력 -->
				<c:if test="${currentPage eq totalPages && !hasNextBlock}">
					<li class="page-item disabled"><span class="page-link">마지막
							페이지입니다.</span></li>
				</c:if>
			</div>
			
		</div>
		<jsp:include page="footer/footer.jsp" />
	</div>
</div>

<script>
	var regDateMillis = ${board.reg_date.time}; // reg_date가 Date 객체인 경우
	var currentDateMillis = new Date().getTime();
	var oneWeekInMillis = 7 * 24 * 60 * 60 * 1000;
	var imageId = "newImage${loop.index}";
	
	if (currentDateMillis - regDateMillis > oneWeekInMillis) {
	    document.getElementById(imageId).style.display = 'none';
	}
</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var currentPage = ${currentPage};
        var totalPages = ${totalPages};
        var hasNextBlock = ${hasNextBlock};

        var prevPageButton = document.querySelector('.page-link[aria-label="Previous"]');
        var nextPageButton = document.querySelector('.page-link[aria-label="Next"]');
        var firstPageMessage = document.querySelector('.first-page-message');
        var lastPageMessage = document.querySelector('.last-page-message');

        prevPageButton.addEventListener('click', function (event) {
            if (currentPage === 1) {
                alert('첫 번째 페이지입니다.');
                event.preventDefault(); // 이전 페이지로 이동하지 않도록 막음
            }
        });

        nextPageButton.addEventListener('click', function (event) {
            if (currentPage === totalPages && !hasNextBlock) {
                alert('마지막 페이지입니다.');
                event.preventDefault(); // 다음 페이지로 이동하지 않도록 막음
            }
        });
    });
</script>

</body>
</html>
